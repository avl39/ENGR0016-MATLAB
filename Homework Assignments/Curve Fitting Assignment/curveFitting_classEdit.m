% Curve fitting script to find best fitting polynomial for a given datafile

% Clear workspace
clear
clc

% Initialize imported file and filename
fileName = input('Enter the filename within single apostrophes as [FILENAME.ext]');
file = importdata(fileName);

% Parse imported file for data labels and values
cheaders = file.colheaders;
data = file.data;
x = data(:,1);
y = data(:,2);
input = input('What order polynomial would you like to check up to? ')


% Find line of best fit for data values up to a fourth-order polynomial
for i = 1:input
    [p{i}, S] = polyfit(x, y, i);
    r = 1 - (S.normr/norm(y-mean(y)))^2;    % Calculate R^2 values for each polynomial
    rSquaredCompare(i) = r;                 % Store R^2 values in a vector called rSquaredCompare
end

% Find the best fitting polynomial function and plot it
[M, j] = max(rSquaredCompare); % Pull out the location(degree) of the polynomial with the best R^2 value

text = ['polynomial of order ', num2str(j), 'with R^2 value of', num2str(rSquaredCompare(j))];
disp(text)

plot(x,y,'o', x, polyval(p{j},x)) % Plot the imported data against the line of best fit
legend('Imported Values', 'Polynomial line of best fit')
xlabel(cheaders(1))
ylabel(cheaders(2))