function fel=rita(p, menyval)
    % IN
    % p       Parametrar för kurvan
    % menyval Val i menyn vilken beräkning som ska göras
    %
    % UT
    % fel = felkod
    x=sym('x'); % Indikera att x ska hanteras som variabel
    f(x)=sym(p.funktion); % Omvandla från sträng till körbar funktion

    % Beräkna x, y och plotta
    x1 = linspace(p.xmin, p.xmax, p.xstep);
    y1 = p.fx1handle(f, p.xmin, p.xmax, p.xstep);    
    plot(x1, y1);

    title([p.text ' f(x)=' p.funktion]);
    
    if p.fxcount == 2 % Finns en till funktion att jämföra med
        hold on;
        % Beräkna den andra funktionen och plotta
        y2 = p.fx2handle(f, p.xmin, p.xmax, p.xstep);
        plot(x1, y2, 'g');
        
        % Beräkna fel^2 och plotta 
        plot(x1, (y1-y2).^2, 'r');
    end
    
    fel = 0;
end
