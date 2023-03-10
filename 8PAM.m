%MATLAB script for 4 PAM
clc;close all;clear;
SNRindB_sim=0:1:12;
SNRindB=0:0.1:12;
smld_err_prb = zeros(1,length(SNRindB_sim));

%% Simulated error rate
for i=1:length(SNRindB_sim)
    disp(SNRindB_sim(i));
    smld_err_prb(i)=BER_QPAM(SNRindB_sim(i)); % simulated error rate
end
%% Theoritical BER
SNR_per_bit=exp(SNRindB*log(10)/10);
theo_err_prb=(7/4)*qfunc(sqrt((2/7)*SNR_per_bit));
%% Plotting commands follow. 
semilogy(SNRindB_sim,smld_err_prb,'r*','LineWidth',1.5);
hold
grid
semilogy(SNRindB,theo_err_prb,'b-','LineWidth',1.5);
xlabel('SNR_{dB}');
ylabel('Symbole Error Rate');
title('8-PAM Modulation in AWGN Channel');

