function area = trap_cn(f,a,b,N)
%   trapezoidal integration calculation cn from a to b using N steps
%   adapted for splines
%
%   Author: {Conzet, Addison}
%   Collaborators: {Oberg, Sam}
%   Date: {9/17/2020}

    step_size = (b-a)/N;
    area = 0;
        for i = 1:N-1
            x = a+step_size*i;
            area = area + fnval(f,x);
        end
    
    area = step_size*(fnval(f,a)+fnval(f,b))/2+step_size*area;
end