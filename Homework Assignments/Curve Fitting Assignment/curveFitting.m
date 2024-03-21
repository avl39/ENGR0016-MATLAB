% Curve fitting script to find best fitting polynomial for a datafile


fileName = input('Enter the filename within single apostrophes as [FILENAME.ext]');
file = importdata(fileName)

cheaders = file.colheaders;
data = file.data;
x = data(:,1);
y = data(:,2);

for i = 1:4
    [p, S] = polyfit(x, y, i);
    rSquaredCompare(i) = S.rsquared;
end

