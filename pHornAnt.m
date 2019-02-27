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
%         a1,b1, rho_e, rho_h, p_e, and p_h (in cm)
%     
%     Horn flare angles
%         psi_e, and pse_h (in degrees)
%         
% Input Parameters:
% 
%     G_o = Desired gain (dB)
%     f   = Frequency (GHz)
%     a&b = Rectangular waveguide dimensions (cm)
%
% *************************************************************************


function [a1,b1,rhoe, rhoh, pe, ph, psie, psih] = pHornAnt(Go, f, a, b)

f = 11;

%Speed of light [m/s]
c = 2.999e8;

%Gain dimentionless
gain = 10^(Go/10);

%Wavelength[cm] based on frequency f[GHz]
lambda = (c*100) / (f*(1e9));

a = 0.8382.*lambda;

b = 0.3725.*lambda;

xt = gain/(2*pi*sqrt(2*pi));

chi = fzero(@bisection, xt);




function y = bisection(x)
    
global gain a b lambda f;

    %Left-hand side of equation 13-54

    F1=((sqrt(2*x)-b/lambda)^2)*(2*x-1);
    
    %Right=hand side of equation 13-54
    
    F2=(((gain/(2*pi))*sqrt(3/(2*pi))*sqrt(1/x)-a/lambda)^2);
    F3=(((gain^2)/(6*pi^3))/x-1);
    
    
    y=F1-F2*F3;
end










