%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INTEGRANTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carlos Henrique Hannas de Carvalho, nUSP: 11965988

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DADOS INICIAIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f_c = 2 * 10^6;                                                            %Frequencia da portadora (Hz)
f_samp = 50 * 10^6;                                                        %Frequencia de amostragem (Hz)

t_0 = 0;                                                                   %Tempo inicial (s)
t_f = 200 * 10^-6;                                                         %Tempo final (s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = f_samp * ((5 * 10^-6) - t_0);                                          %Quantidade de amostragens, no intervalo de tempo solicitado

t = linspace(t_0, (5 * 10^-6), N+1);                                       %Vetor de tempo, com N amostras

A = 1;                                                                     %Amplitude A

c_t = A*cos(2*pi*f_c*t);                                                   %Funcao da portadora c(t)

%Plot da portadora c(t)
figure
plot(t,c_t)
xlabel('Tempo (s)')
ylabel('Amplitude')
ylim([-1.1, 1.1])
title('Portadora c(t)');
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%