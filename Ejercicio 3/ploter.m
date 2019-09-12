%Convierte una imagen digital en una matriz 2 × n capaz de ser representada con el comando plot.
digital = input('Introduce el Workspace con la imagen digital: ','s');
load(digital);
%Rota la imagen para ponerla derecha
M = imrotate(M ,-90);
%Localiza las coordenadas (x, y) de los ceros de la imagen (los pixeles de color negro).
[x,y]=ind2sub(size(M),find(M==0));
%Muestra la imagen en azul y con puntos
scatter(x,y, 'b.');
%Convierte la matríz en 2 x n
matriz=[x,y]';

%OBSERVACIONES: Para pasar una imagen digital a .mat, se tienen que usar los siguientes
%comandos:
%M=imread('nombreimagen.png');
%save('C:\Users\Usuario\Desktop\bunny.mat', 'M');
%IMPORTANTE. La foto debe ser en blanco y negro. La imagen debe estar en
%una carpeta conocida por matlab. Para agregar una carpeta a matlab se debe
%de clicar en 'Set Path' en la ventana de HOME de matlab.