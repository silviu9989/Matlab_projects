function [REZx,REZy] = add_point(INPUT1x,INPUT1y,INPUT2x,INPUT2y,modulobase)
if ((INPUT1x == INPUT2x) && (INPUT1y == INPUT2y))
    m=mod((3*INPUT1x*INPUT1x-3)*minv(2,modulobase)*minv(INPUT1y,modulobase),modulobase);
else
    m = mod((INPUT2y-INPUT1y)*minv(INPUT2x-INPUT1x,modulobase),modulobase);
end
REZx = mod( -INPUT1x - INPUT2x + m^2,modulobase);
REZy = mod(- INPUT1y + m*(INPUT1x - REZx),modulobase);
end