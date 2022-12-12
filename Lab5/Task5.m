clear;

xx = -2:0.1:3;
yy = func(xx);

disp('Input data:')
disp(xx)
disp(yy)

%figure;
%hold on;
%plot(xx, yy);
%title('Исходная функция');

net = newff(minmax(xx), [10, 1], {'tansig', 'purelin'});
net.trainParam.epochs = 50;

net = train(net, xx, yy);

yy1 = sim(net, xx);

disp('Simulate data:')
disp(yy)
disp(yy1)
disp('error: ')
disp(yy1 - yy)

figure;
hold on;
plot(xx, yy);
plot(xx, yy1, 's');
title('Исходная функция и симулированные данные');

xx1 = -2:0.1:3;
yy2_true = func(xx1); 
yy2_sim = sim(net, xx1);



figure;
hold on;
plot(xx1, yy2_true);
plot(xx1, yy2_sim);
plot(xx, yy, 's');
title('Реальные значения функции и её симуляция');
disp('mean error:')
disp(mean(abs(yy2_true - yy2_sim)))


function res = func(xx)
    res = sin(xx.^2 - xx);
end