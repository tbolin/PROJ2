%
% GUI och programmets huvudloop
%
clear all; close all;

%
% Skapa ett objekt med alla parametrar
% (Defaultvärden sätts i classdef-filen)
%
p=parametrar;

% Indikera att x ska hanteras som analytisk/symbolisk variabel
x=sym('x');

running=1;

while running
    val=p.meny(p);
    switch val
        case 1
        case 2
        case 3
            p.text='Deriverat numeriskt';
            p.fx1handle = @derivera_n;
            p.fxcount = 1; % Ingen jämförelse
            p.rita(p, val);
        case 4
            p.text='Deriverat analytiskt';
            p.fx1handle = @derivera_a;
            p.fxcount = 1; % Ingen jämförelse
            p.rita(p, val);
        case 5
            p.text='Integrerat numeriskt';
            p.fx1handle = @integrera_n;
            p.fxcount = 1; % Ingen jämförelse
            p.rita(p, val);
        case 6
            p.text='Integrerat analytiskt';
            p.fx1handle = @integrera_a;
            p.fxcount = 1; % Ingen jämförelse
            p.rita(p, val);
        case 7
            p.text='Jämförelse numerisk/analytisk derivering';
            p.fx1handle = @derivera_n;
            p.fx2handle = @derivera_a;
            p.fxcount = 2;
            p.rita(p, val);           
        case 8
            p.text='Jämförelse numerisk/analytisk integrering';
            p.fx1handle = @integrera_n;
            p.fx2handle = @integrera_a;
            p.fxcount = 2;
            p.rita(p, val);
        case 9
            running=0;
    end
    
    
end
close all % Stäng menyfönstret och figurfönstret