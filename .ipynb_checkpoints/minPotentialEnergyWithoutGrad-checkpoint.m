function res=minWithoutGrad(X0)

func = @potentialEnergy;

X0=cell2mat(X0);

res=fminunc(func,X0);
