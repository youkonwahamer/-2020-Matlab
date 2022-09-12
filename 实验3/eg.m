 
clear,clc,close all;
w=-10:0.001:10;
f=2.23*(1./(2+i*w)-1./(5+i*w))
am=abs(f);
ang=angle(f);
subplot(2,1,1);plot(w,am);title('幅频响应');
subplot(2,1,2);plot(w,ang);title('相频响应');



