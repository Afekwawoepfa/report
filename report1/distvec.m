function X = distvec(A, B)
%distvec AとBの横ベクトルの距離を求める
%   Aのi行目とBのj行目の距離がX(i,j)
    [r1, c1] = size(A);
    [r2, c2] = size(B);
    n1 = repmat(A, r2, 1);
    n2 = reshape((ones(r1,1)*reshape(B,1,r2*c2)), r1*r2, c2);
    X = sqrt(sum(((n1-n2).^2)'));
    X = reshape(X, r1, r2);
end