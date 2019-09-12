function elipse(n)
n=input('Introduce el numero de elipses deseadas: ');
a= input('Introduce el semieje mayor de la elipse: ');
b=input('Introduce el semieje menor de la elipse: ');
t = linspace(0,2*pi);

%Estas serian la ecuaciones de la elipse
x = a*cos( t );
y = b*sin( t );
i=0;
%Aqui giramos la elipse n veces
while(n>i)
tita =i*pi/n;
x1 = (x-y*tan(tita))*cos(tita);
y1 = y/cos(tita) + (x-y*tan(tita))*sin(tita);
if i==n/2
   x1=y;
   y1=x;
end
%Dibujamos las elipses
figure(1);
hold on
plot(x1,y1,'-m')
axis equal
i=i+1;
end
