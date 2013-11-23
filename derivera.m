function Y=derivera(f, a, d)
    % IN
    % f symbolisk funktion i en variabel
    % a vektor med punkter där derivatan av f ska beräknas
    % d största tilåtna fel
    % UT
    % Y = [yn ya]
    % yn vektor med de numreriskt beräknade derivatorna
    % ya vektor med de analytiskt beräknade derivatorna
    yn = numeriskt(f, a, d)
    ya = analytiskt(f, a)
    Y = [yn ; ya];
end

%Derivera numeriskt
function yn=numeriskt(f, a, d)
    h=1;
    yn = (double((f(a+h))-double(f(a-h))))/(2*h);
end

%Derivera analytiskt
function ya=analytiskt(f, a)
    der = diff(f);
    ya = double(der(a));
end