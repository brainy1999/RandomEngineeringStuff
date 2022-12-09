%% Plotter for Research
% Made by 
%   Bernard Li, MECE+NSS+Math
%   
clc
clear 
clear all
close all

%% Import Files

data1 = readtable('Bernard_Final_Takes_att3.csv');
data2 = readtable('Bernard_Final_Takes_att3_001.csv');
data3 = readtable('Bernard_Final_Takes_att3_002.csv');
data4 = readtable('Bernard_Final_Takes_att3_003.csv');
data5 = readtable('Bernard_Final_Takes_att3_004.csv');
data6 = readtable('Bernard_Final_Takes_att3_005.csv');
data7 = readtable('Bernard_Final_Takes_att3_006.csv');
data8 = readtable('Bernard_Final_Takes_att3_007.csv');
data9 = readtable('Bernard_Final_Takes_att3_008.csv');
data10 = readtable('Bernard_Final_Takes_att3_009.csv');
numdatasets = 10;
data_titles = ["pitch rate = 0", "Pitch rate = 0.2","Pitch Rate = 0.8","Pitch Rate = 4.0","Pitch Rate = 10","Pitch Rate = 100","Pitch Rate = 50","Pitch Rate = 20","Pitch Rate = 25","Pitch Rate = 30"];

%% plot commands

% stopatmax  0 plots all trajectories, 1 plots at max
% plotcrash 0 does not plot the crash points, 1 plots crash points
% plotakeoff 0 does not plot takeoff point, 1 plots the takeoff point

plotcrash = 0;
plotakeoff = 0;
t_hat = 200;

axis_limit_min = -2500;
axis_limit_max = 2500;

%% Plot Data at optimal point

clc
close all

figure(1)
plot3(0,0,0);
hold on
xlim([axis_limit_min,axis_limit_max])
ylim([axis_limit_min,axis_limit_max])
zlim([0,axis_limit_max])
title('All Tests, stopping at optimal trajectory point','Interpreter','latex')

xlabel('x (cm)'); ylabel('y (cm)'); zlabel('z (cm)');

% now plot all datapoints
plotalldatas(data1,1,plotcrash,plotakeoff);
plotalldatas(data2,1,plotcrash,plotakeoff);
plotalldatas(data3,1,plotcrash,plotakeoff);
plotalldatas(data4,1,plotcrash,plotakeoff);
plotalldatas(data5,1,plotcrash,plotakeoff);
plotalldatas(data6,90,plotcrash,plotakeoff);
plotalldatas(data7,100,plotcrash,plotakeoff);
plotalldatas(data8,0,plotcrash,plotakeoff);
plotalldatas(data9,270,plotcrash,plotakeoff);
plotalldatas(data10,190,plotcrash,plotakeoff);

if(plotakeoff == 0 && plotcrash ==0)
     legend("",data_titles(1),data_titles(2),data_titles(3),data_titles(4),data_titles(5),data_titles(6),data_titles(7),data_titles(8),data_titles(9),data_titles(10))
elseif(plotakeoff == 1 && plotcrash == 0 || plotakeoff == 0 && plotcrash ==1)
     legend("",data_titles(1),"",data_titles(2),"",data_titles(3),"",data_titles(4),"",data_titles(5),"",data_titles(6),"",data_titles(7),"",data_titles(8),"",data_titles(9),"",data_titles(10),"")
elseif (plotakeoff && plotcrash ==1)
     legend("",data_titles(1),"","",data_titles(2),"","",data_titles(3),"","",data_titles(4),"","",data_titles(5),"","",data_titles(6),"","",data_titles(7),"","",data_titles(8),"","",data_titles(9),"","",data_titles(10),"","")
end
hold off

%% Plot data at reachable set time T
figure(2)
plot3(0,0,0);
hold on
xlim([axis_limit_min,axis_limit_max])
ylim([axis_limit_min,axis_limit_max])
zlim([0,axis_limit_max])
title('All Tests, plotting at Reachable Set Time $\hat{T}$','Interpreter','latex')

xlabel('x (cm)'); ylabel('y (cm)'); zlabel('z (cm)');

% now plot all datapoints
plotalldatas(data1,t_hat,plotcrash,plotakeoff);
plotalldatas(data2,t_hat,plotcrash,plotakeoff);
plotalldatas(data3,t_hat,plotcrash,plotakeoff);
plotalldatas(data4,t_hat,plotcrash,plotakeoff);
plotalldatas(data5,t_hat,plotcrash,plotakeoff);
plotalldatas(data6,t_hat,plotcrash,plotakeoff);
plotalldatas(data7,t_hat,plotcrash,plotakeoff);
plotalldatas(data8,t_hat,plotcrash,plotakeoff);
plotalldatas(data9,t_hat+100,plotcrash,plotakeoff);
plotalldatas(data10,t_hat,plotcrash,plotakeoff);

