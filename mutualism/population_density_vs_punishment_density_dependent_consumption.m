%% set parameters and initial conditions
%parameters
hp = 0.75;
k =0.01; 
g = 0.8;
a = 0.8; 
f = 15; 
w = 0.5;
c=0.6;
b = 1; 
m = 0.5; 
hj = 0.9;
v_vec = linspace(0.01,1,100);

%initial conditions
F0=20;
S0=15;
J0=20;
P0 = 50;
A0 = 10;

tmax = 10000; 

%% loop over parameter combinations
row = 0;
for i = 1:length(v_vec)
    v = v_vec(i);
    P = zeros(tmax, 1);
    F = zeros(tmax, 1);
    S = zeros(tmax, 1);
    A = zeros(tmax, 1);
    J = zeros(tmax, 1);
            
    P(1,1) = P0;
    F(1,1) = F0;
    S(1,1) = S0;
    A(1,1) = A0;
    J(1,1) = J0;
    %% loop over time           
    for t = 2:tmax
        P(t,1) = hp.*P(t-1,1)./(hp+k+P(t-1,1))+g.*S(t-1,1)./(g+P(t-1,1)); % plant population density
        A(t,1) = hj*c*F(t-1,1)./(m+(c*F(t-1,1)./J(t-1,1))); % adult insects (pollinators)
        F(t,1) = (1-exp(-a.*A(t,1))).^2.*f.*P(t,1)/(1-exp(-a.*A(t,1))+2.*b.*v.*(1-exp(-1/2.*a.*A(t,1)))); % pollinated flowers
        J(t,1) = 2.*b.*(1-exp(-1/2.*a.*A(t,1))).*f.*P(t,1); % juvenile insects (seed consumers)   
        S(t,1) = w*c*F(t,1)./(w+(J(t,1)/(c*F(t,1)))); % remaining seeds, the assumption here is that juvenile insects consume a density-dependent proportion of seeds
    end 
    S(isnan(S)) = 0;
    A(isnan(A)) = 0;
    J(isnan(J)) = 0;
    F(isnan(F)) = 0;
    P(isnan(P)) = 0;

    %% plot plant components
    figure(109)
    hold on
    box on
    ax = gca;
    ax.XAxis.FontSize = 15;
    ax.YAxis(1).FontSize = 15;
    yyaxis left
    plot(v, P(tmax),'.','MarkerSize',10) 
    plot(v, S(tmax),'.','MarkerSize',10) 
    xlabel('Strength of Punishment, $v$','FontSize',20,'interpreter','latex')
    ylabel('Population Density','FontSize',20,'interpreter','latex')
    yyaxis right
    plot(v, F(tmax),'.','MarkerSize',10) 
    ax.YAxis(2).FontSize = 15;
    text(0.4,2,'S','FontSize',15,'interpreter','latex')
    text(0.4,3.8,'F','FontSize',15,'interpreter','latex')
    text(0.4,5.4,'P','FontSize',15,'interpreter','latex')       

    %% plot insect components
    figure(120)
    box on
    hold on
    ax = gca;
    ax.XAxis.FontSize = 15;
    ax.YAxis.FontSize = 15;
    plot(v, A(tmax), 'k.','MarkerSize',10) 
    plot(v, J(tmax), 'k.','MarkerSize',10) 
    xlabel('Strength of Punishment, $v$','FontSize',20,'interpreter','latex')
    ylabel('Population Density','FontSize',20,'interpreter','latex')
    text(0.4,3.5,'A','FontSize',15,'interpreter','latex')
    text(0.4,9,'J','FontSize',15,'interpreter','latex')                    
end 
       



                   
              
                
                
           
           
          
