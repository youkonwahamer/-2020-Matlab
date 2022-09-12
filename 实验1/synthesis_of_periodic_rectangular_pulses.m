clear all;
t=-0.5:0.001:7;

rectwave=zeros(size(t));
 for k=0:100
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
 end
rectwave=0.5+(2/pi)*rectwave;
subplot(3,1,1);%%图形排成3行1列，处于第一个位置
plot(t,rectwave);%%绘制点
title({'Exp-1.1';'k=100'},'FontSize',16);%%k=100时的曲线

rectwave=zeros(size(t));
for k=0:20
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end
rectwave=0.5+(2/pi)*rectwave;
  subplot(3,1,2);%%图形排成3行1列，处于第二个位置
plot(t,rectwave);
title('k=20','FontSize',16);%%k=20时的曲线

rectwave=zeros(size(t));
for k=0:3
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end
rectwave=0.5+(2/pi)*rectwave;
subplot(3,1,3);%%图形排成3行1列，处于第3个位置
plot(t,rectwave);
title('k=3','FontSize',16);%%k=3时的曲线

figure(2);
rectwave=zeros(size(t));
for k=0:500
   rectwave=rectwave+0.5*sin((2*k+1)*t)/(2*k+1);
  end
rectwave=0.25+(2/pi)*rectwave;
subplot(2,1,1);
plot(t,rectwave);
title({'Exp-1.2';'k=500，所有分量取原来的0.5'},'FontSize',24);%%将所有分量取0.5时的曲线

rectwave=zeros(size(t));
rectwave=0.05*sin(3*t)/3;%%3次谐波取0.05
for k=2:500
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end
rectwave=(2/pi)*sin(t)+0.5+(2/pi)*rectwave;
subplot(2,1,2);
plot(t,rectwave);
title('k=500,三次谐波取原来的0.05','FontSize',24);

figure(3);
rectwave=zeros(size(t));
for k=0:500
   rectwave=rectwave+sin((2*k+1)*t+(2*k+1)*pi/3)/(2*k+1);
  end
rectwave=0.5+(2/pi)*rectwave;
subplot(2,1,1);
plot(t,rectwave);
title({'Exp-1.3';'k=500,全部相移'},'FontSize',24);
rectwave=zeros(size(t));
rectwave=sin(3*t+pi)/3;
for k=2:500
   rectwave=rectwave+sin((2*k+1)*t)/(2*k+1);
  end
rectwave=(2/pi)*sin(t)+0.5+(2/pi)*rectwave;
subplot(2,1,2);
plot(t,rectwave);
title('k=500,只相移三次谐波','FontSize',24);

figure(4);
clear all;
t=-0.5:0.001:7;
rc=0.1;
rectRC1=zeros(size(t));
for k=0:500
    b=2*k+1;
    rectRC1=rectRC1+(sin(t*b-atan(rc*b))/sqrt(1+(rc*b)^2))/b;
end
rectRC1=0.5+(2/pi)*rectRC1;

rc=0.3;
rectRC2=zeros(size(t));
for k=0:500
    b=2*k+1;
    rectRC2=rectRC2+(sin(t*b-atan(rc*b))/sqrt(1+(rc*b)^2))/b;
end
rectRC2=0.5+(2/pi)*rectRC2;

rc=1;
rectRC3=zeros(size(t));
for k=0:500
    b=2*k+1;
    rectRC3=rectRC3+(sin(t*b-atan(rc*b))/sqrt(1+(rc*b)^2))/b;
end
rectRC3=0.5+(2/pi)*rectRC3;

rc=3;
rectRC4=zeros(size(t));
for k=0:500
    b=2*k+1;
    rectRC4=rectRC4+(sin(t*b-atan(rc*b))/sqrt(1+(rc*b)^2))/b;
end
rectRC4=0.5+(2/pi)*rectRC4;

plot(t,rectRC1,'r', 'LineWidth',0.8);
hold on;
plot(t,rectRC2,'b','LineWidth',0.25);
hold on;
plot(t,rectRC3,'g','LineWidth',0.25);
hold on;
plot(t,rectRC4,'c','LineWidth',0.25);
hold on;%%当前轴及图像保持不刷新可以使多个函数图像显示在一幅图，一套坐标系中
legend('rc=0.1','rc=0.3','rc=1','rc=3');
title('通过不同RC滤波器之后的波形','FontSize',24);
figure(5)

 rectwave=zeros(size(t));
 for k=1:100
   rectwave=rectwave+sin(k*pi/2)*sin(k*pi/2)*cos(k*4*t)/(k*k);
 end
rectwave=0.5+(4/(pi*pi))*rectwave;

plot(t,rectwave);%%绘制点
title({"三角波";'k=100'},'FontSize',16);%%k=100时的曲线

