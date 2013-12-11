function fel=rita(p, menyval)
    % IN
    % p       Parametrar f�r kurvan
    % menyval Val i menyn vilken beräkning som ska göras
    %
    % UT
    % fel = felkod
    %x=sym('x'); % Indikera att x ska hanteras som variabel
    %f(x)=sym(p.funktion); % Omvandla fr�n str�ng till k�rbar funktion

    % Beräkna x, y och plotta
    x1 = linspace(p.xmax, p.xmin, p.xstep);
    [y1, mate_fel] = math_error(p, 1);
    % kolla att inget gick fel
    if mate_fel
        fel = 1;
        return
    end
    plot(x1, y1);

    title([p.text ' f(x)=' p.funktion]);
    
    if p.fxcount == 2 % Finns en till funktion att j�mf�ra med
        hold on;
        % Ber�kna den andra funktionen och plotta
        [y2, mate_fel] = math_error(p, 2);
        if mate_fel
            fel = 2;
            return
        end
        plot(x1, y2, 'g');
        % Ber�kna fel^2 och plotta 
        plot(x1, (y1-y2).^2, 'r');
    end
    
    fel = 0;
end
