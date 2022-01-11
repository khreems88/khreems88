%Project Code -- Kevin Riemer
clear;clc;close all

%Constants
prompt1='Input m value:';
m=input(prompt1);
prompt2='Input n value:';
n=input(prompt2);
Pstar=1; h=1; U=1; dx=h/(n-1); int=0.5; n_int=(int/dx)+1;

%Dicretize

y_star=0:dx:1;
Bcst=-2*Pstar*(dx)^2;
for i=2:n-1
    B(1:n)=Bcst; 
end 

B(1)=0; %BC at y_star=0
B(n)=0; %BC at y_star=1
B(n_int)=0; %BC at y_star=0.5

%Build A matrix
for i=2:n-1
    w(i)=-2;
    v(i-1)=1;
end
    
A=diag(v,1)+diag(v,-1)+diag(w);
A(1,2)=0;
A(n-1,n)=1;
A(1,1)=1; %BC at y_star=0
A(n,n)=3/2; %BC at y_star=1
A(n,n-1)=-2; %BC at y_star=1
A(n,n-2)=1/2; %BC at y_star=1
A(n_int,n_int-2)=1/2; %Interface
A(n_int,n_int-1)=-2; %Interface
A(n_int,n_int)=(3/2)+(3/2)*m; %Interface
A(n_int,n_int+1)=-2*m; %Interface
A(n_int,n_int+2)=m/2; %Interface

%Thomas Algorithm

%But first, 2 steps of Gauss Elimination

%At Interface
A(n_int,n_int-2)=0;
A(n_int,n_int-1)=-1*(-2+1);
A(n_int,n_int)=-1*((((3/2)+(3/2)*m)-0.5)-(m/2));
A(n_int,n_int+1)=-1*(-2*m+m);
A(n_int,n_int+2)=0;

%At y_star=0
A(n,n-2)=0;
A(n,n-1)=-2+1; 
A(n,n)=1.5-0.5;

%Now Thomas Algorithm
Agauss=A;
Bgauss=B;

dprime(1)=Bgauss(1)/Agauss(1,1);
cprime(1)=Agauss(1,2)/Agauss(1,1);
bprime(1)=1;

for i=2:n-1
    c(i)=Agauss(i,i+1);
end 

for i=2:n
    bprime(i)=1;
    a(i)=Agauss(i,i-1);
    b(i)=Agauss(i,i);
    bstar(i)=b(i)-cprime(i-1)*a(i);
    d(i)=Bgauss(i);
    if i>n-1
        cprime(i)=0;
    else cprime(i)=c(i)/bstar(i);
    end 
    dprime(i)=(d(i)-dprime(i-1)*a(i))/(bstar(i));
end

%Solve for u_star
u_star(n)=dprime(n);
for i=n:-1:2
    u_star(i-1)=dprime(i-1)-cprime(i-1)*u_star(i);
end

%Sanity Check (RREF)
Asan=rref(Agauss);
u_star_san=[A\B']';

%Shear Stress -- second order fwd difference
tau=(U/h)*((-u_star(3)+4*u_star(2)-3*u_star(1))/(2*dx))

%Flow Rate -- Trapezoidal Rule
V=0;
for i=1:n-1
    V=V+U*h^2*sum(((u_star(i)+u_star(i+1))/2)*(dx));
end

disp('Flow rate=')
disp(V)

%Analytical Solutions -- use this to check numerical solution
u_star_ana=(-y_star.^2)+2.*y_star;
V_ana=(2/3)*U*h^2;
tau_ana=(2*U)/h;

%Plots
figure
plot(u_star_ana,y_star)
title('Analytical Solution of u*')
xlabel('u^* (dimensionless velocity)')
ylabel('y^*(dimensionless channel height)')

figure
plot(u_star,y_star,u_star_ana,y_star)
title('Numerical Solution of u* vs. Analytical Solution of u*')
xlabel('u^* (dimensionless velocity)')
ylabel('y^*(dimensionless channel height)')
legend('Numerical Solution','Analytical Solution','Location','northwest')

%Plot Multiple Results; plot over multiple runs (make sure to get rid of 'clear' in line 2 if doing
%this) -- and remove the comments from lines 126-131; you have to store
%multiple runs manually in the command window after each run

% figure
% plot(run1,y1,run2,y2,run3,y3,run4,y4,run5,y5,u_star_ana,y_star)
% title('Numerical Solution of u* with varying dx')
% xlabel('u^* (dimensionless velocity)')
% ylabel('y^*(dimensionless channel height)')
% legend('dx=0.1000','dx=0.0333','dx=0.0200','dx=0.0100','dx=0.0040','Analytical Solution','Location','northwest')

%Error -- Relative
Etau=(abs((tau_ana-tau)/tau_ana))*100 %percent
Eflow=(abs((V_ana-V)/V_ana))*100 %percent
E_ustar=(abs((u_star_ana-u_star)./u_star_ana)).*100; %percent

figure %error of u_star
plot([1:1:n],E_ustar)
title('Error of Numerical Solution Compared to Analytical Solution of u*')
xlabel('n')
ylabel('Error (%)')

%Effect of m; plot over multiple runs (make sure to get rid of 'clear' in line 2 if doing
%this) -- and remove the comments from lines 126-131; you have to store
%multiple runs manually in the command window after each run

% figure
% plot(run1,y1,run2,y2,run3,y3,run4,y4)
% title('Numerical Solution of u* with varying m')
% xlabel('u^* (dimensionless velocity)')
% ylabel('y^*(dimensionless channel height)')
% legend('m=0.5','m=1','m=2','m=3','Location','northwest')






