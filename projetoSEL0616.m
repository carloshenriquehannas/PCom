%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PCOM SEL 0616 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carlos Henrique Hannas de Carvalho, nUSP: 11965988

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DADOS INICIAIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f_c = 2 * 10^6;                                                            %Frequencia da portadora (Hz)
f_samp = 50 * 10^6;                                                        %Frequencia de amostragem (Hz)

t_0 = 0;                                                                   %Tempo inicial (s)
t_f = 200 * 10^-6;                                                         %Tempo final (s)

N = f_samp * (t_f - t_0);                                                  %Quantidade de amostragens, no intervalo total de tempo

t = linspace(t_0, t_f, round(N));                                          %Vetor de tempo, com N amostras
f = linspace(-f_samp/2, f_samp/2, N);                                      %Vetor de frequencia, com N amostras

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de amplitude para plot no grafico
A_min = -1.1;                                                              %Amplitude minima para plot do exercicio 1 
A_max = 1.1;                                                               %Amplitude maxima para plot do exercicio 1

%Intervalo de tempo para plot no grafico
t_min = 0;                                                                 %Tempo minimo para plot do exercicio 1 (s)
t_max = 5 * 10^-6;                                                         %Tempo maximo para plot do exercicio 1 (s)

c_t = cos(2 * pi * f_c * t);                                               %Funcao da portadora c(t)

%Plot da portadora c(t)
figure
plot(t, c_t)
xlabel('Tempo (s)')
ylabel('Amplitude de c(t)')
xlim([t_min, t_max])                                                       %Intervalo de tempo do grafico
ylim([A_min, A_max])                                                       %Intervalo de amplitude do grafico 
title('Portadora c(t)');
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de frequencia para subplot negativo no grafico
f_neg_min = -2 * 10^6;                                                     %Frequencia minima negativa para subplot do exercicio 2 (Hz)
f_neg_max = -1.8 * 10^6;                                                   %Frequencia maxima negativa para subplot do exercicio 2 (Hz)

%Intervalo de frequencia para subplot positivo no grafico
f_pos_min = 1.8 * 10^6;                                                    %Frequencia minima negativa para subplot do exercicio 2 (Hz)
f_pos_max = 2 * 10^6;                                                      %Frequencia maxima positiva para subplot do exercicio 2 (Hz)

C_f = fft(c_t);                                                            %C(f): Transformada de Fourier de c(t)

%Plot dos espectros negativo e positivo
figure
subplot(1,2,1)                                                             %Posicao do espectro negativo no grafico
plot(f, fftshift(abs(C_f)))
xlabel('Frequência (Hz)')
ylabel('Amplitude de C(f)')
xlim([f_neg_min, f_neg_max])                                               %Intervalo de frequencia do espectro negativo no grafico
title('Espectro negativo de C(f)')
grid on

subplot(1,2,2)                                                             %Posicao do espectro positivo no grafico
plot(f, fftshift(abs(C_f)))
xlabel('Frequência (Hz)')
ylabel('C(f)')
xlim([f_pos_min, f_pos_max])                                               %Intervalo de frequencia do espectro positivo no grafico
title('Espectro positivo de C(f)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de tempo para plot no grafico
t_min = 90 * 10^-6;                                                        %Tempo minimo para plot do exercicio 3 (s)
t_max = 110 * 10^-6;                                                       %Tempo maximo para plot do exercicio 3 (s)

m_t = sinc(t - (100 * 10^-6));                                             %Funcao da mensagem m(t)

%Plot da mensagem m(t)
figure
plot(t, m_t);
xlabel('Tempo (s)')
ylabel('Amplitude de m(t)')
xlim([t_min, t_max])                                                       %Intervalo de tempo do grafico
title('Mensagem m(t)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de frequencia para plot no grafico
f_min = -2 * 10^6;                                                         %Frequencia minima para plot do exercicio 4 (Hz)
f_max = 2 * 10^6;                                                          %Frequencia maxima para plot do exercicio 4 (Hz)

M_f = fft(m_t);                                                            %M(f): Transformada de Fourier de m(t)

LMP = powerbw(abs(M_f), f);                                                %Calcula Largura de Meia Potencia (LMP)

%Plot do espectro de M(f)
figure
plot(f, fftshift(abs(M_f)));
xlabel('Frequência (Hz)')
ylabel('Amplitude de M(f)')
xlim([f_min, f_max])                                                       %Intervalo de frequencia no grafico
title('Espectro de M(f)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de tempo para plot no grafico
t_min = 90 * 10^-6;                                                        %Tempo minimo para plot do exercicio 5 (s)
t_max = 110 * 10^-6;                                                       %Tempo maximo para plot do exercicio 5 (s)

s_t = c_t .* m_t;                                                          %Funcao do sinal modulado s(t)

%Plot do sinal modulado de s(t)
figure
plot(t, s_t);
xlabel('Tempo (s)')
ylabel('Amplitude de s(t)')
xlim([t_min, t_max])                                                       %Intervalo de tempo no grafico
ylim([A_min, A_max])                                                       %Intervalo de amplitude no grafico
title('Sinal modulado s(t)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de frequencia para plot no grafico
f_min = -5 * 10^6;                                                         %Frequencia minima para plot do exercicio 6 (Hz)
f_max = 5 * 10^6;                                                          %Frequencia maxima para plot do exercicio 6 (Hz)

S_f = fft(s_t);                                                            %S(f): Transformada de Fourier de s(t)

%Plot do sinal modulado de s(t)
figure
plot(f, fftshift(abs(S_f)));
xlabel('Frequência (Hz)')
ylabel('Amplitude de S(f)')
xlim([f_min, f_max])                                                       %Intervalo de tempo no grafico
title('Espectro de S(f)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%