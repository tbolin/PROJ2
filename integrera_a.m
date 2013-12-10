function [ py ] = integrera_a(f, a, b, n)
% Ber�knar integralerna analytiskt
% IN
% f symbolisk funktion i en variabel
% a start f�r ber�kningsintervallet
% b slut f�r ber�kningsintervallet
% n antalet punkter i intervallet
% UT
% py vektor med de analytiskt ber�knade integralerna
    x = linspace(a, b, n);
    py = vpa(int(f(x)));
end
