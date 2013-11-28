%
% GUI och programmets huvudloop
%

% Sätt defaultvärden på funktion och intervall så det går 
% snabbt att komma igång med experimenterandet
%
x=sym('x'); % Indikera att x ska hanteras som variabel
funktion='3*x+2';

xmin=0;
xmax=100;


running=1;

while running
    menytext = ['Numerisk och symbolisk derivering/integral' char(10) ...
'f(x)=' funktion char(10) 'Plotintervall [' num2str(xmin) ', ' ... 
num2str(xmax) ']' char(10) ...
'Välj från menyn:']
    
    val=menu(menytext,'Mata in ny funktion','Mata in nytt intervall', ...
    'Derivera numeriskt', 'Derivera symboliskt', ...
    'Integrera numeriskt', 'Integrera symboliskt', 'Avsluta')
    % clf;    
    switch val
        case 7 
            running=0;
        case 1
            funktion=input('Mata in ny funktion f(x):','s')
            xmin=42
         case 3
            blob(20)
        case 4
            elastisk_gubbe 
        otherwise
            subval=100,
    end 
end
close all % Stäng menyfönstret och figurfönstret