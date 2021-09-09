clear 
%clf

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

%initial conditions
A0 = 0; %aboveground biomass
B0 = 100; %belowground biomass
H0 = 20; %herbivore population density
tmax = 1000; 

Astore = zeros(length(qvec)*length(k1vec), 14);
Bstore = zeros(length(qvec)*length(k1vec), 16);
Hstore = zeros(length(qvec)*length(k1vec), 15);
maxH = zeros(100,1);
meanPeriodvec = zeros(length(qvec)*length(k1vec), 13);
overvec = zeros(length(qvec)*length(k1vec), 14);

row = 0;


for i = 1:length(qvec)
    q = qvec(i);
    for j = 1:length(k1vec)
        k1 = k1vec(j);
       
        A = zeros(tmax, 1);
        B = zeros(tmax, 1);
        H = zeros(tmax, 1);
        A1vec = zeros(tmax, 1);
        A3vec = zeros(tmax, 1);

            
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
            B(t,1) = B2 + q*A(t,1)/(1+m*B2); %the correct form is q*A(t,1)/(1+m*B2).
            H(t,1) = h2*H2;
            A1vec(t,1) = A1;
            A3vec(t,1) = A3;                
        end  %close 2:tmax
       
        row = row+1;
        Astore(row, :) = [r y b v x q m p1 p2 rp k1 k2 mean(A(tmax-200:tmax)) std(A(tmax-200:tmax))/mean(A(tmax-200:tmax))];
        Bstore(row, :) = [r y b v x q m p1 p2 rp k1 k2 mean(B(tmax-200:tmax)) std(B(tmax-200:tmax)) std(B(tmax-200:tmax))/mean(B(tmax-200:tmax)) any(B<10^(-6))];
        Hstore(row, :) = [r y b v x q m p1 p2 rp k1 k2 mean(H(tmax-200:tmax)) std(H(tmax-200:tmax))/mean(H(tmax-200:tmax)) any(H<10^(-6))];
        overvec(row, :) = [r y b v x q m p1 p2 rp k1 k2 any(A1vec(tmax-200:tmax)<A3vec(tmax-200:tmax)) length(find(A1vec(tmax-200:tmax)<A3vec(tmax-200:tmax)))/201];            
        Herbivore = H(801:1000);

        %find local maximum values
        Hmax = islocalmax(Herbivore);
        %find the mean of cycle periods (using Hmax)
        meanPeriodvec(row, :) = [r y b v x q m p1 p2 rp k1 k2 mean(diff(find(Hmax==1)))];
    end 
end

figure(6)
clf
hold on
plot(1:tmax, A,'Color', [0.2 0.7 0.2], 'LineWidth',2)
ylabel('Aboveground biomass (solid line)','color','k')
plot(1:tmax, H, 'Color', [1 191/255 128/255],'LineWidth',2)
xlabel('generations')
ylabel('Herbivore density (dashed line)','color','k')
grid on
grid minor
xlim([900 1000])
                   
         
                   
              
                
                
           
           
          
