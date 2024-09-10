% 2024/0910 自動控制實驗A組
% 40971206H 潘林陞 41173011H 周東陞
% 使用程式碼閱覽題目時 需要將其他題目先註解
% 例如：閱覽第二題時 將第一 第三題註解再按下 RUN

syms t s

%  2024/09/10 自動控制實驗A組 2.1  a b
% 計算多項式

    P1 = [1 7 2 9 10 12 15];    % s^6 + 7s^5 + 2s^4 + 9s^3 + 10s^2 + 12s + 15
    P2 = [1 9 8 9 12 15 20];    % s^6 + 9s^5 + 8s^4 + 9s^3 + 12s^2 + 15s + 20
    roots_P1 = roots(P1);
    roots_P2 = roots(P2);
    
    P3 = P1 + P2;
    P4 = P1 - P2; 
    P5 = conv(P1, P2);

    % 顯示結果% 顯示結果
    disp('P3 = P1 + P2 的多項式係數為：')
    disp(P3)
    disp('P4 = P1 - P2 的多項式係數為：')
    disp(P4)
    disp('P5 = P1 * P2 的多項式係數為：')
    disp(P5)
    
    P6 = poly([ -7 -8 -3 -5 -9 -10 ]); 
    disp('P6 的多項式係數為：')
    disp(P6)

%  2024/09/10 自動控制實驗A組 2.1  c d
% 部分分式展開 zpk <-> tf

    G1 = zpk([-2 -3 -6 8],[0 -7 -9 -10 -15],[20]);           % G1 = {20*(s + 2)*(s + 3)*(s + 6)*(s - 8)}  % {s*(s + 7)*(s + 9)*(s + 10)*(s + 15)}
    tf(G1)
    G2 = tf([1 17 99 223 140],[1 32 363 2092 5052  4320]);
    zpk(G2)
    
%  2024/09/10 自動控制實驗A組 2.1  f
    % G6 的部分分式展開
    G6 =    (5 * (s + 2))    /   (s  * (s^2 + 8*s + 15));    
    [numg6, deng6] = numden(G6);
    numg6 = sym2poly(numg6);
    deng6 = sym2poly(deng6);
    
    % G7 的部分分式展開
    G7 =    (5 * (s + 2))    /   (s * (s^2 + 6*s + 9));    
    [numg7, deng7] = numden(G7);
    numg7 = sym2poly(numg7);
    deng7 = sym2poly(deng7);

    % G8 的部分分式展開
    G8 =    (5 * (s + 2))    /   (s * (s^2 + 6*s + 34));    
    [numg8, deng8] = numden(G8);
    numg8 = sym2poly(numg8);
    deng8 = sym2poly(deng8);
    
    % 顯示結果
    disp('LTI G6(s) in Polynomial Form')
    Gtf6 = tf(numg6, deng6)
    disp('LTI G6(s) in Factored Form')
    Gzpk = zpk(Gtf6)
        
    disp('LTI G7(s) in Polynomial Form')
    Gtf7 = tf(numg7, deng7)
    disp('LTI G7(s) in Factored Form')
    Gzpk = zpk(Gtf7)
    
    disp('LTI G8(s) in Polynomial Form')
    Gtf8 = tf(numg8, deng8)
    disp('LTI G8(s) in Factored Form')
    Gzpk = zpk(Gtf8)
    
    
%  2024/09/10 自動控制實驗A組 考試 2.2

    % 2.2 a b c d
    f_t = 0.0075 - 0.00034*exp(-2.5*t)*cos(22*t) + 0.087*exp(-2.5*t)*sin(22*t) - 0.0072*exp(-8*t);
    F_s = laplace(f_t, t, s); 
    disp('f(t) 的拉普拉斯變換為：')
    pretty(F_s)

    F_s = (2*(s+3)*(s+5)*(s+7))/(s*(s+8)*(s^2 + 10*s + 100));  
    f_t = ilaplace(F_s, s, t);
    disp('F(s) 的逆拉普拉斯變換為：')
    pretty(f_t)

    %  2.2 e f
    A = [  
             (7 + 5/s + s),   -(2 + s),            -(5); 
            -(2 + s),         (4 + 2*s + 3/s),     -(2 + s);
            -(5),            -( 2 + s),             (8 + s + 4/s)
        ];

    A1 = [  
            (3/s),            -(2 + s),              -(5); 
            0,         (4 + 2*s + 3/s),           -(2 + s);
            0,               -( 2 + s),      (8 + s + 4/s)
        ];
    A2 = [  
             (7 + 5/s + s),   (3/s),            -(5); 
            -(2 + s),             0,     -(2 + s);
            -(5),                 0,             (8 + s + 4/s)
        ];
    A3 = [  
             (7 + 5/s + s),   -(2 + s),            (3/s); 
            -(2 + s),         (4 + 2*s + 3/s),         0;
            -(5),            -( 2 + s),                0
        ];

    B = [
            (3/s);
            0;
            0
        ];

    I1 = det(A1) / det(A);
    I1 = simplify(I1);
    I2 = det(A2) / det(A);
    I2 = simplify(I2);
    I3 = det(A3) / det(A);
    I3 = simplify(I3);

    disp('I1(s) ：')
    pretty(I1)
    disp('I2(s) ：')
    pretty(I2)
    disp('I3(s) ：')
    pretty(I3)

    %{
    f_t1 = ilaplace(I1, s, t);
    disp('I1(s) 的逆拉普拉斯變換為：')
    pretty(f_t1)
    f_t2 = ilaplace(I2, s, t);
    disp('I2(s) 的逆拉普拉斯變換為：')
    pretty(f_t2)
    f_t3 = ilaplace(I3, s, t);
    disp('I3(s) 的逆拉普拉斯變換為：')
    pretty(f_t3)
    %}