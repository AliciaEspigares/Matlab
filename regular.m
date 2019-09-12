function regular(lados,radio,p,q) 
global A;
angle = 2*pi/lados;
theta = 0;
for n = 1:lados
theta = theta + angle;
[x,y] = pol2cart(theta,radio);
%El comando [x,y] = pol2cart(theta,radio) transforma las coordenadas polares(theta,radio) en las coordenadas cartesianas (x,y).
A(:,n) = [x;y] + [p;q];
 end
 A = A(:,1:n);