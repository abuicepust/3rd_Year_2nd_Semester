clc;close all;
img=imread('cameraman.tif');
HighKernel = [ -1 -1 -1; -1 10 -1; -1 -1 -1 ];
HPI = conv2(HighKernel, img);
subplot(2,2,1); imshow(img); title('Source Image');
subplot(2,2,2);imshow(HPI);title('High Pass Filtered Image');
LowKernel = [ 1 1 1; 1 -10 1; 1 1 1 ];
LPI = conv2(LowKernel,img);
subplot(2,2,3);imshow(img);
title('Source Image');
subplot(2,2,4);imshow(LPI);
title('Low Pass Filtered Image');