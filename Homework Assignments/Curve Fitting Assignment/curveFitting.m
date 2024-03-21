% Curve fitting script to find best fitting polynomial for a given datafile

% Initialize imported file and filename
fileName = input('Enter the filename within single apostrophes as [FILENAME.ext]');
file = importdata(fileName);

% Parse imported file for data labels and values
cheaders = file.colheaders;
data = file.data;
x = data(:,1);
y = data(:,2);

% Find line of best fit for data values up to a fourth-order polynomial
for i = 1:4
    [p, S] = polyfit(x, y, i);
    r = 1 - (S.normr/norm(y-mean(y)))^2;
    rSquaredCompare(i) = r;
end

% Find the best fitting polynomial function and plot it
[M, j] = max(rSquaredCompare);
plot(x,y,'o', x, polyval(polyfit(x,y,j),x))
legend('Imported Values', 'Polynomial line of best fit')
xlabel(cheaders(1))
ylabel(cheaders(2))