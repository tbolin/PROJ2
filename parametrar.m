classdef parametrar < handle    % 'handle' <-> klassen hanteras med
                                % pekare, s� den kan modifieras av
                                % funktioner den skickas till
                                
    % Ren dataklass med parametrar f�r ritjobbet, men ingen kod
    properties
        meny = @enkel_meny;     % Enkel meny som default
        rita = @rita;           % Enkel ritfunktion som default
        text='';                % Etikett f�r plotten
        funktion='3*x^2+2';     % Funktion att jobba med
        xmin = 0;               % minsta v�rde att unders�ka
        xmax = 10;              % st�rsta v�rde...
        xstep = 2000;           % Antal punkter att plotta [xmin, xmax]
        feltr = 0.001;          % Tr�skel f�r fel att markera i plot
        fxcount = 0;            % Antal funktioner att j�mf�ra
        fx1handle = 0;          % F�rsta funktion
        fx2handle = 0;          % Andra funktion att j�mf�ra med
    end
end
