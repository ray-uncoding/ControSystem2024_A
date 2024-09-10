% 建立符號變數 s, R1, R2, L, c, V
syms s R1 R2 L c V 

% 顯示標籤
disp('Constructing symbolic objects for frequency variable ''s'', and ''R1'', ''R2'', ''L'', ''c'', and ''V''. (Note: Use lower-case ''c'' for capacitor.)')

% 形成矩陣 A2
A2 = [(R1 + L*s), V; -L*s, 0];

% 顯示標籤
disp('Forming Ak = A2')
disp(A2)

% 形成矩陣 A
A = [(R1 + L*s), -L*s; -L*s, (L*s + R2 + (1/(c*s)))];

% 顯示標籤
disp('Forming A')
disp(A)

% 使用克萊姆法則解 I2(s)
I2 = det(A2) / det(A);

% 簡化 I2(s)
I2 = simplify(I2);

% 形成傳遞函數 G(s) = I2(s) / V(s)
G = I2 / V;

% 顯示標籤
disp('G(s)')

% 以漂亮的格式顯示 G(s)
pretty(G)

% 收集並以漂亮格式顯示 G(s) 中的 's' 項
pretty(collect(G, 's'))
