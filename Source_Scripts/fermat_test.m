clear all;
% Checking correctness of our primality testing implementation
k=1;
count=0;count3=0;
tt=0;
p=zeros(1,100);

p3=zeros(1,100);
xne=zeros(1,100);
for j=10:30000
    count=count+(fermat_tet(j,5)~=brutecheckprime(j));
    
   
    count3=count3+(fermat_tet(j,100)~=brutecheckprime(j));
    tt=tt+1;
    p(k)=count/tt;
    
    p3(k)=count3/tt;
    xne(k)=tt;
    k=k+1;
end
%Plot returns probablity that our implementation returns incorrect output
%versus sample size

plot(xne,p)
hold on
title("Probability plot that Fermat's Little Theorem Implementation returns incorrect result")
xlabel("Probablity")

plot(xne,p3)
legend("Check levels:5","Check levels:100")


function prime=fermat_tet(n,runs)
for i=1:runs
a=randi([1,n-1]);
f=modpower(a,n-1,n);
prime=1;
if f~=1
    prime=0;
    return;
end
end
end
function result = modpower(base, exponent, modulus)
    % Efficient modular exponentiation using square-and-multiply algorithm
    result = 1;
    base = mod(base, modulus);

    while exponent > 0
        if mod(exponent, 2) == 1
            result = mod(result * base, modulus);
        end
        exponent = floor(exponent / 2);
        base = mod(base^2, modulus);
    end
end
function res=brutecheckprime(n)
     res=1;
     for i=1:floor(sqrt(n))
         if mod(n,i)==0
             res=0;
             return;
         end
     end
end