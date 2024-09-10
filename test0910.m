% 2024/0903 自動控制實驗A組
% 40971206H 潘林陞 41173011H 周東陞
% 使用程式碼閱覽題目時 需要將其他題目先註解
% 例如：閱覽第二題時 將第一 第三題註解再按下 RUN

%  2024/09/10 自動控制實驗A組 考試 2.1  a b

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

    syms s
    P6 = (s + 7)*(s + 8)*(s + 3)*(s + 5)*(s + 9)*(s + 10);
    P6_expanded = expand(P6);
    disp('展開後的多項式 P6 為：')
    pretty(P6_expanded)

%  2024/09/10 自動控制實驗A組 考試 2.1  c d
    G1 = zpk([-2 -3 -6 8],[0 -7 -9 -10 -15],[20]);           % G1 = {20*(s + 2)*(s + 3)*(s + 6)*(s - 8)}  % {s*(s + 7)*(s + 9)*(s + 10)*(s + 15)}
    tf(G1)
    G2 = tf([1 17 99 223 140],[1 32 363 2092 5052  4320]);
    zpk(G1)
    
%  2024/09/10 自動控制實驗A組 考試 2.1  f

    % G6 的部分分式展開
    G6_num = 5 * (s + 2);
    G6_den = s * (s^2 + 8*s + 15);
    G6 = G6_num / G6_den;
    G6_partial = partfrac(G6);

    % G7 的部分分式展開
    G7_num = 5 * (s + 2);
    G7_den = s * (s^2 + 6*s + 9);
    G7 = G7_num / G7_den;
    G7_partial = partfrac(G7);

    % G8 的部分分式展開
    G8_num = 5 * (s + 2);
    G8_den = s * (s^2 + 6*s + 34);
    G8 = G8_num / G8_den;
    G8_partial = partfrac(G8);

    % 顯示結果
    disp('G6 的部分分式展開為：')
    disp(G6_partial)
    disp('G7 的部分分式展開為：')
    disp(G7_partial)
    disp('G8 的部分分式展開為：')
    disp(G8_partial)

    
    
