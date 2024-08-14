%Simulation to test performance of matrix chain mul. algorithms
clear all;
x=zeros(20);
y=zeros(20);
y1=zeros(20);
p=[12,21,65,18,24,93,121,16,41,31,47,5,47,29,76,18,72,15]; % Matrix chain

for i=2:20
    x(i)=i;
    tic;
    [a,b,c]=dyn_mat_chain(p);
    y(i)=y(i-1)+toc;
end
for i=2:20
    tic;
    [d,e,f]=memo_mat_chain(p);
    y1(i)=y1(i-1)+toc;
end

plot(x,y);
title("Performace Analysis of the Dynamic/Memoized versions of Matrix Chain Multiplication Algorithms");
xlabel("Iteration number");
ylabel("Time elapsed:Cumulative")
hold on;
plot(x,y1);
legend("Dynamic Matrix Chain","Memoized Matrix Chain")