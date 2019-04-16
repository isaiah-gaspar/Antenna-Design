% *************************************************************************
% patchAnt.m
% *************************************************************************
% 
% This MATLAB program designs a patch antenna of
% Antenna Theory: Analysis and Design(4ED) by  Constantine Balanis
% 
%
% Program computes:
% 
%     Patch Dimensions
%         h and w (in cm)     
%         
% Input Parameters:
% 
%     f   = Frequency (in GHz)
%     er  = Dielectric Constant
%     h   = Substrate Height (in cm)
%
% *************************************************************************


function [w, L] = patchAnt(f, er, h)


    %%%%%% User Provided
    %f = 11;
    %Go = 22.6;
    %%%%%% User Provided

%Speed of light [cm/s]
    c = 30;
    
%Fundamental Frequency in GHz
    f0 = f;
    
%Wavelength
    lambda = c/f0;
    
%Width of the patch antenna (14-6)    
    w = (1/2)*(c/f0)*sqrt(2/(er+1));
    
%Effective dielectric constant (14-1)
    e_eff = (1/2)*(er + 1) + (1/2)*(er - 1)*sqrt(1+12*(h/w));
    
%Find Extension length del_L (14-2)
    del_L = (h * 0.412)*((e_eff+0.3)*((w/h) + 0.264))/((e_eff-0.258)*((w/h)+0.8));
    
%Find actual length(in cm) using (14-3)
    L = (lambda/2)*(1/sqrt(1.972)) - 2*del_L;   
  
%Find L effective, include actual size and fringing
    Le = L + 2*del_L;
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%With Slot insert for matching
    
%Input impedence, G1 in siemens
    
    
    
    
    
    
    end

































