function [outputArg1,outputArg2] = gngauss(m,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nargin == 0
    m=0;sigma=1;
elseif nargin == 1
    sigma = m; m = 0;
end
u = rand;
r = sqrt(2*sigma^2*log(1/(1-u)));
v = rand;
teta = 2*pi*v;
outputArg1 = m+r*cos(teta);
outputArg2 = m+r*sin(teta);
end

