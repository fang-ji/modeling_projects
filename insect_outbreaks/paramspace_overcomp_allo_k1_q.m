tic
%NEED TO RUN THE TIME SERIES CODE FIRST
% plant-related parameters
r = 6; %plant growth rate, 1-7
y = 0.7; %allocation rate
b = 0.05; %density dependence parameter
v = 1; %infinite means plants do not compensate, 0.1-10
x = 0; %x=1 tolerance; x=0 overcompensation
qvec = linspace(0.1,1,50); %allocation rate in fall, 0.1-1
m = 0.5; %density-dependence of allocation in fall, 0.01-1

% herbivore-related parameters
p1 = 0.5; %degree of adult herbivore interference, 0.5-5
p2 = 1.5; %degree of juvenile herbivore interference, 0.5-5
rp = 2.5; %herbivore growth rate, 1-4
k1vec = linspace(0.01,0.5,50); %sensitivity of herbivores to food limitation, 0.5-5
k2 = 0.25; %strength of food limitation on juveniles, 

for i = 1:length(qvec)
    q = qvec(i);
    for j = 1:length(k1vec)
        k1 = k1vec(j);
       
    figure(99)
    grid on
    grid minor
    hold on                    
    xlim([0.01 0.5])
    ylim([0.1 1])
    xlabel('$k_1$ (strength of food limitation)','FontSize',13.5,'interpreter','latex')          
    ylabel('$q$','FontSize',13.5,'interpreter','latex')
    %set(gca,'fontsize',14)

        
    meanA = Astore(Astore(:,1)==r & Astore(:,2)==y & Astore(:,3)==b & Astore(:,4)==v & Astore(:,5)==x & Astore(:,6)==q & Astore(:,7)==m & Astore(:,8)==p1 & Astore(:,9)==p2 & Astore(:,10)==rp & Astore(:,11)==k1 & Astore(:,12)==k2, 13); %meanA
    CVA = Astore(Astore(:,1)==r & Astore(:,2)==y & Astore(:,3)==b & Astore(:,4)==v & Astore(:,5)==x & Astore(:,6)==q & Astore(:,7)==m & Astore(:,8)==p1 & Astore(:,9)==p2 & Astore(:,10)==rp & Astore(:,11)==k1 & Astore(:,12)==k2, 14); %CVA
    meanB = Bstore(Bstore(:,1)==r & Bstore(:,2)==y & Bstore(:,3)==b & Bstore(:,4)==v & Bstore(:,5)==x & Bstore(:,6)==q & Bstore(:,7)==m & Bstore(:,8)==p1 & Bstore(:,9)==p2 & Bstore(:,10)==rp & Bstore(:,11)==k1 & Bstore(:,12)==k2, 13); %meanB
    CVB = Bstore(Bstore(:,1)==r & Bstore(:,2)==y & Bstore(:,3)==b & Bstore(:,4)==v & Bstore(:,5)==x & Bstore(:,6)==q & Bstore(:,7)==m & Bstore(:,8)==p1 & Bstore(:,9)==p2 & Bstore(:,10)==rp & Bstore(:,11)==k1 & Bstore(:,12)==k2, 15); %CVB
    anyB = Bstore(Bstore(:,1)==r & Bstore(:,2)==y & Bstore(:,3)==b & Bstore(:,4)==v & Bstore(:,5)==x & Bstore(:,6)==q & Bstore(:,7)==m & Bstore(:,8)==p1 & Bstore(:,9)==p2 & Bstore(:,10)==rp & Bstore(:,11)==k1 & Bstore(:,12)==k2, 16); %anyB
    meanH = Hstore(Hstore(:,1)==r & Hstore(:,2)==y & Hstore(:,3)==b & Hstore(:,4)==v & Hstore(:,5)==x & Hstore(:,6)==q & Hstore(:,7)==m & Hstore(:,8)==p1 & Hstore(:,9)==p2 & Hstore(:,10)==rp & Hstore(:,11)==k1 & Hstore(:,12)==k2, 13); %meanH
    CVH = Hstore(Hstore(:,1)==r & Hstore(:,2)==y & Hstore(:,3)==b & Hstore(:,4)==v & Hstore(:,5)==x & Hstore(:,6)==q & Hstore(:,7)==m & Hstore(:,8)==p1 & Hstore(:,9)==p2 & Hstore(:,10)==rp & Hstore(:,11)==k1 & Hstore(:,12)==k2, 14); %CVH
    %to check if there's any number in the time series is below 10^-6:
    anyH = Hstore(Hstore(:,1)==r & Hstore(:,2)==y & Hstore(:,3)==b & Hstore(:,4)==v & Hstore(:,5)==x & Hstore(:,6)==q & Hstore(:,7)==m & Hstore(:,8)==p1 & Hstore(:,9)==p2 & Hstore(:,10)==rp & Hstore(:,11)==k1 & Hstore(:,12)==k2, 15); %anyH
    %calculate the mean cycle period
    meanPeriod = meanPeriodvec(meanPeriodvec(:,1)==r & meanPeriodvec(:,2)==y & meanPeriodvec(:,3)==b & meanPeriodvec(:,4)==v & meanPeriodvec(:,5)==x & meanPeriodvec(:,6)==q & meanPeriodvec(:,7)==m & meanPeriodvec(:,8)==p1 & meanPeriodvec(:,9)==p2 & meanPeriodvec(:,10)==rp & meanPeriodvec(:,11)==k1 & meanPeriodvec(:,12)==k2, 13);

    %if CV is NaN, then mean is 0
    meanB(isnan(meanB)) = 0;  %to substitute all the NaNs in the array with 0
                              %because the NaNs are actually very small
                              %numbers (can be regarded as
                              %extinction here
    meanH(isnan(meanH)) = 0;

    %herbivore & plant extinct
    if anyB == 1 
       plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', [166/255 166/255 166/255], 'MarkerFaceColor', [166/255 166/255 166/255])
    elseif meanH < 10^(-6) 
       plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', [166/255 166/255 166/255], 'MarkerFaceColor', [166/255 166/255 166/255])
    %plants survive, herbivores die
    elseif meanH < 10^(-6) && meanB > 10^(-6)
        if CVB < 0.02 %herbivore extincts, plants stable
           plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', 'green', 'MarkerFaceColor', 'green')
        elseif CVB > 0.02 %herbivores extinct, plants cycle
               plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k')
        end
                
    %both plants and herbivores survive 
    elseif meanH > 10^(-6) && meanB > 10^(-6)
        if CVB < 0.02 %all alive & stable
           plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', 'w', 'MarkerFaceColor', 'w')
        end
        if CVB > 0.02
           if meanPeriod > 4 %consumer-resource cycles
              plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', [70/255 150/255 255/255], 'MarkerFaceColor', [70/255 150/255 255/255]) %blue
              %else %population does not change every year
           else  %single-species cycles
              plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', [1 204/255 153/255], 'MarkerFaceColor', [1 204/255 153/255]) %orange
           end
        end
    end
  end
end
        
toc
                   
                    
