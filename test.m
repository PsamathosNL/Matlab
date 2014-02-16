format short
clc
close all
% x = 1:0.1:10;
% ci = [0, 1];
% ri = [0, 10];
% y = zeros(size(x));
% for i = 1:length(ci)
%    y = y+ci(i).*(x+ri(i)*(rand(size(x))-0.5)).^(i-1);
% end
%[a,b] = polyfit(x,y,3);

x= [1:5];
y = [1,2,4,4,5];

o = [0,1];
fmq  =fmlsqAB(x,y)
%[h(1), h(3); h(2), h(4)]
%verg = vergelijk(x,y,o(end))

fmj = fmlsqJ(x,y,o)
break
hold on
plot(x,y,'.r')
xf = x(1):0.01:x(end);
yf = 0.*xf;
for i = 1:length(c);
    yf = yf + c(i).*xf.^(i-1);
end
plot(xf,yf)
