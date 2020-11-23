%
%
%    Creation Date: 2020/11/16
%    Modified Date: 2020/11/16
%           Author: Alessio Xompero
%            email: a.xompero@qmul.ac.uk
%
%
%---- prologue
% clear all; close all; clc;

% Load information of the datasets

% predatapath=fullfile('/media','alessioxompero','Elements','AVIS_PhD','Datasets','M3CAM-2.0');
% predatapath=fullfile('/home','alessio','Desktop','AVIS_PhD_Project','Datasets','M3CAM-2.0');
predatapath=fullfile('..','..','..','Datasets','M3CAM-2.0');

%%% Datasets definition for the results
datasets(1).Name = 'courtyard';
datasets(1).NumCams = 4;
datasets(1).DataPath = fullfile(predatapath, 'courtyard/');
datasets(1).Duration = [2849,3118,3528,3454];

datasets(2).Name = 'gate';
datasets(2).NumCams = 4;
datasets(2).DataPath = fullfile(predatapath, 'gate/');
datasets(2).Duration = [330,450,480,375];

datasets(3).Name = 'office';
datasets(3).NumCams = 3;
datasets(3).DataPath = fullfile(predatapath, 'office/');
datasets(3).Duration = [573,612,1352];

datasets(4).Name = 'backyard';
datasets(4).NumCams = 4;
datasets(4).DataPath = fullfile(predatapath, 'backyard/');
datasets(4).Duration = [1217,1213,1233,1235];
