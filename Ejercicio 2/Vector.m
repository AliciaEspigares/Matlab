a=input('Introduce el valor del coeficiente a del plano: ');
b=input('Introduce el valor del coeficiente b del plano: ');
c=input('Introduce el valor del coeficiente c del plano: ');
V=input('Introduce el vector (como vector fila [x y z]): ');

%Declaramos las variables x, y, z
    syms x y z
%Escribimos la ecuacion
    Ec=a*x+b*y+c*z;
%Declaramos la variable alfa
    syms alfa
%Lo escribimos en forma paramétrica
    x0=V(1)+a*alfa;
    y0=V(2)+b*alfa;
    z0=V(3)+c*alfa;
%Definimos la funcion ec
    Ec2=inline(Ec,'x','y','z');
%Sustituimos x,y,z por x0,y0,z0
    Ec3=Ec2(x0,y0,z0);
%Obtenemos alfa
    alfa=solve(Ec3);
%Obtenemos el vector simétrico
    M=[V(1)+a*alfa, V(2)+b*alfa, V(3)+c*alfa];
    vector_simetrico=2.*M-V;
%Lo imprimimos en pantalla
    fprintf('\nEl vector simétrico respecto al plano es: ');
    disp(vector_simetrico);