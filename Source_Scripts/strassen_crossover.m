function [crossover_point, times] = strassen_crossover()

% matrix sizes
sizes = [2^6 2^7 2^8 2^9 2^10 2^11 2^12];

crossover_point = 2048;

% Initialize timing array
times = zeros(size(sizes));

for i = 1:length(sizes)
    
    % random matrices
    A = rand(sizes(i));
    B = rand(sizes(i));
    
    % Time Strassen's algorithm
    tic;
    C = strassen(A, B, crossover_point);
    times(i) = toc;
    
end
%------------------------------
figure;
loglog(sizes, times);
hold on;
loglog(sizes, times(end)*(sizes./sizes(end)).^3);
xlabel('Matrix size');
ylabel('Time (s)');
legend('Strassen Cross@2048', 'Brute force (O(n^3))');
grid on;

end
%-------------------------------
function C = strassen(A, B, crossover_point)

% Brute Force case
n = size(A, 1);
if n <= crossover_point
    C = A*B;
    return;
end

% Split matrices into submatrices
m = n/2;
A11 = A(1:m, 1:m);
A12 = A(1:m, m+1:n);
A21 = A(m+1:n, 1:m);
A22 = A(m+1:n, m+1:n);
B11 = B(1:m, 1:m);
B12 = B(1:m, m+1:n);
B21 = B(m+1:n, 1:m);
B22 = B(m+1:n, m+1:n);

% Strassen Algo
P1 = strassen(A11+A22, B11+B22, crossover_point);
P2 = strassen(A21+A22, B11, crossover_point);
P3 = strassen(A11, B12-B22, crossover_point);
P4 = strassen(A22, B21-B11, crossover_point);
P5 = strassen(A11+A12, B22, crossover_point);
P6 = strassen(A21-A11, B11+B12, crossover_point);
P7 = strassen(A12-A22, B21+B22, crossover_point);


C11 = P1+P4-P5+P7;
C12 = P3+P5;
C21 = P2+P4;
C22 = P1-P2+P3+P6;


C = [C11 C12; C21 C22];

end