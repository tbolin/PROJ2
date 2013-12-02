function py = integrera_n(f, a, b, n, varargin)
% Ber�knar integralerna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start f�r ber�kningsintervallet
% b slut f�r ber�kningsintervallet
% n antalet punkter i intervallet
% UT
% py vektor med de numreriskt ber�knade integralerna
    intervall = linspace(a,b,n);	% formaterar intervallet
    h = (b-a)/(n/2);                    % h = stegl�ngden                          
    py = ((intervall+h)-(intervall-h))*(f(intervall-h)+f(intervall+h)/2);   % Trapetsregeln
end
% "vildvittror drakar och gr�suggor" - � Tobias

