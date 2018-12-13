function res=nPointsPE(n,A)
% n: number of points

INP = sym('INP', [n, 3])
total=0.0

for n_u=1:n
    for n_v=n_u+1:n
        u=INP(n_u,:);
        v=INP(n_v,:);
        dist=sqrt((u(1)-v(1))^2 + (u(2)-v(2))^2 + (u(3)-v(3))^2);
        ene=dist^(-12) - 2*dist^(-6);
        total=total+ene;
    end
end

res=subs(total,INP,A)

