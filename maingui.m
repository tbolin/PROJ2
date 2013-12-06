%
% GUI och programmets huvudloop
%
clear; close all;

%
% Skapa ett objekt med alla parametrar
% (Defaultvärden sätts i classdef-filen)
%
p=parametrar;
x=sym('x'); % Indikera att x ska hanteras som variabel

running=1;

while running
    val=enkel_meny(p);
    switch val
        case 7 
            running=0;
        case 1
        case 2
        case 3
            rita(p, val);
        case 4
        case 5
        case 6
    end
    
    
end
close all % Stäng menyfönstret och figurfönstret