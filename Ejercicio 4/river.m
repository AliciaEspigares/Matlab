image = input('Introduce la imagen con su extensi�n: ','s');
M1 = imread(image);

%Crea la imagen en gris
M2 = rgb2gray(M1);

%Calcula el valor umbral
k=graythresh(M2);
disp('El valor humbral de k es ')
disp(k)

%Muestra la resoluci�n actual
ra=size(M2);
disp('La resoluci�n actual es: ');
disp(ra);

%Obtiene la nueva resoluci�n.
b = input('A continuaci�n introduce la resoluci�n deseada.\nIntroduce la longitud deseada: ');
a = input('Introduce el ancho deseado: ');

%Cambia la resoluci�n.
M3 = imresize (M2, [a, b]); 

%Muestra la imagen
imshow(M3);