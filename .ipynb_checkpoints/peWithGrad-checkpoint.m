function res=peWithGrad(X0)
func = @potentialEnergy;

X0 = cell2mat(X0);
y=func(X0);
yp = diff(y,X0);
res=yp;
% res=gradient(func, X0);