function [D, Ds] = ComputeDeepBit(track_patches, net, mean_data, batch_size)


% prepare input
num_images = length(track_patches);
num_batches = ceil(length(track_patches)/batch_size);

initic=tic;

bindesc = zeros(32, num_images);

for bb = 1 : num_batches
    batchtic = tic;
    range = 1+batch_size*(bb-1):min(num_images,batch_size * bb);
    tic
    input_data = {prepareBatch(track_patches(range),mean_data,batch_size)};
    toc, tic
    fprintf('Batch %d out of %d %.2f%% Complete ETA %.2f seconds\n',...
        bb,num_batches,bb/num_batches*100,toc(initic)/bb*(num_batches-bb));
    %output_data = caffe('forward', {input_data});  
    output_data = net.forward(input_data);
    toc
    
    output_data = squeeze(output_data{1});
    bintmp = 0.5 * (mysignfn(output_data - 0.5) + 1);
    if bb == num_batches
       bindesc(:,range) = bintmp(:,1:length(range));
    else
       bindesc(:, range) = bintmp;
    end
    toc(batchtic)
end
toc(initic);

% Dummy function that returns a dummy binary descriptor in bytes.
%
% P is the patch to convert into a binary descriptor.

for j=1:size(bindesc,2)
    Ds{j} = bindesc(:,j)';
    D{j} = ConvertDescBinary2Decimal(bindesc(:,j))';
end
% B = randi([0,1],1,256);
% D = ConvertDescBinary2Decimal(B);
end



function y = mysignfn(x)
z = sign(x);
z(z==0) = -1;
y = z;
end
