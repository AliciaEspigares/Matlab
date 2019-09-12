function resultado=decode()
%La matriz para la decodificación es la misma, ya que es autoinversa
Ainv=[20 9 0; 25 6 0; 0 0 25];

codigo=input('Introduce el mensaje que quieras decodificar: ', 's');

%Inicializamos esta variable con el número de letras del mensaje
letrasRestantes = size(codigo,2);
%Esta variable tiene que comenzar como true
ejecutarBloque=true;
%Esta variable representa la distancia al principio del mensaje del bloque
%a tratar
offset=0;

mensajeDecodificado=[];

%Declaramos esta variable para que no quede fuera de scope en el bucle
%while
bloqueADecodificar=0;

while(ejecutarBloque)
    
    %Lo primero es comprobar cuantas letras quedan sin codificar en el
    %mensaje e incluirlas en el bloque. Si el mensaje ha sido codificado
    %con este sistema, debe tener un múltiplo de 3 caracteres. En caso
    %contrario, añadimos tantas 'a' como hagan falta al final de la cadena
    %codificada (las 'a', al cambio, valen 0, por lo que no afectan a la
    %suma en el producto de la matriz, con lo que no se altera el mensaje
    %original más allá de añadir letras al final)
    if(letrasRestantes>=3)
        bloqueADecodificar = codigo(1, offset+1:offset+3);
        offset=offset+3;
        letrasRestantes=letrasRestantes-3;
    
   elseif(letrasRestantes==2)
        bloqueADecodificar=[codigo(1,offset+1:offset+2) 'a'];
        letrasRestantes=0;
        
    elseif (letrasRestantes==1)
        bloqueADecodificar=[codigo(1,offset+1) 'aa'];
        letrasRestantes=0;
    end
       
    
        bloqueADecodificar=bloqueADecodificar-97;
        
        %Aquí ocurre la codificación
        bloqueDecodificado = [0 0 0];
        bloqueDecodificado(1)=mod(mod(Ainv(1,1)*bloqueADecodificar(1),26)+mod(Ainv(1,2)*bloqueADecodificar(2),26)+mod(Ainv(1,3)*bloqueADecodificar(3),26),26);
        bloqueDecodificado(2)=mod(mod(Ainv(2,1)*bloqueADecodificar(1),26)+mod(Ainv(2,2)*bloqueADecodificar(2),26)+mod(Ainv(2,3)*bloqueADecodificar(3),26),26);
        bloqueDecodificado(3)=mod(mod(Ainv(3,1)*bloqueADecodificar(1),26)+mod(Ainv(3,2)*bloqueADecodificar(2),26)+mod(Ainv(3,3)*bloqueADecodificar(3),26),26);
        
        %Para que el mensaje codificado tenga sentido, hay que volver a
        %sumar 97 unidades antes de reconvertirlo a char
        mensajeDecodificado=[mensajeDecodificado bloqueDecodificado+97];
        
        %Si no quedan letras, evitamos una nueva ejecución del bucle
    if(letrasRestantes<=0)
        ejecutarBloque=false;
    end
end

%mensajeCodificado
resultado=char(mensajeDecodificado);

%El resultado de decodificar
%xkxiawpuauvmgglypxcsscjwnnmgdabfsa
%es
%eldesembarcoseproduciraennormandiaaa