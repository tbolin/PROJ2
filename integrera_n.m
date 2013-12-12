function py = integrera_n(f, a, b, n, varargin)
% Berï¿½knar integralerna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start fï¿½r berï¿½kningsintervallet
% b slut fï¿½r berï¿½kningsintervallet
% n antalet punkter i intervallet
% UT
% py vektor med de numreriskt berï¿½knade integralerna
    %py = zeros(1,n)
    syms k;
    h = (b-a)/(n);                    % h = steglängden 
    for N = [1:1:n],
        py(N) = vpa(h*symsum((f(a+(k-1)*h)+f(a+(k-1)*h +h))/2, k, 1, N)); %trapetsregeln
    end
end
% "vildvittror drakar och gråsuggor" - ï¿½ Tobias

