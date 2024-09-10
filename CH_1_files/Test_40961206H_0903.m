% 2024/0903 自動控制實驗A組
% 40971206H 潘林陞 41173011H 周東陞
% 使用程式碼閱覽題目時 需要將其他題目先註解
% 例如：閱覽第二題時 將第一 第三題註解再按下 RUN

%  2024/09/03 自動控制實驗A組 考試第一題
%  mesh current

R = [                               %電阻網路
        3e3     0      0     0      0;
        -1e3    5e3    0     -2e3   0;
        -2e3    0      3e3   -1e3   0;
        0       -2e3   -1e3  4e3    -1e3;
        0       0      0     -1e3   2e3;
    ];

V = [27;    26;     -6;     0;      -26];


I = inv(R)*V ;
I

%  2024/09/03 自動控制實驗A組 考試第二題
%  電路參數

R1 = 2;
R2 = [0.1 * R1 : 0.01 : 10 * R1];
Vin = 5;
Rsum = R1 + R2;

Vout    = ( R2 ./ Rsum ) * Vin;
I       = Vin ./ Rsum;
Pin     = I .*  Vin;
Pout    = I .*  Vout;

Xaxis   = R2 ./ R1;
Yaxis1  = Vout;
Yaxis2  = I;
Yaxis3  = Pout;
Yaxis4  = Pout ./ Pin;


figure;
plot( Xaxis, Yaxis1, '-',  Xaxis, Yaxis2, '--',  Xaxis, Yaxis3, ':', Xaxis, Yaxis4, '-.' );
title('Maximum Power Transfer Parameter Plots');
xlabel('R_2/R_1');
ylabel({'Max. Power Transfer'; 'Parameters (V, A, W)'});
legend({'V_{out}', 'Current', 'P_{out}', 'P_{out}/P_{in}'});
gtext({'V_{out}'; 'Current'; 'P_{out}'; 'P_{out}/P_{in}'})
grid on;

%  2024/09/03 自動控制實驗A組 考試第三題
%  訊號

x   = [0 : 0.001 : 5];
w1 = 1;
w2 = 3;
w3 = 10;

y1 = 10 + 5 .* exp(-x) .* cos(w1 .* x + 0.5);
y2 = 10 + 5 .* exp(-x) .* cos(w2 .* x + 0.5);
y3 = 10 + 5 .* exp(-x) .* cos(w3 .* x + 0.5);


figure;
plot( x, y1, '-',  x, y2, '--',  x, y3, ':' );
title('y(x) = 10 + 5exp(-x)*cos(wx + 0.5)');
xlabel('Time (sec)');
ylabel('y(x)');
legend({'\omega = 1: solid line', '\omega = 3: dashed line', '\omega = 10: dotted line'});
gtext({'w = 1'; 'w = 3'; 'w = 10'})
grid on;


