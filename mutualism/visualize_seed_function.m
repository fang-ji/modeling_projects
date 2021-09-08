%% visualize seed function that assumes insect larvae consume a density-dependent proportion of seeds
A = linspace(0,20,500);
a = 0.8;
b = 1.5;
c = 10;
wvec = [5];
for i = 1:length(wvec)
    w = wvec(i);
    for j = 1:length(A)
        J_over_cF(j) = (2.*b.*(1-exp(-1/2.*a.*A(j))))./(c.*(1-exp(-a.*A(j))));
        survive(j,i) = c.*w./(w+J_over_cF(j)).*(1-exp(-a.*A(j)));
    end
end
figure(1)
box on
hold on
plot(A,survive,'k-','LineWidth',2);
ax = gca;
ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;
xlabel('Density of Adult Insects, $A$','FontSize',20,'interpreter','latex')
ylabel('Viable Seeds per Flower','FontSize',20,'interpreter','latex')
text(18,8.75,'$a$','FontSize',25,'interpreter','latex')


%% visualize seed function that assumes insect larvae consume all the seeds in a developing fruit
A_H = linspace(0,20,100);
a = 0.8;
b = 1.5;
c = 10;
for j = 1:length(A_H)
        survive_H(j) = c.*(exp(-1/2.*a.*A_H(j))-exp(-a.*A_H(j)));
end
figure(2)
box on
hold on
plot(A_H,survive_H*3.8,'k-','LineWidth',2);
ax = gca;
ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;
xlabel('Density of Adult Insects, $A$','FontSize',20,'interpreter','latex')
ylabel('Viable Seeds per Flower','FontSize',20,'interpreter','latex')
text(18,8.75,'$b$','FontSize',25,'interpreter','latex')
