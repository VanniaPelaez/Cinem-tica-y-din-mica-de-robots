%% Codigo Tarea 1.2 B) ejercicio 3
clear
close all

W = transl(0,0,0);
cTb = transl(0,0,2)*troty(-180,'deg')*trotz(90,'deg');

p1 = [100; -30; 0];
p2 = [100; 91; 0];
p3 = [-104; 91; 0];
p4 = [-104; -30; 0];

TCP = [57; 0; 132];

x_min = min([p1(1), p2(1), p3(1), p4(1)]);
x_max = max([p1(1), p2(1), p3(1), p4(1)]);
y_min = min([p1(2), p2(2), p3(2), p4(2)]);
y_max = max([p1(2), p2(2), p3(2), p4(2)]);
z_mesa = p1(3);

figure(1)
hold on; grid on; axis equal; view(60,25);
xlabel('X (mm)'); ylabel('Y (mm)'); zlabel('Z (mm)');
title('Configuración Robótica - Mesa, TCP y Sistemas de Coordenadas');

[x_m, y_m] = meshgrid(x_min:10:x_max, y_min:10:y_max);
z_m = ones(size(x_m)) * z_mesa;
surf(x_m, y_m, z_m, 'FaceColor', [0.7 0.5 0.3], 'FaceAlpha', 0.6, 'EdgeColor', 'none');

esquinas = [p1, p2, p3, p4];
altura_patas = -100;

for i = 1:4
    plot3([esquinas(1,i), esquinas(1,i)], ...
          [esquinas(2,i), esquinas(2,i)], ...
          [altura_patas, z_mesa], 'k-', 'LineWidth', 3);
end

plot3(0, 0, 0, 'ro', 'MarkerSize', 15, 'MarkerFaceColor', 'r', 'LineWidth', 1);

longitud_ejes = 50;

quiver3(0, 0, 0, longitud_ejes, 0, 0, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.3);
text(longitud_ejes, 0, 0, 'X_W', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r');

quiver3(0, 0, 0, 0, longitud_ejes, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.3);
text(0, longitud_ejes, 0, 'Y_W', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g');

quiver3(0, 0, 0, 0, 0, longitud_ejes, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.3);
text(0, 0, longitud_ejes, 'Z_W', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b');

text(0, 0, 15, 'W', 'FontSize', 14, 'FontWeight', 'bold', 'Color', 'r', ...
     'HorizontalAlignment', 'center', 'BackgroundColor', 'white');

plot3(TCP(1), TCP(2), TCP(3), 'go', 'MarkerSize', 15, 'MarkerFaceColor', 'g', 'LineWidth', 1);

R = troty(90, 'deg');

ejex_tcp = R(1:3, 1);
ejey_tcp = R(1:3, 2);
ejez_tcp = R(1:3, 3);

quiver3(TCP(1), TCP(2), TCP(3), ...
        ejex_tcp(1)*longitud_ejes, ...
        ejex_tcp(2)*longitud_ejes, ...
        ejex_tcp(3)*longitud_ejes, ...
        'r', 'LineWidth', 2, 'MaxHeadSize', 0.3);
text(TCP(1) + ejex_tcp(1)*longitud_ejes, ...
     TCP(2) + ejex_tcp(2)*longitud_ejes, ...
     TCP(3) + ejex_tcp(3)*longitud_ejes, ...
     'X_{TCP}', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r');

quiver3(TCP(1), TCP(2), TCP(3), ...
        ejey_tcp(1)*longitud_ejes, ...
        ejey_tcp(2)*longitud_ejes, ...
        ejey_tcp(3)*longitud_ejes, ...
        'g', 'LineWidth', 2, 'MaxHeadSize', 0.3);
text(TCP(1) + ejey_tcp(1)*longitud_ejes, ...
     TCP(2) + ejey_tcp(2)*longitud_ejes, ...
     TCP(3) + ejey_tcp(3)*longitud_ejes, ...
     'Y_{TCP}', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g');

quiver3(TCP(1), TCP(2), TCP(3), ...
        ejez_tcp(1)*longitud_ejes, ...
        ejez_tcp(2)*longitud_ejes, ...
        ejez_tcp(3)*longitud_ejes, ...
        'b', 'LineWidth', 2, 'MaxHeadSize', 0.3);
text(TCP(1) + ejez_tcp(1)*longitud_ejes, ...
     TCP(2) + ejez_tcp(2)*longitud_ejes, ...
     TCP(3) + ejez_tcp(3)*longitud_ejes, ...
     'Z_{TCP}', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b');

text(TCP(1), TCP(2), TCP(3) + 15, 'TCP', 'FontSize', 14, 'FontWeight', 'bold', 'Color', 'g', ...
     'HorizontalAlignment', 'center', 'BackgroundColor', 'white');

plot3(esquinas(1,:), esquinas(2,:), esquinas(3,:), ...
      'bo', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
for i = 1:4
    text(esquinas(1,i), esquinas(2,i), esquinas(3,i)+10, ...
         sprintf('ρ%d', i), 'FontSize', 10, 'Color', 'b');
end

axis([-150 150 -100 150 -120 150]);
rotate3d on;
