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

This section will cover general functions that will most likely be on the exam. I haven't seen the exam yet so I cannot guarantee that all of these will be on the exam or it will have ALL of the terms that will be on the exam, but this should cover a majority of them.

1. polyfit

2. polyval

3. root

4. roots

5. audiodevinfo

6. audiowrite

7. audioread

### Variable Types and When to Use Each One

MATLAB has various different variable types, each of which has their own usecases. This section will detail each variable type and explain when to use each, sorted into subcatagories based off of the variable's classification type.

1. Scalars

    1. Doubles/Floats

    2. Characters

    3. Strings

    4. Booleans

2. Arrays

    1. Vectors

    2. Matricies

    3. Cell Arrays

    4. Structures

## Importing Data

- How to import data
- How to analyze data
- Curve fitting using polyfit and polyval
- Plotting data with confidence intervals

## Time-Based Signal Analysis
