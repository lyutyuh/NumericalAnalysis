function res=test(X0)

func = @potentialEnergy;

function [yy,grad_atX] = myFunc(XX);
yy=func(XX);
grad_atX=gradient(yy,0.0001);

res=myFunc(X0);
