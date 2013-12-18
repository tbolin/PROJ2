function py = integrera_n(f, a, b, n, varargin)
% Ber�knar integralerna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start f�r ber�kningsintervallet
% b slut f�r ber�kningsintervallet
% n antalet punkter i intervallet
% UT
% py vektor med de numreriskt ber�knade integralerna
    syms k;
    h = (b-a)/(n);                  % h = stegl�ngden
    f = matlabFunction(f);
    ay = zeros(1,n);                % f�r allokerar ay som anv�nds f�r att spara stegl�ngden
    for N = [1:1:n],                % loop som hittar stegl�ngden
        X = a+(N-1)*h;              % f�rsta x-v�rdet
        Y = a+(N)*h;                % andra x-v�rdet
        ay(N) = vpa(h*(f(X)+f(Y))/2); %trapetsregeln
    end
    L = length(ay);
    py = zeros(1,L);                
    for K = linspace(1,L,L)         
        if K == 1
            py(K) = ay(K);          % f�r att inte f�rs�ka hitta element 0
        else
            py(K) = vpa(ay(K) + py(K-1));   % s�tter ihop steget med tidigare summa f�r en ny summa.
        end
    end
end
% "vildvittror drakar och gr�suggor" - � Tobias
