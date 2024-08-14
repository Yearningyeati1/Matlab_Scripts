function [min_cost,res_arr,s_arr]=memo_mat_chain(chain)
n=length(chain)-1;
res_arr=-1*ones(n,n);
s_arr=-1*ones(n,n);

%------------------------
function cost=recur_cost(i,j)
if res_arr(i,j)>=0
    cost=res_arr(i,j);
elseif i==j
    cost=0;
else
    cost=inf;
    for k=i:j-1
        res= recur_cost(i,k)+ recur_cost(k+1,j)+ chain(i)*chain(k+1)*chain(j+1);
        if res<cost
            s_arr(i,j)=k;
            cost=res;
        end
    end
    res_arr(i,j)=cost;
end
end
%-----------------------------

min_cost=recur_cost(1,n);
end

