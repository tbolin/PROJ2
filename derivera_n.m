function [ dy ] = derivera_n(f, a, b, n, varargin)
% Ber√§knar derivatorna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start f√∂r ber√§kningsintervallet
% b slut f√∂r ber√§kningsintervallet
% n antalet punkter i intervallet
% varargin l√§gesv√§ljare mellan matlabfunc och symbolisk med vpa
% UT
% dy vektor med de numeriskt ber√§knade derivatorna
    STEP_N = 2^10;
    if nargin <= 4
        f = matlabFunction(f);
    end
    intervall = linspace(a,b,n);	% formaterar intervallet
    start_steg = max(abs(intervall), 2^(-1000))/(STEP_N);          % s√§tter ett l√§mpligt startsteg
    numeriskt = @numeriskt_exp4;    % v√§ljer numerisk funktion
    % Ber√§knar en l√§mplig stegl√§ngd basserat mha 2:a derivatan
    nytt_steg = calc_step(f, intervall, start_steg, STEP_N);
    berr = numeriskt(f, intervall, nytt_steg);
    if nargin <= 4
        dy = double(berr);
    else
        dy = vpa(berr);
    end
end

function step=calc_step(f, a, h, STEP_N)
    % Ber√§knar l√§mplig stegl√§ngd

    % Skillnaden mellan stegets storlek och inv‰rdet fÂr inte vara fˆr stor
    % efter som det dÂ leder till cancelation
    a_step = abs(a/STEP_N);
    % steget bˆr inte heller vara stˆrre ‰n v‰rdet av funktionen i a
    % bland annat triggfunktioner kan fÂ problem dÂ.
    abs_f = abs(f(a))/STEP_N;
    % 2^(-1000) ‰r d‰r fˆr att undvika att steget blir 0
    step = min(max(a_step, 2^(-1000)), abs_f);
end

%
% RichardsonextrMAGI be here, borde ge ett fel prop mot h^10
% Inte s√• snyggt, g√∂r om till en rekursiv funktion om/n√§r jag orkar
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
% vildvittror drakar och gr√•suggor







