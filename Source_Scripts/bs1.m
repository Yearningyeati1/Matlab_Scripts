function cp = bs1(a,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
cp=0;
%-----------
for i=1:n
    for k=1:n-i
        cp=cp+1;
        if a(k)>a(k+1)
            temp=a(k);
            a(k)=a(k+1);
            a(k+1)=temp;
        end
    end
end
%-----------
end