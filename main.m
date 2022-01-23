%% 1. calculating populations at each energy
N_i = 1E5;
Z = linspace(0, 50, 51);
Be = 0.833;
T_low = 238;
T_high = 368;
T_mid = 318; 
Z_dist_T_low = population_dist(N_i, Z, Be, T_low);
Z_dist_T_high = population_dist(N_i, Z, Be, T_high);
Z_dist_T_mid = population_dist(N_i, Z, Be, T_mid);

%% 2. plotting populations

plot(Z, Z_dist_T_low);

%% 4. calculating total energy

E_tot_T_low = sum(Z_dist_T_low.*rotational_energy(Z, Be));

%% 5. calculating total rotational energy

E_tot_T_high = sum(Z_dist_T_high.*rotational_energy(Z, Be));
E_tot_T_mid = sum(population_dist(N_i, Z, Be, T_mid).*rotational_energy(Z, Be));

%% 6. average energy

pop_low = sum(Z_dist_T_low);
pop_mid = sum(Z_dist_T_mid);
pop_high = sum(Z_dist_T_high);

E_avg_low = E_tot_T_low./pop_low;
E_avg_mid = E_tot_T_mid./pop_mid;
E_avg_high = E_tot_T_high./pop_high;

%% 7. energy_temp_plot

plot([E_avg_low, E_avg_mid, E_avg_high], [T_low, T_mid, T_high]);

%% Functions

function [N] = boltz_dist(Ei, Ej, T)
    dE = Ej - Ei;
    b = 1 ./ (8.314.*T);
    N = exp(-b.*dE);
end

function [E] =  rotational_energy(J, Be)
    E = J .* (J + 1) * Be;
end

function [pop] = population_dist(N_i, Z, Be, T)
    Ez = boltz_dist(0, rotational_energy(Z, Be), T);
    pop = N_i * Ez;
end