syms s R1 R2 L c V % Construct symbolic objects for
% frequency variable 's', and
%'R1','R2', 'L','c', and 'V'.
% Note: Use lower-case 'c'
% in declaration for
% capacitor.
A2=[(R1+L*s) V;-L*s 0] % Form Ak = A2.
A=[(R1+L*s) -L*s;-L*s (L*s+R2+(1/(c*s)))]
% Form A.
I2=det(A2)/det(A); % Use Cramer's rule to solve for
% I2(s).
I2=simplify(I2); % Reduce complexity of I2(s)
G=I2/V; % Form transfer function,
% G(s) = I2(s)/V(s).
'G(s)' % Display label.
pretty (G) % Pretty print G(s).
pretty (collect(G,'s'))