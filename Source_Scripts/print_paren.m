function print_paren(s_arr,i,j)
if i==j
    fprintf("A%d",i);
else
    fprintf('(');
    print_paren(s_arr,i,s_arr(i,j));
    print_paren(s_arr,s_arr(i,j)+1,j);
    fprintf(')');
end
end