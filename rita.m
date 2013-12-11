function fel=rita(p, menyval)
    % IN
    % p       Parametrar för kurvan
    % menyval Val i menyn vilken beräkning som ska göras
    %
    % UT
    % fel = felkod
    
    close all, hold off;
    
    x=sym('x'); % Indikera att x ska hanteras som variabel
    f(x)=sym(p.funktion); % Omvandla från sträng till körbar funktion

    % Beräkna x, y och plotta
    x1 = linspace(p.xmin, p.xmax, p.xstep);
    y1 = p.fx1handle(f, p.xmin, p.xmax, p.xstep);    

    if p.fxcount == 1 % Bara en funktion. Plotta den utan konstigheter!
        plot(x1, y1);
        title([p.text ' f(x)=' p.funktion]);
    
<<<<<<< HEAD
    else % Finns en funktion att jämföra med --> visualisera felet
        
        % Plotta första kurvan i grönt som referens
=======
    else % Finns en funktion att jÃ¤mfÃ¶ra med --> visualisera felet
        
        % Plotta fÃ¶rsta kurvan i grÃ¶nt som referens
>>>>>>> origin/master
        subplot(2, 1, 1);
        plot(x1, y1, 'g');
        title([p.text ' f(x)=' p.funktion]);
        hold on;

<<<<<<< HEAD
        % Beräkna den andra funktionen och fel^2 mellan funktionerna
        y2 = p.fx2handle(f, p.xmin, p.xmax, p.xstep);
        fel = (y1-y2).^2;

        % Välj ut punkter med fel större än en viss tröskel relativt 
        % spannet i y-led, dvs där felet är så stort att kurvorna inte 
=======
        % BerÃ¤kna den andra funktionen och fel^2 mellan funktionerna
        y2 = p.fx2handle(f, p.xmin, p.xmax, p.xstep);
        fel = (y1-y2).^2;

        % VÃ¤lj ut punkter med fel stÃ¶rre Ã¤n en viss trÃ¶skel relativt 
        % spannet i y-led, dvs dÃ¤r felet Ã¤r sÃ¥ stort att kurvorna inte 
>>>>>>> origin/master
        % sammanfaller i plotten
        
        % Skapa logisk vektor, dvs 1 om sant annars 0
        felpunkter = fel > ((p.feltr * (max(y1) - min(y1)))^2);

        % 
        ptr1 = 1;
        while ptr1 <= length(felpunkter)
<<<<<<< HEAD
            %  Flytta i till första felpunkt i raden
            ptr1 = ptr1 - 1 + find(felpunkter(ptr1:end) ~= 0, 1);
            % Om ingen hittad, peka på vektorns slut
            if isscalar(ptr1) == 0, ptr1=length(felpunkter); end
                        
            % Hitta sista felpunkt i raden. Justera för slut på vektorn!
=======
            %  Flytta i till fÃ¶rsta felpunkt i raden
            ptr1 = ptr1 - 1 + find(felpunkter(ptr1:end) ~= 0, 1);
            % Om ingen hittad, peka pÃ¥ vektorns slut
            if isscalar(ptr1) == 0, ptr1=length(felpunkter); end
                        
            % Hitta sista felpunkt i raden. Justera fÃ¶r slut pÃ¥ vektorn!
>>>>>>> origin/master
            ptr2 = ptr1 - 1 + find(felpunkter(ptr1:end) == 0, 1) - 1;
            if isscalar(ptr2) == 0, ptr2=length(felpunkter); end
            if ptr2 < ptr1, ptr2=length(felpunkter); end

<<<<<<< HEAD
            % Plotta y2 i rött, bitarna som skiljer sig synbart från y1
            plot(x1(ptr1:ptr2), y2(ptr1:ptr2), 'r');
            
            % Om felet är enstaka punkter, plotta även en röd markör
=======
            % Plotta y2 i rÃ¶tt, bitarna som skiljer sig synbart frÃ¥n y1
            plot(x1(ptr1:ptr2), y2(ptr1:ptr2), 'r');
            
            % Om felet Ã¤r enstaka punkter, plotta Ã¤ven en rÃ¶d markÃ¶r
>>>>>>> origin/master
            if abs(ptr1-ptr2) < p.feltr
                plot(x1(ptr1:ptr2), y2(ptr1:ptr2), 'r*');
            end

<<<<<<< HEAD
            % Flytta ptr1 till nästa bit av vektorn som bör kollas
=======
            % Flytta ptr1 till nÃ¤sta bit av vektorn som bÃ¶r kollas
>>>>>>> origin/master
            ptr1 = ptr2 + 1;
        end
        
        % Plotta felet 
        subplot(2, 1, 2);
        plot(x1, fel, 'c');
<<<<<<< HEAD
        title(['Fel^2 mellan numerisk och analytisk beräkning av' ' f(x)=' p.funktion]);
=======
        title(['Fel^2 mellan numerisk och analytisk berÃ¤kning av' ' f(x)=' p.funktion]);
>>>>>>> origin/master
    end
    
    fel = 0;
end
