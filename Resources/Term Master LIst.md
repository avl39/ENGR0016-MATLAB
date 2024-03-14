# Avery Law ENGR 0016: Intro to Engineering Computing with Dr. Matthew Kropf

## MATLAB Term/Function Masterlist

### General Notes

This guide is divided into several sections -- MATLAB-specific commands and general programming commands as well as a style guide with some suggestions for formatting code. Use each of these sections as you will. It should operate as a reference moreso than a how-to, though feel free to reach out to me at <AVL39@pitt.edu> or to Dr. Kropf with any questions. There is also a small section at the end regarding common terminology that you might encounter should you continue your journey into programming.

This guide will not teach you how to program. While you *can* use it to learn how to program if you haven't been paying attention up to this point in the semester, I would recommend looking up some YouTube videos on how to use MATLAB for our applications.

Please use this guide as a starting point or a less convoluted version of the available MATLAB documentation. I find it easier to get through a more concise set of documentation than a webpage that I don't know how to get started with.

### Programming Best Practices

Here are some good habits to develop when programming. By no means is this an exhaustive list and most of this is my personal opinion from personal experience but take these as suggesstions and a starting point to develop some habits. If you're an ME/EE Major, these might be a little more relevant to you as if you do a lot of computer work in your professional life this is kind of where the fun begins.

- Comment your code
  - When writing code, try to add comments where you think it would be helpful. If you have a local function in a script, you don't need to comment every single line of code in that local function but add a comment just to signify what that function is supposed to do in the grand scheme of the script.

- Indent your code

  - When writing code try to make sure that your functions follow a nested whitespace structure. While it doesnt directly impact the functionality of your code it helps with legibility. Trying to read code that all has the same amount of whitespace is an actual headache. MATLAB is nice and autoindents some functions like `for` and `while` but doesn't indent `if` for some reason? Just get in the habit of indenting your code manually.

  - **IF YOU ARE DEFINING A FUNCTION IN A SCRIPT, IE USING `FUNCTION`, INDENT YOUR CODE.** Thank you! It helps so much with the legibility of your code. For instance, don't write

            % Define a function cooling for Newton's Law of Cooling

            function cooling = cooling(h,A,T,T0) 
            cooling = h*A*(T-T0)
            end

  instead, write:

            % Define a function cooling for Newton's Law of Cooling
            
            function cooling = cooling(h,A,T,T0) 
                cooling = h*A*(T-T0)
            end

  Using whitespace to control the placement of your code helps a tremendous amount with legibility. Most programming languages will autoindent definitions but MATLAB tends not to so get into the habit of indenting functions. Especially with nested control structures, you want to get into the habit of indenting your code so you can clearly see where each command structure begins and ends (This is a little bit of a pet peeve of mine, indent your code or I will find you).

- Try to make your code as efficient as possible

  - We all get bored easily. The less lines of code you have to write to make a functional script, the less the computer has to do and the less reading your peers have to do. Save us all a headache. It might take a little bit to fully optimize your code, but it really does help everyone.

  - Not to mention, the better optimized your code is the faster it will run on your machine. None of us enjoy sitting there doing nothing while we wait for our computers to compile and run code.

- Don't be afraid to ask for help

  - The MATLAB forums have solutions for basically everything. If you're confused about how to use a function, consult the documentation. If you don't know where to start on a problem, consult the forums. I can almost guarantee you that someone has had a similar problem to you before and has asked about it. They might not have the exact solution you're looking for but they offer a very helpful starting point.

  - Even outside of MATLAB, StackOverflow and github are both excellent resources. StackOverflow houses answers to so many questions and github houses a lot of programs and example code for you to use.

- Don't be afraid to use external resources

  - Programmers are like artists -- Good artists create but great artists steal. But don't steal. Always cite your sources for your code in your heading -- something along the lines of "parts borrowed from [USER]".

- Don't be afraid to take breaks

  - Programming can be really tedious and/or stressful depending on who you are. There is nothing wrong with taking a step back from your work, going for a walk or grabbing something to eat, and then coming back to it. We all get frustrated when we can't figure out a simple problem and getting space is a very good idea.

  - Related: don't burn yourself out. This work can be really fun and really rewarding when it works but you really have to go through the trenches to get there. Don't get overinvested into a project and overwork yourself into oblivion trying to solve a small problem in the grand scheme of things.

