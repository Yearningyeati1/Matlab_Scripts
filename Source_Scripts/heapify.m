function [a cp]=heapify(a,n,i)
%Heapify Routine
t=0;cp=0;
l=2*i;
r=2*i+1;
largest=i;
cp=cp+1;
if((l<=n)&&(a(largest)<a(l)))
    largest=l;
end
cp=cp+1;
if((r<=n)&&(a(largest)<a(r)))
    largest=r;
end
cp=cp+1;
if(largest~=i)
    temp=a(i);a(i)=a(largest);a(largest)=temp;
    [a t]=heapify(a,n,largest);
    cp=cp+t;
end

end