function area = simp(f,a,b,N)
%   simpsons integration of f from a to b using N steps
%
%   Author: {Conzet, Addison}
%   Collaborators: {Oberg, Sam}
%   Date: {9/17/2020}
    step_size = (b-a)/N;
    f = symfun(f,symvar(f));
    values = a:step_size:b;
    area = step_size/3*(f(values(1))+2*sum(f(values(3:2:end-2)))+4*sum(f(values(2:2:end)))+f(values(end)));
end

