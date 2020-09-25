function area = trap(f,a,b,N)
%   trapezoidal integration of f from a to b using N steps
%
%   Author: {Conzet, Addison}
%   Collaborators: {Oberg, Sam}
%   Date: {9/17/2020}

    step_size = (b-a)/N;
    area = 0;
    f = symfun(f,symvar(f));
        for i = 1:N-1
            x = a+step_size*i;
            area = area + f(x);
        end
    
    area = step_size*(f(a)+f(b))/2+step_size*area;
end

