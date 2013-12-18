function py = integrera_n(f, a, b, n, varargin)
% Berï¿½knar integralerna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start fï¿½r berï¿½kningsintervallet
% b slut fï¿½r berï¿½kningsintervallet
% n antalet punkter i intervallet
% UT
% py vektor med de numreriskt berï¿½knade integralerna
<<<<<<< HEAD
    syms k;
    h = (b-a)/(n);                  % h = steglängden
    f = matlabFunction(f);
    ay = zeros(1,n);                % förallokerar ay som används för att spara steglängden
    for N = [1:1:n],                % loop som hittar steglängden
        X = a+(N-1)*h;              % första x-värdet
        Y = a+(N)*h;                % andra x-värdet
        ay(N) = vpa(h*(f(X)+f(Y))/2); %trapetsregeln
    end
    L = length(ay);
    py = zeros(1,L);                
    for K = linspace(1,L,L)         
        if K == 1
            py(K) = ay(K);          % för att inte försöka hitta element 0
        else
            py(K) = vpa(ay(K) + py(K-1));   % sätter ihop steget med tidigare summa för en ny summa.
        end
    end
end
% "vildvittror drakar och grï¿½suggor" - ï¿½ Tobias
=======
    %py = zeros(1,n)
    syms k;
    h = (b-a)/(n);                    % h = steglängden 
    for N = [1:1:n],
        py(N) = vpa(h*symsum((f(a+(k-1)*h)+f(a+(k-1)*h +h))/2, k, 1, N)); %trapetsregeln
    end
end
% "vildvittror drakar och gråsuggor" - ï¿½ Tobias
>>>>>>> master

