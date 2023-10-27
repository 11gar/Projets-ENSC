function M = quadrangle_from_points(I, x, y)

ox = fix(mean(x));
oy = fix(mean(y));
M1 = halfplane_from_cartesian_line(I, [x(1) x(2)], [y(1) y(2)]);
if M1(oy, ox) == 0
    M1 = 1-M1;
end
M2 = halfplane_from_cartesian_line(I, [x(2) x(3)], [y(2) y(3)]);
if M2(oy, ox) == 0
    M2 = 1-M2;
end
M3 = halfplane_from_cartesian_line(I, [x(3) x(4)], [y(3) y(4)]);
if M3(oy, ox) == 0
    M3 = 1-M3;
end
M4 = halfplane_from_cartesian_line(I, [x(4) x(1)], [y(4) y(1)]);
if M4(oy, ox) == 0
    M4 = 1-M4;
end
M = double(M1.*M2.*M3.*M4);
end