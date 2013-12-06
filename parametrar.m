classdef parametrar < handle    % 'handle' <-> klassen hanteras med
                                % pekare, så den kan modifieras av
                                % funktioner den skickas till
                                
    % Ren dataklass med parametrar för ritjobbet, men ingen kod
    properties
        funktion='3*x^2+2';     % Funktion att jobba med
        xmin = 0;               % minsta värde att undersöka
        xmax = 10;              % största värde...
    end
end
