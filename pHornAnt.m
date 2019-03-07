% *************************************************************************
% pHornAnt.m
% *************************************************************************
% 
% This MATLAB program designs an optimum gain pyramidal horn based on 
% the formulation of Section 13.4.3, Equations (13-55) - (13-58b) of
% Antenna Theory: Analysis and Design(4ED) by  Constantine Balanis
% 
%
% Program computes
% 
%     Horn Dimensions
%         a1,b1, rhoe, rhoh, pe, and ph (in cm)
%     
%     Horn flare angles
%         psie, and pseh (in degrees)
%         
% Input Parameters:
% 
%     Go = Desired gain (dB)
%     f   = Frequency (GHz)
%     a&b = Rectangular waveguide dimensions (cm)
%
% *************************************************************************


function [a1,b1,rhoe, rhoh, pe, ph, psie, psih] = pHornAnt(Go, f, a0, b0)

global a b lambda gain

    %%%%%% User Provided
    %f = 11;
    %Go = 22.6;
    %%%%%% User Provided

%Speed of light [m/s]
    c = 2.999e8;

%Gain dimentionless
    gain = 10^(Go/10);

%Wavelength[cm] based on frequency f[GHz]
    lambda = (c*100) / (f*(1e9));

    %%%%%% User Provided
    a = a0*lambda;
    b = b0*lambda;
    %%%%%% User Provided

%Calculated initial point
    xt = gain/(2*pi*sqrt(2*pi)); 

%https://www.mathworks.com/help/matlab/ref/fzero.html
%Tool for plotting soltuion wrt iteration to verify bisection
    options = optimset('PlotFcns',{@optimplotx,@optimplotfval});

%Solved value for chi using bisection that satisfies (13-54) pg 754
    chi = fzero(@bisection, xt, options); 

        function y = bisection(x)



            %Left-hand side of equation 13-54
            F1=((sqrt(2*x)-b/lambda)^2)*(2*x-1);

            %Right=hand side of equation 13-54    
            F2=(((gain/(2*pi))*sqrt(3/(2*pi))*sqrt(1/x)-a/lambda)^2);
            F3=((((gain^2)/(6*pi^3))/x)-1);    

            %Calculated Error
            y=F1-F2*F3;
        end 


%Using (13-54a) and (13-54b), answer in [cm]

    rhoe = chi*lambda;

    rhoh = ((gain^2)/(8*pi^3))*(1/chi)*lambda;

    %disp(chi)

%Using (13-56a) and (13-56b), answer in [cm]

    a1 = (gain/(2*pi))*lambda*sqrt(3/(2*pi*chi));

    b1 = sqrt(2*chi)*lambda;

%Using (13-47a) and (13-47b), answer in [cm] on page 747

    pe = (b1 - b)*sqrt((rhoe/b1)^2-(1/4));
    
    ph = (a1 - a)*sqrt((rhoh/a1)^2-(1/4));
    
    
%Psi calculation in degrees

    psie = atand((b1/2)/pe);
    
    psih = atand((a1/2)/ph);
    


end

































