% 定義 P1 和 P2 的多項式係數
P1 = [1 7 2 9 10 12 15]; % 對應 s^6 + 7s^5 + 2s^4 + 9s^3 + 10s^2 + 12s + 15
P2 = [1 9 8 9 12 15 20]; % 對應 s^6 + 9s^5 + 8s^4 + 9s^3 + 12s^2 + 15s + 20

% a. 求解 P1 的根
roots_P1 = roots(P1);

% b. 求解 P2 的根
roots_P2 = roots(P2);

% c. 計算 P3 = P1 + P2, P4 = P1 - P2, P5 = P1 * P2
P3 = P1 + P2; % 多項式相加
P4 = P1 - P2; % 多項式相減
P5 = conv(P1, P2); % 多項式相乘

% 顯示結果
disp('P1 的根為：')
disp(roots_P1)

disp('P2 的根為：')
disp(roots_P2)

disp('P3 = P1 + P2 的多項式係數為：')
disp(P3)

disp('P4 = P1 - P2 的多項式係數為：')
disp(P4)

disp('P5 = P1 * P2 的多項式係數為：')
disp(P5)
