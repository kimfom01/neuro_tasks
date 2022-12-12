clc;

% реализация функция "И" с помощью персептрона
P = [0 0 1 1; 0 1 0 1];
T = [0 0 0 1];
ANDNet = newp([0 1; 0 1], 1);
Y0 = sim(ANDNet, P);
ANDNet.trainParam.epochs = 20;
net = train(ANDNet, P, T);
Y = sim(net, P);

disp('AND');
disp(P);
disp(Y);

% реализация функция "ИЛИ" с помощью персептрона
P = [0 0 1 1; 0 1 0 1];
T = [0 1 1 1];
ORNet = newp([0 1; 0 1], 1);
Y0 = sim(ORNet, P);
ORNet.trainParam.epochs = 20;
net = train(ORNet, P, T);
Y = sim(net, P);

disp('OR');
disp(P);
disp(Y);

% реализация функция "НЕТ" с помощью персептрона
P = [0 1];
T = [1 0];
NOTNet = newp([0 1], 1);
Y0 = sim(NOTNet, P);
NOTNet.trainParam.epochs = 20;
net = train(NOTNet, P, T);
Y = sim(net, P);

disp('NOT');
disp(P);
disp(Y);

% реализация функция "исключающее ИЛИ" с помощью персептрона
P = [0 0 1 1; 0 1 0 1];
T = [0 1 1 0];
XORNet = newp([0 1; 0 1], 1);
Y0 = sim(XORNet, P);
XORNet.trainParam.epochs = 20;
net = train(XORNet, P, T);
Y = sim(net, P);

disp('XOR');
disp(P);
disp(Y);

% реализация функция "исключающее ИЛИ" с помощью сеть прямого распространения
P = [0 0 1 1; 0 1 0 1];
T = [0 1 1 0];
XORNet = newff([0 1; 0 1], [5, 1], {'tansig', 'purelin'});
Y0 = sim(XORNet, P);
XORNet.trainParam.epochs = 20;
net = train(XORNet, P, T);
Y = sim(net, P);

disp('XOR2');
disp(P);
disp(Y);