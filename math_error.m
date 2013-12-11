function math_error( err )
    % Hanterar fel som uppkommer i matefunktionerna
    % IN
    % err     felet som har uppst�tt
    %
    % UT
    % fel     felkod, 
    %         0 om allt g�r bra
    %         1 funktionen delar med 0
    %         2 funktionen har fel format
    %         
    %         -1 f�r fel som inte hanteras

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
end 

