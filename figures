function figures

%dit is de funtie waarmee je de positie van een figuur kunt vastleggen, dus
%waar in beeld die verschijnt. Gebruiken door onderaan je document de
%functie figures aan te roepen zonder input arguments. De functie zal het
%aantal figuren bepalen en verdelen over vier posities op het scherm.

fig=flipud(findall(0,'type','figure'));
number=length(fig);

set(0,'Units','pixels'); 
scnsize = get(0,'ScreenSize');

fig=flipud(findall(0,'type','figure'));
number=length(fig);
% number=length(fig);
n=35;


pos(:,1) = [0,(scnsize(4)+n)/2,scnsize(3)/2,(scnsize(4)-n)/2];
pos(:,2) = [scnsize(3)/2,(scnsize(4)+n)/2,scnsize(3)/2,(scnsize(4)-n)/2];
pos(:,3) = [0,n,scnsize(3)/2,(scnsize(4)-n)/2];
pos(:,4) = [scnsize(3)/2,n,scnsize(3)/2,(scnsize(4)-n)/2];

for i=1:number;
    b=mod(i-1,4)+1;
    set(fig(i),'OuterPosition',pos(:,b),'menubar','none');
end

end
