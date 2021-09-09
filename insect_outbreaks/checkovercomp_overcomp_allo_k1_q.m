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

for i = 1:length(k1vec)
    k1 = k1vec(i);
    for j = 1:length(qvec)
        q = qvec(j);

        figure(352);
        grid on
        grid minor
        hold on
          
        xlim([0.01 0.5])
        ylim([0.1 1])
        xlabel('k_1')          
        ylabel('q')
 
        %decide if overcompensation occurs
        over = overvec(overvec(:,1)==r & overvec(:,2)==y & overvec(:,3)==b & overvec(:,4)==v & overvec(:,5)==x & overvec(:,6)==q & overvec(:,7)==m & overvec(:,8)==p1 & overvec(:,9)==p2 & overvec(:,10)==rp & overvec(:,11)==k1 & overvec(:,12)==k2, 13);
        meanB = Bstore(Bstore(:,1)==r & Bstore(:,2)==y & Bstore(:,3)==b & Bstore(:,4)==v & Bstore(:,5)==x & Bstore(:,6)==q & Bstore(:,7)==m & Bstore(:,8)==p1 & Bstore(:,9)==p2 & Bstore(:,10)==rp & Bstore(:,11)==k1 & Bstore(:,12)==k2, 13); %meanB

        if meanB>10^-6 && over == 1 %overcompensation yes
           plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k')
        else %overcompensation no
           plot(k1,q, 's', 'MarkerSize', 8, 'MarkerEdgeColor', 'w', 'MarkerFaceColor', 'w')
        end
    end
end
  