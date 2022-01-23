%% Mini project 1

// energy of state J
function [E] =  rotational_energy(J, Be)
    E = J .* (J + 1) .* Be
end

// Boltzmann dist fraction

function [N] = bolz_dist(Ei, Ej, T)
    dE = Ej .- Ei
    b = 1 ./ (8.314.*T)
    N = exp(-b*dE)
end


