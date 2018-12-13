function res=minWithGrad(X0)

func = @potentialEnergy;

X0=cell2mat(X0);

options = optimset('GradObj','on')

[res,grd]=fminunc(func,X0, options);
