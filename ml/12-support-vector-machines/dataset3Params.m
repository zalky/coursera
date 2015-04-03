function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

C_vec = sigma_vec = [0.01 0.03 0.1 0.3 1 3]';
[C_V, sigma_V] = meshgrid(C_vec, sigma_vec);
error_train = zeros(size(C_V));
error_val = zeros(size(C_V));

for j = 1:length(sigma_vec)
  for i = 1:length(C_vec)
    printf('Training with C = %f, and sigma = %f\n', C_V(i, j), sigma_V(i, j));
    model = svmTrain(X, y, C_V(i, j), ...
                     @(x1, x2) gaussianKernel(x1, x2, sigma_V(i, j)));
    error_train(i, j) = mean(double(y ~= svmPredict(model, X)));
    error_val(i, j) = mean(double(yval ~= svmPredict(model, Xval)));
  end
end

[i, j] = find(error_val == min(min(error_val)));

printf('Error minimized with C = %f, and sigma = %f.\n', ...
       C_V(i, j), sigma_V(i, j));

C = C_V(i, j);
sigma = sigma_V(i, j);

end
