
%% visualize hp
%%{
%clear all

%close all
P = linspace(0,5,100);
hpvec = [0.1,0.5,0.9];
k = 0.2;
for hp_i = 1:length(hpvec)
    hp = hpvec(hp_i);
    for P_i = 1:length(P)
        plant_survival(P_i,hp_i) = hp./(hp+k+P(P_i));
    end
end
figure(1)
box on
hold on 
plot(P,plant_survival,'-','LineWidth',1.5)
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Plant Density, $P$','FontSize',20,'interpreter','latex')
ylabel('Plant Survival Rate','FontSize',20,'interpreter','latex')
%text(1,0.6,'$b=0.5$','FontSize',20,'interpreter','latex','Color',[200/255 200/255 200/255])
%text(7,1.2,'$b=0.5$','FontSize',20,'interpreter','latex')
%text(7,0.6,'$b=0.9$','FontSize',20,'interpreter','latex')
legend({'$h_p$=0.25','$h_p$=0.5','$h_p$=0.9'},'FontSize',15,'interpreter','latex')
xlim([0,5])
%}

%% visualize k
%%{
%clear all
%close all
P = linspace(0,5,100);
hp = 0.5;
kvec = [0.01 0.15 0.5];
for k_i = 1:length(kvec)
    k = kvec(k_i);
    for P_i = 1:length(P)
        plant_survival(P_i,k_i) = hp./(hp+k+P(P_i));
    end
end
figure(2)
box on
hold on 
plot(P,plant_survival,'-','LineWidth',1.5)
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Plant Density, $P$','FontSize',20,'interpreter','latex')
ylabel('Plant Survival Rate','FontSize',20,'interpreter','latex')
%text(1,0.6,'$b=0.5$','FontSize',20,'interpreter','latex','Color',[200/255 200/255 200/255])
%text(7,1.2,'$b=0.5$','FontSize',20,'interpreter','latex')
%text(7,0.6,'$b=0.9$','FontSize',20,'interpreter','latex')
legend({'$k$=0.01','$k$=0.15','$k$=0.5'},'FontSize',15,'interpreter','latex')
xlim([0,5])
%}

%% visualize g
%%{
%clear all
%close all
P = linspace(0,5,100);
gvec = [0.1 0.5 0.9];
for g_i = 1:length(gvec)
    g = gvec(g_i);
    for P_i = 1:length(P)
        germination(P_i,g_i) = g./(g+P(P_i));
    end
end
figure(3)
box on
hold on 
plot(P,germination,'-','LineWidth',1.5)
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Plant Density, $P$','FontSize',20,'interpreter','latex')
ylabel('Germination Rate','FontSize',20,'interpreter','latex')
%text(1,0.6,'$b=0.5$','FontSize',20,'interpreter','latex','Color',[200/255 200/255 200/255])
%text(7,1.2,'$b=0.5$','FontSize',20,'interpreter','latex')
%text(7,0.6,'$b=0.9$','FontSize',20,'interpreter','latex')
legend({'$g$=0.1','$g$=0.5','$g$=0.9'},'FontSize',15,'interpreter','latex')
xlim([0,5])
%ylim([0,1])
%}
%% visualize a
%%{
%clear all
%close all
A = linspace(0,10,100);
avec = [0.1,0.3,0.9];
for i = 1:length(avec)
    a = avec(i);
    for j = 1:length(A)
        pollination(j,i) = 1-exp(-a.*A(j));
    end
end
figure(6)
box on 
plot(A,pollination,'LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Adult Population Density, $A$','FontSize',20,'interpreter','latex')
ylabel('Fraction of Visited Flowers','FontSize',20,'interpreter','latex')
%text(7,0.42,'$m=0.1$','FontSize',20,'interpreter','latex')
%text(7,0.2,'$m=0.3$','FontSize',20,'interpreter','latex')
%text(7,0.05,'$m=0.9$','FontSize',20,'interpreter','latex')
legend({'$a$=0.1','$a$=0.3','$a$=0.9'},'Location','southeast','FontSize',15,'interpreter','latex')
xlim([0,10])
ylim([0,1.05])
%}
%% visualize w
%%{
clear all
%close all
J_over_cF = linspace(0,10,100);
wvec = [0.5,2,5];
for i = 1:length(wvec)
    w = wvec(i);
    for j = 1:length(J_over_cF)
        survive(j,i) = w./(w+J_over_cF(j));
    end
end
figure(4)
box on
plot(J_over_cF,survive,'LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Juveniles per Seed, $\frac{J}{cF}$','FontSize',20,'interpreter','latex')
ylabel('Fraction of Remaining Seeds','FontSize',20,'interpreter','latex')
%text(7,0.9,'$k_1=0.5$','FontSize',20,'interpreter','latex')
%text(7,0.73,'$k_1=2$','FontSize',20,'interpreter','latex')
%text(7,0.55,'$k_1=5$','FontSize',20,'interpreter','latex')
legend({'$w$=0.5','$w$=2','$w$=5'},'FontSize',15,'interpreter','latex')
xlim([0,10])
%ylim([0,1])
%}

