clc;
% building, training, and testing a neural network designed to determine the numerical value of formula parameters, if the formula type is known.
x = 0:0.05:1;
a = 0.1 + 0.9 *rand;
b = 0.1 + 0.9 *rand;
y = a + b *x.^2;
T = zeros(2,100);
for i=1:100
    b=0.1 + 0.9 *rand;
    a=0.1 + 0.9 *rand;
    T(1,i)=a;
    T(2,i)=b;
    P(i,:)=a + b.*x.^2;
end

P=P';
net=newff(minmax(P),[3 4 2],{'tansig' 'tansig' 'purelin'},'trainlm');
net.performFcn='sse';
net.trainParam.goal=0;
net.trainParam.epochs=3000;
[net,tr]=train(net,P,T);
K=sim(net,y');
y1=K(1)+ K(2)*(x.^2);
plot(x,y,'o',x,y1);

[a,n] = max(abs(y1-y));
['отн.ошибка=' num2str((y1(n)-y(n))/y(n)*100) '%']