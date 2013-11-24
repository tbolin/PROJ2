function Y=derivera(f, a, d)
    % IN
    % f symbolisk funktion i en variabel
    % a vektor med punkter där derivatan av f ska beräknas
    % d största tilåtna fel
    % UT
    % Y = [yn ya]
    % yn vektor med de numreriskt beräknade derivatorna
    % ya vektor med de analytiskt beräknade derivatorna
    yn = numeriskt(f, a, d);
    yn2 = numeriskt2(f, a, d);
    ya = analytiskt(f, a);
    Y = [yn; yn2 ; ya];
end

%Derivera numeriskt
function yn=numeriskt(f, a, d)
    h=0.0001;
    yn = double((f(a+h)-f(a-h))/(2*h));
    %yn = (double((f(a+h))-double(f(a-h))))/(2*h);
end

function yn=numeriskt2(f, a, d)
    h=0.0001;
    yn = double((8*(f(a+h)-f(a-h))-f(a+2*h)+f(a-2*h))/(12*h));
end

%Derivera analytiskt
function ya=analytiskt(f, a)
    der = diff(f);
    ya = double(der(a));
end

% Det är 
% syms x;
% f(x) = sym('funktion')