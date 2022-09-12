clear all;
t=-0.4:0.0002:0.4;

N_fft=length(t);
dT=0.0002;
df=1/(dT*N_fft);
F=df*((1:N_fft)-N_fft/2);

fs=200;
ts=1/fs;
nt=-0.4:ts:0.4;
%定义抽样的频率，然后是相应的其他参数

fc=50;%滤波器的滤波

%先画原信号
t=-0.4:0.0002:0.4;
x1=zeros(size(t));
x2=zeros(size(t));
x=zeros(size(t));
x1=0.02*(1+0.4*cos(60*pi*t));
x2=0.0001+t.^2;
x=x1./x2;
plot(t,x);
title({'HFUT Signal&System2021 Exp-4.1';'origin signal'},'FontSize',20);

%频谱
figure(2);
A=fftshift(fft(x));
y=abs(A);
plot(F,y);
title({'HFUT Signal&System2021 Exp-4.2';'frequency-amplitude'},'FontSize',20);
xlabel('frequency');
ylabel('amplitude');

%抽样画stem棍棍图(时域抽样)
figure(3);
xs=0.02*(1+0.4*cos(60*pi*nt))./(nt.*nt+0.0001);%直接从原函数抽样
stem(xs);
title({'HFUT Signal&System2021 Exp-4.3';'STEM'},'FontSize',20);

%错位相加模拟抽样效果
figure(4);
Rshift=floor(fs/df);
%因为crishift是对数组操作，只能取整数值，除法不一定是整数结果，所以向下取整
for k=-4:4
   A=A+circshift(A,[0 k*Rshift]);
end
y=abs(A);
plot(F,y);
title({'HFUT Signal&System2021 Exp-4.4';'Cuo Wei Xiang Jia'},'FontSize',20);
xlabel('frequency');
ylabel('amplitude');

%滤波
figure(5);
H=(abs(F)<fc);%低通滤波器，对F小于fc的数组元素，直接取0值
As=H.*A;
plot(F,abs(As));
title({'HFUT Signal&System2021 Exp-4.5';'Low Pass Filter'},'FontSize',20);
xlabel('frequency');
ylabel('amplitude');

%对频域抽样后的信号进行还原
figure(6);
ys=ifft(ifftshift(As));
plot(t,ys);
title({'HFUT Signal&System2021 Exp-4.6';'recovery after sampling and LowPassFilter'},'FontSize',20);
xlabel('time');
ylabel('value');
————————————————
版权声明：本文为CSDN博主「Endless Woo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/Endless_Wu/article/details/117370968