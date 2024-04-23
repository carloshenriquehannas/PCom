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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de amplitudes no grafico
A_min = -1.1; 
A_max = 1.1;

t_f1 = 5 * 10^-6;                                                          %Tempo final (s) para exercicio 1                                                           

N = f_samp * (t_f1 - t_0);                                                 %Quantidade de amostragens, no intervalo de tempo solicitado

t = linspace(t_0, t_f1, N+1);                                              %Vetor de tempo, com N amostras

c_t = cos(2 * pi * f_c * t);                                               %Funcao da portadora c(t)

ciclos = f_c * (t_f1 - t_0);                                               %Quantidade de ciclos no intervalo de tempo solicitado

%Plot da portadora c(t)
figure
plot(t, c_t)
xlabel('Tempo (s)')
ylabel('Amplitude')
ylim([A_min, A_max])                                                       %Intervalo de amplitude do grafico 
title('Portadora c(t)');
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de frequencia para subplot negativo
f_neg_min = -2 * 10^6;
f_neg_max = -1.8 * 10^6;

%Intervalo de frequencia para subplot positivo
f_pos_min = 1.8 * 10^6;
f_pos_max = 2 * 10^6;

C_f = fft(c_t);                                                            %C(f): Transformada de Fourier de c(t)

f = linspace(-f_samp/2, f_samp/2, N+1);                                    %Vetor de intervalo de frequencias do espectro

%Plot dos espectros negativo e positivo
figure
subplot(1,2,1)                                                             %Posicao do espectro negativo no grafico
plot(f, fftshift(abs(C_f)))
xlabel('Frequência (Hz)')
ylabel('C(f)')
xlim([f_neg_min, f_neg_max])                                               %Intervalo de frequencia do espectro negativo
title('Espectro de frequência negativa')
grid on

subplot(1,2,2)                                                             %Posicao do espectro positivo no grafico
plot(f, fftshift(abs(C_f)))
xlabel('Frequência (Hz)')
ylabel('C(f)')
xlim([f_pos_min, f_pos_max])                                               %Intervalo de frequencia do espectro positivo
title('Espectro de frequência positiva')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCICIO 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Intervalo de tempo para plot
t_i3 = 90 * 10^-6;                                                         %Tempo inicial (s) do exercicio 3
t_f3 = 110 * 10^-6;                                                        %Tempo final (s) do exercicio 3

x = linspace(t_i3, t_f3, round((t_f3 - t_i3) * f_samp));                   %Vetor de tempo, com N amostras 

m_t = sinc(x - (100 * 10^-6));                                             %Funcao m(t)

%Plot da mensagem m(t)
figure
plot(x, m_t);
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Mensagem m(t)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
