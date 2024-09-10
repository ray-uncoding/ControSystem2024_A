% 建立符號變數 s, R1, R2, L, c, V
syms s R1 R2 L c V 
disp('Constructing symbolic objects for frequency variable ''s'', and ''R1'', ''R2'', ''L'', ''c'', and ''V''. (Note: Use lower-case ''c'' for capacitor.)')

A2 = [  
        (R1 + L*s),     V; 
        -L*s,           0
    ];


disp('Forming Ak = A2')
disp(A2)

A = [
    (R1 + L*s), -L*s;
    -L*s, (L*s + R2 + (1/(c*s)))
    ];
disp('Forming A')
disp(A)

I2 = det(A2) / det(A);
I2 = simplify(I2);
G = I2 / V;
disp('G(s)')
pretty(G)
pretty(collect(G, 's'))
