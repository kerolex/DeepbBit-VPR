function images = prepareBatch(list_images,mean_data,batch_size)
%% Prepare_batch
%
disp('Prepare batch ...')
num_images = length(list_images);
if nargin < 3
  batch_size = num_images;
end

IMAGE_DIM = 256;
CROPPED_DIM = 224;

indices = [0 IMAGE_DIM-CROPPED_DIM] + 1;
center = floor(indices(2) / 2)+1;
images = zeros(CROPPED_DIM,CROPPED_DIM,3,batch_size,'single');

for i=1:num_images
  % read file
%  fprintf('%c Preparing %s\n',13,track_patches{i});
  try
    im = list_images{i};
    % resize to fixed input size
    im = single(im);
    im = imresize(im, [IMAGE_DIM IMAGE_DIM], 'bilinear');
    % Transform GRAY to RGB
    if size(im,3) == 1
      im = cat(3,im,im,im);
    end
    % permute from RGB to BGR (IMAGE_MEAN is already BGR)
    im = im(:,:,[3 2 1]) - mean_data;
    % im = im(:,:,[3 2 1]);
    % Crop the center of the image
    images(:,:,:,i) = permute(im(center:center+CROPPED_DIM-1,...
      center:center+CROPPED_DIM-1,:),[2 1 3]);
  catch
    warning('Problems with file',list_images{i});
  end
end
