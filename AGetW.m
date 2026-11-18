function [W] = AGetW(A)
%GETW 此处显示有关此函数的摘要
%   此处显示详细说明
[nw2,nz]=size(A);
nw=(nw2-1)/2;
zz=[-nw:nw];

W=zeros(nz,nz);

for ix=1:nz
    idxz=ix+zz;
    idxz1=idxz(idxz > 0 & idxz <= nz);
    idx = idxz >0 & idxz <= nz;
    W(idxz1,ix)=A(idx,ix);


end
end

