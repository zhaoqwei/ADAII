function [A] = GetW(W,nw)
%GETW 此处显示有关此函数的摘要
%   此处显示详细说明
[nz,nz]=size(W);
nn=2*nw+1;
A=zeros(nn,nz);
[~, max_indices] = max(W);
indz0=[-nw:nw];

for ix=1:nz
    z0=max_indices(ix);
    indz=z0+indz0;
    iz0 = find(indz < 1);
    indz(iz0)=-indz(iz0)+2*z0;
    iz1 = find(indz > nz);
    dz=nz-z0;
    indz(iz1)=nz-indz(iz1)+z0-dz;
    A(:,ix)=W(indz,ix);
end
end

