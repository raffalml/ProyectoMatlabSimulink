%% GRAFICAS
% SISTEMA LINEALIZADO
clear LinealX1 LinealX2 LinealX3 LinealX4
clear LinealX1hat LinealX2hat LinealX3hat LinealX4hat
clear yMedida1 yMedida2 u
%Acomodando los arreglos
%LinealX
for i=1:length(out.LinealX.time)
    LinealX1(i,:)=out.LinealX.signals.values(1,:,i);
    LinealX2(i,:)=out.LinealX.signals.values(2,:,i);
    LinealX3(i,:)=out.LinealX.signals.values(3,:,i);
    LinealX4(i,:)=out.LinealX.signals.values(4,:,i);
end
% LinealXhat
LinealX1hat=zeros(length(out.LinealXhat.time),1);
LinealX2hat=zeros(length(out.LinealXhat.time),1);
LinealX2hat=zeros(length(out.LinealXhat.time),1);
LinealX2hat=zeros(length(out.LinealXhat.time),1);
for i=1:length(out.LinealXhat.time)
    LinealX1hat(i,:)=out.LinealXhat.signals.values(i,1);
    LinealX2hat(i,:)=out.LinealXhat.signals.values(i,2);
    LinealX3hat(i,:)=out.LinealXhat.signals.values(i,3);
    LinealX4hat(i,:)=out.LinealXhat.signals.values(i,4);
end
% yMedida
for i=1:length(out.yMedida.time)
    yMedida1(i,:)=out.yMedida.signals.values(1,:,i);
    yMedida2(i,:)=out.yMedida.signals.values(2,:,i);
end

%%
clc
figure('position',[50 70 1300 600]); set(gcf,'color','w');
subplot(2,3,1)
plot(out.LinealX.time,LinealX1,'y','LineWidth',1.5,'color','r')
hold on
plot(out.LinealXhat.time,LinealX1hat,'y','LineWidth',1.5,'color','b')
title('$x_1 \; y \; \hat{x}_1$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$x_1 \; y \; \hat{x}_1$','Interpreter','latex')
legend({'x1','x1barra'},'Location','northeast')
grid

subplot(2,3,4)
plot(out.LinealX.time,LinealX2,'y','LineWidth',1.5,'color','r')
hold on
plot(out.LinealXhat.time,LinealX2hat,'y','LineWidth',1.5,'color','b')
title('$x_2 \; y \; \hat{x}_2$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$x_2 \; y \; \hat{x}_2$','Interpreter','latex')
legend({'x2','x2barra'},'Location','northeast')
grid

subplot(2,3,2)
plot(out.LinealX.time,LinealX3,'y','LineWidth',1.5,'color','r')
hold on
plot(out.LinealXhat.time,LinealX3hat,'y','LineWidth',1.5,'color','b')
title('$x_3 \; y \; \hat{x}_3$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$x_3 \; y \; \hat{x}_3$','Interpreter','latex')
legend({'x3','x3barra'},'Location','northeast')
grid

subplot(2,3,5)
plot(out.LinealX.time,LinealX4,'y','LineWidth',1.5,'color','r')
hold on
plot(out.LinealXhat.time,LinealX4hat,'y','LineWidth',1.5,'color','b')
title('$x_4 \; y \; \hat{x}_4$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$x_4 \; y \; \hat{x}_4$','Interpreter','latex')
legend({'x4','x4barra'},'Location','northeast')
grid

