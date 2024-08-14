%-Quickselect Performance Analysis vs inbulit sort implementation to search
%3rd largest element
%--In each instance 3rd largest element is found in arrays
%--of size ranging from 20-220
clear all;close all;
x=zeros(1,200);
y=zeros(1,200);
y1=zeros(1,200);
y2=zeros(1,200);


k=2;
for i=20:220

    arr=round(rand(1,i)*100);
    x(k)=i;
    tic;
    res1=quickselect1(arr,1,i,3,-1);
    y(k)=y(k-1)+toc;

    k=k+1;
end

k=2;
for i=20:220

    arr=round(rand(1,i)*100);
    x(k)=i;
    
    tic;
    res2=select_brute(arr,3);
    y1(k)=y1(k-1)+toc;

    k=k+1;
end

k=2;
for i=20:220

    arr=round(rand(1,i)*100);
    x(k)=i;
    
    tic;
    res3=quickselect_rand(arr,1,i,3,-1);
    y2(k)=y2(k-1)+toc;

    k=k+1;
end


plot(x,y);
hold on;
plot(x,y1);
plot(x,y2);
title("Selecting 3rd Largest Element: 3 Approaches");
xlabel("Array Size")
ylabel("Time Spent:Cumulative");
legend("Quickselect: Static Pivot","Brute Sorting Method","Quickselect:Randomized")


function res= select_brute(a,k)
l=sort(a);
res=l(length(a)-k);
end


function res= quickselect1(a, lb, ub,k,res)
if lb < ub
    [a, loc] = partition(a, lb, ub);
    if(loc==k)
        res=a(k);
        return;
    elseif(loc>k)
        res= quickselect1(a, lb, loc-1,k,res);
    else
        res= quickselect1(a, loc+1, ub,k,res);
    end
end
end

function res= quickselect_rand(a, lb, ub,k,res)
if lb < ub
    [a, loc] = partition_rand(a, lb, ub);
    if(loc==k)
        res=a(k);
        return;
    elseif(loc>k)
        res= quickselect_rand(a, lb, loc-1,k,res);
        return;
    else
        res= quickselect_rand(a, loc+1, ub,k,res);
        return;
    end
end
end

%----Regular Static Partition
function [a, d] = partition(a, lb, ub)
pivot = a(lb);
start = lb + 1;
last = ub;
while start <= last
    while start <= ub && a(start) <= pivot
        start = start + 1;

    end
    while last >= lb + 1 && a(last) > pivot
        last = last -1;

    end
    if start < last
        temp = a(start);
        a(start) = a(last);
        a(last) = temp;
    end
end
a(lb) = a(last);
a(last) = pivot;
d = last;
end


%--Randomized Partition

function [a, d] = partition_rand(a, lb, ub)
%---Selecting Random Pivot
x=randi([lb,ub]);
temp=a(lb);a(lb)=a(x);a(x)=temp;
a(lb) = a(x);
%---------------

pivot = a(lb);
start = lb + 1;
last = ub;
while start <= last
    while start <= ub && a(start) <= pivot
        start = start + 1;
        
    end
    
    while last >= lb + 1 && a(last) > pivot
        last = last -1;
        
    end
    
    if start < last
        temp = a(start);
        a(start) = a(last);
        a(last) = temp;
    end
end
a(lb) = a(last);
a(last) = pivot;
d = last;
end

