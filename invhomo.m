function C=invhomo(Ch)
fila3=Ch(3,:);
D=diag(fila3); 
C=Ch*inv(D);
C(3,:)=[]; 