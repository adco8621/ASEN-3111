function Cp = Cp_func(theta,constants)
%   function to calculate the pressure coefficient
%
%   Author: {Conzet, Addison}
%   Collaborators: {Oberg, Sam}
%   Date: {9/17/2020}

    Cp = 1-(4*(sind(theta))^2 ...
    + (2*constants.Gamma*sind(theta))/(pi*constants.R*constants.V_inf) ...
    + ((constants.Gamma)/(2*pi*constants.R*constants.V_inf))^2);
end

