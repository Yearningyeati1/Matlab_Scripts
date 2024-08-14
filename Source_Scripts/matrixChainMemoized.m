function minCost = matrixChainMemoized(p)
    n = length(p) - 1;
    m = -1 * ones(n, n); % Initialize cost matrix with -1
    s = -1 * ones(n, n); % Initialize split matrix with -1

    % Helper function to recursively calculate cost
    function cost = lookupChain(i, j)
        if m(i, j) >= 0
            cost = m(i, j);
        elseif i == j
            cost = 0;
        else
            cost = inf;
            for k = i:j-1
                q = lookupChain(i, k) + lookupChain(k+1, j) + p(i)*p(k+1)*p(j+1);
                if q < cost
                    cost = q;
                    s(i, j) = k;
                end
            end
            m(i, j) = cost;
        end
    end

    minCost = lookupChain(1, n);
end