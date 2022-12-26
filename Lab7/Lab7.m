clc;
% building, training, and testing a neural network designed to smooth and approximate a sequence of values obtained with some error.
p = -2:0.2:3;
Q = length(p);
t = sin(p.^2 - p);
r = 10; 
t1=t+(rand(1,Q).*t*r/50-t*r/100);
plot(p,t,p,t1,'r-');
legend('initial function', 'with errors');
title('Original functions');

net=newff(minmax(p),[7 7 7 1], {'tansig','logsig','tansig','purelin'});
net=train(net,p,t1);
yf=sim(net,p);
figure;
plot(p,yf,'k',p,t1,'r',p,t,'g');
legend('smoothed function', 'with errors','initial function');
title('smoothing a function using newff');

[a,n] = max(abs(t1-yf));
['отн. ошибка= ' num2str((t1(n)-yf(n))/yf(n)*100) '%']


pt = -2:0.1:3;
Qt = length(pt);
tt = sin(pt.^2 - pt); 
yft=sim(net,pt);
figure;
plot(pt,yft,'b',pt,tt,'g');
legend('smoothed newff function', 'original function');
title('testing function smoothing using NeuralNetwork');


figure
e = yft-tt;
plot(pt,e,'b');
legend('newff network error','newrbe network error');
title('absolute errors in smoothing');