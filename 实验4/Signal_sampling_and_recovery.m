clear all;
%先画原信号
t=-0.4:0.0002:0.4;
x1=zeros(size(t));
x2=zeros(size(t));
x=zeros(size(t));
x1=0.02*(1+0.4*cos(60*pi*t));
x2=0.0001+t.^2;
x=x1./x2;
subplot(2,1,1)
plot(t,x);
title({'原信号';},'FontSize',20);
N_fft=length(t);
dt=0.0002;
df=1/(dt*N_fft);
F=df*((1:N_fft)-N_fft/2);
A=fftshift(fft(x));
y=abs(A);
subplot(2,1,2)
plot(F,y);
title({'幅频曲线'},'FontSize',20);
xlabel('frequency');
ylabel('amplitude');

% 抽样画stem棍棍图(时域抽样)
figure(2);
fs1=200;%定义抽样的频率，然后是相应的其他参数
ts1=1/fs1;
N_ts1 = floor(ts1/dt);%%floor 向负无穷舍入
Xs1 = zeros(size(t));
for k1 = 1:length(t)
    if( mod((k1-1), N_ts1)==0)%%mod(a,m)=a%m
        Xs1(k1) = x(k1);       % 每隔N_ts个时域数据抽取一个点
    end
end
subplot(2,1,1)
stem(Xs1);
title({'STEM(200)'},'FontSize',20);

fs2=80;%定义抽样的频率，然后是相应的其他参数
ts2=1/fs2;
N_ts2 = floor(ts2/dt);
Xs2 = zeros(size(x));
for k2 = 1:length(x)
    if( mod((k2-17), N_ts2)==0)
        Xs2(k2) = x(k2);       % 每隔N_ts个时域数据抽取一个点
    end
end
subplot(2,1,2)
stem(Xs2);
title({'STEM(80)'},'FontSize',20);

%错位相加模拟抽样频谱效果
figure(3);
% Rshift1=floor(fs1/df);
% %因为crishift是对数组操作，只能取整数值，除法不一定是整数结果，所以向下取整
% %crishift（A,K）将A中元素平移K个位置
% A1=A;
% for k1=-4:4
%    A1=A1+circshift(A,k1*Rshift1);
% end
% A1=A1-A;
% y1=abs(A1);
y1=fftshift(fft(Xs1))*dt*N_ts1 
ys1=abs(y1)
subplot(2,1,1);
plot(F,ys1);
title({'直接求傅里叶变换';'200'},'FontSize',12);

% Rshift2=floor(fs2/df);
% A2=A;
% for k2=-4:4
%    A2=A2+circshift(A, k2*Rshift2);
% end
% A2=A2-A;
% y2=abs(A2);
y2=fftshift(fft(Xs2))*dt*N_ts2 
ys2=abs(y2)
subplot(2,1,2);
plot(F,ys2);
title({'80'},'FontSize',12);


%滤波
figure(4);
fc1=fs1/2;
H1=(abs(F)<fc1);%低通滤波器，对F小于fc的数组元素，直接取0值
As1=H1.*y1;
subplot(2,1,1)
plot(F,abs(As1));
title({'低通后的幅频';'100'},'FontSize',20);
fc2=fs2/2;
H2=(abs(F)<fc2);%低通滤波器，对F小于fc的数组元素，直接取0值
As2=H2.*y2;
subplot(2,1,2)
plot(F,abs(As2));
title({'40'},'FontSize',20);

%对频域抽样滤波后的信号进行还原
figure(5);
X1=ifft(ifftshift(As1))*df*N_fft;

plot(t,X1,': r');
title({'频域抽样滤波后的信号还原'},'FontSize',20);
hold on;
X2=ifft(ifftshift(As2))*df*N_fft;
plot(t,X2,'-. g');
hold on;
plot(t,x,'-  k')
hold on;
legend('200抽样','80抽样','原信号');
% 
