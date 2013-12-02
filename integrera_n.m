function py = integrera_n(f, a, b, n, varargin)
% Beräknar integralerna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start för beräkningsintervallet
% b slut för beräkningsintervallet
% n antalet punkter i intervallet
% UT
% py vektor med de numreriskt beräknade integralerna
    intervall = linspace(a,b,n);	% formaterar intervallet
    h = (b-a)/(n/2);                    % h = steglängden                          
    py = ((intervall+h)-(intervall-h))*(f(intervall-h)+f(intervall+h)/2);   % Trapetsregeln
end
% "vildvittror drakar och gråsuggor" - © Tobias

