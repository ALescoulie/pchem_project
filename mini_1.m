function [E] =  rotational_energy(J, Be)
    E = J .* (J + 1) .* Be
end
