function [res, grad]=potentialEnergy(A)
%A should be a list of (x,y,z)

n_rows=length(A);

INPVEC = sym('INPVEC', [length(A) 1]);

INP = zeros([n_rows/3 3], 'sym')


for i=1:n_rows
    c = mod(i,3);
    if c == 0
        c = 3;
    end
    r = floor(i/3-0.1) +1;
    INP(r,c)=INPVEC(i);
end

n_rows = size(INP);
n_rows = n_rows(1);

total=0.0
for n_u=1:n_rows
    for n_v=n_u+1:n_rows
        u=INP(n_u,:);
        v=INP(n_v,:);
        dist=sqrt((u(1)-v(1))^2 + (u(2)-v(2))^2 + (u(3)-v(3))^2);
        ene=dist^(-12) - 2*dist^(-6);
        total=total+ene;
    end
end
res=size(A)
res=double(subs(total,INPVEC,A'))
grad=gradient(total,INPVEC)
grad=double(subs(grad,INPVEC,A'))