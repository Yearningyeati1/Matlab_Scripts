function cp = heapsort(a)
%Heapsort Routine
% 
cp=0;
t1=0;t2=0;
n=length(a);
for i=floor(n/2):-1:1
    [a t1]=heapify(a,n,i);
end

for j=n:-1:2
    
    temp=a(1);a(1)=a(j);a(j)=temp;
    [a t2]=heapify(a,j-1,1);
end
cp=cp+t1+t2;
end