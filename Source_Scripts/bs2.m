function cp = bs2(a,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
cp=0;
%-----------
for i=1:n
    flag=0;
    for k=1:n-i
        cp=cp+1;
        if a(k)>a(k+1)
            flag=1;
            temp=a(k);
            a(k)=a(k+1);
            a(k+1)=temp;
        end
    end
    if flag==0
        break;
    end
end
%-----------
end