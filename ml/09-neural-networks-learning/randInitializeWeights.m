function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%
%   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
%   the column row of W handles the "bias" terms
%

% You need to return the following variables correctly 
W = zeros(L_out, 1 + L_in);

% ====================== YOUR CODE HERE ======================
% Instructions: Initialize W randomly so that we break the symmetry while
%               training the neural network.
%
% Note: The first row of W corresponds to the parameters for the bias units
%

% From ex4.pdf: One effective strategy for choosing εinit is to base
% it on the number of units in the k. A good choice of epsilon is
% epsilon = sqrt(6)/sqrt(Lin + Lout), where Lin = s(l) and Lout =
% s(l+1) are the number of units in the layers adjacent to Theta(l)

epsilon = 0.12;

W = rand(L_out, 1 + L_in)*2*epsilon - epsilon;


% =========================================================================

end
