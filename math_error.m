function [ y, fel ] = math_error( p, f_no, varargin )
    % Hanterar fel som uppkommer i matefunktionerna
    % IN
    % p       Parametrar f�r kurvan
    % f_no    Vilken av funktionerna som ska anv�ndas
    %
    % UT
    % y       Returv�rde fr�n funktionen om allt g�r bra
    % fel     felkod, 
    %         0 om allt g�r bra
    %         1 om funktionen delar med 0
    %         
    %         -1 f�r fel som inte hanteras

    try
        x=sym('x');          % Indikera att x ska hanteras som variabel
        f(x)=sym(p.funktion); % Omvandla från sträng till körbar funktion
        if f_no == 1
            y = p.fx1handle(f, p.xmin, p.xmax, p.xstep); 
        else
            y = p.fx2handle(f, p.xmin, p.xmax, p.xstep); 
        end
        fel = 0;

        % OBS!
        % Hantering av olika typer av fel ska vara h�r!
    catch err 
        % Felhantering f�r division med 0
        if strcmp(err.identifier, 'MATLAB:nologicalnan') || ...
           strcmp(err.identifier,'symbolic:mupadmex:CommandError')
            % Varnar f�r delning med 0, men krachar inte programmet
            fel = 1;
            formatSpec = 'Varning! Funktionen delar med 0.\n Felkod: %i\n';
        elseif strcmp(err.identifier, 'MATLAB:minrhs') || ...
               strcmp(err.identifier, 'symbolic:sym:sym:errmsg9')
            fel = 2;
            formatSpec = 'Funktionen �r felformaterad eller anv�nder inte x som variabel\n Felkod: %i\n';
        else
            % Om det �r ett fel som inte hanteras h�r skickas det vidare
            err.identifier
            fel = -1;
            rethrow(err);
        end
        fprintf(2, formatSpec, fel);
        y = 0; % s�tter y = 0 f�r att undvika kracher pga fel output
    end 
end

