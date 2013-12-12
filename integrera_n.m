function py = integrera_n(f, a, b, n, varargin)
% Ber�knar integralerna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start f�r ber�kningsintervallet
% b slut f�r ber�kningsintervallet
% n antalet punkter i intervallet
% UT
% py vektor med de numreriskt ber�knade integralerna
    %py = zeros(1,n)
    syms k;
    h = (b-a)/(n);                    % h = stegl�ngden 
    for N = [1:1:n],
        py(N) = vpa(h*symsum((f(a+(k-1)*h)+f(a+(k-1)*h +h))/2, k, 1, N)); %trapetsregeln
    end
end
% "vildvittror drakar och gr�suggor" - � Tobias

