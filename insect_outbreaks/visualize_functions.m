
%% visualize b
%%{
%clear all
%close all
B = linspace(0,10,100);
bvec = [0.25,0.5,0.9];
y = 0.9;
for i = 1:length(bvec)
    b = bvec(i);
    for j = 1:length(B)
        allocation(j,i) = y.*B(j)./(1+b.*B(j));
    end
end
figure(1)
box on
plot(B,allocation,'k-','LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Quantity of BG Biomass, $B$','FontSize',20,'interpreter','latex')
ylabel('Allocation from BG to AG','FontSize',20,'interpreter','latex')
text(7,2.1,'$b=0.25$','FontSize',20,'interpreter','latex')
text(7,1.2,'$b=0.5$','FontSize',20,'interpreter','latex')
text(7,0.6,'$b=0.9$','FontSize',20,'interpreter','latex')
%legend({'b=0.25','b=2','b=3','b=4','b=5'},'FontSize',15,'interpreter','latex')
xlim([0,10])
%ylim([0,1])
%}
 
%% visualize p
%%{
%clear all
%close all
HoverA = linspace(0,10,100);
pvec = [0.5,2,5];
for i = 1:length(pvec)
    p = pvec(i);
    for j = 1:length(HoverA)
        damage(j,i) = HoverA(j)./(p+HoverA(j));
    end
end
figure(2)
box on
plot(HoverA,damage,'k-','LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Herbivores per AG Biomass, $\frac{H}{A}$','FontSize',20,'interpreter','latex')
ylabel('Herbivory Damage','FontSize',20,'interpreter','latex')
text(7,0.9,'$p_1=0.5$','FontSize',20,'interpreter','latex')
text(7,0.73,'$p_1=2$','FontSize',20,'interpreter','latex')
text(7,0.55,'$p_1=5$','FontSize',20,'interpreter','latex')
xlim([0,10])
%}

%% visualize k
%%{
%clear all
%close all
AoverH = linspace(0,10,100);
kvec = [0.5,2,5];
for i = 1:length(kvec)
    k = kvec(i);
    for j = 1:length(AoverH)
        survive(j,i) = AoverH(j)./(k+AoverH(j));
    end
end
figure(3)
box on
plot(AoverH,survive,'k-','LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('AG Biomass per Herbivore, $\frac{A}{H}$','FontSize',20,'interpreter','latex')
ylabel('Survivorship of Herbivores','FontSize',20,'interpreter','latex')
text(7,0.9,'$k_1=0.5$','FontSize',20,'interpreter','latex')
text(7,0.73,'$k_1=2$','FontSize',20,'interpreter','latex')
text(7,0.55,'$k_1=5$','FontSize',20,'interpreter','latex')
xlim([0,10])
%} 

%% visualize m
%%{
%clear all
%close all
B = linspace(0,10,100);
q = 0.9;
mvec = [0.1,0.3,0.9];
for i = 1:length(mvec)
    m = mvec(i);
    for j = 1:length(B)
        allocation(j,i) = q/(1+m.*B(j));
    end
end
figure(4)
box on 
plot(B,allocation,'k-','LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel('Quantity of BG Biomas, $B$','FontSize',20,'interpreter','latex')
ylabel('Fraction of AG allocated to BG','FontSize',20,'interpreter','latex')
text(7,0.42,'$m=0.1$','FontSize',20,'interpreter','latex')
text(7,0.2,'$m=0.3$','FontSize',20,'interpreter','latex')
text(7,0.05,'$m=0.9$','FontSize',20,'interpreter','latex')
xlim([0,10])
ylim([0,1])
%}

%% visualize 1-zd
%clear all
%close all
HperA = linspace(0,40,100);
vvec = [0.05,0.2,0.5];
p1 = 0.5;
for i = 1:length(vvec)
    v = vvec(i);
    for j = 1:length(HperA)
        z(j,i) = 1-(1+v*HperA(j))/(1+(v*HperA(j))^2);
        d1(j,i) = HperA(j)/(p1+HperA(j));
        frac(j,i) = 1-z(j,i)*d1(j,i);
    end
end
figure(5)
hold on
box on
plot(HperA,frac,'k-','LineWidth',1.5);
ax = gca;
ax.XAxis.FontSize = 12.5;
ax.YAxis.FontSize = 12.5;
xlabel("Herbivores per AG Biomass, $\frac{H}{A}$",'FontSize',20,'interpreter','latex')
ylabel({'Fraction of AG Biomass, $1-zd_1$'},'FontSize',20,'interpreter','latex')
text(15,0.85,'$v=0.05$','FontSize',20,'interpreter','latex')
text(15,0.22,'$v=0.2$','FontSize',20,'interpreter','latex')
text(15,0.05,'$v=0.5$','FontSize',20,'interpreter','latex')
yline(1,'-.k');
ylim([0,1.3])
%}

