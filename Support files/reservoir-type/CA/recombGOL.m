%% recombGOL.m
% function to recombine/infect an individual to create the new Game of Life offspring reservoir. 

% This is called by the @config.recombFcn pointer.

function loser = recombGOL(winner,loser,config)

% params - input_scaling, leak_rate,
W= winner.input_scaling(:);
L = loser.input_scaling(:);
pos = randperm(length(L),ceil(config.rec_rate*length(L)));         
L(pos) = W(pos);
loser.input_scaling = reshape(L,size(loser.input_scaling));

W= winner.leak_rate(:);
L = loser.leak_rate(:);
pos = randperm(length(L),ceil(config.rec_rate*length(L)));         
L(pos) = W(pos);
loser.leak_rate = reshape(L,size(loser.leak_rate));

W= winner.time_period(:);
L = loser.time_period(:);
pos = randperm(length(L),sum(rand(length(L),1) < config.rec_rate));         
L(pos) = W(pos);
loser.time_period = reshape(L,size(loser.time_period));

W= winner.boundary_condition(:);
L = loser.boundary_condition(:);
pos = randperm(length(L),sum(rand(length(L),1) < config.rec_rate));         
L(pos) = W(pos);
loser.boundary_condition = reshape(L,size(loser.boundary_condition));

% rules
W= winner.birth_threshold(:);
L = loser.birth_threshold(:);
pos = randperm(length(L),ceil(config.rec_rate*length(L)));         
L(pos) = W(pos);
loser.birth_threshold = reshape(L,size(loser.leak_rate));

W= winner.loneliness_threshold(:);
L = loser.loneliness_threshold(:);
pos = randperm(length(L),ceil(config.rec_rate*length(L)));         
L(pos) = W(pos);
loser.loneliness_threshold = reshape(L,size(loser.leak_rate));

W= winner.overcrowding_threshold(:);
L = loser.overcrowding_threshold(:);
pos = randperm(length(L),ceil(config.rec_rate*length(L)));         
L(pos) = W(pos);
loser.overcrowding_threshold = reshape(L,size(loser.leak_rate));

% cycle through sub-reservoirs
for i = 1:config.num_reservoirs
    
    % input weights
    W= winner.input_weights{i}(:);
    L = loser.input_weights{i}(:);
    pos = randperm(length(L),ceil(config.rec_rate*length(L)));         
    L(pos) = W(pos);
    loser.input_weights{i} = reshape(L,size(loser.input_weights{i}));
       
    % input widths
    W= winner.input_widths{i}(:);
    L = loser.input_widths{i}(:);
    pos = randperm(length(L),ceil(config.rec_rate*length(L)));         
    L(pos) = W(pos);
    loser.input_widths{i} = reshape(L,size(loser.input_widths{i})); 
    
end

% for output weights
if config.evolve_output_weights
    W= winner.output_weights(:);
    L = loser.output_weights(:);
    pos = randperm(length(L),ceil(config.rec_rate*length(L)));         
    L(pos) = W(pos);
    loser.output_weights = reshape(L,size(loser.output_weights));
end
