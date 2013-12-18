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
        plot(x1, y1, 'LineSmoothing','on');
        title([p.text ' f(x)=' p.funktion]);
    
    else % Finns en funktion att jämföra med --> visualisera felet
        
        % Plotta första kurvan i grönt som referens
        subplot(2, 1, 1);
        plot(x1, y1, 'g', 'LineSmoothing','on');
        title([p.text ' f(x)=' p.funktion]);
        hold on;

        % Beräkna den andra funktionen och fel^2 mellan funktionerna
        y2 = p.fx2handle(f, p.xmin, p.xmax, p.xstep);
        fel = (y1-y2).^2;

        % Välj ut punkter med fel större än en viss tröskel relativt 
        % spannet i y-led, dvs där felet är så stort att kurvorna inte 
        % sammanfaller i plotten
        
        % Skapa logisk vektor, dvs 1 om sant annars 0
        % Felpunkter anses vara punkter där y(x) avviker mer än tröskeln
        % p.feltr från den andra funktionen. (Jämförelsen tar hänsyn 
        % till att felet beräknats som en kvadrat, medan tröskeln är 
        % linjär.)
        felpunkter = fel > ((p.feltr * (max(y1) - min(y1)))^2);

        %
        % Sök upp de delar av kurvorna som skiljer synbart och visa
        % hur andra kurvan skiljer sig från den första
        %
        ptr1 = 1;
        while ptr1 <= length(felpunkter)
            %  Flytta ptr till första felpunkt i raden
            ptr1 = ptr1 - 1 + find(felpunkter(ptr1:end) ~= 0, 1);
            % Om ingen hittad, avbryt eftersom det inte finns fler fel
            if isscalar(ptr1) == 0, break; end

            % Hitta sista felpunkt i raden. Justera för slut på vektorn!
            ptr2 = ptr1 - 1 + find(felpunkter(ptr1:end) == 0, 1) - 1;
            if isscalar(ptr2) == 0, ptr2=length(felpunkter); end
            if ptr2 < ptr1, ptr2=length(felpunkter); end

            % Plotta y2 i rött, bitarna som skiljer sig synbart från y1
            plot(x1(ptr1:ptr2), y2(ptr1:ptr2), 'r', 'LineSmoothing','on');
            legend('Numerisk beräkning (används som referenskurva)', ...
                'Analytisk beräkning när den skiljer synbart från numeriska');
            
            % Om felet är ett fåtal punkter, plotta även en röd markör
            if abs(ptr1-ptr2) < p.feltr * abs(p.xmax - p.xmin)
                felpunkt = ptr1+round((ptr2-ptr1)/2); % Hitta mitten
                plot(x1(felpunkt), y2(felpunkt), 'r*', 'LineSmoothing','on');
            end

            % Flytta ptr1 till nästa bit av vektorn som bör kollas
            ptr1 = ptr2 + 1;
        end
        
        % Plotta felet 
        subplot(2, 1, 2);
        plot(x1, fel, 'c', 'LineSmoothing','on');
        title(['Fel^2 mellan numerisk och analytisk beräkning av' ' f(x)=' p.funktion]);
    end
    
    fel = 0;
end
