clc;close all;
c=input('Please Input Constant C: ');
gamma=input('Input Constant Gamma: ');
img=imread('E:\3-2\ICE-3207 DISP\ICE-3208 Sessional\Exm\\JWST.jpg');
subplot(1,2,1);imshow(img);
title('Input image');
img2=im2double(img);
trans_img=c*(img2.^gamma);
subplot(1,2,2);imshow(trans_img);
title('Power Law Transformation');