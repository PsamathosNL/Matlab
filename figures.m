function [pos1, pos2, pos3, pos4]=figuren(n)
%dit is de funtie waarmee je de positie van een figuur kunt vastleggen, dus
%waar in beeld die verschijnt, gewoon aanroepen moet
%[pos1,pos2,pos3,pos4]=figuren(n) n is hierbij het aantal pixels wat er aan
%de onderkant verwijdert moet worden ivm taakbalk, 30 is hiervoor een mooie
%waarde.
%als je een figuur wilt toewijzen aan een van deze plaatsen gebruik je het
%command: 'OuterPosition',pos1 of een andere positie.

set(0,'Units','pixels') 
scnsize = get(0,'ScreenSize');
fig1 = figure;

n=30;

position = get(fig1,'Position');
outerpos = get(fig1,'OuterPosition');
borders = outerpos - position;
fig2 = figure;
fig3 = figure;
fig4 = figure;
edge = -borders(1)/2;
pos1 = [edge,...
        scnsize(4) * (1/2)+n/2,...
        scnsize(3)/2 - edge,...
        scnsize(4)/2-n/2];
pos2 = [scnsize(3)/2 + edge,...
        pos1(2),...
        pos1(3),...
        pos1(4)];
pos3 = [edge,...
        edge+n,...
        scnsize(3)/2 - edge,...
        scnsize(4)/2-n/2];
pos4 = [scnsize(3)/2 + edge,...
        pos3(2),...
        pos3(3),...
        pos3(4)];
set(fig1,'OuterPosition',pos1) 
set(fig2,'OuterPosition',pos2)
set(fig3,'OuterPosition',pos3)
set(fig4,'OuterPosition',pos4)
end
