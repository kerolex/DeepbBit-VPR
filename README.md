# DeepBit-VPR


Learning Compact Binary Descriptors with Unsupervised Deep Neural Networks

Created by Kevin Lin, Jiwen Lu, Chu-Song Chen, Jie Zhou

## Introduction

We propose a new unsupervised deep learning approach to learn compact binary descriptor. We enforce three criterions on binary codes which are learned at the top layer of our network: 1) minimal loss quantization, 2) evenly distributed codes and 3) rotation invariant bits. Then, we learn the parameters of the networks with a back-propagation technique. Experimental results on three different visual analysis tasks including image matching, image retrieval, and object recognition demonstrate the effectiveness of the proposed approach.

The details can be found in the following [CVPR 2016 paper](http://www.iis.sinica.edu.tw/~kevinlin311.tw/cvpr16-deepbit.pdf)


## Prerequisites

  0. MATLAB (tested with 2015a on 64-bit Ubuntu)
  0. Caffe's [prerequisites](http://caffe.berkeleyvision.org/installation.html#prequequisites)


## Installation

Adjust Makefile.config and simply run the following commands:

    $ make all -j8
    $ make matcaffe

For a faster build, compile in parallel by doing `make all -j8` where 8 is the number of parallel threads for compilation (a good choice for the number of threads is the number of cores in your machine).


## Retrieval evaluation on CIFAR10

First, run the following command to download and set up `CIFAR10 Dataset`, `VGG16 pre-trained on ILSVRC12`, `DeepBit 32-bit model trained on CIFAR10`. This script will rotate training data and create leveldb files.

    $ ./prepare.sh


Launch matalb and run `run_cifar10.m` to perform the evaluation of `precision at k` and `mean average precision at k`. We set `k=1000` in the experiments. The bit length of binary codes is `32`. 
    
    >> run_cifar10


Then, you will get the `mAP` result as follows. 

    >> MAP = 0.25446596


Note: CIFAR10 dataset is split into training and test sets, with 50,000 and 10,000 images, respectively. During retrieval process, the 50,000 training images are treated as the database. We use the 10,000 test images as the query samples.






We extract DeepBit image features using the 32-bit model pre-trained on Cifar10: [MEGA](https://mega.nz/#!kFd3RZbR!jhhlgfd-eOV4YpflBcZ3lE3UmeQqJFLuds1fLdIKS_0)  | [Dropbox](https://www.dropbox.com/s/z815s0cjdipwr5b/DeepBit32_final_iter_1.caffemodel?dl=0)

**Note**: This documentation may contain links to third party websites, which are provided for your convenience only. Third party websites may be subject to the third party’s terms, conditions, and privacy statements.

## Citations

If you use DeepBit in your research, please acknowledge:
```
Unsupervised Deep Learning of Compact Binary Descriptors
K. Lin, J. Lu, C-S. Chen, J. Zhou
IEEE Transactions on Pattern Recognition and Machine Intelligence, 
vol. 41, n.6, pp. 1501--1514, Jun, 2019
```

```
Learning Compact Binary Descriptors with Unsupervised Deep Neural Networks
K. Lin, J. Lu, C-S. Chen, J. Zhou
IEEE Conference on Computer Vision and Pattern Recognition (CVPR),
Las Vegas, NV, USA, 27-30 Jun, 2016
```

## Enquiries, Question and Comments

If you have any further enquiries, question, or comments about the MATLAB scripts for obtaining the image features of the dataset used in Xompero et al. [1], please contact a.xompero@qmul.ac.uk. 

Please contact the authors of DeepBit for technical enquiries, questions, or comments about the method:
* Kevi Lin (kevinlin311.tw@iis.sinica.edu.tw), 
* Jiwen Lu (lujiwen@tsinghua.edu.cn) 
* Chu-Song Chen (song@iis.sinica.edu.tw)

