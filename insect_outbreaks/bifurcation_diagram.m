clear
%clf
%%{ 
% plant-related parameters
r = 8; %plant growth rate, 1-7
y = 0.9; %allocation rate in spring
b = 0.01; %density-dependence
v =1.2; % overcompensation parameter
x = 0; %x=1 tolerance; x=0 overcompensation
q = 0.6; %allocation rate in fall, 0.1-1
m = 0.01; %density-dependence of allocation in fall, 0.01-1

% herbivore-related parameters
p1 = 0.05; %degree of adult herbivore interference, 0.5-5
p2 = 10; %degree of juvenile herbivore interference, 0.5-5
rp = 50; %herbivore growth rate, 1-4
k1 = 0.5; %sensitivity of herbivores to food limitation, 0.5-5
k2vec = linspace(0.1,7.5,200); %strength of food limitation experienced by juveniles, 
%}

%initial conditions
A0 = 0; %aboveground biomass
B0 = 100; %belowground biomass
H0 = 20; %herbivore population density
tmax = 10000; 
        
for j = 1:length(k2vec)
    k2 = k2vec(j);

    A(1,1) = A0;
    B(1,1) = B0;
    H(1,1) = H0;
            
    %A1 stands for A', A2 stands for A'', etc.
    for t = 2:tmax
        A1 = r*y*B(t-1,1)/(1+b*B(t-1,1));
        B1 = B(t-1,1) - y*B(t-1,1)/(1+b*B(t-1,1));
                
        if max([A1, H(t-1,1)])>0
            d1 = H(t-1,1)/(p1*A1+H(t-1,1));
            h1 = A1/(k1*H(t-1,1)+A1);
        else d1 = 0;
            h1 = 0;
        end

        A2 = (1-d1)*A1;
        H1 = h1*H(t-1,1);
        z = 1 - (1+(v*H(t-1,1)/A1))/(1+(v*H(t-1,1)/A1)^2);
        A3 = A2 + min([(1-z)*d1*A1 B1]); 
        B2 = B1 - min([(1-z)*d1*A1 B1]);
        H2 = rp*H1; 
        if max([A3 H2])>0
            d2 = H2/(p2*A3+H2);
            h2 = A3/(k2*H2+A3);
        else d2 = 0;
             h2 = 0;
        end

        A(t,1) = (1-d2)*r*A3;
        B(t,1) = B2 + q*A(t,1)/(1+m*B2); 
        H(t,1) = h2*H2;
    end  %close 2:tmax
       
           
    Herbivore = H(9801:10000); %last 200 time steps
    belowground = B(9801:10000);
    aboveground = A(9801:10000);
 
    %plot belowground biomass
    figure(27)
    hold on
    box on
    plot(k2, belowground,'k.')
    xlim([0.1 7.5])
    xlabel('Strength of Food Limitation, $k_2$','FontSize',20,'interpreter','latex')
    ylabel('Belowground Biomass','color','k','FontSize',20,'interpreter','latex')

    %plot herbivore population density
    figure(28)
    hold on
    set(gca, 'YScale', 'log')
    plot(k1, Herbivore,'k.')
    xlim([0.1 5.5])
    ylim([0 50])
    xlabel('$k_1$ (strength of food limitation)','FontSize',13.5,'interpreter','latex')
    ylabel('Herbivore density','color','k','FontSize',13.5,'interpreter','latex')

    %plot aboveground biomass
    figure(29)
    hold on
    plot(k1, aboveground,'k.')
    xlim([0.1 5.5])
    ylim([0 50])
    xlabel('$k_1$ (strength of food limitation)','FontSize',13.5,'interpreter','latex')
    ylabel('Aboveground biomass','color','k','FontSize',13.5,'interpreter','latex')
end






                
                
           
           
          
