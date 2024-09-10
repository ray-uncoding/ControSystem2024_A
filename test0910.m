% 2024/0903 自動控制實驗A組
% 40971206H 潘林陞 41173011H 周東陞
% 使用程式碼閱覽題目時 需要將其他題目先註解
% 例如：閱覽第二題時 將第一 第三題註解再按下 RUN

%  2024/09/10 自動控制實驗A組 考試 2.1 

    P1 = [1 7 2 9 10 12 15];    % s^6 + 7s^5 + 2s^4 + 9s^3 + 10s^2 + 12s + 15
    P2 = [1 9 8 9 12 15 20];    % s^6 + 9s^5 + 8s^4 + 9s^3 + 12s^2 + 15s + 20
    roots_P1 = roots(P1);
    roots_P2 = roots(P2);
    
    P3 = P1 + P2;
    P4 = P1 - P2; 
    P5 = conv(P1, P2);

    % 顯示結果
   fprintf('P1 的根為：\n');
    disp(roots_P1);
    fprintf('P2 的根為：\n');
    disp(roots_P2);
    fprintf('P3 = P1 + P2 的多項式係數為：\n');
    disp(P3);
    fprintf('P4 = P1 - P2 的多項式係數為：\n');
    disp(P4);
    fprintf('P5 = P1 * P2 的多項式係數為：\n');
    disp(P5);

    syms s
    P6 = (s + 7)*(s + 8)*(s + 3)*(s + 5)*(s + 9)*(s + 10);
    % 展開多項式
    P6_expanded = expand(P6);
    fprintf('展開後的多項式 P6 為：')
    pretty(P6_expanded)

