# Avery Law ENGR 0016: Intro to Engineering Computing with Dr. Matthew Kropf: Exam 2 Study Guide

## General Script Writing

### Control Structures

Control structures influence how your script is run/processed. They can cause sections of your script to be run repeatedly or skipped depending on certain conditions present in the argument. This section will go over the control structures relevant for this exam.

1. If/Elseif/Else

    - Syntax

            if [ARGUMENT]
                CODE
            elseif [ARGUMENT]
                CODE
            else
                CODE
            end

    - Usage
      - The `if` control structure runs the nested code if the conditions detailed in the argument are met.
      - The `elseif` control structure **must** be used in conjunction with the `if` control structure. It evaluates an argument if and only if the preceeding `if` statement is false.
      - The `else` control structure **must** be used in conjunction with the `if` control structure. It runs if and only if the preceeding `if` and `elseif` statements are false.
        - Unlike the `if` and `elseif` statements, the `else` statement does not take an argument and runs whenever the preceeding statements are skipped.
      - Should be used when evaluating some kind of statement, ie a user input or what iteration a loop is on.

    - Example:

            userInput = input('Please enter your age: ');

            if userInput < 18
                disp('Under 18')
            elseif userInput > 18
                disp('Over 18')
            elseif userInput == 18
                disp('18');
            else
                disp('Not a number, please try again')
                userInput = input('Please eneter your age: ');
            end

2. While

    - Syntax

            while [ARGUMENT]
                code
            end

    - Usage
      - The `while` loop runs the nested code as long as the argument is true.
      - It differs from an `if` statement in that it always evaluates the argument while `if` statements only evalute the argument once.
        - `while` loops will break once the argument is false whereas `if` statements will continue after they finish execution.

    - Example

            Yes = "Yes";

            while choice == Yes
                choice = input('Please input Yes or No', "s");
                disp('Yes!')
            end

3. For

    - Syntax

            for [ARGUMENT]
                code
            end

    - Usage
      - The `for` loop runs a certain number of times, indicated by the argument of the `for` loop.
      - It operates similarly to a `while` loop but instead of running for an extended period of time, it automatically iterates a certain number of times
      - Typically, `for` loops are used with an iteration, or index, variable (i,j,k) which track the number of times a `for` loop has been run.
        - `for` loops are typically run until that index variable is equal to a certain number of iterations, say for every value inside of a vector.

    - Example

            i = length(var);
            for j < i
                T(j) = 1/var(j);
            end

        This is a pretty bad example I won't lie. I can't think of a better example off the top of my head right now

### Boolean Operators & Boolean Logic

Boolean operators are what allow control structures to work. Boolean operators compare two arguments and give a `TRUE` or `FALSE` output based on the arguments. Different boolean operators have different processes that determine their output. This section will cover the most common boolean operators that you might need

1. ==

    - Syntax

            [ARGUMENT1] == [ARGUMENT2]

    - Usage
      - Used to compare two objects. The output will only be TRUE if the two objects are exactly identical.
      - Can be used to compare scalars, arrays, chars, strings, and any other variable type

    - Example

            if a == b
                disp('Equal')
            else
                disp('Not Equal')
            end

2. &&

    - Syntax

            [bool1] && [bool2]

    - Usage
      - Used to link two boolean operations together.
      - Operates the same way that an AND gate operates.
      - Will output a `TRUE` value if and only if both boolean operations are `TRUE`
        - If one or both of the boolean operations are `FALSE`, the output will be `FALSE`.

    - Example

            if a==b && b > C
                disp('Yes!')
            else
                disp('Yikes')
            end

3. ||

    - Syntax

            [bool1] || [bool2]

    - Usage
      - Used to link two boolean operations together.
      - Operates in the same way that an OR gate operates.
      - Will output `FALSE` if and only if both boolean operations are `FALSE`
        - If one or both of the boolean operations are `TRUE`, the output will be `TRUE`

