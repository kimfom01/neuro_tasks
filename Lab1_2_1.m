clc
clear all

% 1
A = [7 0 1 12; 11 22 1 17; 5 13 0 15; 14 8 18 2];
s_col = sum(A,1);
s_row = sum(A,2);
s_col
s_row

% 2
diag = trace(A)

% 3
s_3 = sum(A(2,[1:3]));
s_3

% 4
