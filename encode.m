function resultado=encode()
A=[20 9 0; 25 6 0; 0 0 25];

mensaje=input('Introduce el mensaje que quieras codificar: ', 's');

%Inicializamos esta variable con el número de letras del mensaje
letrasRestantes = size(mensaje,2);
%Esta variable tiene que comenzar como true
ejecutarBloque=true;
%Esta variable representa la distancia al principio del mensaje del bloque
%a tratar
offset=0;

mensajeCodificado=[];

%Declaramos esta variable para que no quede fuera de scope en el bucle
%while
bloqueACodificar=0;

while(ejecutarBloque)
    
    %Lo primero es comprobar cuantas letras quedan sin codificar en el
    %mensaje e incluirlas en el bloque. Como la codificación debe ser en
    %bloques de 3 caracteres, rellenamos los caracteres que falten con 'x'
    if(letrasRestantes>=3)
        bloqueACodificar = mensaje(1, offset+1:offset+3);
        offset=offset+3;
        letrasRestantes=letrasRestantes-3;
    
    elseif(letrasRestantes==2)
        bloqueACodificar=[mensaje(1,offset+1:offset+2) 'x'];
        letrasRestantes=0;
        
    elseif (letrasRestantes==1)
        bloqueACodificar=[mensaje(1,offset+1) 'xx'];
        letrasRestantes=0;
    end
       
    
        bloqueACodificar=bloqueACodificar-97;
        
        %Aquí ocurre la codificación
        bloqueCodificado = [0 0 0];
        bloqueCodificado(1)=mod(mod(A(1,1)*bloqueACodificar(1),26)+mod(A(1,2)*bloqueACodificar(2),26)+mod(A(1,3)*bloqueACodificar(3),26),26);
        bloqueCodificado(2)=mod(mod(A(2,1)*bloqueACodificar(1),26)+mod(A(2,2)*bloqueACodificar(2),26)+mod(A(2,3)*bloqueACodificar(3),26),26);
        bloqueCodificado(3)=mod(mod(A(3,1)*bloqueACodificar(1),26)+mod(A(3,2)*bloqueACodificar(2),26)+mod(A(3,3)*bloqueACodificar(3),26),26);
        
        %Para que el mensaje codificado tenga sentido, hay que volver a
        %sumar 97 unidades antes de reconvertirlo a char
        mensajeCodificado=[mensajeCodificado bloqueCodificado+97];
        
        %Si no quedan letras, evitamos una nueva ejecución del bucle
    if(letrasRestantes<=0)
        ejecutarBloque=false;
    end
end

%mensajeCodificado
resultado=char(mensajeCodificado);

%El resultado tras codificar
%ohtristepazquenaceconeldiadelaqueelsolnoquieresertestigo
%es
%fchwfiaflrukuensmwkenxkxesxxkagawxkipaniegoqjiawrtwlssmad