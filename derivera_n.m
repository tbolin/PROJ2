function [ dy ] = derivera_n(f, a, b, n, varargin)
% Ber�knar derivatorna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start f�r ber�kningsintervallet
% b slut f�r ber�kningsintervallet
% n antalet punkter i intervallet
% varargin l�gesv�ljare mellan matlabfunc och symbolisk med vpa
% UT
% dy vektor med de numreriskt ber�knade derivatorna

    if nargin <= 4
        f = matlabFunction(f);
    end
    intervall = linspace(a,b,n);	% formaterar intervallet
    start_steg = 1/(2^10);          % s�tter ett l�mpligt startsteg
    numeriskt = @numeriskt_exp4;    % v�ljer numerisk funktion
    % Ber�knar en l�mplig stegl�ngd basserat p� 2:a derivatan
    nytt_steg = start_steg./bis(f, intervall, start_steg); 
    berr = numeriskt(f, intervall, nytt_steg);
    if nargin <= 4
        dy = double(berr);
    else
        dy = vpa(berr);
    end
end

function ddy=bis(f, a, h)
    % Ber�knar andraderivata
    andra = (f(a+h)-2*f(a)+f(a-h))./(h.^2);
    if double(andra)
        ddy=andra;
    else
        ddy=0.00000000001;
    end
end

%
% RichardsonextrMAGI be here, borde ge ett fel prop mot h^10
% Inte s� snyggt, g�r om till en rekursiv funktion om/n�r jag orkar
function dy=numeriskt_exp(f, a, h)
    dy = (2*f(a+2*h)-2*f(a-2*h)-f(a+h)+f(a-h))./(2*h*(4-1));
end

function dy=numeriskt_exp2(f, a, h)
    dy=(4*numeriskt_exp(f, a, h/2)-numeriskt_exp(f, a, h))/(4-1);
end

function dy=numeriskt_exp3(f, a, h)
    dy=(16*numeriskt_exp2(f, a, h/2)-numeriskt_exp2(f, a, h))/(16-1);
end

function dy=numeriskt_exp4(f, a, h)
    dy=(64*numeriskt_exp3(f, a, h/2)-numeriskt_exp3(f, a, h))/(64-1);
end
% vildvittror drakar och gr�suggor







