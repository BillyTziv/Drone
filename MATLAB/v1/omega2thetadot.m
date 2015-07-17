% Convert omega to roll, pitch, yaw derivatives
function thetadot = omega2thetadot(omega, angles)
    phi = angles(1);
    theta = angles(2);
    psi = angles(3);
    W = [
        0, cos(psi), -cos(phi)*sin(psi)
        0, sin(psi), cos(phi)*cos(psi)
        1, 0, sin(phi)
    ];
    thetadot = W\omega;

%     phi = angles(1);
%     theta = angles(2);
%     psi = angles(3);
%     W = [
%         1, 0, -sin(theta)
%         0, cos(phi), cos(theta)*sin(phi)
%         0, -sin(phi), cos(theta)*cos(phi)
%     ];
%     thetadot = W\omega;
    
%     
%       thetadot = inv(W) * omega;
%     
%     phi = angles(1);
%     theta = angles(2);
%     psi = angles(3);
% 
%     Rz = [cos(psi) -sin(psi) 0
%         sin(psi) cos(psi) 0
%         0 0 1];
%     Rx = [1 0 0;
%         0 cos(phi) -sin(phi);
%         0 sin(phi) cos(phi)];
%     Ry = [cos(theta) 0 sin(theta);
%         0 1 0;
%         -sin(theta) 0 cos(theta)];
%     R = Rz*Rx*Ry
%     Rtrans = transpose(R);
%     Rder = diff(R);
%     omegaX = simplify(Rder*Rtrans, 'Steps', 20);
% 
%     thetadot = [omegaX(3,2); omegaX(1,3); omegaX(2,1)] *omega;
end
