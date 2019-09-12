image = input('Introduce la imagen con su extensión: ','s');
M1 = imread(image);

%Crea la imagen en gris
M2 = rgb2gray(M1);

%Calcula el valor umbral
k=graythresh(M2);
disp('El valor humbral de k es ')
disp(k)

%Muestra la resolución actual
ra=size(M2);
disp('La resolución actual es: ');
disp(ra);

%Obtiene la nueva resolución.
b = input('A continuación introduce la resolución deseada.\nIntroduce la longitud deseada: ');
a = input('Introduce el ancho deseado: ');

%Cambia la resolución.
M3 = imresize (M2, [a, b]); 

%Muestra la imagen
imshow(M3);