4. <, >, <=, and >=

    - Syntax

            bool1 = a < b;
            bool2 = a > b;
            bool3 = a <=b;

    - Usage
      - Used to compare two values
      - They operate the same way you would expect them to operate.
        - `[ARG1]<[ARG2]` takes two arguments. If the left argument is less than the right argument, it outputs `TRUE`. Otherwise, it outputs `FALSE`.
        - `[ARG1]>[ARG2]` takes two arguments. If the left argument is greater than the right argument, it outputs `TRUE`. Otherwise, it outputs `FALSE`.
        - `[ARG1]<=[ARG2]` takes two arguments. If the left argument is less than or equal to the right argument, it outputs `TRUE`. Otherwise, it outputs `FALSE`.
        - `[ARG1]>=[ARG2]` takes two arguments. If the left argument is greater than or equal to the right argument, it outputs `TRUE`. Otherwise, it outputs `FALSE`.

### General Functions to know

This section will cover general functions that will most likely be on the exam. I haven't seen the exam yet so I cannot guarantee that all of these will be on the exam or it will have ALL of the terms that will be on the exam, but this should cover a majority of them. If you notice a function that should be in this section that isnt, namely the `fft`, `spectrogram`, and `importdata` functions, those all have their own dedicated subsections in this study guide.

1. polyfit

    - Syntax

            polyfit(x,y,n);

    - Usage
      - Used to find the best fitting polynomial with degree `n`.

2. polyval

    - Syntax

            polyval(x,y);

    - Usage
      - Used to evaluate a polynomial where `x` is the coefficients of the polynomial in descending order

3. root

    - Syntax

            root(x,y);

    - Usage
      - Used to find the symbolic roots of a function.
      - Will not numerically solve for the roots of the function.

4. roots

    - Syntax

            roots(x);

    - Usage
      - Used to find the numerical roots of a function.
      - Will return both the real and nonreal roots to the function.

5. audiodevinfo

    - Syntax

            audiodevinfo

    - Usage
      - Used to find the IDs of all audio equipment that the computer is interfacing with.
      - Will return information regarding all audio inputs and outputs.

6. audiowrite

    - Syntax

            audiowrite(filename, y, fs);

    - Usage
      - Used to create an audio tone with name `filename` represented by the vector `y` with audio sample rate `fs`
      - When generating a .wav file, make sure the amplitude of your function does not exceed a value of $\pm 1$. wav files do not support amplitudes greater than $\pm 1$.
      - To generate an audio signal with more than one tone present, add multiple periodic functions.
        - Make sure that you add a coefficient before each period function equal to $1/n$, where $n$ is the number of individual tones that you want to represent in your audio file.

    - Example 1: Single Tone

            fs = 44100;
            t = 1:1/fs:2;
            freq = 1000;
            y = sin(2*pi*freq*t);

            audiowrite('1kTone.wav',y,fs);

    - Example 2: Dual Tone

            fs = 44100;
            t = 1:1/fs:2;
            freq1 = 1000;
            freq2 = 2500;
            y = 0.5*sin(2*pi*freq1*t)+0.5*sin(2*pi*freq2*t);
            audiowrite('dualTone.wav',y,fs);

7. audioread

    - Syntax

            [y,fs] = audioread(filename)

    - Usage
      - Used to pull data from an audio file.
      - Returns the sampled data and frequency as `y` and `fs`, respectively.

    - Example

            [y,fs] = audioread('1kTone.wav');

### Variable Types and When to Use Each One

MATLAB has various different variable types, each of which has their own usecases. This section will detail each variable type and explain when to use each, sorted into subcatagories based off of the variable's classification type.

1. Scalars

    Scalars are a datatype that can only hold one value at a time.

    1. Doubles/Floats/Integers

        An integer is a number value that has no decimal places.

        A float is a value type that can store any type of number with a bit depth of 32 bits. This means that floats can only store up to 32 digits at a time.

        A double is similar to a float in that it can store any number type. It differs from a float in its bit depth. A double can store up to 64 bits, meaning it can store up to 64 digits at a time.

        Doubles are the default number type in MATLAB. You don't really get a choice to use or not use a double because MATLAB stores every number as a double unless you decide to declare a number as a string.

    2. Characters/Strings

        Characters are a symbol that represents a letter, number, or symbol.

        In MATLAB, character arrays are created by enclosing text in single quotations, like so:

                char = 'Hello World!';

        Strings are containers for pieces of text. In MATLAB, strings can be operated on in the same way that data can be operated on.

        For our usecase, we tend to use character arrays more than we use strings.

    3. Booleans

        Booleans are simply TRUE or FALSE values. They are the result of logical comparisons or the arguments of control structures.

