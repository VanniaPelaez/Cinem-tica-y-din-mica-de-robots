clear
close all

W = transl(0,0,0);
cTb = transl(0,0,2)*troty(-180,'deg')*trotz(90,'deg');
wTb = transl(-1,2,1);

wp1 = [0;1;1];
wp2 = [0;3;1];
wp3 = [-2;3;1];
wp4 = [-2;1;1];

objeto_pos = wTb(1:3,4);

syms aTw wTc
aTb = aTw*wTc*cTb;
disp('3.1) Expresion simbolica de aTb:');
disp(aTb);

x_min = min([wp1(1), wp2(1), wp3(1), wp4(1)]);
x_max = max([wp1(1), wp2(1), wp3(1), wp4(1)]);
y_min = min([wp1(2), wp2(2), wp3(2), wp4(2)]);
y_max = max([wp1(2), wp2(2), wp3(2), wp4(2)]);
z_mesa = wp1(3);

if objeto_pos(1) >= x_min && objeto_pos(1) <= x_max && ...
   objeto_pos(2) >= y_min && objeto_pos(2) <= y_max && ...
   abs(objeto_pos(3) - z_mesa) < 0.05
    disp('3.2) El objeto esta DENTRO de la mesa');
    estado = 'DENTRO';
else
    disp('3.2) El objeto esta FUERA de la mesa');
    estado = 'FUERA';
end

figure(1)  
hold on; grid on; axis equal; view(60,25);

[x_m, y_m] = meshgrid(-2:0.1:0, 1:0.1:3);
z_m = ones(size(x_m)) * 1;
surf(x_m, y_m, z_m, 'FaceColor', [0.7 0.5 0.3], 'FaceAlpha', 0.6, 'EdgeColor', 'none');

patas_x = [-2, -2, 0, 0];
patas_y = [1, 3, 3, 1];
for i = 1:4
    plot3([patas_x(i), patas_x(i)], ...
          [patas_y(i), patas_y(i)], ...
          [0, 1], 'k-', 'LineWidth', 3);
end

cam_x = 1.5; cam_y = 2; cam_z = 3;
plot3(cam_x, cam_y, cam_z, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g', 'LineWidth', 1);
text(cam_x, cam_y, cam_z+0.2, 'C', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g');

esquinas = [wp1, wp2, wp3, wp4];
plot3(esquinas(1,:), esquinas(2,:), esquinas(3,:), ...
      'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b', 'DisplayName', 'Esquinas mesa');

plot3(objeto_pos(1), objeto_pos(2), objeto_pos(3), ...
      'ms', 'MarkerSize', 15, 'MarkerFaceColor', 'm', 'DisplayName', 'Objeto B');
text(objeto_pos(1), objeto_pos(2), objeto_pos(3)+0.2, 'B', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'm');

rotate3d on;
