function area = trap_ca(f,N,yt)
%   trapezoidal integration calculation ca from a to b using N steps
%   adapted for splines
%
%   Author: {Conzet, Addison}
%   Collaborators: {Oberg, Sam}
%   Date: {9/17/2020}

    area = 0;
    yt = symfun(yt,symvar(yt));
        for i = 1:numel(N)-1
            lhs = fnval(f,N(i));
            rhs = fnval(f,N(i+1));
            area = area + eval(((lhs+rhs)/2)*(yt(N(i+1))-yt(N(i))));
        end
end