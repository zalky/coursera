function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

pos_i = find(y == 1); neg_i = find(y == 0);

plot(X(pos_i, 1), X(pos_i, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg_i, 1), X(neg_i, 2), 'ko', 'LineWidth', 2, 'MarkerSize', 7);

## % Labels and Legend
## xlabel('Exam 1 score')
## ylabel('Exam 2 score')

## % Specified in plot order
## legend('Admitted', 'Not admitted')

% Labels and Legend
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

% Specified in plot order
legend('Accepted (y = 1)', 'Rejected (y = 0)')
hold off;

end
