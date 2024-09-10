% 顯示標籤
disp('(ch2sp3)')

% 建立符號變數 s (頻率變數 's')
syms s 

% 建立符號傳遞函數 G(s)
G = 54 * (s + 27) * (s^3 + 52*s^2 + 37*s + 73) / ...
    (s * (s^4 + 872*s^3 + 437*s^2 + 89*s + 65) * (s^2 + 79*s + 36));

% 顯示標籤
disp('Symbolic G(s)')

% 以漂亮的格式顯示 G(s)
pretty(G)

% 提取符號傳遞函數的分子和分母
[numg, deng] = numden(G);

% 將分子和分母轉換為多項式向量
numg = sym2poly(numg);
deng = sym2poly(deng);

% 顯示標籤
disp('LTI G(s) in Polynomial Form')

% 將 G(s) 轉換為 LTI (線性時不變系統) 物件並顯示
Gtf = tf(numg, deng)

% 顯示標籤
disp('LTI G(s) in Factored Form')

% 將 G(s) 轉換為分解形式並顯示
Gzpk = zpk(Gtf)