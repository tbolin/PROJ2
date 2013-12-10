function [ dy ] = derivera_a(f, x, vararg)
% Ber�knar derivatorna analytiskt
% IN
% f symbolisk funktion i en variabel
% a start f�r ber�kningsintervallet
% b slut f�r ber�kningsintervallet
% n antalet punkter i intervallet
% UT
% dy vektor med de analytiskt ber�knade derivatorna
    %x = linspace(a, b, n);
    der = diff(f);
    dy = vpa(der(x));
end

