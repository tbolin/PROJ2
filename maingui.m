%
% GUI och programmets huvudloop
%
clear; close all;

%
% Skapa ett objekt med alla parametrar
% (Defaultvärden sätts i classdef-filen)
%
p=parametrar;

running=1;

while running
    menytext = ['Numerisk och symbolisk derivering/integral' char(10) ...
    'f(x)=' p.funktion char(10) 'Plotintervall [' num2str(p.xmin) ', ' ... 
    num2str(p.xmax) ']' char(10) ...
    'Välj från menyn:'];
    
    val=menu(menytext,'Mata in ny funktion','Mata in nytt intervall', ...
    'Derivera numeriskt', 'Derivera symboliskt', ...
    'Integrera numeriskt', 'Integrera symboliskt', 'Avsluta');
    % clf;    
    switch val
        case 7 
            running=0;
        case 1
            p.funktion=input('Mata in ny funktion f(x):','s');
        case 2
            p.xmin=input('Mata in xmin:');
            p.xmax=input('Mata in xmax:');
        case 3
            f(x)=sym(p.funktion); % Omvandla från sträng till körbar funktion
            xplot = linspace(f, p.xmin, p.xmax, 2000); % Nog med punkter för en stor skärm...
            ynum = derivera_n(f, p.xmin, p.xmax, 2000);
            plot(xplot,ynum);
        case 4
        case 5
        case 6
    end
    
    
end
close all % Stäng menyfönstret och figurfönstret