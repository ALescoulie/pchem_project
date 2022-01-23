%% Mini project 1
Ni = 1E5;
Be = 0.833;
T_low = 238;
Ei = rotational_energy(0, Be);
Ej = rotational_energy(1, Be);
Nj = Ni.*bolz_dist(Ei, Ej, T_low);

%% Mini project 2

Nj_lev = Nj .* rotational_degen(1);

%% General fuctions
%% Boltzmann dist fraction

function [N] = bolz_dist(Ei, Ej, T)
    dE = Ej - Ei;
    b = 1 ./ (8.314.*T);
    N = exp(-b*dE);
end
%% Mini project 1 functions

%% energy of state J
function [E] =  rotational_energy(J, Be)
    E = J .* (J + 1) .* Be;
end

%% Mini project 2 functions

%% rotational degeneracy

function [g] = rotational_degen(J)
    g = 2 .* J + 1;
end
