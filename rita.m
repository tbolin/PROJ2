function fel=rita(p, menyval)
    % IN
    % p       Parametrar för kurvan
    % menyval Val i menyn vilken beräkning som ska göras
    %
    % UT
    % fel = felkod
    x=sym('x'); % Indikera att x ska hanteras som variabel
    f(x)=sym(p.funktion); % Omvandla från sträng till körbar funktion
    xplot = linspace(p.xmin, p.xmax, 2000); % Nog med punkter för en stor skärm...
    ynum = derivera_n(f, p.xmin, p.xmax, 2000);
    plot(xplot,ynum);
    fel = 0;
end