if(plotakeoff == 0 && plotcrash ==0)
     legend("",data_titles(1),data_titles(2),data_titles(3),data_titles(4),data_titles(5),data_titles(6),data_titles(7),data_titles(8),data_titles(9),data_titles(10))
elseif(plotakeoff == 1 && plotcrash == 0 || plotakeoff == 0 && plotcrash ==1)
     legend("",data_titles(1),"",data_titles(2),"",data_titles(3),"",data_titles(4),"",data_titles(5),"",data_titles(6),"",data_titles(7),"",data_titles(8),"",data_titles(9),"",data_titles(10),"")
elseif (plotakeoff && plotcrash ==1)
     legend("",data_titles(1),"","",data_titles(2),"","",data_titles(3),"","",data_titles(4),"","",data_titles(5),"","",data_titles(6),"","",data_titles(7),"","",data_titles(8),"","",data_titles(9),"","",data_titles(10),"","")
end
hold off

%% Plot raw data
figure(3)
plot3(0,0,0);
hold on
% xlim([axis_limit_min,axis_limit_max])
% ylim([axis_limit_min,axis_limit_max])
% zlim([0,axis_limit_max])
title('All Tests, raw data','Interpreter','latex')

xlabel('x (cm)'); ylabel('y (cm)'); zlabel('z (cm)');

% now plot all datapoints
plotalldatas(data1,0,plotcrash,plotakeoff);
plotalldatas(data2,0,plotcrash,plotakeoff);
plotalldatas(data3,0,plotcrash,plotakeoff);
plotalldatas(data4,0,plotcrash,plotakeoff);
plotalldatas(data5,0,plotcrash,plotakeoff);
plotalldatas(data6,0,plotcrash,plotakeoff);
plotalldatas(data7,0,plotcrash,plotakeoff);
plotalldatas(data8,0,plotcrash,plotakeoff);
plotalldatas(data9,0,plotcrash,plotakeoff);
plotalldatas(data10,0,plotcrash,plotakeoff);

if(plotakeoff == 0 && plotcrash ==0)
     legend("",data_titles(1),data_titles(2),data_titles(3),data_titles(4),data_titles(5),data_titles(6),data_titles(7),data_titles(8),data_titles(9),data_titles(10))
elseif(plotakeoff == 1 && plotcrash == 0 || plotakeoff == 0 && plotcrash ==1)
     legend("",data_titles(1),"",data_titles(2),"",data_titles(3),"",data_titles(4),"",data_titles(5),"",data_titles(6),"",data_titles(7),"",data_titles(8),"",data_titles(9),"",data_titles(10),"")
elseif (plotakeoff && plotcrash ==1)
     legend("",data_titles(1),"","",data_titles(2),"","",data_titles(3),"","",data_titles(4),"","",data_titles(5),"","",data_titles(6),"","",data_titles(7),"","",data_titles(8),"","",data_titles(9),"","",data_titles(10),"","")
end
hold off
%% Functions

function plotting = plotalldatas(indata,stopat,plotcrash,plottakeoff)
% Plotting has 4 inputs. indata is the data matrix.
%stopat is the point where the data stops, in case of crash. If you want to plot raw data, set to 0. If you want to plot at max altitude, plot at 1.
%plotcrash plots an X where the drone crashes. 0 for no, 1 for yes. plottakeoff plots the start location of the drone. 0 for no, 1 for yes.

    X = table2array(indata(5:height(indata),'RigidBody_4'));
    Z = table2array(indata(5:height(indata),'RigidBody_5'));
    Y = table2array(indata(5:height(indata),'RigidBody_6'));

    if(stopat == 1) %checks stopatmax for command, then executes
        maxheight = max(Z);
        maxlocation = find(Z==maxheight);
    elseif(stopat == 0)
        maxlocation = length(Z);
    else
        maxlocation = stopat;
    end

    color = rand(3,1);

    plot3(X(1:maxlocation),Y(1:maxlocation),Z(1:maxlocation),'LineWidth',3,'MarkerSize',10, 'Color',color)
    
    datalength = length(X);
    
    if(plottakeoff ==1)
        startpoint = [X(1),Y(1),Z(1)];
        plot3(startpoint(1),startpoint(2),startpoint(3),'o','LineWidth',3,'MarkerSize',10,'Color',color)
    end
    if(plotcrash == 1)
        landpoint = [X(datalength-1),Y(datalength-1),Z(datalength-1)];
        plot3(landpoint(1),landpoint(2),landpoint(3),'x','LineWidth',3,'MarkerSize',10,'Color',color) 
    end
    plotting = 1;

end
