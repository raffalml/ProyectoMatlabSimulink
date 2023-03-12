%% CODIGO DE MATLAB PROYECTO
clear all
clc
% Calculo de los puntos de equilibrio
Xi1=0; Xi2=0; m1=0.1; m2=0.1; g=9.81; l1=0.5; l2=0.5;
syms x1 x2 x3 x4
u=0;

%Ecuacion de estado No.2 -> X2p
n1=2*l2*Xi1-2*(l2+l1*cos(x3))*Xi2;
n2=2*l2*u;
n3=g*(2*m1+m2)*sin(x1);
n4=-g*m2*sin(x1+2*x3);
n5=l1*m2*sin(2*x3)*x2^2;
n6=2*l2*m2*sin(x3)*(x2+x4)^2;
d=2*l1^2*l2*(m1+m2-m2*cos(x3)^2);
X2p=(n1+n2+(l1*l2)*(n3+n4+n5+n6))/d;

%Ecuacion de estado No.4 -> X4p
DEN=l1^2*l2^2*m2*(m1+m2-m2*cos(x3)^2);
N1= l2^2*m2+l1^2*(m1 + m2)+2*l1*l2*m2*cos(x3);
N2= -Xi2+l2*m2*(-g*sin(x1+x3) +l1*sin(x3)*x2^2);
N3=l2*m2*(l2+l1*cos(x3));
N4=g*l1*(m1+m2)*sin(x1);
N5=g*l2*m2*sin(x1+x3);
N6=Xi1+u;
N7=l1*l2*m2*sin(x3)*x4*(2*x2+x4);
X4p=(-1/DEN)*(N1*N2 +N3*(N4 +N5+N6+N7));

%Funcion de Estados
fx=[x2;...
    X2p;...
    x4;...
    X4p;];
% Calculando los puntos de equilibrio
PEQSOL=solve(fx,x1,x2,x3,x4);


%% Definiendo la funcion de estados
clear all
clc

syms x1 x2 x3 x4 Xi1 Xi2 m1 m2 g l1 l2 u

%Ecuacion de estado No.2 -> X2p
n1=2*l2*Xi1-2*(l2+l1*cos(x3))*Xi2;
n2=2*l2*u;
n3=g*(2*m1+m2)*sin(x1);
n4=-g*m2*sin(x1+2*x3);
n5=l1*m2*sin(2*x3)*x2^2;
n6=2*l2*m2*sin(x3)*(x2+x4)^2;
d=2*l1^2*l2*(m1+m2-m2*cos(x3)^2);
X2p=(n1+n2+(l1*l2)*(n3+n4+n5+n6))/d;

%Ecuacion de estado No.4 -> X4p
DEN=l1^2*l2^2*m2*(m1+m2-m2*cos(x3)^2);
N1= l2^2*m2+l1^2*(m1 + m2)+2*l1*l2*m2*cos(x3);
N2= -Xi2+l2*m2*(-g*sin(x1+x3) +l1*sin(x3)*x2^2);
N3=l2*m2*(l2+l1*cos(x3));
N4=g*l1*(m1+m2)*sin(x1);
N5=g*l2*m2*sin(x1+x3);
N6=Xi1+u;
N7=l1*l2*m2*sin(x3)*x4*(2*x2+x4);
X4p=(-1/DEN)*(N1*N2 +N3*(N4 +N5+N6+N7));

%Funcion de Estados
fx=[x2;...
    X2p;...
    x4;...
    X4p;];

xv=[x1;x2;x3;x4];
Xi=[Xi1;Xi2];

% Jacobianos
dfdx=simplify(jacobian(fx,xv));
dfdu=simplify(jacobian(fx,u));
dfdXi=simplify(jacobian(fx,Xi));

%% Puntos de equilibrio:

XEQ=[pi;0;0;0]; % PUNTO DE DE EQUILIBRIO: 1
% XEQ=[0;0;pi;0]; % PUNTO DE DE EQUILIBRIO: 2
% XEQ=[0;0;0;0]; % PUNTO DE DE EQUILIBRIO: 3
% XEQ=[pi;0;pi;0]; % PUNTO DE DE EQUILIBRIO: 4

UEQ=0; %ENTRADA DE EQUILIBRIO

%% Sistema linealizado:
A=subs(dfdx,[xv;u],[XEQ;UEQ]);
B=subs(dfdu,[xv;u],[XEQ;UEQ]);
E=subs(dfdXi,[xv;u],[XEQ;UEQ]);

%% Sustituyendo valores de parametros:
A=subs(A,[Xi1,Xi2,m1,m2,g,l1,l2],[0,0,0.1,0.1,9.81,0.5,0.5]);
A=double(A)
B=subs(B,[Xi1,Xi2,m1,m2,g,l1,l2],[0,0,0.1,0.1,9.81,0.5,0.5]);
B=double(B)
E=subs(E,[Xi1,Xi2,m1,m2,g,l1,l2],[0,0,0.1,0.1,9.81,0.5,0.5]);
E=double(E)

%Estabilidad
Estabilidad=eig(A)

%% Matriz de Contrabilidad
C=[1 0 0 0;0 0 1 0];
CtAB=ctrb(A,B);
rank(CtAB)
% Matriz de Observabilidad
ObAB=obsv(A,C);
rank(ObAB)

%% Control LQR
Q=[100 0 0 0;0 0 0 0;0 0 100 0;0 0 0 0];
R=1;
K=lqr(A,B,Q,R)
PolosControlador=eig(A-B*K)

%% Filtro de Kalman
Sxi=diag([0.05^2,0.05^2]);
Seta=diag([0.01^2,0.01^2]);
L=lqr(A',C',E*Sxi*E',Seta)'
PolosKalman=eig(A-L*C)

%% Simulando con SIMULINK
r=0; %Referencia
% Condiciones iniciales para -------- Xeq1=[pi;0;0;0];
x0=[179*pi/180;0;0*pi/180;0];
xh0=[179*pi/180;0;0*pi/180;0]*1.05;
YEQ=[pi;0];

% Condiciones iniciales para -------- Xeq2=[0;0;pi;0];
% x0=[0*pi/180;0;179*pi/180;0];
% xh0=[0*pi/180;0;179*pi/180;0]*1.05;
% YEQ=[0;pi];

% Condiciones iniciales para -------- Xeq3=[0;0;0;0];
% x0=[0.001*pi/180;0;0*pi/180;0];
% xh0=[0.001*pi/180;0;0*pi/180;0]*1.05;
% YEQ=[0;0];

% Condiciones iniciales para -------- Xeq4=[pi;0;pi;0];
% x0=[179*pi/180;0;179*pi/180;0];
% xh0=[179*pi/180;0;179*pi/180;0]*1.05;
% YEQ=[pi;pi];

%% Discretización
syms t
Ts=0.001;
Ad=expm(A*Ts);
Bd=inv(A)*(Ad-eye(4))*B;
Cd=C;
PolosControladorDiscreto=exp(Ts*PolosControlador)
Kd=place(Ad,Bd,PolosControladorDiscreto);
PolosKalmanDiscreto=exp(Ts*PolosKalman)
Ld=place(Ad',Cd',PolosKalmanDiscreto)';