- Naming Conventions

  - Capitalization conventions

    - snake_case vs camelCase vs PascalCase

      - In snake_case, spaces in names are replaced with the underscore(_) character

      - In camelCase, the first letter of the first word in a name is left lowercase and every subsequent first letter is left in uppercase

      - In PascalCase, the first letter of every word is left uppercase

      - There is not one "right" capitalization convention(***do not use PascalCase***), but be consistent with your naming. I have a preference for camelCase because I think it's the fastest system to type and also looks the best but try them all out and find what works best for you (***DO NOT USE PASCALCASE I WILL FIND YOU***)

  - Variable Names

    - Make your variable names intuitive. If something is a user input, name it `userInput` or something along those lines. Make your life easier by making your variables clear and make everyone who's reading your code lives easeir by making so they can intuit what each variable is used for.

  - Constant, functions, and miscellaneous others

    - In the grander world of Computer Science/Computer Programming, constants are typically written in all uppercase. You don't have to follow this, but make sure your naming conventions are consistent.

    - Function names are typically written in all lowercase. Again, you aren't required to follow this but it is good practice to be consistent. Especially if you work with a bunch of computer science people be consistent.

    - In general, make sure the names of things are always intuitive. If, for example, there was a gravitational constant, I could use `g` for it because `g` is a widely used notation for gravity. If I have a function to calculate the drag experienced by a body, I could name that function `drago`, `dragforce`, or `dragForce`, not `function32415`. It seems like a small thing but it adds up in the long run. The less we have to interpret the better your code feels to read and build off of.

### MATLAB-specific functions

