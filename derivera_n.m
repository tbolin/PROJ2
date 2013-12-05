function dy = derivera_n(f, a, b, n, varargin)
% Beräknar derivatorna numeriskt
% IN
% f symbolisk funktion i en variabel
% a start för beräkningsintervallet
% b slut för beräkningsintervallet
% n antalet punkter i intervallet
% varargin lägesväljare mellan matlabfunc och symbolisk med vpa
% UT
% dy vektor med de numreriskt beräknade derivatorna
    if nargin <= 4
        f = matlabFunction(f);
    end
    intervall = linspace(a,b,n);	% formaterar intervallet
    start_steg = 1/(2^10);          % sätter ett lämpligt startsteg
    numeriskt = @numeriskt_exp4;    % väljer numerisk funktion
    % Beräknar en lämplig steglängd basserat på 2:1 derivatan
    nytt_steg = start_steg./bis(f, intervall, start_steg); 
    berr = numeriskt(f, intervall, nytt_steg);
    if nargin <= 4
        dy = double(berr);
    else
        dy = vpa(berr);
    end
end

function ddy=bis(f, a, h)
    % Beräknar andraderivata
    andra = (f(a+h)-2*f(a)+f(a-h))./(h.^2);
    try
    if double(andra)
        ddy=andra;
    else
        ddy=0.00000000001;
    end
    % Felhantering för nolldivision, kanske borde ligga högre upp i
    % hierarkin
    catch err
        if (strcmp(err.identifier, 'MATLAB:nologicalnan')) && ~all(a)
            smallest = 2^(-1022);
            sprintf(['WARNING! Division by zero. \n Adjusting zero elements to ', num2str(smallest)])
            for i=1:length(a)
                if ~a(i)
                    a(i) = smallest;
                end
            end
            ddy = bis(f, a, h);
        else
            rethrow(err);
        end 
    end
end

%
% RichardsonextrMAGI be here, borde ge ett fel prop mot h^10
% Inte så snyggt, gör om till en rekursiv funktion om/när jag orkar
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
% vildvittror drakar och gråsuggor







