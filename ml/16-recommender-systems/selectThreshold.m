function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
  ## pval is a vector of probabilities, convert to a prediction vector
  ## based on epsilon
  prediction_val = pval < epsilon;
  truep = sum(prediction_val == 1 & yval == 1);
  falsep = sum(prediction_val == 1 & yval == 0);
  falsen = sum(prediction_val == 0 & yval == 1);
  precision = truep/(truep + falsep);
  recall = truep/(truep + falsen);
  F1 = 2*precision*recall/(precision + recall);
  if F1 > bestF1
    bestF1 = F1;
    bestEpsilon = epsilon;
  end
end

end
