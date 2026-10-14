function [ps] = Phaseshift(vp,wf,dz)
%PHASESHIFT 此处显示有关此函数的摘要
%   此处显示详细说明
nz=length(vp);
nt=length(wf);
ps=zeros(nt,nz);
iz=1;
kz=2*wf'/vp(iz);
ps(:,iz)=exp(-1i*kz*0);
for iz=2:nz
    kz=2*wf'/vp(iz-1);
    ps(:,iz)=exp(-1i*kz*dz).*ps(:,iz-1);
end
end

