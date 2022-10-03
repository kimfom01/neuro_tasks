clc

x = 1:10;
y = 5.*x + x.^2 + 2.*x.^3;

plot(x, y, 'bo-')