2. Arrays

    An array is a datatype that can store more than one value at a time. Normally, the values inside of an array must be of the same datatype (doubles, characters, strings).

    1. Vectors

        Vectors can store values in one dimension and one dimension only. They are represented by an array with dimensions of `nx1` or `1xn`.

    2. Matricies

        A matricies typically store values in two dimenisions. They are represented by an array with dimensions of `nxm` or `mxn`.

        Matricies can also be three dimensional, with dimensions of `NxMxP` or `MxNxP`. This is a more rare usecase but can be useful in some fringe scenarios. Generally stick to two-dimensional matricies.

    3. Cell Arrays

        Cell Arrays are a special type of array because the data in each cell can be a different datatype. A cell array could contain doubles, strings, and character arrays. Cell arrays can also store vectors and matricies within a cell.

    4. Structures

        Structures are not really arrays but can be grouped under this category. Structures contain `member` elements that group variables. Each `member` stores some kind of value or list of values

        For example, the function `importdata` takes some kind of text file, typically a .csv file, and breaks the data into `member` objects. To reference the `members` inside of a `structure` object, the reference will look something like this:

                variable = structure.memberName;

        This assigns the value of `variable` to the field `memberName` inside of the `structure` object.

## Importing Data

This section will focus on how to import and analyze data inside of MATLAB, with a primary focus on .csv datafiles.

### How to import data

To import data, the primary function to be used is the `importdata` function. As discussed prior, the `importdata` function creates a `structure` parent object with several child `member` objects.

With .csv files, the `importdata` function splits the .csv into 3 different `member` objects: the `data` member, the `textdata` member, and the `colheader` member.

When we import data into MATLAB, we want to focus on the `data` member. If we have a .csv file and want to perform some analysis on it, the code would look somewhat similar to this:

    importeddata = importdata('DATA1.csv');
    data = importeddata.data;
    headers = importeddata.colheaders;
    text = importeddata.textdata;

This code imports our .csv file, `DATA1.csv`, and creates a variable called `data` that contains the actual data from the .csv file. The headers from the .csv file are stored in a character array called `headers`, and the text data from the .csv is stored in a character array called `text`.

### Analyzing Data in MATLAB

There are a few tools that we can use to analyze data inside of MATLAB. The quickest and most useful tools to analyze data inside of MATLAB are the `roots`, `polyfit`, and `polyval` functions. The roots function can tell us intercepts, and the `polyfit` and `polyval` functions help us find the line of best fit for the function.

Another very helpful tool in MATLAB is simply looking at the data on a plot. To plot the data in MATLAB, we can use the `plot` function. Assuming that the x values are in the first column and the y values are in the second column, our code will look something like this:

    x = data(:,1);
    y = data(:,2);
    plot(x,y)

This code creates two vectors, `x` and `y` with the values in each column, then plots them against one another. `polyval` and `polyfit` start to fall apart when the function to be analyzed is periodic function or when the function isn't a polynomial function.

### Curve Fitting using `polyfit` and `polyval`

Both `polyfit` and `polyval` are very, very powerful tools for evaluating data. If you recall to earlier in the semester, one of our homework assignments was to create a line of best fit script up to a fourth-order polynomial. If you didn't do that homework, there is a sample script inside of the github that can be found [here](https://github.com/avl39/ENGR0016-MATLAB/blob/main/Homework%20Assignments/Curve%20Fitting%20Assignment/curveFitting.m).

This script will plot the imported data as well as the line of best fit. It will also display the order polynomial with the R^2 value into the command window.

If you need to do it manually, you can also use code that is similar to the following block, but I would recommend just having a premade script going into the exam just so you don't have to remember how to type all of this out.

    file = importdata(FILENAME.csv);
    data = file.data;
    x = data(:,1);
    y = data(:,2);

    for i = 1:4
        p(i) = polyfit(x,y,i);
    end

    for j = 1:i
        figure
        plot(x,y,'o',x,p(j))
    end

Note: This code is completely untested so use it at your own risk. Honestly, just refer to the link with my curve fitting assignment.

### Plotting Data with Confidence Intervals

The `polyval` function can also be used to plot a line of best fit with confidence intervals. Using the `S` structure that can be generated by the `polyfit` function, we can calculuate error estimates in a variable called `delta`. This example is pulled directly from the documentation, but be prepared to adapt the documentation's code to an example given on the exam.

    x = 1:100;
    y = -0.3*x + 2*rand(1,100);
    [p,S] = polyfit(x,y,1);

    [y_fit,delta] = polyval(p,x,S);

    plot(x,y,'bo')                                              % Plots generated data
    hold on
    plot(x,y_fit,'r-')                                          % Plots linear line of best fit
    plot(x,y_fit+2*delta,'m--',xmy_fit-2*delta,'m--')           % Plots linear line of best fit plus or minus 5%

