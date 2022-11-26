%comparing diesel cycle vs brayton cycle 

 

close

clc

t= input('please enter temperature ratio of the cycle:'); % temperature ratio input

%t=10; % temperature ratio 

 

y=1.4; % k, specific heat ratio 

r=[1:50]; %compresion ratio from 1 to 50 

 

n_D= 1- ((1./(y*t))*((((t./r.^(y-1)).^y)-1)./(1-((r.^(y-1))./t))));% diesel cycle efficiency

 

n_B= 1-(1./r.^(y-1)); %Brayton cycle efficiency 

 

plot(n_D,'r','linewidth',3); %diesel cycle plot 

ylim([0 .9]);

 

grid on

hold on

 

plot(n_B,'b','linewidth',3);%brayton cycle plot 

ylim([0 .9]);

 

xlabel('Compression ratio');

ylabel('Efficiency');

legend({'Diesel Cycle','Brayton cycle'});

title('Diesel Cycle vs Brayton cycle');

