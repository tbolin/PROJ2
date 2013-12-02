function [ py ] = integrera_a(f, a, b, n)
% Beräknar integralerna analytiskt
% IN
% f symbolisk funktion i en variabel
% a start för beräkningsintervallet
% b slut för beräkningsintervallet
% n antalet punkter i intervallet
% UT
% py vektor med de analytiskt beräknade integralerna
    x = linspace(a, b, n);
    int = diff(f);
    py = vpa(int(x));
end

