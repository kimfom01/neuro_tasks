clc;
clear all;

% 1
A = [7 0 1 12; 11 22 1 17; 5 13 0 15; 14 8 18 2];
s_col = sum(A,1)
s_row = sum(A,2)


% 2
diag = trace(A)

% 3
s_3 = sum(A(2,1:3))


% 4
s_last_row = sum(A(4,:))
s_last_col = sum(A(:,4))

% 5
B = A;
B(:,1) = []

% 6
temp = A(:, 2);
A(:, 2) = A(:,3);
A(:,3) = temp;
A