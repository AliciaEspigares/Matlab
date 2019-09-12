%Convierte una matriz en cuadrada añadiendo ceros
%Teoría de sistemas, Práctica 1

function b = cuadrada( a )

b=a;

[fil, col] =size(b);

if fil>col
    b(:, col+1:fil) = 0;
elseif col>fil
    b(fil+1:col,:) = 0;
    
end
end