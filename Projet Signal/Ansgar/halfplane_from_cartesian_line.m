function M = halfplane_from_cartesian_line(I, x, y)

[h, w] = size(I);
M = zeros(h, w);
[X, Y] = meshgrid(1:w, 1:h);
dx = x(2)-x(1);
dy = y(2)-y(1);
a = -dy/sqrt(dx*dx+dy*dy);
b = dx/sqrt(dx*dx+dy*dy);
c = -a*x(1)-b*y(1);
M = double((a*X+b*Y+c)>=0);
end