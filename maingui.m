%
% GUI och programmets huvudloop
%
clear all; close all;

%
% Skapa ett objekt med alla parametrar
%
try
    load('settings.mat'); % Försök läsa sparade värden
catch
    p=parametrar; % Ta defaultvärden från classdef-filen vid misslyckande
end

% Sätt upp enkelt gränssnitt som default
s.meny = @enkel_meny;     % Enkel meny som default
s.rita = @rita;           % Enkel ritfunktion som default

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
        case 4
            p.text='Deriverat analytiskt';
            p.fx1handle = @derivera_a;
            p.fxcount = 1; % Ingen jämförelse
        case 5
            p.text='Integrerat numeriskt';
            p.fx1handle = @integrera_n;
            p.fxcount = 1; % Ingen jämförelse
        case 6
            p.text='Integrerat analytiskt';
            p.fx1handle = @integrera_a;
            p.fxcount = 1; % Ingen jämförelse
        case 7
            p.text='Jämförelse numerisk/analytisk derivering';
            p.fx1handle = @derivera_n;
            p.fx2handle = @derivera_a;
            p.fxcount = 2;      
        case 8
            p.text='Jämförelse numerisk/analytisk integrering';
            p.fx1handle = @integrera_n;
            p.fx2handle = @integrera_a;
            p.fxcount = 2;
        case 9
            running=0;
    end
    % ritar kurvorna samt f�ngar ev fel
    if running
        try
            p.rita(p, val);
        catch err
            math_error(err);
        end
    end
    % Spara parametervärden till nästa körning, så man slipper mata 
    % in allt på nytt. (Väldigt bra när man testar och kraschar ;-)
    save('settings.mat', 'p');
end
close all % Stäng menyfönstret och figurfönstret