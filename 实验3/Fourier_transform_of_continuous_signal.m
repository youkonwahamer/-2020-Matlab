clear all;

%原函数
figure(1);
t=-1.5:0.0001:1.5;%%定义横坐标
rectwave=zeros(size(t));%%清空纵坐标

rectwave = ur(t+0.5)+9*ur(t+0.1)-20*ur(t)+9*ur(t-0.1)+ur(t-0.5);%%计算纵坐标
plot(t,rectwave);%%绘制脉冲函数
title({'3.1原函数';'t-y'},'FontSize',16);
xlabel('t','FontSize',12);
ylabel('y','FontSize',12);
hold on;
grid on;

%幅度谱和相位谱
figure(2);
%%构建频率轴
N_fft=length(t);
dT=0.001;
df=1/(dT*N_fft);
Faxis=df*((1:N_fft)-ceil(N_fft/2));
%%ceil()朝正无穷大方向取整 如果没有调用，相移之后的图形会比原图矮一些

%%傅里叶变换
RW=fft(rectwave);%%未经调整的傅里叶变换值
%首先是幅度谱
RW0=fftshift(RW);%%调整傅里叶变换值的位置
RWA=abs(RW0);%%显示绝对值
subplot(2,1,1);
plot(Faxis,RWA);%%绘制幅度谱
title({'3.2';'幅频曲线'},'FontSize',16);
xlabel('w','FontSize',16);
ylabel('|F(W)|','FontSize',16);
hold on;
%相位谱（直接调用angle函数求角度）
% RW(RW<0.001)=0;
Phase=angle(RWA)/pi*180;
subplot(2,1,2);
plot(Faxis,Phase);
title({'3.2';'相频曲线'},'FontSize',16);
xlabel('w','FontSize',16);
ylabel('φ(w)','FontSize',16);
hold on;

%然后是引入相位移动
figure(3);
%引入学号（ID）相关的相移
ID=100;
Pshift = 0.1*(ID-50)*Faxis;
RWchange=RW0.*exp(1j*Pshift);%此处引入相移，以下是逆变换过程
ReRW0=ifft(ifftshift(RWchange));%%调整顺序后再逆变换
ReRW=ifft(RWchange);%不调整顺序直接逆变换，乱码图
%逆变换结束，开始画图
plot(t,ReRW0,'r');
hold on;

plot(t,rectwave,'g');
hold on;
grid on;
legend('using ifftshift','origin signal');
title({'ID=100';'相位移动'},'FontSize',18);
% 用了ifftshift的图形，就相当于把相位移动转化为了时域的平移
% 但是不用shift调整数组顺序，由于ifft的自身运算定义，会把顺序改过的数组直接拿来算，出来一个乱码图

% 最后是脉冲信号部分
figure(4);
for k=1:5 	%变为5脉冲信号
    	rectwave5((k-1)*N_fft+1:k*N_fft) = rectwave;
end
N_fft5=length(rectwave5);
dT=0.001;
df=1/(dT*N_fft5);
Faxis5=df*((1:N_fft5)-ceil(N_fft5/2));
RW5_0=fftshift(fft(rectwave5));%%5脉冲信号经调整后的傅里叶变换
RW5_A=abs(RW5_0);
plot(Faxis,5*RWA);
axis([-30,30,-inf,inf])
hold on;
plot(Faxis5,RW5_A);
axis([-30,30,-inf,inf])
legend('origin signal','5-Pulsed signal')
title({'5脉冲频谱';},'FontSize',18);
xlabel('w','FontSize',16);
ylabel('F(w)','FontSize',16);

figure(5);
for k=1:11 	%变为11脉冲信号
    	rectwave11((k-1)*N_fft+1:k*N_fft) = rectwave;
end

N_fft11=length(rectwave11);
dT=0.001;
df=1/(dT*N_fft11);
Faxis11=df*((1:N_fft11)-ceil(N_fft11/2));
RW11_0=fftshift(fft(rectwave11));
RW11_A=abs(RW11_0);

for k=1:101 	%变为101脉冲信号
    	rectwave101((k-1)*N_fft+1:k*N_fft) = rectwave;
end
N_fft101=length(rectwave101);
dT=0.001;
df=1/(dT*N_fft101);
Faxis101=df*((1:N_fft101)-ceil(N_fft101/2));
RW101_0=fftshift(fft(rectwave101));
RW101_A=abs(RW101_0);

%画三个脉冲的图，然后加一些坐标轴图示

subplot(3,1,1)
plot(Faxis,5*RWA,'m');%%绘制幅度谱
axis([-30,30,-inf,inf])
hold on;
plot(Faxis5,RW5_A,'r');
axis([-30,30,-inf,inf])
xlabel('w','FontSize',16);
ylabel('F(w)','FontSize',16);
hold on;
legend('原函数','5脉冲');
subplot(3,1,2)
plot(Faxis,11*RWA,'m');%%绘制幅度谱
axis([-30,30,-inf,inf])
hold on;
plot(Faxis11,RW11_A,'g');
axis([-30,30,-inf,inf])
xlabel('w','FontSize',16);
ylabel('F(w)','FontSize',16);
hold on;
legend('原函数','11脉冲');
subplot(3,1,3)
plot(Faxis,101*RWA,'m');%%绘制幅度谱
axis([-30,30,-inf,inf])
hold on;
plot(Faxis101,RW101_A,'y');
axis([-30,30,-inf,inf])
xlabel('w','FontSize',16);
ylabel('F(w)','FontSize',16);
hold on;
legend('原函数','101脉冲');
figure(6);
rectwave11(1:N_fft) = rectwave;
for k=2:11 	%变为11脉冲信号
    	rectwave11((k-1)*N_fft-299:k*N_fft-300) = rectwave;
end

N_fft11=length(rectwave11);
dT=0.001;
df=1/(dT*N_fft11);
Faxis11=df*((1:N_fft11)-ceil(N_fft11/2));
RW11_0=fftshift(fft(rectwave11));
RW11_A=abs(RW11_0);

plot(Faxis,11*RWA);
axis([-30,30,-inf,inf])
hold on;
plot(Faxis11,RW11_A);
axis([-30,30,-inf,inf])
legend('origin signal','11-Pulsed signal')
title({'11脉冲频谱(相邻脉冲重叠)';},'FontSize',18);
xlabel('w','FontSize',16);
ylabel('F(w)','FontSize',16);

