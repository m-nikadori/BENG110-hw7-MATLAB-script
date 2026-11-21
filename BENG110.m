xA = 0; yA = 0; xB = 20; yB = 0; xC = 0; yC = 20;
xA_prime = 0; yA_prime = 0; xB_prime = 24; yB_prime = 4; xC_prime = -3; yC_prime = 17;
P_old = [xA, yA; xB, yB; xC, yC];
P_new = [xA_prime, yA_prime; xB_prime, yB_prime; xC_prime, yC_prime];
ux = [xA_prime-xA; xB_prime-xB; xC_prime-xC];
uy = [yA_prime-yA; yB_prime-yB; yC_prime-yC];
M = [ones(3,1), P_old]; % matrix [1, x, y]
a = M \ ux; % a = [a0; a1; a2]
b = M \ uy; % b = [b0; b1; b2]
a1 = a(2);
a2 = a(3);
b1 = b(2);
b2 = b(3);
E_xx = a1;
E_yy = b2;
E_xy = 0.5 * (a2 + b1);
E = [E_xx, E_xy; E_xy, E_yy]; % 2D cauchy tensor
angle_deg = 30;
theta = deg2rad(angle_deg); % rotate 30 degrees
R = [cos(theta), sin(theta); -sin(theta), cos(theta)];
E_new = R * E * R'; % strain tensor after rotation
figure;
hold on;
grid on;
axis equal; % blue solid line is undeformed
fill([xA, xB, xC], [yA, yB, yC], 'b', 'FaceAlpha', 0.2, 'EdgeColor', 'b', 'LineWidth', 2); % blue solid line is undeformed
fill([xA_prime, xB_prime, xC_prime], [yA_prime, yB_prime, yC_prime], 'r', 'FaceAlpha', 0.2, 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--'); % red broken line is deformed
xlabel('X [mm]'); ylabel('Y [mm]');
title('Triangle Marker Deformation');
legend('Undeformed (Before)', 'Deformed (After)');