function X = sub64(image)
%64色に減色
R=image(:,:,1); G=image(:,:,2); B=image(:,:,3);
X = floor(double(R)/64)*4*4 + floor(double(G)/64)*4 + floor(double(B)/64);
end