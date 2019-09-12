%Convierte una matriz en cuadrada a�adiendo ceros
%Teor�a de sistemas, Pr�ctica 1

function b = cuadrada( a )

b=a;

[fil, col] =size(b);

if fil>col
    b(:, col+1:fil) = 0;
elseif col>fil
    b(fil+1:col,:) = 0;
    
end
end