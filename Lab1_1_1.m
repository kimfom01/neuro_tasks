clc
clear all

N=8;
x=-0.2:4/N:4; % интервал от 0.2 до 4 разделен на N точек
y=log(x+1).*sqrt(exp(x) + exp(-x));
x
y