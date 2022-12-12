clear;
x = 0:0.5:5;
y = 1:0.5:5;
[X,Y] = meshgrid(x,y);
Z= nthroot((X+Y),3);

mesh(X,Y,Z);
grid on

XX = X(1:end);
YY = Y(1:end);
ZZ = Z(1:end);

p =[XX;YY];

t = ZZ;

net2 = newrbe(p,t);
ynet = sim(net2,p);

abs(ynet - t)

x1 = 0:0.2:5;
y1 = 1:0.2:5;
[X1,Y1] = meshgrid(x1, y1);
Z1 = nthroot((X1+Y1),3);
XX1 = X1(1:end);
YY1 = Y1(1:end);
ZZ1 = Z1(1:end);
ptest = [XX1; YY1];
ttest = ZZ1;
yt = sim(net2, ptest);

YT = reshape(yt, size(Z1));
figure
subplot(1,2,1);
mesh(X1, Y1, Z1);
grid on
subplot(1,2,2);
mesh(X1, Y1, YT);
grid on;

[a,n] = max(abs(yt-ZZ1))
['отн.ошибка=' num2str((ZZ1(n)-yt(n))/yt (n)*100) '%']