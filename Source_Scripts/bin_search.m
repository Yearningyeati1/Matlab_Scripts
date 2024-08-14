clear all;
sim_size=100;
step=10;
runs=10;
xne=zeros(1,20);
ync=zeros(1,20);
ync2=zeros(1,20);
arr=round(rand(1,20)*100);
for i=1:20
    xne(i)=i;
    ync(i)=bin_iter(arr,arr(i),1,20,0);
    ync2(i)=bin_recur(arr,arr(i),1,20,0);
end

bar(xne,ync,0.5,'FaceColor',[0.2 0.2 0.7]);
hold on;
bar(xne,ync2,.25,'FaceColor',[0 0.7 0.7]);
title("Performace: Iterative VS Recursive Versions of Binary search: Array of 20 elements")
xlabel("Element number")
ylabel("No. of Comparisons Performed")
legend("Binary Search: Iterative","Binary Search: Recursive")
grid on

function cp = bin_iter(a,key,lb,ub,cp)
cp=cp+1;
while(lb<=ub)
    cp=cp+1;
    mid=floor((lb+ub)/2);
    cp=cp+1;
    if(a(mid)>key)
        ub=mid-1;
        cp=cp+1;
    elseif(a(mid)<key)
        lb=mid+1;
        cp=cp+1;
    else
        index=mid;
        cp=cp+1;
        return;
    end
end
end
        

function cp = bin_recur(a,key,lb,ub,cp)
cp=cp+1;
if(lb<=ub)
    cp=cp+1;
    if(lb==ub)
        cp=cp+1;
        if(a(lb)==key)
            index=lb;
            return;
        end
    else    
    mid=floor((lb+ub)/2);
    cp=cp+1;
    if(a(mid)==key)
        index=mid;
        return;
    elseif(a(mid)>key)
        cp=cp+1;
        cp=bin_recur(a,key,lb,mid-1,cp);
    else
        cp=bin_recur(a,key,mid+1,ub,cp);
    end
    end
else
index=-1;
end
end