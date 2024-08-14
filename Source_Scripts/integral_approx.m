sim_size=100;
xne=zeros(1,sim_size);
yne=zeros(1,sim_size+1);
base=10000;
step=10000;
k=1;
for j=1:5
    k=1;
for i=base:step:base+step*sim_size
    xne(k)=i;
    yne(k)=yne(k)+monte_integ(i);
    k=k+1;
end
end
plot(xne,yne/5);
hold on;
plot(3.14159,zeros(1,10))
grid on;
xlabel('Number of Sample Points');
ylabel('Approximation result');
title('Approximating integral [0->2](sqrt(4-x^2)) using Randomized Algorithms');

function approx=monte_integ(samples)
%integral 0->2(sqrt(4-x^2))
%f calculates the function value at x;
f=@(x)sqrt(4-x.^2);
%matrix x of size<1,samples> stores random values between 0 to 2 for our
%problem
x=2*rand(1,samples);
%sample stores the curve values for these individual points
sample=f(x);
%our approximation is nothing but the average area under the curve
approx=2*mean(sample);
end