%% visualize w
%%{
clear all
%close all
A = linspace(0,10,100);
a = 0.8;
b = 1.5;
c = 3;
wvec = [0.5,2,5];
for i = 1:length(wvec)
    w = wvec(i);
    for j = 1:length(A)
        J_over_cF(j) = (2.*b.*(1-exp(-1/2.*a.*A(j))))./(c.*(1-exp(-a.*A(j))));
        survive(j,i) = w./(w+J_over_cF(j)).*(1-exp(-a.*A(j)));
    end
end
figure(5)
box on
hold on
plot(A,J_over_cF,'b--','LineWidth',1.5);
plot(A,survive,'LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Adult Insects, $A$','FontSize',20,'interpreter','latex')
ylabel('Fraction of Remaining Seeds','FontSize',20,'interpreter','latex')
%text(7,0.9,'$k_1=0.5$','FontSize',20,'interpreter','latex')
%text(7,0.73,'$k_1=2$','FontSize',20,'interpreter','latex')
%text(7,0.55,'$k_1=5$','FontSize',20,'interpreter','latex')
legend({'$w$=0.5','$w$=2','$w$=5'},'FontSize',15,'interpreter','latex')
xlim([0,10])
%ylim([0,1])
%}


%% visualize m
%%{
%clear all
%close all
cF_over_J = linspace(0,10,100);
hj = 0.9;
mvec = [0.1,0.3,0.9];
for i = 1:length(mvec)
    m = mvec(i);
    for j = 1:length(cF_over_J)
        survival(j,i) = hj.*cF_over_J(j)./(m+cF_over_J(j));
    end
end
figure(5)
box on 
plot(cF_over_J,survival,'LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Seeds per Juvernile, $\frac{cF}{J}$','FontSize',20,'interpreter','latex')
ylabel('Juvenile Survival Rate','FontSize',20,'interpreter','latex')
%text(7,0.42,'$m=0.1$','FontSize',20,'interpreter','latex')
%text(7,0.2,'$m=0.3$','FontSize',20,'interpreter','latex')
%text(7,0.05,'$m=0.9$','FontSize',20,'interpreter','latex')
legend({'m=0.1','m=0.3','m=0.9'},'Location','southeast','FontSize',15,'interpreter','latex')
xlim([0,10])
ylim([0,1])
%}

