%    Creation Date: 2020/11/16
%    Modified Date: 2020/11/17
%           Author: Alessio Xompero
%            email: a.xompero@qmul.ac.uk

%----------prologue
clear all; close all; clc

%profile on

addpath(genpath('..'))
addpath(genpath('../../caffe-master/'))
% addpath(genpath('/import/linux/caffe/1.0.0-cuda-7.5-cudnn5/'))
% addpath(genpath(fullfile(getenv('HOME'),'AVIS_PhD_Project/Softwares/Caffe/matlab')))

basepath = '..';
datasets_info % Load datasets info

% Parameters
disp('Setup Neural Network')
setup_nn % setup and start the neural network for DeepBit

% 1. courtyard
% 2. gate
% 3. office
% 4. backyard
% for d=[1 4 2 3]
for d=2
  disp(['####### ' datasets(d).Name ' ######'])
  
  for c=1:datasets(d).NumCams
    disp(['##### cam' num2str(c) ' #####']);
    
    list_imgs = cell(datasets(d).Duration(c),1);
    for j=1:datasets(d).Duration(c)
      
      img = imread(fullfile(datasets(d).DataPath, 'images', ...
        ['view' num2str(c)], 'rgb', [num2str(A(j,2)+1, '%06d') '.png']));
      
      list_imgs(j) = rgb2gray(img);
    end
    
    tic
    
    % Compute DeepBit descriptors
    disp('Computing DeepBit...')
    
    [D, Ds] = ComputeDeepBit(list_imgs, net, mean_data, batch_size);
    
    toc
    
    fID = fopen(['deepbit_' datasets(d).Name '_view' num2str(c) '.txt'],'w');
    for j=1:length(D)
      fprintf(fID, ' %4d', j-1);
      desc = D{j};
      for l=1:length(desc)
        fprintf(fID, ' %d', desc(l));
      end
      fprintf(fID, ' \n');
    end
    fclose(fID);
    
  end
end

disp('Finished!')

%profile viewer
