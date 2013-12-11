classdef parametrar < handle    % 'handle' <-> klassen hanteras med
                                % pekare, så den kan modifieras av
                                % funktioner den skickas till
                                
    % Ren dataklass med parametrar för ritjobbet, men ingen kod
    properties
        meny = @enkel_meny;     % Enkel meny som default
        rita = @rita;           % Enkel ritfunktion som default
        text='';                % Etikett för plotten
        funktion='3*x^2+2';     % Funktion att jobba med
        xmin = 0;               % minsta värde att undersöka
        xmax = 10;              % största värde...
        xstep = 2000;           % Antal punkter att plotta [xmin, xmax]
        feltr = 0.001;          % Tröskel för fel att markera i plot
        fxcount = 0;            % Antal funktioner att jämföra
        fx1handle = 0;          % Första funktion
        fx2handle = 0;          % Andra funktion att jämföra med
    end
end
