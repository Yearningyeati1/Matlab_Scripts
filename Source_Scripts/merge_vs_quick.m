%MAIN
k = 1;
%--Merge Sort--%
xne = zeros(1,10);
ync = zeros(1,10);
%--Quick Sort--%
ynd = zeros(1,10);
for n=10:10:100
    xne(k) = n;
    a = round(rand(1,n)*100);
    ynd(k) = qs(a,n);
    ync(k) = ms(a,n);
    cp = 0;
    k = k+1;
end
plot(xne,ynd,xne,ync)
title ("Sorting Analysis")
xlabel("No. of elements")
ylabel("No. of counts")
legend("Quick Sort","Merge Sort")
grid on

%--Quick Sort--%
function cp = qs(arr, n)
    cp = 0;
    if n > 1
        pivot = arr(end);
        left = [];
        right = [];
        for i = 1:n-1
            if arr(i) <= pivot
                left = [left, arr(i)];
            else
                right = [right, arr(i)];
                cp = cp + 1;  
            end
            cp = cp + 1; 
        end
        arr = [qs(left, numel(left)), pivot, qs(right, numel(right))];
    end
end

%--Merge Sort--%
function [count] = ms(arr, n)
    count = 0;
    if n > 1
        mid = floor(n/2);
        left = arr(1:mid);
        right = arr(mid+1:end);
        count = count + ms(left, numel(left));
        count = count + ms(right, numel(right));
        i = 1;
        j = 1;
        k = 1;
        while i <= numel(left) && j <= numel(right)
            if left(i) <= right(j)
                arr(k) = left(i);
                i = i + 1;
            else
                arr(k) = right(j);
                j = j + 1;
            end
            k = k + 1;
            count = count + 1;  % Counting the number of comparisons
        end
        while i <= numel(left)
            arr(k) = left(i);
            i = i + 1;
            k = k + 1;
        end
        while j <= numel(right)
            arr(k) = right(j);
            j = j + 1;
            k = k + 1;
        end
    end
end