 function grafico=Plotfiguras(figura1,figura2,figura3)
hold off;
plot(figura1(1,:),figura1(2,:),'c');
hold on;
plot(figura2(1,:),figura2(2,:),'b');
hold on;
plot(figura3(1,:),figura3(2,:),'m');
axis('equal');
