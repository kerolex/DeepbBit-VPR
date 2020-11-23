%% setup_neuralnet

% -- settings start here ---
use_gpu = 0; % set 1 to use gpu, and 0 to use cpu
feat_len = 32;
batch_size = 10;

net_weights = '../models/deepbit/DeepBit32_final_iter_1.caffemodel';   % models
net_model = '../models/deepbit/deploy32.prototxt';                  % model definition
% --- settings end here ---

caffe.reset_all();

% Set caffe mode
if exist('use_gpu', 'var') && use_gpu
  caffe.set_mode_gpu();
  gpu_id = 0;  % we will use the first gpu in this demo
  caffe.set_device(gpu_id);
else
  caffe.set_mode_cpu();
end

% Initialize the network using BVLC CaffeNet for image classification
% Weights (parameter) file needs to be downloaded from Model Zoo.
phase = 'test'; % run with phase test (so that dropout isn't applied)

if ~exist(net_weights, 'file')
    error('%s does not exist.', net_weights);
end

if ~exist(net_model, 'file')
    error('%s does not exist.', net_model);
end

% Initialize a network
%net = caffe.Net(net_model, net_weights, phase);

% load mean file
d = load('../models/deepbit/cifar10_mean_train.mat');
mean_data = d.mean_data;
