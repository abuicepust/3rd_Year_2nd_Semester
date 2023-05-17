img=imread('kids.tif');
[r,c]=size(img);
subplot(331);imshow(img);title('Source image')
[u,v]=meshgrid(-floor(c/2):floor((c-1)/2),-floor(r/2):floor((r-1)/2));
sin_noise= 15*sin( 2*pi*1/10*u + 2*pi*1/10*v);
noisy_img=double(img)+sin_noise;
NOISY_IMG=fftshift(fft2(noisy_img));
subplot(332);imshow(noisy_img,[]);title('Sinusoidal noisy image');
subplot(339);imshow(mat2gray(log(1+abs(NOISY_IMG))));title('FFT of noisy image');
D=sqrt(u.^2+v.^2);
D0=50;W=20;
GBRF= 1 - exp ( -(1/2).* ( ((D.^2)-(D0.^2)) ./ (D.*W) ).^2 ) ;
subplot(333);mesh(GBRF);title('GBRF');
GBRF_IMG=NOISY_IMG.*GBRF;
gbrf_img=ifft2(GBRF_IMG);
subplot(337);imshow(mat2gray(abs(gbrf_img)));title('GBRF filtered image');
GBPF=1 - GBRF;
subplot(335);mesh(GBPF);title('GBPF');
GBPF_IMG=NOISY_IMG.*GBPF;
gbpf_img=ifft2(GBPF_IMG);
subplot(338);imshow(mat2gray(abs(gbpf_img)));title('GBPF filtered image');