The meat and potatoes of this document, so to speak. Again, this is not an exhaustive list but contains most of the common commands that we have/will use in class. This list will start with the most basic commands in MATLAB and progress into the more niche commands that find less usage but are still within the realm of usability within our usecases. MATLAB has a cheat sheet of some commonly used functions and their syntax that can be found [here](https://www.mathworks.com/content/dam/mathworks/fact-sheet/matlab-basic-functions-reference.pdf).

- clear

  `clear` is used to clear all variables in the workspace. You can add an argument to `clear` to clear a specific variable ie

        clear var

  where `var` is the variable's name. Usually used in conjunction with the next command, `clc`

- clc

  `clc` is used to clear the command window. Not much usage outside of cleaning up your workspace but is still a good function to know.

- linspace

  `linspace` is used to create a vector of evenly spaced points. It can be useful in conjunction with the `plot` function to plot a function over a range of values.

  `linspace` differs from the vector creation operation `:` in that the `:` operation creates a list of points with the spacing of the second argument ie

        a = 1:1:10;

  will create points that range from the values 1 to 10 in increments of 1. The operation performed to create the vector `a` would look something like `a(1) = 1`, `a(2) = a(1) + 1`, `a(3) = a(2) + 1`, etc.
  
  The `linspace` function, however, will create a number of values that are spaced evenly. If we take the same line of code,

        a = linspace(1,10,10);

  The operation will look something like `a(1) = 1`, `a(2) = a(1) + ((10-1)/10-1)`, `a(3) = a(2) +((10-1)/10-1)`, etc. `linspace` holds the advantage over the colon in that it will ***always*** include the arguments `x1` and `x2` whereas the colon will not always include `x1` and `x2`. It should be noted though, that if you want, lets say, 100 points between 1 and 10, you need to specify *n* as 101 instead of 100 because 1 and 100 are considered points in that set. Always account for that and set your *n* value to 1 more than how many points you want between your upper and lower bounds.

- plot

  `plot` plots one variable versus another. The first argument of the `plot` function is the variable you want on the X-axis and the second argument of the function is the variable you want on the Y-axis. The third and subsequent argument(s) of the `plot` function can be either another variable to plot on the X-axis, typically the same as the first argument.

  The third argument could also be a `linespec` argument which determines how the relationship between the x and y variables is displayed. `linespec` arguments include line color, point denotion(dots, boxes, circles, etc), or line style(dotted, dashed, dots and dashes, etc).

  The `plot` function can take theoretically an infinite number of arguments, plotting an infinite number of relationships all with different `linespec` arguments. MATALB will automatically interpret the third argument of the `plot` function and use that to determine if you are trying to plot another relation or adding a `linespec` argument.

- plot3

  The `plot3` function is used to plot the relationship between three different variables. It creates a three-dimensional graph with x, y, and z axes. You can set the dimensions, titles, and scale of these axes easily with their respective functions. The arguments of the `plot3` function are similar to the `plot` function in that the first argument is your x variable and the second argument is the y variable, but differs in that the third argument is not a `linespec` argument but your third variable. The `linespec` argument becomes the fourth (and potentially final) argument in the `plot3` function. It functions much the same as it does in the `plot` function.

  The same plotting tricks that can be done with the `plot` function can also be done with the `plot3` function. You can plot multiple lines, all with different data patterns, line widths, colors, etc. You can also animate them to convey time. One common usage for `plot3` graphs are to show a particle's motion in three-dimensional space, with the x, y, and z coordinates representing the particles coordinate at any time *t*, represented by the animation.

- figure

  the `figure` function creates a new figure element. Following uses of the `plot` function will write onto this new `figure` element instead of overwriting the previous plot on the previous figure element.

- hold

  `hold` is used in conjunction with the `plot` or `figure` functions. It allows following plots to be placed onto the same figure.

- legend

  The `legend` function adds a legend to your plot. Pretty straighforward. It provides another way to label your data for ease of accessibility. Generally, having a plot is a pretty good practice, especially if you have multiple datasets plotted on the same figure.

- pcolor

  The `pcolor` function is used to create a pseuodcolor plot. Typically, pseudocolor plots are used to convey the relationship between three or more sets of data. Some of their applications include topographical maps (displaying x and y coordinates as well as altitude) or temperature cooling graphs(displaying, x and y coordinates as well as temperature). Similar to the `plot` and `plot3` functions, `pcolor` plots can also be animated to show changes over time, and can be easier to read than `plot3` plots.

- colorbar

  The `colorbar` function is used in conjunction with the `pcolor` function. It gives a key to what the different colors on the `pcolor` plot mean.

- clim

  The `clim` function allows you to set the upper and lower bounds of your colorbar. When building a pseudocolor plot that deals with time, this function is especially important as if you animate without setting your color limits the color scale will change resulting in no visual change in your `pcolor` plot until the animation finishes.

  The `clim` function used to be known as `caxis` but this function is now depricated. If you type it into a script, MATLAB will throw an error recommending you to use the `clim` function instead. They have the exact same syntax and if you are looking at forum posts from before version R2022a released they will reference the `caxis` function instead of the `clim` function.

- shading/colormap

  The `shading` and `colormap` functions both deal with how the `pcolor` plot is displayed. The `shading` function deals with how the colors are seperated/combined and the `colormap` function determines what color scale the `pcolor` plot is displayed with.

- xlabel/ylabel/title

  Take a wild guess what `xlabel`, `ylabel`, and `title` do. They title either your figure or your axis. It should be noted that you can set a target object for all of these functions. In the case of a pseudocolor plot, you can title the colorbar with code that looks something like this:

        cb = colorbar;
        ylabel(cb, 'Color Bar Title'); 
  
  In this case, we set the `colorbar` object as our target and use the `ylabel` function to make the label for the function vertical instead of horizontal as it would be if we had used the `xlabel` function.

- input

  `input` prompts the user to type something into the command window and stores the input as a variable. `input` can either take a `string` or a `double` value. To tell MATLAB to store the input as a string, you must add the `"s"` argument to the end, ie:

        userIn = input("Prompt", "s")

  Without the `"s"` argument, MATLAB will try to store the user input as a double and that can lead to problems with reading the user's input.

- num2str/str2num

  the `num2str` function converts the argument from a number to a string. More specifically, it converts any real number into its alphanumeric counterpart.

  the `str2num` function does the inverse of the `num2str` function and takes a string and converts it into its numerical counterpart. It does this by converting each character into some combination of scalar values that converts into the character counterpart.

- str2double
  the `str2double` function, much like the `str2num` function converts a string into a numeric string but converts it into a double instead of a scalar value. This function is basically `str2num` on steroids. We don't really need to worry about it for our use case.

- function

  the `function` function is used to define a custom function. In a script, the function can be a global or a local function, being able to be called in the command line or only inside that script, respectively. Functions are usually defined for repetitive, multistep tasks.

- root

  the `root` function returns a symbolic representation of the roots of a polynomial. It doesn't numerically solve for the roots of the function and as such will not produce actual numbers for you to use, but will still create an array with representations of the roots of the function.

- roots

  the `roots` function, unlike the `root` function will numerically solve a polynomial. It will produce both real and nonreal answers so pay close attention to the second column of the `ans` variable as it details the imaginary portion of the answer.

- Trig functions

  MATLAB has built in handling for trig functions. It can handle all 6 trig functions and their hyperbolic variants. The arguments of the trig functions **must be in radians**, not degrees.

  To get the inverse of the trig functions, add `a` to the beginning of the trig function ie sin<sup>-1</sup>(x) == `asin(x)`, cos<sup>-1</sup>(x) == `acos(x)`, etc.

- exp

  the `exp` function is exponential function ie e<sup>[ARGUMENT]</sup>. Used to model exponential growth or decay.

- log

  the `log` function is the natural log function. Should not be confused for the regular log base in math. `log(x)` in MATLAB is the same as *ln(x)* not log<sub>x</sub>.

- log2 and log10

  `log2(x)` is mathematically the same as *log<sub>2</sub>(x)* and `log10(x)` is the same as *log<sub>10</sub>(x)*. These should not be confused with `log(x)` which is simply *ln(x)*

- nthroot

  the `nthroot` function does exactly what you would think it does. It solves for the nth root of your argument. It will only solve for the real roots of your argument and will not give an imaginary number.

- Logical Operators

  MATLAB has several boolean logical operators, detailed below. Logical operators have many usecases and it is worth the time looking into them and learning their truth tables.

  - &&

    `&&` is the same as the AND operator. It compares 2 arguments located on either side of the operator and compares them. The `&&` operator will only output the boolean value `TRUE` if both arguments are true and will output the boolean value `FALSE` if one or both of the arguments is false.
  - ||

    `||` is the same as the OR operator. It compares 2 arguments located on either side of the operator and compares them. The `~` operator will output the boolean value `TRUE` if one of the arguments is true and will only output `FALSE` if both arguments are false.

  - ~

    `~` is the same as a NOT gate. It takes a single argument and inverts its boolean value. If the argument is `TRUE`, the output will be `FALSE` and if the argument is `FALSE`, the output will be `TRUE`.

  - XOR

    The `XOR` operator takes two arguments on either side and compares them. It will output a boolean value of `TRUE` if and only if the two arguments have different values ie if the argument on the left is `TRUE` and the right is `FALSE` or vice versa. However, if both of the arguments have the same boolean value, ie both are `TRUE` or both are `FALSE`, the `XOR` operator will output a value of `FALSE`.

### General programming functions [TO DO]

Some general programming functions that can be found in other languages, maybe with different syntax but the general function is the same in all languages. These commands of course can be found in MATLAB and are very useful once things start to become more complicated.

- if

  The `if` function is used to check a parameter. It evaluates a boolean value, typically comparing two values, and runs if that condition is met. If the condition is not met, the contained code will be skipped.

- else

  The `else` function is used in conjunction with the `if` function. Typically, if the conditions of the `if` function is not fufilled the program will move to evaluate the next control structure, that being the `else` function.

  If the program skips the `if` statement, typically the `else` statement will always run.

- else if (elseif in MATLAB)

  The `elseif` function is a combination of the `if` and the `else` functions. It operates like the `if` function by evaluating some kind of statement, but also operates like an `else` statement by only evaluating that statement if the prior `if` statement is skipped.

- for

  The `for` loop does what it sounds like it does. It repeats the nested code as long as the argument remains true. Typically, `for` loops use some kind of variable to count the number of iterations (*i*, *j*, etc.). At the end of the nested code inside the `for` loop, the interval counter will increase by 1 (think `i = i+1;`).

- while

  The `while` loop is similar to the `for` loop in that it continuously runs the nested code while the argument remains true. It differs from the `for` loop in that it will not iterate automatically. `while` loops are useful for reading inputs. You can make a `while` loop act in the same manner as a `for` loop by making your argument a counting variable and adding the `i = + 1` line to the end of the `while` loop, ie

        i = 1;
        n = 1;
        x = 5;

        while i >= 10
          z(i) = x^n;
          n = n+1;
          i = i + 1;
        end

        disp('Done');

  In this example, the `while` loop iterates while `i` is less than 10, sets the value of the datapoint at the position `i` in the vector `z` equal to 5 to the power of `n`. After it sets that value in `z`, it increases the value of `n` by 1, increases the value of `i` by 1, then rechecks if `i` is still less than 10. If `i` is less than 10, it runs the loop again. If not, it ends the loop and displays the text "Done" in the command window.

### Common programming terms [TO DO]

Here you can find some common programming terms that are used regularly in various languages. While they might not hold the exact same in every language, for the most part their meaning is universal. The wording and purpose of each term might be a little bit different but again they typically mean the same or similar things.

- variable

  A `variable` is simply a string that stores an assigned value. A `variable` name could be a single `character` object or a `string` object and can store basically any datatype. Most coding languages allow `variable` definitions be to `character` objects, `string` objects, `scalar` objects, `array` objects, or `symbolic` objects.

  Typically you don't create a `variable` object purely out of numbers as your coding environment might treat that `variable` as a scalar instead of a `variable`. It is generally good practice to assign your variable names as `characters`(A, a, B, b, etc.) or `string` objects (A1, a1, B1, b1, etc.). Try to avoid common delimiters in your `variable` names as they can interfere with function `argument` objects or just cause problems.

  Variables are the bread and butter of every language. Without the ability to create variables, you cannot do anything in a given coding language.

- character

  A `character` is simply a single alphanumereic character. It could be a letter, a number, a symbol (punctuation), or a character in another language. Depending on your coding language, characters from languages other than English might be handled somewhat differently from how you expect. For safety, try to only use the Latin alphabet.

- string

  A `string` is a datatype consisting of `characters`. Specifically, a `string` is, well, a string of `characters` that are longer than just one `character`. Typically, `string` objects are words used to declare `variable` definitions or `variable` names.

  `character` objects become `string` objects when there is more than one `character` object adjacent to another. It should be noted that the **space character** is treated as a delimiter and cannot be contained in a variable name unless you indicate that it is part of a `variable` name by surrounding the `string` with double quotations, ie:

        string = "Hello World!"

- scalar

  A `scalar` is a variable that stores a single value. In the context of data handling, a `scalar` can be thought of as a single data point in a dataset with a row and column coordinate -- Think of a single cell in an Excel spreadsheet. Typically, `scalar` objects are treated as "arrays" with the dimensions of 1x1.

- vector

  A `vector` is a datatype that stores more than one value. In the context of data handling, a `vector` is treated as either a row or column that stores a number *n* of numbers. `vector` objects are refered to having the dimensions of `1*n` or `n*1`.

- matrix

  A `matrix` is a datatype that stores more than one value. In the context of data handling, a `matrix` is treated as having both rows and columns with the dimensions *n* and *m*. `matrix` objects differ from vectors in that one of their dimensions cannot be 1. *n* and *m* cannot equal 1, or the object is no longer a matrix.

  It should be noted that in MATLAB matricies can be three-dimensional and this opens up a lot of options in terms of plotting data relationships.

- array

  An `array` object is a datatype that stores more than one value. `vector` and `matrix` objects fall under the umbrella term of an `array` as an `array` is simply a multi-dimensional datatype. ie, it has the dimensions of *n* \* *m* where *n* or *m* can equal 1 but only one of its dimensions at most can equal 1.

- float

  A `float` is a datatype that is used to store numbers. `float` objects can store up to 32 bits of data and will typically do everything you need to store a number but begin to fall short when dealing with high degrees of precision ie numbers with a lot of decimal places.
  
- double

  A `double` is a precision datatype that can store a pretty large sized piece of data. For our usage, you can think of a `double` as a very precise number, more precise than the `float` datatype and is helpful for very precise calculations. `double` objects can carry double the place values that a `float` value can carry and thus is more precise. In MATLAB, the default number datatype is a `double`.

- argument

  An `argument` is simply the "input" of a function that it evaluates. Typically, `argument` objects are located inside parenthesis following function names and seperated by commas, although some languages will let you seperate arguments with whitespace(space).

- delimiter

  A `delimiter` is used to indicate where an input begins and ends. Some common delimiters include commas, spaces, pipes(|), slashes or backslashes, colons, tabs, and hashes(#).

  `delimiters` simply tell you where a piece of data starts and where it ends. They are especially pertinent in data handling as most instruments will use a `delimiter` to seperate readings.

### MATLAB-specific jargon [TO DO]

MATLAB has some terms that are specific to it. There aren't going to be very many terms in this section as MATLAB is pretty standard in terms of its terminology, but there are a couple.

- Cell Arrays

  Cell arrays are arrays that can store multiple datatypes in each of the cells. These cells cannot be directly operated on and the values inside the cells have to be called using cell referencing in order to operate on them.

  Other programming languages have something similar, Python has `numpy object arrays` which do a very similar thing but are somewhat limited in their usage and are not used as much (see this [link](https://stackoverflow.com/questions/40609838/what-is-the-equivalent-to-a-matlab-cell-array))

  Cell arrays are helpful to store multiple datatypes ie handling strings and arrays in the same array but that's about the extent of their usage. For handling a singular datatype, use an array as using a cell array to handle that data just adds another level of uneeded complexity. MATLAB's documentation itself recommends that you only use cell arrays to store multiple datatypes in the same array and to use a normal array for all other usecases.

### Editor's Notes - These are going to be pretty unhinged, be prepared

2.3.24 - I've been working on this for about 6 hours now and I'm slowly losing my sanity. Trying to type all of this from memory is a lot and I'm confusing a lot of syntax with Python. I also just prefer Python of MATLAB, I feel like for engineering there's a lot of overlap in the two program's capabilities. MATLAB definitely has a shallower learning curve but I feel like Python is more intuitive from a data handling perspective. the `numpy` and `pandas` libraries have basically everything you need for data science and working with filetypes in Python feels really really intuitive but maybe I'm just biased. I would recommend anyone who's reading this and feels up for the challenge to do some reading/learning on data handling with Python -- I used LinkedIn's Intro to Python course to learn the basics and then just used the `pandas` practice problems to get more familiar with the libraries. Those practice problems can be found [here](https://www.w3resource.com/python-exercises/pandas/index-data-series.php). If you do want to get started with Python, I'd recommend VSCode or Jupyter Notebooks as your IDE. You can build Jupyter Notebooks through VSCode(what I do) and then personalization from VSCode will carry into Jupyter, but I would only recommend VSCode if you are going to learn how to program in other languages. Jupyter Notebooks and VSCode have very similar capabilities but I prefer VSCode for its extension marketplace and overall visual approach. VSCode feels a little more streamlined than Jupyter Notebooks does to me and I enjoy the workflow more in VSCode than it Jupyter, though I haven't used Jupyter nearly as much as I have used VSCode.

8.3.24 - Aiming to get this out today. Everything is still pretty rough and there's a lot I still need to get done but I think this a good starting point. I'll probably finish this over break and upload an updated version with some edits and get mostly everything with the [TODO] marker done. Most of this has been done from memory with the exception of a couple of function definitions so it's a very real possibility that I missed something or messed something up. If you want to amend something you can shoot me an email or just leave a comment under the Canvas post and I'll do my best to amend it. I think for the most part I've hit everything that we've covered up to this point in the semester but it is a very real possibility that I missed something here. I did not comment on our use of ChatGPT because I feel like that is outside the scope of this document but if you would like to see that let me know.
