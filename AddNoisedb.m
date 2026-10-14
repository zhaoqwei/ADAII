function [Y, noise] = AddNoisedb(X,db,wlet)
% noisegen add white Gaussian noise to a signal.
% [Y, NOISE] = NOISEGEN(X,SNR) adds white Gaussian NOISE to X.  The SNR is in dB.
% rng(7, 'twister');
rng();
% 计算信号功率  
signalPower = mean(X(:).^2);  
% 计算噪声功率  
noisePower = signalPower / (10^(db / 10));  
% noisePower = signalPower / (10^(SNR / 10));  
% noisePower=signalPower*NSR;
% 生成噪声  
noise = sqrt(noisePower) * randn(size(X));  
% 将噪声添加到信号中  
% Wnoise=imfilter(noise,wlet,'replicate');Wnoise=Wnoise/max(absfft(wlet));
Y = X + noise;  
end