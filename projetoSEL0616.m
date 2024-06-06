%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PCOM SEL 0616 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Carlos Henrique Hannas de Carvalho, nUSP: 11965988
%Gabriel Aguilar Soares de Melo, nUSP: 11915432
%Pedro Antonio Bruno Grando, nUSP: 12547166

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
t_min = 90;                                                                %Tempo minimo para plot do exercicio 3 (us)
t_max = 110;                                                               %Tempo maximo para plot do exercicio 3 (us)

x = linspace(-120, 120, round(N));                                         %Define uma frequencia para sinc()
m1 = sinc(x);                                                              %Funcao da mensagem m(t)

%Plot da mensagem m(t)
figure
plot(t/1e-6, m1);
xlabel('Tempo (us)')
ylabel('Amplitude de m(t)')
xlim([t_min, t_max])                                                       %Intervalo de tempo do grafico
ylim([-0.3, 1.1])                                                          %Intervalo auxiliar
title('Mensagem m(t)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de frequencia para plot no grafico
f_min = -2 * 10^6;                                                         %Frequencia minima para plot do exercicio 4 (Hz)
f_max = 2 * 10^6;                                                          %Frequencia maxima para plot do exercicio 4 (Hz)

M1 = fft(m1);                                                              %M(f): Transformada de Fourier de m(t)

LMP = powerbw(abs(M1), f);                                                 %Calcula Largura de Meia Potencia (LMP)
fprintf('Largura de Meia Potencia: %.4f\n', LMP);

%Plot do espectro de M(f)
figure
plot(f, (fftshift(abs(M1))));
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

s_t = c_t .* m1;                                                           %Funcao do sinal modulado s(t)

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de frequencia para plot no grafico
f_min = -6 * 10^6;                                                         %Frequencia minima para plot do exercicio 7 (Hz)
f_max = 6 * 10^6;                                                          %Frequencia maxima para plot do exercicio 7 (Hz)

e_t = c_t .* s_t;                                                          %Funcao da demodulacao e(t)

E_f = fft(e_t);                                                            %E(f): Transformada de Fourier de e(t)

%Plot do sinal demodulado de e(t)
figure
plot(f, fftshift(abs(E_f)));
xlabel('Frequência (Hz)')
ylabel('Amplitude de E(f)')
xlim([f_min, f_max])                                                       %Intervalo de frequencia no grafico
title('Espectro do sinal demodulado E(f)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 8 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de frequencia para plot no grafico
f_min = -6 * 10^6;                                                         %Frequencia minima para plot do exercicio 8 (Hz)
f_max = 6 * 10^6;                                                          %Frequencia maxima para plot do exercicio 8 (Hz)

%Intervalo de frequencia para FPB aceitar
f_neg_min = -2 * 10^6;                                                     %Frequencia minima aceitavel pelo FPB (Hz)
f_pos_max = 2* 10^6;                                                       %Frequencia maxima aceitavel pelo FPB (Hz)

%Definicao de sistemas dinamicos
qsi = sqrt(2)/2;
w_n = 2 * pi * 2 * 10^6;
num = w_n^2;
den = [1 2*qsi*w_n w_n^2];

x_t = lsim(num, den, e_t, t);                                              %Resposta temporal x(t) simulada para o FPB
X_f = fft(x_t);                                                            %X(f): Transformada de Fourier de x(t)

FPB = zeros(1, N);                                                         %Inicializacao do FPB (filtro passa-baixa)
FPB(f >= f_neg_min & f <= f_pos_max) = 1;                                  %FPB aceita valores entre -2MHz e 2MHz

figure
subplot(1,2,1)
plot((abs(X_f)))
xlabel('Frequência (Hz)')
ylabel('Amplitude do espectro')
xlim([f_min, f_max])                                                       %Intervalo de frequencia no grafico
title('Espectro do sinal após o filtro')
grid on

subplot(1,2,2)
plot(f, FPB, f, (abs(E_f)))
xlabel('Frequência (Hz)')
ylabel('Amplitude do filtro')
title('Filtro retangular')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 9 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m2 = ifft(ifftshift(fftshift(X_f)));                                       %Recuperacao do sinal m'(t)

%Plot do sinal recuperado de m'(t)
figure
plot(t, m2)
xlabel('Tempo (s)')
ylabel('Amplitude de m''(t)')
xlim([t_min, t_max])                                                       %Intervalo de tempo no grafico
title('Sinal recuperado m''(t)')
grid on

coef = corrcoef(m1, m2);                                                   %Coeficiente de relacao entre os sinais m(t) e m'(t)
fprintf('Coeficiente de relação entre os sinais: %.4f\n', coef(1,2));   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
