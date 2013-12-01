function [ dy ] = derivera_a(f, a, b, n)
% Beräknar derivatorna analytiskt
% IN
% f symbolisk funktion i en variabel
% a start för beräkningsintervallet
% b slut för beräkningsintervallet
% n antalet punkter i intervallet
% UT
% dy vektor med de analytiskt beräknade derivatorna
    x = linspace(a, b, n);
    der = diff(f);
    dy = vpa(der(x));
end

