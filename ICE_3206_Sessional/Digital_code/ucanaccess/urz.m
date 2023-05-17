%%%%URZ%%%
bitstream=[1 0 1 0 1 0];
bitrate = 1;
n = 1000;
len = length(bitstream);
time = len/bitrate;
N = n*len;
dt = time/N;
t = 0:dt:len;
x = zeros(1,length(t));

for i =1:len
    if bitstream(i)==1
        x((i-1)*n+1:(i-1)*n+n/2)=1;
    else 
         x((i-1)*n+1:(i-1)*n+n/2)=0;
    end
end

plot(t,x,'LineWidth',3);
axis([0 len -2 2]);
grid on;
title("URZ");
xlabel('Time in sec');
ylabel('Amplitude');