%% visualize a
%%{
%clear all
%close all
A = linspace(0,10,100);
b = 2;
avec = [0.1,0.3,0.9];
for i = 1:length(avec)
    a = avec(i);
    for j = 1:length(A)
        reproduction(j,i) = 2.*b.*(1-exp(-(1/2).*a.*A(j)));
    end
end
figure(7)
box on 
plot(A,reproduction,'LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Adult Population Density, $A$','FontSize',20,'interpreter','latex')
ylabel('Juveniles per Flowers','FontSize',20,'interpreter','latex')
%text(7,0.42,'$m=0.1$','FontSize',20,'interpreter','latex')
%text(7,0.2,'$m=0.3$','FontSize',20,'interpreter','latex')
%text(7,0.05,'$m=0.9$','FontSize',20,'interpreter','latex')
legend({'$a$=0.1','$a$=0.3','$a$=0.9'},'Location','southeast','FontSize',15,'interpreter','latex')
xlim([0,10])
ylim([0,4])
%}

%% visualize v
%%{
%clear all
%close all
A = linspace(0,5,100);
b = 2;
a = 0.8;
vvec = [0.5,1,5];
for i = 1:length(vvec)
    v = vvec(i);
    for j = 1:length(A)
        J(j) = 2.*b.*(1-exp(-1/2.*a.*A(j)))./(1-exp(-a.*A(j))); 
        punish(j,i) = J(j)./(v+J(j));
    end
end
figure(8)
box on 
plot(A,punish,'LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Adult Population Density, $A$','FontSize',20,'interpreter','latex')
ylabel('Proportion of Dropped Flowers','FontSize',20,'interpreter','latex')
%text(7,0.42,'$m=0.1$','FontSize',20,'interpreter','latex')
%text(7,0.2,'$m=0.3$','FontSize',20,'interpreter','latex')
%text(7,0.05,'$m=0.9$','FontSize',20,'interpreter','latex')
legend({'$v$=0.5','$v$=1','$v$=5'},'Location','southeast','FontSize',15,'interpreter','latex')
xlim([0,5])
ylim([0,1])
%}

%% visualize a
%%{
%clear all
%close all
A = linspace(0.01,30,100);
f = 15;
hj = 0.9;
c = 0.6;
b = 2;
m = 0.5;
avec = [0.9];
for i = 1:length(avec)
    a = avec(i);
    for j = 1:length(A)
        pollinators_per_flower(j,i) = (hj*c*(1-exp(-a.*A(j))))/(m+(hj*c*(1-exp(-a.*A(j))))/(2*b*(1-exp(-(1/2).*a.*A(j)))));
        reproduction(j,i) = (1-exp(-(1/2).*a.*A(j)));
        pollination(j,i) = (1-exp(-a.*A(j)));
    end
end
figure(9)
box on 
hold on
plot(A,pollination-reproduction,'-','LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Pollinator, $A$','FontSize',20,'interpreter','latex')
ylabel('Fraction of Flowers','FontSize',20,'interpreter','latex')
%text(7,0.42,'$m=0.1$','FontSize',20,'interpreter','latex')
%text(7,0.2,'$m=0.3$','FontSize',20,'interpreter','latex')
%text(7,0.05,'$m=0.9$','FontSize',20,'interpreter','latex')
%}

%% visualize v vs pollinator
%%{
%clear all
%close all
vvec = linspace(0.0001,10,100);
f = 15;
hj = 0.9;
c = 0.6;
b = 2;
m = 0.5;
a = 0.9;
A = 1;
aA = 1-exp(-a*A);
half_aA = 1-exp(-(1/2)*a*A);
for i = 1:length(vvec)
    v = vvec(i);
        pollinators_per_flower(i) = (2*b*hj*c*v*aA^2*half_aA)/(2*m*b*half_aA*(v*aA+2*b*half_aA)+c*v*aA^2);
end
figure(8)
box on 
hold on
plot(vvec,pollinators_per_flower,'-','LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Pollinator-to-Flower Ratio, $\frac{A}{fP}$','FontSize',20,'interpreter','latex')
ylabel('Fraction of Flowers','FontSize',20,'interpreter','latex')
%text(7,0.42,'$m=0.1$','FontSize',20,'interpreter','latex')
%text(7,0.2,'$m=0.3$','FontSize',20,'interpreter','latex')
%text(7,0.05,'$m=0.9$','FontSize',20,'interpreter','latex')
%}

