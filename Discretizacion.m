%% Discretización
syms t
Ts=0.01;
Ad=expm(A*Ts);
% Bd=double(int(expm(A*t)*B,t,0,Ts));
Bd=inv(A)*(Ad-eye(4))*B
Cd=C;
PolosControladorDiscreto=exp(Ts*PolosControlador);
Kd=place(Ad,Bd,PolosControladordiscreto);
PolosKalmanDiscreto=exp(Ts*PolosKalman);
Ld=place(Ad',Cd',PolosKalmandiscreto)';