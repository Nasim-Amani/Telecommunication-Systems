clc;close all; clear;
%simulation parameters
SNR_dB_sim=0:1:11;
SNR_dB=0:0.1:11;
%Initialization
%smld_err_prb = zeros(1,length(SNR_dB_sim));
%% simulated error rate
smld_err_prb=BER_BASD_vec(SNR_dB_sim);
% for i=1:length(SNR_dB_sim)
%     disp(SNR_dB_sim(i));
%     smld_err_prb(i)=BER_BASD_vec(SNR_dB_sim(i));
% end
%% theoretical error rate
% for i=1:length(SNR_dB)
%     SNR = exp(SNR_dB(i)*log(10)/10);
%     theo_err_prb(i)=qfunc(sqrt(2*SNR));
% end
SNR = exp(SNR_dB*log(10)/10);
theo_err_prb = qfunc(sqrt(2*SNR));
%% Plotting commands follow.
semilogy(SNR_dB_sim,smld_err_prb,'r*','LineWidth',1.5);
hold
semilogy(SNR_dB,theo_err_prb,'LineWidth',1.5);
grid;
axis([SNR_dB(1) SNR_dB(end) 1e-6 1e0]);
xlabel('SNR_{dB}');
ylabel('BER');
title('Binary Antipodal Modulation in AWGN channel');