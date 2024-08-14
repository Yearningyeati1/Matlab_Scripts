clear all;
clc;
xn=zeros(1,10);
yn=zeros(1,10);
yn2=zeros(1,10);
h=1;
for j=10:10:100
    a=round(rand(1,j)*100);
    yn(h)=bs1(a,j);
    yn2(h)=bs2(a,j);
    xn(h)=j;
    h=h+1;
end
plot(xn,yn)
grid on;
hold on;
plot(xn,yn2)
title("Bubble Sort Analysis")
xlabel('Array length:')
ylabel('No.of comparisons performed:')
legend('Brute Bubble Sort','Bubble Sort with termination')