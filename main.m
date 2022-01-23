N_i = 1E5;
Z = linspace(0, 50, 51);
Be = 0.833;
T0 = 238;
T1 = 368;
Z_dist_T0 = N_i*boltz_dist(0, rotational_energy(Z, 0.833), T0);


%% plotting

plot(Z, Z_dist_T0);

%% Functions
function [N] = boltz_dist(Ei, Ej, T)
    dE = Ej - Ei;
    b = 1 ./ (8.314.*T);
    N = exp(-b.*dE);
end

function [E] =  rotational_energy(J, Be)
    E = J .* (J + 1) * Be;
end


function [g] = rotational_degen(J)
    g = 2 .* J + 1;
end