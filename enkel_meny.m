function menyval=enkel_meny(p)
    % Visar en enkel meny för kommandon och läser in parametrar
    % via kommandofönstret vid behov.
    %
    % Inte så snyggt, men löser uppgiften med ganska lite arbete.
    %
    % IN
    % p        (Pekare till) Parametrar för kurvan
    % menyval  Val i menyn vilken beräkning som ska göras
    %
    % UT
    % Menyval  Siffra för vad som valts i menyn
    
    % Text överst i menyrutan, inklusive värden på parametrarna
    menytext = ['Numerisk och symbolisk derivering/integral' char(10) ...
    'f(x)=' p.funktion char(10) 'Plotintervall [' num2str(p.xmin) ', ' ... 
    num2str(p.xmax) ']' char(10) ...
    'Välj från menyn:'];
    
    % Visa menyn och fråga efter val
    menyval=menu(menytext,'Mata in ny funktion','Mata in nytt intervall', ...
    'Derivera numeriskt', 'Derivera symboliskt', ...
    'Integrera numeriskt', 'Integrera symboliskt', 'Avsluta');

    % Fråga efter parametrar i kommandofönstret vid behov.
    switch menyval
        case 1
            p.funktion=input('Mata in ny funktion f(x):','s');
        case 2
            p.xmin=input('Mata in xmin:');
            p.xmax=input('Mata in xmax:');
        case 3
        case 4
        case 5
        case 6
end