subplot(2,3,3)
plot(out.yMedida.time,yMedida1,'y','LineWidth',1.5,'color','k')
hold on
plot(out.yMedida.time,yMedida2,'y','LineWidth',1.5,'color','g')
title('$y$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
legend({'y1','y2'},'Location','northeast')
grid

subplot(2,3,6)
plot(out.u.time,out.u.signals.values,'y','LineWidth',1.5,'color','k')
hold on
title('$u$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$u$','Interpreter','latex')
legend({'u(t)'},'Location','northeast')
grid

%export_fig Graf1LinealXeq4DISCRETO -pdf -transparent


%% SISTEMA NO LINEAL
clear NOLinealX1 NOLinealX2 NOLinealX3 NOLinealX4
clear NOLinealX1hat NOLinealX2hat NOLinealX3hat NOLinealX4hat
clear NOyMedida1 NOyMedida2 

%Acomodando los arreglos
% NOLinealX
NOLinealX1=zeros(length(out.NOLinealX.time),1);
NOLinealX2=zeros(length(out.NOLinealX.time),1);
NOLinealX3=zeros(length(out.NOLinealX.time),1);
NOLinealX4=zeros(length(out.NOLinealX.time),1);
for i=1:length(out.NOLinealX.time)
    NOLinealX1(i,:)=out.NOLinealX.signals.values(i,1);
    NOLinealX2(i,:)=out.NOLinealX.signals.values(i,2);
    NOLinealX3(i,:)=out.NOLinealX.signals.values(i,3);
    NOLinealX4(i,:)=out.NOLinealX.signals.values(i,4);
end
% NOLinealXhat
NOLinealX1hat=zeros(length(out.NOLinealXhat.time),1);
NOLinealX2hat=zeros(length(out.NOLinealXhat.time),1);
NOLinealX2hat=zeros(length(out.NOLinealXhat.time),1);
NOLinealX2hat=zeros(length(out.NOLinealXhat.time),1);
for i=1:length(out.NOLinealXhat.time)
    NOLinealX1hat(i,:)=out.NOLinealXhat.signals.values(i,1);
    NOLinealX2hat(i,:)=out.NOLinealXhat.signals.values(i,2);
    NOLinealX3hat(i,:)=out.NOLinealXhat.signals.values(i,3);
    NOLinealX4hat(i,:)=out.NOLinealXhat.signals.values(i,4);
end
% yMedida
% for i=1:length(out.yMedidaNOLineal.time)
%     yMedida1NOLineal(i,:)=out.yMedidaNOLineal.signals.values(1,:,i);
%     yMedida2NOLineal(i,:)=out.yMedidaNOLineal.signals.values(2,:,i);
% end
for i=1:length(out.y1.time)
    y1(i,:)=out.y1.signals.values(1,:,i);
    y2(i,:)=out.y2.signals.values(1,:,i);
end

%%
clc
figure('position',[50 70 1300 600]); set(gcf,'color','w');
subplot(2,3,1)
plot(out.NOLinealX.time,NOLinealX1,'y','LineWidth',1.5,'color','r')
hold on
plot(out.NOLinealXhat.time,NOLinealX1hat,'y','LineWidth',1.5,'color','b')
title('$x_1 \; y \; \hat{x}_1$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$x_1 \; y \; \hat{x}_1$','Interpreter','latex')
legend({'x1','x1barra'},'Location','northeast')
grid

subplot(2,3,4)
plot(out.NOLinealX.time,NOLinealX2,'y','LineWidth',1.5,'color','r')
hold on
plot(out.NOLinealXhat.time,NOLinealX2hat,'y','LineWidth',1.5,'color','b')
title('$x_2 \; y \; \hat{x}_2$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$x_2 \; y \; \hat{x}_2$','Interpreter','latex')
legend({'x2','x2barra'},'Location','northeast')
grid

subplot(2,3,2)
plot(out.NOLinealX.time,NOLinealX3,'y','LineWidth',1.5,'color','r')
hold on
plot(out.NOLinealXhat.time,NOLinealX3hat,'y','LineWidth',1.5,'color','b')
title('$x_3 \; y \; \hat{x}_3$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$x_3 \; y \; \hat{x}_3$','Interpreter','latex')
legend({'x3','x3barra'},'Location','northeast')
grid

subplot(2,3,5)
plot(out.NOLinealX.time,NOLinealX4,'y','LineWidth',1.5,'color','r')
hold on
plot(out.NOLinealXhat.time,NOLinealX4hat,'y','LineWidth',1.5,'color','b')
title('$x_4 \; y \; \hat{x}_4$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$x_4 \; y \; \hat{x}_4$','Interpreter','latex')
legend({'x4','x4barra'},'Location','northeast')
grid

subplot(2,3,3)
% plot(out.yMedidaNOLineal.time,yMedida1NOLineal,'y','LineWidth',1.5,'color','k')
% hold on
% plot(out.yMedidaNOLineal.time,yMedida2NOLineal,'y','LineWidth',1.5,'color','g')
plot(out.y1.time,y1,'y','LineWidth',1.5,'color','r')
hold on
plot(out.y1.time,y2,'y','LineWidth',1.5,'color','b')
title('$y$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
legend({'y1','y2'},'Location','northeast')
grid

subplot(2,3,6)
plot(out.uNOLineal.time,out.uNOLineal.signals.values,'y','LineWidth',1.5,'color','k')
hold on
title('$u$','interpreter','latex')
xlabel('$t[s]$','Interpreter','latex')
ylabel('$u$','Interpreter','latex')
legend({'u(t)'},'Location','northeast')
grid

%export_fig Graf1NOLinealXeq3DISCRETO -pdf -transparent