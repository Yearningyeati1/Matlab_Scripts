%-Quickselect Performance Analysis
%--In each instance 3rd largest element is found in arrays
%--of size ranging from 50-500
x=zeros(1,450);
y=zeros(1,450);
k=1;
for i=50:500
    arr=round(rand(1,i)*100);
    cp=quickselect(arr,1,i,0,3);
    x(k)=i;
    y(k)=cp;
    k=k+1;
end
bar(x,y);
title("Performance of Quickselect on Random Arrays, Case:Selecting 3rd Largest element");
xlabel("Array Size")
ylabel("Comparisons Made");

function cp= quickselect(a, lb, ub, cp,k)
if lb < ub
    cp = cp + 1;
    [a, loc, cp] = partition(a, lb, ub, cp);
    cp=cp+1;
    if(loc==k)
        res=a(k);
        return;
    elseif(loc>k)
        cp= quickselect(a, lb, loc-1, cp,k);
    else
        cp= quickselect(a, loc+1, ub, cp,k);
    end
end
cp = cp + 1;
end

function [a, d, cp] = partition(a, lb, ub, cp)
pivot = a(lb);
start = lb + 1;
last = ub;
while start <= last
    while start <= ub && a(start) <= pivot
        start = start + 1;
        cp = cp + 1;
    end
    cp = cp + 1;
    while last >= lb + 1 && a(last) > pivot
        last = last -1;
        cp = cp + 1;
    end
    cp = cp + 1;
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