The documentation uses `2*delta` because that corresponds to approximately a 95% prediction interval. `delta` corresponds to approximately 68% but is no less than 50%.

For the exam, be able to adapt this code to different data. Just remember the `delta` object that can be generated by the `polyval` function and that `polyval` can take the `S` struct from the `polyfit` function.

## Time-Based Signal Analysis

This section will cover various topics in the realm of audio, including Fast Fourier Transforms (ffts), spectrograms, and other audio-related jargon

### Audio and Data Jargon

1. Bit

    - A bit is a unit of data. In computer systems, a bit represents a binary digit, being a 1 or a 0. A bit is one of those digits.
    - It can be helpful to think of a bit as a single switch. Every switch has two positions, on or off (1 or 0).

2. Bitrate/Bit Depth

    - Bit depth is how many bits can be represented inside of a single variable.
        - To represent every value in a base-10 counting system, the minimum bit depth is 4.

        - Bit depth can be calculated by the function $$d = p^n$$ where $d$ is the number of possible bit combinations, $p$ is the number of positions possible, and $n$ is the bit depth.

        - Bit depth can be found from this function by taking the natural log of both sides then dividing $ln(d)$ by $ln(p)$ to get $$\frac{ln(d)}{ln(p)} = n$$

        - For normal digital computers, $p$ will ALWAYS equal 2 because the physical parts of the computer that control signal have two possible positions.

    - To continue the switch analogy, bit depth is how many switches in a row you can have. The more switches that you can have, the more possible combinations that are possible.

3. Sample Rate

    - The audio sample rate, often represented by $f_{s}$, is how many times per second a recording object takes a sample. Generally, a higher samplerate is better but there are diminishing returns past a certain point, defined by the **Nyquist Critera**

4. Nyquist Critera

    - The Nyquist Critera defines the sample rate that should be achieved by a recording object based off of the maximum expected frequency.
    - The equation $$f_{s}\ge 2*f_{n}$$ where $f_{s}$ is the sample rate frequency and $f_{n}$ is the highest expected frequency to be recorded.
    - For humans, the highest frequency we can hear is approximately 20kHz, or about 20,000 Hz, so very little audio equipment has to go above a sample rate of 44.1kHz or 44100 Hz.

### Fast Fourier Transforms

Fast Fourier Transforms, or ffts, are a form of audio analysis. In our application, they can be used to clean up noise in a signal and find the most prominent frequencies at a given time.

Any audio signal can be represented by some combination of sine and cosine waves at different frequencies. An fft works by comparing a lot of different sine and cosine wave combinations to the given graph at a given time interval and comparing the likeness between the two functions. It will continue this iteration until it satisfies an internal criterion (see [Notes.md](https://github.com/avl39/ENGR0016-MATLAB/blob/main/Resources/Notes.md#fast-fourier-transform-fft) for more info).

For our application, all you should need to know is how to make an fft, how to read an fft, how to make a signal based off of an fft, and what might change how an fft looks (noise).

To create an fft, you use the `fft` function. If I have a periodic function `y` represented by `y = sin(2*pi*1000*t)`, I can create an fft of `y` with no other data. I would use some code that looks similar to:

    transform = fft(y);

The fft of `y` will have a peak at 1000 Hz with minimal lines elsewhere. The fft will only look like this if the signal is perfect.

To create an audio signal based off of an fft, you first need to analyze what the fft looks like. Every major peak is a present frequency and the higher the peak is, the more prevalent the frequency is. We can use the `audiowrite` function to create an audio file based off of the fft.

The most prevalent signals are going to be the frequency inside of our `y` function and the 1 divided by the number of prevalent signals will be the coefficient for each periodic function. For instance, if we had 4 signals at 300 Hz, 600 Hz, 1000 Hz, and 2000 Hz, our `y` function would look something like:

    y = 1/4*sin(2*pi*300*t)+1/4*sin(2*pi*600*t)+1/4*sin(2*pi*1000*t)+1/4*sin(2*pi*2000*t);
