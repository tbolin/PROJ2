function fel=rita(p, menyval)
    % IN
    % p       Parametrar för kurvan
    % menyval Val i menyn vilken berÃ¤kning som ska gÃ¶ras
    %
    % UT
    % fel = felkod
    %x=sym('x'); % Indikera att x ska hanteras som variabel
    %f(x)=sym(p.funktion); % Omvandla från sträng till körbar funktion

    % BerÃ¤kna x, y och plotta
    x1 = linspace(p.xmax, p.xmin, p.xstep);
    [y1, mate_fel] = math_error(p, 1);
    % kolla att inget gick fel
    if mate_fel
        fel = 1;
        return
    end
    plot(x1, y1);

    title([p.text ' f(x)=' p.funktion]);
    
    if p.fxcount == 2 % Finns en till funktion att jämföra med
        hold on;
        % Beräkna den andra funktionen och plotta
        [y2, mate_fel] = math_error(p, 2);
        if mate_fel
            fel = 2;
            return
        end
        plot(x1, y2, 'g');
        % Beräkna fel^2 och plotta 
        plot(x1, (y1-y2).^2, 'r');
    end
    
    fel = 0;
end
