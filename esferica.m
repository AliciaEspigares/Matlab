function coord=esferica(X,Y,Z)

%Definir variables simbólicas para la equivalencia rectangulares-esféricas
syms x y z r p q real;
x=r*sin(p)*cos(q);
y=r*sin(p)*sin(q);
z=r*cos(p);

%Calculamos la base local en función de r p y q 
u1=[diff(x,r),diff(y,r),diff(z,r)];
u2=[diff(x,p),diff(y,p),diff(z,p)];
u3=[diff(x,q),diff(y,q),diff(z,q)];

%Esta es la matriz de cambio de base de canónica a local en función de r p
%y q
M=[u1' u2' u3'];

%Como el resultado final debe estar únicamente en función del tiempo, es
%necesario que la matriz de cambio de base venga en función únicamente de
%las variables de entrada, que nuevamente están en función únicamente de la
%variable t

%De las ecuaciones de cambio rectangular a esférica, se deduce el cambio
%inverso, lo que permite sustituir r p y q por expresiones en función de
%las entradas
r=sqrt(X*X+Y*Y+Z*Z);
p=acos(Z/r);
q=asin(Y/(r*sin(p)));

%Creamos una nueva matriz reevaluando la anterior matriz de cambio de base
M2=eval(M);

%Devolvemos el resultado
coord=M2*[X;Y;Z];

%Resultado obtenido para la entrada esferica(cos(t), sin(t), t+1):
%cos(t)*(sin(t)^2/(((t + 1)^2/((t + 1)^2 + cos(t)^2 + sin(t)^2) - 1)*((t + 1)^2 + cos(t)^2 + sin(t)^2)) + 1)^(1/2)*(1 - (t + 1)^2/((t + 1)^2 + cos(t)^2 + sin(t)^2))^(1/2) - sin(t)*(t + 1) + sin(t)*(sin(t)^2/(((t + 1)^2/((t + 1)^2 + cos(t)^2 + sin(t)^2) - 1)*((t + 1)^2 + cos(t)^2 + sin(t)^2)) + 1)^(1/2)*(t + 1)
%(cos(t)*sin(t))/((t + 1)^2 + cos(t)^2 + sin(t)^2)^(1/2) + (sin(t)^2*(t + 1))/((1 - (t + 1)^2/((t + 1)^2 + cos(t)^2 + sin(t)^2))^(1/2)*((t + 1)^2 + cos(t)^2 + sin(t)^2)^(1/2)) + (sin(t)^2/(((t + 1)^2/((t + 1)^2 + cos(t)^2 + sin(t)^2) - 1)*((t + 1)^2 + cos(t)^2 + sin(t)^2)) + 1)^(1/2)*(1 - (t + 1)^2/((t + 1)^2 + cos(t)^2 + sin(t)^2))^(1/2)*(t + 1)*((t + 1)^2 + cos(t)^2 + sin(t)^2)^(1/2)
%                                                                                                                                                                                                                                  (cos(t)*(t + 1))/((t + 1)^2 + cos(t)^2 + sin(t)^2)^(1/2) - sin(t)*(1 - (t + 1)^2/((t + 1)^2 + cos(t)^2 + sin(t)^2))^(1/2)*((t + 1)^2 + cos(t)^2 + sin(t)^2)^(1/2)