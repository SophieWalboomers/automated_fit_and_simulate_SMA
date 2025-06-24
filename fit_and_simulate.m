% These functions are called by the livescript fit_and_simulate_livescript.mlx
% Adapted from Jan Treurs NOMEtuningadaptive template (https://www.researchgate.net/publication/337830707_NOME_Tuning_Adaptive_Template)
function RMSE = fit_and_simulate(P, plot, timepoints, stateselection, empirical_data, person_index)
    
    global dt;
    global k;
    
    % Combination functions
    mcf=[75 21 2 3 76 45];
    
    % Tuning matrices, as in the NOMEtuningadaptive template by Jan Treur
    mcwtuning = [
        NaN  NaN  NaN  NaN  % X1
        NaN  NaN  NaN  NaN  % X2
        NaN  NaN  NaN  NaN  % X3
        NaN  NaN  NaN  NaN  % X4
        NaN  NaN  NaN  NaN  % X5
        NaN  NaN  NaN  NaN  % X6 
        NaN  1    2    3    % X7 
        NaN  NaN  NaN  NaN  % X8
        NaN  NaN  NaN  NaN  % X9
        NaN  NaN  NaN  NaN  % X10
        NaN  NaN  NaN  NaN  % X11
        NaN  NaN  NaN  NaN  % X12
        NaN  NaN  NaN  NaN  % X13
        NaN  NaN  NaN  NaN  % X14 
        NaN  NaN  NaN  NaN  % X15 
        NaN  NaN  NaN  NaN  % X16
        NaN  NaN  NaN  NaN  % X17
        NaN  NaN  NaN  NaN  % X18
        NaN  NaN  NaN  NaN  % X19
        NaN  NaN  NaN  NaN  % X20
    ];

    mcfptuning =cat(3,[NaN  NaN  NaN  NaN  NaN  % 
    NaN  NaN  NaN  NaN  NaN  % X2
    NaN  NaN  NaN  NaN  NaN  % X3
    NaN  NaN  NaN  NaN  NaN  % X4
    NaN  NaN  NaN  NaN  NaN  % X5
    NaN  NaN  NaN  NaN  NaN  % X6
    NaN  NaN  NaN  NaN  NaN  % X7 
    NaN  NaN  NaN  NaN  NaN  % X8 
    NaN  NaN  NaN  NaN  NaN  % X9 
    NaN  NaN  NaN  NaN  NaN  % X10 
    NaN  NaN  NaN  NaN  NaN  % X11 
    NaN  NaN  NaN  NaN  NaN  % X12 
    NaN  NaN  NaN  NaN  NaN  % X13
    NaN  NaN  NaN  NaN  NaN  % X14
    NaN  NaN  NaN  NaN  NaN  % X15
    NaN  NaN  NaN  NaN  NaN  % X16
    NaN  NaN  NaN  NaN  NaN  % X17
    NaN  NaN  NaN  NaN  NaN  % X18
    NaN  NaN  NaN  NaN  NaN  % X19
    NaN  NaN  NaN  NaN  NaN  % X20
    ],[NaN  NaN  NaN  NaN  NaN %
    NaN  NaN  NaN  NaN  NaN  % X2
    NaN  NaN  NaN  NaN  NaN  % X3
    NaN  NaN  NaN  NaN  NaN  % X4
    NaN  NaN  NaN  NaN  NaN  % X5
    NaN  NaN  NaN  NaN  NaN  % X6
    NaN  NaN  NaN  NaN  NaN  % X7 
    NaN  NaN  NaN  NaN  NaN  % X8 
    NaN  NaN  NaN  NaN  NaN  % X9 
    NaN  NaN  NaN  NaN  NaN  % X10 
    NaN  NaN  NaN  NaN  NaN  % X11 
    NaN  NaN  NaN  NaN  NaN  % X12 
    NaN  NaN  NaN  NaN  NaN  % X13
    NaN  NaN  NaN  NaN  NaN  % X14
    NaN  NaN  NaN  NaN  NaN  % X15
    NaN  NaN  NaN  NaN  NaN  % X16
    NaN  NaN  NaN  NaN  NaN  % X17
    NaN  NaN  NaN  NaN  NaN  % X18
    NaN  NaN  NaN  NaN  NaN  % X19
    NaN  NaN  NaN  NaN  NaN  % X20
    ],[NaN  NaN  NaN NaN NaN % 
    NaN  NaN  NaN  NaN  NaN  % X2
    NaN  NaN  NaN  NaN  NaN  % X3
    NaN  NaN  NaN  NaN  NaN  % X4
    NaN  NaN  NaN  NaN  NaN  % X5
    NaN  NaN  NaN  NaN  NaN  % X6 
    NaN  NaN  NaN  NaN  NaN  % X7 
    4    NaN  NaN  NaN  NaN  % X8 
    NaN  NaN  NaN  NaN  NaN  % X9 
    NaN  NaN  NaN  NaN  NaN  % X10 
    NaN  NaN  NaN  NaN  NaN  % X11 
    NaN  NaN  NaN  NaN  NaN  % X12 
    NaN  NaN  NaN  NaN  NaN  % X13
    NaN  NaN  NaN  NaN  NaN  % X14
    NaN  NaN  NaN  NaN  NaN  % X15
    NaN  NaN  NaN  NaN  NaN  % X16
    NaN  NaN  NaN  NaN  NaN  % X17
    NaN  NaN  NaN  NaN  NaN  % X18 
    NaN  NaN  NaN  NaN  NaN  % X19
    NaN  NaN  NaN  NaN  NaN  % X20
    ],[NaN  NaN  NaN  NaN  NaN % 
    NaN  NaN  NaN  NaN  NaN  % X2
    NaN  NaN  NaN  NaN  NaN  % X3
    NaN  NaN  NaN  NaN  NaN  % X4
    NaN  NaN  NaN  NaN  NaN  % X5
    NaN  NaN  NaN  NaN  NaN  % X6
    NaN  NaN  NaN  NaN  NaN  % X7 
    NaN  NaN  NaN  NaN  NaN  % X8 
    NaN  NaN  NaN  NaN  NaN  % X9 
    NaN  NaN  NaN  NaN  NaN  % X10 
    NaN  NaN  NaN  NaN  NaN  % X11 
    NaN  NaN  NaN  NaN  NaN  % X12 
    NaN  NaN  NaN  NaN  NaN  % X13
    NaN  NaN  NaN  NaN  NaN  % X14
    NaN  NaN  NaN  NaN  NaN  % X15
    NaN  NaN  NaN  NaN  NaN  % X16
    NaN  NaN  NaN  NaN  NaN  % X17
    NaN  NaN  NaN  NaN  NaN  % X18
    NaN  NaN  NaN  NaN  NaN  % X19
    NaN  NaN  NaN  NaN  NaN  % X20
    ],[NaN  NaN  NaN  NaN  NaN  % 
    NaN  NaN  NaN  NaN  NaN  % X2
    NaN  NaN  NaN  NaN  NaN  % X3
    NaN  NaN  NaN  NaN  NaN  % 
    NaN  NaN  NaN  NaN  NaN  % X5
    NaN  NaN  NaN  NaN  NaN  
    NaN  NaN  NaN  NaN  NaN  % X7 
    NaN  NaN  NaN  NaN  NaN  % X8 
    NaN  NaN  NaN  NaN  NaN  % X9 
    NaN  NaN  NaN  NaN  NaN  % X10 
    NaN  NaN  NaN  NaN  NaN  % X11 
    NaN  NaN  NaN  NaN  NaN  % X12 
    NaN  NaN  NaN  NaN  NaN  % X13
    NaN  NaN  NaN  NaN  NaN  % X14
    NaN  NaN  NaN  NaN  NaN  % X15 
    NaN  NaN  NaN  NaN  NaN  % X16
    NaN  NaN  NaN  NaN  NaN  % X17
    NaN  NaN  NaN  NaN  NaN  % X18
    NaN  NaN  NaN  NaN  NaN  % X19
    NaN  NaN  NaN  NaN  NaN  % X20
    ],[NaN  NaN  NaN  NaN  NaN  % 
    NaN  NaN  NaN  NaN  NaN  % X2
    NaN  NaN  NaN  NaN  NaN  % X3
    NaN  NaN  NaN  NaN  NaN  % X4
    NaN  NaN  NaN  NaN  NaN  % X5
    NaN  NaN  NaN  NaN  NaN  % X6
    NaN  NaN  NaN  NaN  NaN  % X7 
    NaN  NaN  NaN  NaN  NaN  % X8 
    NaN  NaN  NaN  NaN  NaN  % X9 
    NaN  NaN  NaN  NaN  NaN  % X10 
    NaN  NaN  NaN  NaN  NaN  % X11 
    NaN  NaN  NaN  NaN  NaN  % X12 
    NaN  NaN  NaN  NaN  NaN  % X13
    NaN  NaN  NaN  NaN  NaN  % X14
    NaN  NaN  NaN  NaN  NaN  % X15
    NaN  NaN  NaN  NaN  NaN  % X16
    NaN  NaN  NaN  NaN  NaN  % X17
    NaN  NaN  NaN  NaN  NaN  % X18
    NaN  NaN  NaN  NaN  NaN  % X19
    NaN  NaN  NaN  NaN  NaN  % X20
    ]);
    
    mcfwtuning = [
        NaN NaN NaN NaN NaN NaN  % X1
        NaN NaN NaN NaN NaN NaN  % X2
        NaN NaN NaN NaN NaN NaN  % X3
        NaN NaN NaN NaN NaN NaN  % X4
        NaN NaN NaN NaN NaN NaN  % X5
        NaN NaN NaN NaN NaN NaN  % X6
        NaN NaN NaN NaN NaN NaN  % X7
        NaN NaN NaN NaN NaN NaN  % X8
        NaN NaN NaN NaN NaN NaN  % X9
        NaN NaN NaN NaN NaN NaN  % X10
        NaN NaN NaN NaN NaN NaN  % X11
        NaN NaN NaN NaN NaN NaN  % X12
        NaN NaN NaN NaN NaN NaN  % X13
        NaN NaN NaN NaN NaN NaN  % X14
        NaN NaN NaN NaN NaN NaN  % X15
        NaN NaN NaN NaN NaN NaN  % X16
        NaN NaN NaN NaN NaN NaN  % X17
        NaN NaN NaN NaN NaN NaN  % X18
        NaN NaN NaN NaN NaN NaN  % X19
        NaN NaN NaN NaN NaN NaN  % X20
    ];
    
    mstuning = [
        NaN
        NaN
        NaN
        NaN
        NaN
        NaN % X6 
        NaN % X7 
        NaN % X8 
        NaN % X9 
        NaN % X10
        NaN % X11
        NaN % X12
        NaN % X13 
        NaN % X14 
        NaN % X15 
        NaN % X16 
        NaN % X17 
        NaN % X18 
        NaN % X19 
        NaN % X20 
        ];
    
    ivtuning = [NaN
        NaN
        NaN
        NaN
        NaN
        NaN % X6
        NaN % X7
        NaN % X8
        NaN % X9
        NaN % X10
        NaN % X11
        NaN % X12
        NaN % X13
        NaN % X14
        NaN % X15
        NaN % X16
        NaN % X17
        NaN % X18
        NaN % X19
        NaN % X20
        ];
    
    % Role matrices and initial values, as in the NOMEadaptive template by Jan Treur

    mb=[9 NaN NaN NaN % X1 
    1  NaN NaN NaN    % X2 
    2  NaN NaN NaN    % X3 
    3  4   NaN NaN    % X4 
    4  5   NaN NaN    % X5 
    4  6   NaN NaN    % X6 
    4  5   6   7      % X7 
    4  5   7   NaN    % X8 
    8  NaN NaN NaN    % X9 
    6  10  NaN NaN    % X10
    4  11  NaN NaN    % X11
    11 NaN NaN NaN    % X12
    5  13  NaN NaN    % X13
    4  5   14  NaN    % X14
    4  6   15  NaN    % X15
    4  8   16  NaN    % X16
    10 17  NaN NaN    % X17
    4  5   14  18     % X18
    4  6   15  19     % X19
    4  8   16  20     % X20
    ];
    
    mcwv=[
    1 NaN NaN NaN
    1 NaN NaN NaN
    1 NaN NaN NaN
    1 0.1 NaN NaN
    0.5 0.5 NaN NaN
    NaN 0.075 NaN NaN
    NaN -0.5 0.5 0.5
    NaN 0.4 0.3 NaN 
    1 NaN NaN NaN
    0.19 1 NaN NaN
    1 0.085 NaN NaN
    1 NaN NaN NaN
    1 0.15 NaN NaN
    1 1 1 NaN
    1 1 1 NaN
    0.6 0.6 1 NaN
    0.1 0.1 NaN NaN
    1 0.1 0.1 0.102
    1 0.02 0.02 0.108
    0.36 0.02 0.34 0.13
        ];
        
    mcfwv=[
    1   NaN NaN NaN NaN NaN % X1
    NaN 1   NaN NaN NaN NaN % X2
    NaN 1   NaN NaN NaN NaN % X3
    NaN NaN 1   NaN NaN NaN % X4
    NaN NaN 1   NaN NaN NaN % X5
    NaN NaN 1   NaN NaN NaN % X6
    NaN NaN NaN NaN 1   NaN % X7 
    NaN NaN 1   NaN NaN NaN % X8
    NaN 1   NaN NaN NaN NaN % X9
    NaN NaN 1   NaN NaN NaN % X10
    NaN NaN 1   NaN NaN NaN % X11
    NaN NaN NaN NaN NaN 1   % X12 
    NaN NaN 1   NaN NaN NaN % X13 
    NaN NaN NaN 1   NaN NaN % X14 
    NaN NaN NaN 1   NaN NaN % X15 
    NaN NaN NaN 1   NaN NaN % X16 
    NaN NaN 1   NaN NaN NaN % X17 
    NaN NaN 1   NaN NaN NaN % X18 
    NaN NaN 1   NaN NaN NaN % X19 
    NaN NaN 1   NaN NaN NaN % X20 
        ]; 
      
    mcfpv = cat(3,[1000 0.79  6 20 200 % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % X4
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN % X6
    NaN NaN NaN NaN NaN % X7 
    NaN NaN NaN NaN NaN % X8 
    NaN NaN NaN NaN NaN % X9 
    NaN NaN NaN NaN NaN % X10 
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12 
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X19
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN %
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % X4
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN % X6
    NaN NaN NaN NaN NaN % X7 
    NaN NaN NaN NaN NaN % X8 
    NaN NaN NaN NaN NaN % X9 
    NaN NaN NaN NaN NaN % X10 
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12 
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X19
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN % 
    NaN NaN   NaN NaN NaN % X2
    NaN NaN   NaN NaN NaN % X3
    4   0.5   NaN NaN NaN % X4 
    3   NaN   NaN NaN NaN % X5 
    30  0.01  NaN NaN NaN % X6
    NaN NaN   NaN NaN NaN % X7 
    7   NaN   NaN NaN NaN % X8 
    NaN NaN   NaN NaN NaN % X9
    90  0.179 NaN NaN NaN % X10
    100 0.06  NaN NaN NaN % X11 
    NaN NaN   NaN NaN NaN % X12 
    55 0.1    NaN NaN NaN % X13 
    NaN NaN   NaN NaN NaN % X14
    NaN NaN   NaN NaN NaN % X15
    NaN NaN   NaN NaN NaN % X16
    7   0.05  NaN NaN NaN % X17
    90  0.099 NaN NaN NaN % X18 
    50  0.08  NaN NaN NaN % X19
    20  0.1   NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN 
    NaN NaN NaN NaN NaN % X7
    NaN NaN NaN NaN NaN % X8
    NaN NaN NaN NaN NaN % X9
    NaN NaN NaN NaN NaN % X10
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14 
    NaN NaN NaN NaN NaN % X15 
    NaN NaN NaN NaN NaN % X16 
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X19 
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN 
    NaN NaN NaN NaN NaN % X7 
    NaN NaN NaN NaN NaN % X8 
    NaN NaN NaN NaN NaN % X9 
    NaN NaN NaN NaN NaN % X10
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12 
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15 
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X19
    NaN NaN NaN NaN NaN % X19
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN 
    NaN NaN NaN NaN NaN % X7
    NaN NaN NaN NaN NaN % X8
    NaN NaN NaN NaN NaN % X9
    NaN NaN NaN NaN NaN % X10
    NaN NaN NaN NaN NaN % X11 
    0.7 1   NaN NaN NaN % X12 
    NaN NaN NaN NaN NaN % X13 
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X19 
    NaN NaN NaN NaN NaN % X20
    ]);
    
    
    msv=[
    1
    1
    1
    1
    1
    0.005 
    0.01 
    0.01 
    1    
    1    
    0.01 
    0.01 
    0.005 
    0.016 
    0.006 
    0.03 
    0.01 
    0.01 
    0.01 
    0.01 
        ];
     
    iv = [
    0
    0
    0
    0
    0
    0 
    0 
    0 
    0 
    0 
    0.01 
    0.99 
    0 
    0 
    0.01 
    0.01 
    0 
    0 
    0 
    0 
        ];
    
    
    % Adaptation role matrices 
    
    mcwa=[
    NaN NaN NaN NaN  % X1 
    NaN NaN NaN NaN  % X2 
    NaN NaN NaN NaN  % X3 
    NaN NaN NaN NaN  % X4 
    NaN NaN NaN NaN  % X5 
    15  NaN NaN NaN  % X6 
    14  NaN NaN NaN  % X7 
    16  NaN NaN NaN  % X8 
    NaN NaN NaN NaN  % X9 
    NaN NaN NaN NaN  % X10
    NaN NaN NaN NaN  % X11
    NaN NaN NaN NaN  % X12
    NaN NaN NaN NaN  % X13
    NaN NaN NaN NaN  % X14
    NaN NaN NaN NaN  % X15
    NaN NaN NaN NaN  % X16
    NaN NaN NaN NaN  % X17
    NaN NaN NaN NaN  % X18
    NaN NaN NaN NaN  % X19 
    NaN NaN NaN NaN  % X20 
        ];
    
    msa=[
        NaN
        NaN
        NaN
        NaN
        NaN
        NaN % X6 
        NaN % X7 
        NaN % X8 
        NaN % X9 
        NaN % X10 
        NaN % X11 
        NaN % X12 
        NaN % X13 
        NaN % X14 
        NaN % X15 
        NaN % X16 
        NaN % X17 
        NaN % X18 
        NaN % X19 
        NaN % X20 
        ];
    
    mcfwa=[
        NaN NaN NaN NaN NaN NaN NaN  % X1
        NaN NaN NaN NaN NaN NaN NaN  % X2
        NaN NaN NaN NaN NaN NaN NaN  % X3
        NaN NaN NaN NaN NaN NaN NaN  % X4
        NaN NaN NaN NaN NaN NaN NaN  % X5
        NaN NaN NaN NaN NaN NaN NaN  % X6
        NaN NaN NaN NaN NaN NaN NaN  % X7
        NaN NaN NaN NaN NaN NaN NaN  % X8
        NaN NaN NaN NaN NaN NaN NaN  % X9
        NaN NaN NaN NaN NaN NaN NaN  % X10
        NaN NaN NaN NaN NaN NaN NaN  % X11
        NaN NaN NaN NaN NaN NaN NaN  % X12
        NaN NaN NaN NaN NaN NaN NaN  % X13
        NaN NaN NaN NaN NaN NaN NaN  % X14
        NaN NaN NaN NaN NaN NaN NaN  % X15
        NaN NaN NaN NaN NaN NaN NaN  % X16
        NaN NaN NaN NaN NaN NaN NaN  % X17 
        NaN NaN NaN NaN NaN NaN NaN  % X18
        NaN NaN NaN NaN NaN NaN NaN  % X19
        NaN NaN NaN NaN NaN NaN NaN  % X20
        ]; 
    
    mcfpa=cat(3,[NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % X4
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN % X6
    NaN NaN NaN NaN NaN % X7 
    NaN NaN NaN NaN NaN % X8 
    NaN NaN NaN NaN NaN % X9 
    NaN NaN NaN NaN NaN % X10 
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12 
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X19
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN %
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % X4
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN % X6
    NaN NaN NaN NaN NaN % X7 
    NaN NaN NaN NaN NaN % X8 
    NaN NaN NaN NaN NaN % X9 
    NaN NaN NaN NaN NaN % X10 
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12 
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X29
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % X4
    NaN 13 NaN NaN NaN  % X5
    NaN NaN NaN NaN NaN % X6
    NaN NaN NaN NaN NaN % X7
    NaN 17  NaN NaN NaN % X8
    NaN NaN NaN NaN NaN % X9
    NaN NaN NaN NaN NaN % X10
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X19 
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % X4
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN % X6
    NaN NaN NaN NaN NaN % X7
    NaN NaN NaN NaN NaN % X8 
    NaN NaN NaN NaN NaN % X9
    NaN NaN NaN NaN NaN % X10
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12
    NaN NaN NaN NaN NaN % X13
    18  NaN NaN NaN NaN % X14
    19  NaN NaN NaN NaN % X15
    20  NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18 
    NaN NaN NaN NaN NaN % X19
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN 
    12  NaN NaN NaN NaN % X7
    NaN NaN NaN NaN NaN % X8
    NaN NaN NaN NaN NaN % X9
    NaN NaN NaN NaN NaN % X10
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X19
    NaN NaN NaN NaN NaN % X20
    ],[NaN NaN NaN NaN NaN % 
    NaN NaN NaN NaN NaN % X2
    NaN NaN NaN NaN NaN % X3
    NaN NaN NaN NaN NaN % X4
    NaN NaN NaN NaN NaN % X5
    NaN NaN NaN NaN NaN % X6
    NaN NaN NaN NaN NaN % X7
    NaN NaN NaN NaN NaN % X8
    NaN NaN NaN NaN NaN % X9
    NaN NaN NaN NaN NaN % X10
    NaN NaN NaN NaN NaN % X11 
    NaN NaN NaN NaN NaN % X12
    NaN NaN NaN NaN NaN % X13
    NaN NaN NaN NaN NaN % X14
    NaN NaN NaN NaN NaN % X15
    NaN NaN NaN NaN NaN % X16
    NaN NaN NaN NaN NaN % X17
    NaN NaN NaN NaN NaN % X18
    NaN NaN NaN NaN NaN % X19
    NaN NaN NaN NaN NaN % X20
    ]);

    dt = 0.1   ;
    endtimeofsimulation =  1000;
    
    % Updating parameter values 
    [rows,cols] = size(mcwtuning);
    for i = 1:rows
        for j = 1:cols
            if (~isnan(mcwtuning(i,j)))
                index = mcwtuning(i,j);
                mcwv(i,j) = P(index);
            end
        end
         
    end 
    
    [rows,cols] = size(mcfwtuning);
    for j = 1:rows
        for m=1:cols
            if not(isnan(mcfwtuning(j, m))) 
                index = mcfwtuning(j, m);
                mcfwv(j, m) = P(index);   
            end
        end
    end

    nocf = numel(mcf);
    nocfp = size(mcfpv,2);
    
    for j = 1:size(mcfpv,1)
        for p=1:1:nocfp  
            for m=1:1:nocf 
                if not(isnan(mcfptuning(j, p, m))) 
                    index = mcfptuning(j, p, m);
                    mcfpv(j, p, m) = P(index);
                 end
             end
        end
    end
    
    nostates = size(mstuning,1);
    
    for i = 1:nostates
     if (~isnan(mstuning(i)))
         index = mstuning(i);
         msv(i) = P(index);
     end
         
    end    
    
    nostates = size(ivtuning,1);
    
    for i = 1:nostates
     if (~isnan(ivtuning(i)))
         index = ivtuning(i);
         iv(i) = P(index);
     end
         
    end
    
    % Simulating
    nos = numel(iv);
    nocf = numel(mcf);
    nocfp = size(mcfpv,2);
    
    X(:,1)=iv;
    t(1)=0;
    
    for k=1:endtimeofsimulation/dt
        
        for j = 1:nos
    
            if not(isnan(msa(j, 1)))  
                s(j, k) = X(msa(j, 1), k);  
            elseif not(isnan(msv(j, 1))) 
                s(j, k) = msv(j, 1);
            elseif isnan(msv(j, 1)) 
                s(j, k) = 0;
            end
        
            for p=1:1:size(mb,2)
                if not(isnan(mb(j, p)))
                    b(j, p, k) = X(mb(j,p), k);
                elseif isnan(mb(j, p))
                    b(j, p, k) = 0;
                end
            end
            for p=1:1:size(mcwv,2)
                if not(isnan(mcwa(j, p)))
                    cw(j, p, k) = X(mcwa(j,p), k);
                elseif not(isnan(mcwv(j, p))) 
                    cw(j, p, k) = mcwv(j, p);
                elseif isnan(mcwv(j, p)) 
                    cw(j, p, k) = 0;
                end
            end
            for m=1:1:nocf
                if not(isnan(mcfwa(j, m)))
                    cfw(j, m, k) = X(mcfwa(j, m), k);  
                elseif not(isnan(mcfwv(j, m))) 
                    cfw(j, m, k) = mcfwv(j, m);   
                elseif isnan(mcfwv(j, m)) 
                    cfw(j, m, k) = 0;
                end
            end
            for p=1:1:nocfp  
                for m=1:1:nocf 
                    if not(isnan(mcfpa(j, p, m))) 
                        cfp(j, p, m, k) = X(mcfpa(j, p, m), k);  
                    elseif not(isnan(mcfpv(j, p, m))) 
                        cfp(j, p, m, k) = mcfpv(j, p, m);
                    elseif isnan(mcfpv(j, p, m)) 
                        cfp(j, p, m, k) = 1;
                    end
                end
            end
        
            for m=1:1:nocf
                    cfv(j,m,k) = bcf(mcf(m), squeeze(cfp(j, :, m, k)), squeeze(cw(j, :, k)).*squeeze(b(j, :, k)));
            end
        
            aggimpact(j, k) = dot(cfw(j, :, k), cfv(j, :, k))/sum(cfw(j, :, k));
            X(j,k+1) = X(j,k) + s(j,k)*(aggimpact(j,k) - X(j,k))*dt;

            t(k+1) = t(k)+dt;
       end
    end
    
    for j=1:length(stateselection)
        for i=1:length(timepoints)
            Y(j,i)=X(stateselection(j),1+round(timepoints(i)/dt));
        end
            model_data = Y;
    end
    [e_row,e_col] = size(empirical_data);
    RMSE = sqrt(nansum(nansum((model_data - empirical_data).^2))/(e_col * e_row)); %average deviation
    
    if plot
        calculateResults(t, X, timepoints, empirical_data, person_index);
    else 
        AddtoOutput(RMSE, P);
    end
end

function AddtoOutput(RMSE, P)
    global tuningNumbers
    tuningNumbers=[tuningNumbers; [RMSE P]];
end


function calculateResults(t, X, timepoints, empirical_data, person_index)
    figure('Visible', 'on', 'Units', 'pixels', 'Position', [100, 100, 1000, 500]);
    clf;
    hold on;
    xlim([0,1000]);
    ylim([0,1]);
    
    colors_baselevel = lines(6);  % Define consistent color map
    
    % Adjust depending on which states you want to plot 
    h1 = plot(t, X(1,:), 'Color', colors_baselevel(1,:),'LineWidth',1.0);
    h2 = plot(t, X(5,:), 'Color', colors_baselevel(2,:),'LineWidth',1.0);
    h3 = plot(t, X(6,:), 'Color', colors_baselevel(3,:),'LineWidth',1.0);
    h4 = plot(t, X(7,:), 'Color', colors_baselevel(4,:),'LineWidth',1.0);
    h5 = plot(t, X(9,:), 'Color', colors_baselevel(5,:),'LineWidth',1.0);
    
    h6 = plot(timepoints, empirical_data, 'o', ...
              'Color', colors_baselevel(5,:), ...
              'MarkerFaceColor', colors_baselevel(5,:), ...
              'MarkerSize', 10);
    
    legend([h1, h2, h3, h4, h5, h6], {'ws_s','fs_{b.reward}', ...
        'fs_{b.discomfort}','fs_{b.craving}','es_{a.eng}', ...
        'data for es_{a.eng}'},'FontSize',15,'Location','northwest');
    
    fig_title = ['Model fitted to empirical data of person ' num2str(person_index)];
    
    xlabel('iterations', 'FontSize', 15);
    ylabel('state value', 'FontSize', 15);
    title(fig_title , 'FontSize', 16);

    exportgraphics(gcf, [fig_title  '.eps'], 'ContentType', 'vector');
end