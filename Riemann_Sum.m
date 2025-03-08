% Define the function to be integrated
syms x
syms f
f = input('Enter the function to be integrated (use "." for element-wise operations): ');
F = @(x) eval(vectorize(f));

% Define the interval [a, b] and number of subintervals n
a = input('Enter the lower limit (a): ');
b = input('Enter the upper limit (b): ');
n = input('Enter the number of subintervals (n): ');

% Calculate the width of each subinterval
dx = (b - a) / n;

% Initialize variables to store the Riemann sums
left_sum = 0;
right_sum = 0;
midpoint_sum = 0;

% Calculate Riemann sums
for i = 1:n
    xi = a + (i - 1) * dx; % Left endpoint of the subinterval
    left_sum = left_sum + F(xi) * dx;
    
    xi = a + i * dx; % Right endpoint of the subinterval
    right_sum = right_sum + F(xi) * dx;
    
    xi = a + (i - 0.5) * dx; % Midpoint of the subinterval
    midpoint_sum = midpoint_sum + F(xi) * dx;
end
clc;
a1=abs(a);
%left sum graph
hold on;
fplot(f,[a b],'k');
fplot('y==0',[a b+((a1+b)/n)],'b');
title('left sum graph');
for i=a:((a1+b)/n):b
    x=i;
    t=subs(f);
    hold on;
    line([i i],[0 t])
    line([i+((a1+b)/n) i+((a1+b)/n)],[0 t])
    line([i (i+(a1+b)/n)],[t t])
    %line([i (i-((a1+b)/n))],[t t])
end
%right sum graph
figure
hold on;
fplot(f,[a b],'k');
fplot('y==0',[a-((a1+b)/n) b]);
title('right sum graph');
for i=a:((a1+b)/n):b
    x=i;
    t=subs(f);
    hold on;
    if(i>=a)
    line([i i],[0 t])
    line([i-((a1+b)/n) i-((a1+b)/n)],[0 t])
    end
    if(i>=a)
    %line([i (i+(a1+b)/n)],[t t])
    line([i (i-((a1+b)/n))],[t t])
   end
   %if(i==a)
    %    break;
    %end
end
%midpoint sum graph
figure
hold on;
fplot(f,[a b]);
fplot('y==0',[a b]);
title('midpoint sum graph');
mun=1;
div=2;
for i=((a1+b)/n):((a1+b)/n):b
    if(i>a)
    x=((mun/div)*i);
    t=subs(f);
    hold on;
    line([i i],[0 t])
    line([i-((a1+b)/n) i-((a1+b)/n)],[0 t])
    line([i (i-(((a1+b)/n)))],[t t])
    end
    mun=mun+2;
    div=div+2;
end
mun=1;
div=2;
for i=-((a1+b)/n):-((a1+b)/n):a
    if(b>i)
    x=((mun/div)*i);
    t=subs(f);
    hold on;
    line([i i],[0 t])
    line([i+((a1+b)/n) i+((a1+b)/n)],[0 t])
    line([i (i+(((a1+b)/n)))],[t t])
    end
    mun=mun+2;
    div=div+2;
end
% Display the results
fprintf('Left Riemann Sum: %f\n', left_sum);
fprintf('Right Riemann Sum: %f\n', right_sum);
fprintf('Midpoint Riemann Sum: %f\n', midpoint_sum);
