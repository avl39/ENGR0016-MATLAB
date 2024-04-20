# ENGR 0016: Intro to Engineering Analysis Final Exam Review

## README

This is supposed to be a study guide for what I expect to be on the final exam. It might not cover every single topic that will be on the exam because I'm not a fortune teller, but this should serve as a pretty good template for what you want to be studying for the final exam.

Don't take everything that's in there as gospel. I will do my best to make sure there are no errors in this document but it is almost inevitable that something will slip through the cracks. If you want to, you can use this document as your way of studying or reviewing content. There will be no practice problems in this document so be aware of that. If you do want practice, my recommendation would be to rebuild your scripts from prior assignments, namely the curve fitting assignment and the curve fitting script. Those two are most likely the scripts that we will need on the final so making sure that those scripts are relatively robust is important so you don't spend time trying to rebuild them during the exam. If you need examples for any of those scripts, they can be found in the [homework folder](https://github.com/avl39/ENGR0016-MATLAB/tree/main/Homework%20Assignments) in their respective folders.

This study guide is going to be split into several sections, one section for each topic that Dr. Kropf mentioned in class on 18.4.24. Again, this is not an exhaustive list of all of the things that you should know, just a starting point for where to start studying. If you need more resources/review on each of the topics covered in class, see my [Notes](https://github.com/avl39/ENGR0016-MATLAB/blob/main/Resources/Notes.md) in the GitHub repository. Good luck and happy studying!

## Functions to Know

This section can't contain every function you need to know for the exam. I'm going to try to cover the majority of the functions that you might need on the exam, but by no means is this an exhaustive list. If you want (almost) every function that we've covered in class, check out the [Term Master List](https://github.com/avl39/ENGR0016-MATLAB/blob/main/Resources/Term%20Master%20LIst.md) or take a look at MATLAB's documentation.

This section won't cover your basic commands like `clear`, `clc`, and making vectors, but it will cover the other functions that we use almost every time we've used MATLAB at this point in the semester or functions that you really should get used to using.

- polyfit

        polyfit(x,y,n)

  Used to calculate the best fitting polynomial of a given degree, `n`.

- polyval

        polyval(p,x)

  Used to calculate the values of the polynomial `p` at given points `x`. Use in conjunction with the `polyfit` function to create and evaluate a polynomial for things like curve fitting

- importdata

        importdata('FILENAME.ext')

  Used to import data. Creates a structure object where you can pull `data`, `colheaders`, and `textdata` by typing `var.memberName`

- audiowrite

        audiowrite(filename, y, fs)

  Creates an audio file with the specified file name with points at `y` with a sample rate frequency of `fs`. See the [audio section](https://github.com/avl39/ENGR0016-MATLAB/blob/main/Resources/Study%20Guides/Final%20Exam%20Study%20Guide.md#audio-files-and-the-nyquist-criterion) for more info on sample rate and audio stuff.

- audioread

        [y,fs] = audioread(filename)

  Takes an audio file and pulls the sample rate frequency, `fs`, and the graph of the audio file, `y`

- randn

        randn(n)

  Creates a matrix of randomly generated numbers. Can be used without the argument `n` to just generate a random number.

  If you use two arguments like so:

        rand(n,m)

  The function will generate a matrix with dimensions `n*m` filled with random values

- syms

        syms [symbol]

  Creates a `symbolic` object with value of `[symbol]`. Use to create expressions with mathematical variables.

- double

        double(m)

  Used to convert a value from a fraction into decimal form

- diff

        diff(v,t)

  Used to calculate the derivative of a value or function. This shouldn't be on the exam but it might be.

- int

        int(v,t)

  Used to calculate the integral of a value or function. This shouldn't be on the exam either but it might be.

- fplot

        fplot(y)

  Similar to the `plot` function but can be used to plot symbolic functions. Say if I have a symbolic function, $2x^3-4x^2+1$. If I wanted to plot that function without evaluating it, I could use the `fplot` function to do so. For instance:

        syms x
        y = 2*x^3-4x^2+1;
        fplot(y)

  This would plot `y` with the symbolic variable `x` on the `x` axis.

## Control Structures

Control structures are what make MATLAB more usable. They allow you to run nested code based on certain condtitions. This section will go more into depth on each control structure and when to use each one.

### if/elseif/else conditionals

Syntax Example:

    if a == b
        thing;
    elseif a == c
        thing2;
    else
        thing3;
    end

The `if` and `elseif` functions are used to run the nested blocks of code if and only if a certain condition is met. In the above example, the `if` statement will run if and only if the variable `a` is equal to the variable `b`. The `elseif` statement will run if and only if the variable `a` is equal to the varaible `c`. The `else` statement will run if the variable `a` is not equal to either the variable `b` or the variable `c`.

The `if`/`elseif`/`else` logical operators follow a top-down approach. If the first conditional is not met, the second conditional will be checked and so on and so forth. You can stack several `elseif` conditionals, but they must be preceeded by an `if` statement and the entire chain must be followed by an `end` statement.

Conditionals are useful if you have something that you only want to happen under specific circumstances, ie evaluating a variable and doing something based off of that input (think inputting yes or no on a website).

Traditionally, `if` and `elseif` statements are how you want to build scripts. They serve many purposes and can be very versatile if used properly.

It should be noted that conditionals will **only run once**. They will only run when the value for their argument is true, and only run once. After one of the control structures is run, it will evaluate the arguments for the rest of the conditionals and skip them if the conditional is false. They will not wait for a change, or continue while a value is true.

### For Loops

Syntax Example:

    for i = 1:10
        disp(i);
        i = 1+1;
    end

The `for` loop is used to run the nested code a certain number of times, controlled by an *iterative counter* variable. Iterative counter variables are simply variables that store a number that indicate how many times the loop has been run. These iterative variables are traditionally single characters such as `i` and `j` (`i` for index).

The `for` loop is useful because you can loop nested code a set number of times. They are especially helpful if you know the size or how many iterations you need to do something.

### While Loops

Syntax Example:

    j = input('Please input Yes or No', "s");
    while j = 'Yes'
        disp('Yes!')
        j = input('Please input Yes or No', "s");
        if j = 'No'
            break
        end
    end
    disp('No :<')

The `while` loop is useful for iterating while a certain condition is true. `while` loops can be thought of as `if` conditionals that repeat as long as the argument remains true. `while` loops will continue to run as long as their argument remains true, or if there is a `break` action triggered at any point inside of the loop.

### Why do we use Control Structures?

Control structures by themselves are very useful, but their primary use is in conjunction with one another. As shown by the example under the `while` loop section, the loops can be combined with the conditionals to create very robust scripts. For instance, you can use a `while` loop to index an array with values, then perform operations on that array using a `for` loop, then prompt the user for what they want to do with that operated data.

Take for instance, the fft bonus script. You can prompt the user for the file they want to analyze. You can use a `while` loop to index a cell array storing the data values from the audio files while also asking the user if they want to analyze more audio files. Inside of the `while` loop, you can use an `if` conditional with a `break` action to break the loop if the user chooses another option.

After you index all of the data, you can use a `for` loop to generate and plot the fft and spectrogram of each audio signal.

In that example, the `while` and `if` control structures work in conjunction with one another to make the script more robust while the `for` loop does all of the heavy lifting after the `while` and `if` control structures finish iterating.

## How to read Documentation

So we're allowed to use MATLAB's documentation on our exams. That means that we've got everything that we could need if you forget it, it's just a matter of knowing how to apply that knowledge. This section will try to cover how to read the documentation and how to apply it to your scripts.

When you open the documentation for a function, you'll see the function's name and the different arguments that it takes. If you're looking up a novel function because we're being told to use it during the final, you'll need to verify how the function is used and which version you want to use. As an example, I'll use the page for the `randn` function because that was introduced during Exam 2.

[Link to the randn function documentation](https://www.mathworks.com/help/matlab/ref/randn.html?s_tid=doc_ta)

On the page for `randn`, we see that it has 4 different syntax styles, with 3 modifiers. Typically, the syntax styles are seperated from the modifiers by one or two blank lines. Under the syntax, you will see the description for each syntax style and modifier, as well as what each one does. In this case, we see that the `randn` function can be called with no argument, 1 argument, or a multitude of arguments. We also see that the `randn` function can take the `'typename'` modifier, indicating that the produced values can be singles or doubles. We also see that it can produce simple or complex numbers using the `'p'` argument.

Below the syntax and description section, there are examples of each syntax form as well as the modifiers. This is the section that we care about. Generally, when you assess how you want to use a new function, the thought process goes as follows:

1. Understand your question

    1. What is the question asking you to do?
    2. How will this function help you achieve that goal?

2. Understand the function

    1. What does this function do?
    2. How is applicable? (see 1.2)

3. Apply the function

    1. Which example is most similar to how I want the function to work for me?
    2. How should I implement this?
    3. Where should I implement this?

Arguably, questions 3.2 and 3.3 are the most important questions to be able to answer. It doesn't matter if you know how the function works if you don't know what you're applying the function to. Likewise, it doesn't matter if you know where you're applying the function if you don't know *how* to implement the function.

For the question on Exam 2 where we had to add noise to our dataset, we would define a matrix with the same dimensions as our dataset and apply a random value filter to that dataset, ie:

    var = importdata('filename');
    x = var.data(:,1);
    y = var.data(:,2);
    yrand = y+randn(length(y),1);

In this scenario, we imported the data into MATLAB, then applied the noise using `randn`. I used `length(y)` instead of declaring the length of the vector because in this scenario, I don't know how long the vector `y` is.

## Audio Files, the Nyquist Criterion, and Data

This section aims to be a brief overview on how we should deal with audio in MATLAB as well as another review of the Nyquist Criteria. There is also a brief section at the end covering how data works in analog and digital systems.

### Audio Files

Audio files are composed of periodic functions (think sine and cosine) with certain varying frequencies. These varying frequencies are what we hear and perceive as different tones. In MATLAB, we can generate audio files using the `audiowrite` function. More applicable to the exam, we can analyze audio files inside of MATLAB using the `audioread` function.

The `audioread` function imports an audio file, typically a .wav file in our case, and parses both the amplitudes at a given time t, but also the sample rate frequency of the audio file. The amplitudes generated by the `audioread` function allow us to perform analysis on the audio file using a Fast Fourier Transform, `fft`, and spectrograms.

FFTs allow us to analyze what audio signals are present at a given point in time, and a spectrogram allows us to analyze the strength of each of these signals, as well as how those signals change over time. In most audio files, an fft will not show a perfectly clean signal due to other frequencies being present in the recording, or noise. Spectrograms will mirror this artifacting, with not every tone that is not the most prominent tone not being perfectly absent.

### The Nyquist Critera

The Nyquist Critera is an inequality that states that the sample rate frequency of an audio device, $f_{s}$ must be greater than or equal two times the greatest playable frequency, $f_{b}$.

$$f_{s}\ge 2*f_{b}$$

An undersampled frequency will have missing datapoints and a signal constructed from that data will not mirror the true wave. Instead, there will be an expansion and contraction of the audio signal. Essentially, an undersampled signal will be missing a significant number of points and as such will result in an incorrect audio signal.

### Data

Digital objects store data in the form of *binary bits*, or a string of 1s and 0s. A *bit* refers to a single digit. A container can store a certain number of bits, and *bit depth* is the number of bits that any given container in a system can store. For instance, a 16-bit processor has containers that can store up to 16 bits at a given time.

The number of states that can be represented by any given bit container is given by the following function:

$$d = p^n$$

where $d$ is the number of possible states, $p$ is the number of possible positions of each bit, and $n$ is the bit depth of each container. The higher the bit depth of a container, or the higher *resolution* of each container, the more precise the data that can be stored in each container is.

When the resolution of an instrument is too low for a given sample, you lose precision in your dataset. You can think of each bit kind of like a significant figure. The less bits you have, the less precise your answer is. As such, if your *bitrate*, or resolution, is too low, you can start to see stepwise artifacting in your data. If you zoom in enough on any plot generated by an analog to digital converter, you will see this stepwise artifacting.

With the stepwise artifacting, the maximum number of steps present is equal to the maximum number of bits.

## Scripts to Have Built

This section will briefly go over the scripts that you should have finished before the final exam. If you need examples, all of my scripts are in the GitHub repository, and each script is linked in its respective subsection.

### Curve Fitting Script

The curve fitting script is designed to take in a dataset and spit out a graph with a line of best fit of a certain order polynomial. Ideally, this script will be robust enough to accept a user input on what order polynomial the user would like to examine up to.

[My script](https://github.com/avl39/ENGR0016-MATLAB/blob/main/Homework%20Assignments/Curve%20Fitting%20Assignment/curveFitting.m) does not take a user input for the order polynomial but does return an R^2 value for the line of best fit. I really should add that input, it's one line of code but I can't be bothered.

### FFT/Spectrogram Scripts

The FFT/Spectrogram script(s) are designed to parse an audio file and generate one (or more) ffts and spectrogram plots for each audio file. They could be in seperate figures or in the same figure with subplots, it's really up to you.

[My script](https://github.com/avl39/ENGR0016-MATLAB/blob/main/Homework%20Assignments/Audio%20Signals/givingUp.m) is designed to take 1 or more audio files and spit out an fft and spectrogram for the audio file in subplots (yes it's called giving up, I finished it at like 2 in the morning, leave me alone). The code from lines 8 through 26 are just the user-facing part, getting the name of the audio files and storing the data. The `while` loop starting at line 30 is where the real number crunching begins. The FFT and spectrogram are basically pulled directly from the documentation but can be edited as needed to change how the graphs look.
