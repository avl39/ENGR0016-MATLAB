# Avery Law ENGR 0016: Intro to Engineering Computing with Dr. Matt, semi-professional skiier

## 4.9.24

### Do Now - Analyzing an FFT plots and Spectrograms

#### FFT Plots

- A larger spike represents a more prevalent frequency
- More noise/messiness in the fft represents more present frequencies

#### Spectrograms

- A frequency that changes over time will be represented in a spectrogram

## 4.4.24

### Do Now - Spectrogram example

Generate an audio wave and create a spectrogram based off of the audio wave

    fs = 44100;
    t = 0:1/fs:3;
    y = 0.5*sin(2*pi*1000*t)+0.5*sin(2*pi*2500*t);
    spectrogram(y,100,80,100,fs,'yaxis') % Pulled from documentation

Spectrograms show frequenccy relative to time

  Fast Fourier Transforms show frequency irrelevant to time

### Do Now part 2: Spectrogram with changing frequency

Generate a spectrogram of an audio wave that changes frequency over time without using chirp

- Since frequency changes over time, generate a vector $f$ that is a function of time

Example Code:

    fs = 44100;
    t = 0:1/fs:3;
    y = 0.5.*sin(2*pi*1000*t)+0.5.*sin(2*pi*1000.*t.^2);
    spectrogram(y,256,128,100,fs,'yaxis')

### Uh

- A perfect sine wave has a fourier transform of a perfect single line
  - The spectrogram is a single horizontal line at amplitude $A$
- A perfect pulse has a fourier transform of all frequencies with equal amplitude
  - The spectrogram is lots of lines

### Working with `spectrogram`

- First argument is the width of the window
  - The number of points displayed in each `fft` sample
  - Wider windows result in more artifacting for changing functions
- Second argument is the amount of overlap between each sample
  - The more overlap results in a smoother looking graph
  - More overlap also results in more uncertainty in interpreting the graph

## 2.4.24

### Do Now - Writing Audio

Write a script to generate a .wav file with two frequencies

- Need to define `fs`
  - Remember the Nyquist Critera
    - $f_{s}\ge 2f_{n}$

      Where $f_{s}$ is the samplerate and $f_{n}$ is the percieved sound

- Need to define frequencies of the two sounds
- Need to define a time vector, `t`

        fs = 44100;
        t = 0:1/fs:3;
        f1 = 100;                 % Frequency 1 at 100Hz
        f2 = 5000;                % Frequency 2 at 5000Hz
        omega = 2*pi;             % Angular Frequency Constant
        y1 = sin(omega*f1.*t);
        y2 = sin(omega*f2.*t);
        yHeard = 0.5.*y1+0.5.*y2;
        audowrite('twoTone1005kHz',yHeard,fs)

Import a .wav file into MATLAB and analyze it

      [audio,fs] = audoread('dualtone.wav');
      audio = audio';
      t = 0:1/fs:length(audio-1)./fs;             % Could also use t=1/fs:1/fs:length(audio);

### Fast Fourier Transform (`fft`)

- Computes the Fast Fourier Transform of the argument
- Can be used to clean up signals with noise
  - Electronics noise
  - Wind noise in recording

### Example of `fft` usage

    fs = 44100;
    t = 0:1/fs:3;
    f1 = 100;                 % Frequency 1 at 100Hz
    f2 = 5000;                % Frequency 2 at 5000Hz
    omega = 2*pi;             % Angular Frequency Constant
    y1 = sin(omega*f1.*t);
    y2 = sin(omega*f2.*t);
    yHeard = 0.5.*y1+0.5.*y2;
    audowrite('twoTone1005kHz',yHeard,fs)

    L = length(y1)
    Y1 = fft(y1);
    P2 = abs(Y1/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);

    f = Fs/L*(0:(L/2));
    plot(f,P1,"LineWidth",3)
    title("Single-Sided Amplitude Spectrum of S(t)")
    xlabel("f (Hz)")
    ylabel("|P1(f)|")

### How does fft work?

- Any signal can be created by some combination of sine and cosine waves
- $\sum_{n}a_{n}sin(f_{n}t)$
  - Tries to fit different sine waves of different frequencies to match the measured wave
  - Compares the simulated graph and the given graph
  - The amplitude, $a_{n}$ associated with the graph defines the fit of the line
    - The higher the value of $a_{n}$, the better fit the simulated graph
    - $a_{n}$ is similar to an R^2 value in graphing
    - The sum will iterate until $n$ is equal to half of your sample frequency, $f_{s}$.

### Spectrogram function

- Takes `fft`s for periods of time
- Can be plotted as a *waterfall* plot
  - 3 Dimensional plot
  - Every peak is a Fourier Transform

### Spectrogram and Instantaneous Frequency

- Can be used to track changes in frequency over time

## 28.3.24

### Audiodevinfo

- Parses the machine for audio drivers/device IDs
- Creates a `struct` with two fields
  - `input` field
  - `output` structure
    - has `name`, `DriverVersion` and `ID` fields

### Sound

- We hear frequencies (20Hz - 20kHz)
- Modeled by periodic functions (sine, cosine, etc.)
  - Periodic because they have 'periods'
    - How long it takes for a function to arrive at the same location, typically a peak or trough (node and antinode, respectively)
  - Frequency(f) is a function of the period(p)
    - $f = \frac{p}{t}$ where f is the frequency of the function in Hertz, p is the period of the function in seconds, and t is the duration being measured

### Modeling Sound

- Sine functions
  - Can be represented by $\pm a*sin(b(t+c))+d$
    - a is the amplitude
    - b controls the horizontal stretch(period)
    - c controls the horizontal shift
    - d controls the vertical shift
  - Can also be represented by $sin(\omega t)$ where $\omega$ is the angular frequency
    - $\omega$ is the angular frequency which can be calculated by $\omega = 2 \pi f$
- If your sample rate and frequency are desynced you can have "random" data
- Nyquist Critera $$f_{s} \ge 2f_{n}$$
  Where $f_{s}$ is the frequency sample rate and $f_{n}$ is the highest frequency signal that can be measured

### Writing sound with MATLAB

- Use the `audiowrite` function after creating a time and periodic function
  - The time vector has to have a point interval equal to your frequency sample rate

            t = 0:1/fs:3;

  - periodic function includes angular frequency

            omega = 2*pi*frequency;
            y = sin(omega.*t);

### Reading sound with MATLAB

- Use the `audioread` function with a .wav file
  - setting `audioread` equal to a vector gives you a sample rate and the amplitude of each point in the audio file
- To find the length of the audio file, take the length of the vector containing the amplitudes and divide it by the frequency sample rate
  - this will result in a time vector with 1 more than the actual number of time vectors

            [y,fs] = audioread('file.wav');
            t = 0:1/fs:(length(y)-1)/fs;

## 26.3.24

### Homework Review Troubleshooting

- Make a chart for inputs and expected outputs
  - Makes it easier to see what is and isn't what you expected

  |             | P         |`i`        |
  |:-----------:|:---------:|:---------:|
  |[a,b]        |2x1        |1          |
  |[a,b,c]      |3x1        |2          |
  |[a,b,c,d]    |4x1        |3          |
  |[a,b,c,d,e]  |5x1        |4          |

  The issue with this block is that the vector changes dimensions every time `i` iterates. To solve, create a cell array object to store all of the values

  When we store each of the arrays in the cell array, each `i` value is stored as its own object inside the cell array eg:

        a = [1,2];
        b = [1,2,3];
        c = [1,2,3,4];
        P{a,b,c};

### Yeah idk whats happening rn

- `y_delta` comes from the optional argument in `polyval(x,y,s)` and estimates the standard error
  - Can be used to calculate degree of certainty in a dataset/trendline

### Editing my code

Goals:

- Make more arbitrary(any order of polynomials)
  - Add field asking user for what order polynomial they want to find
  - Replace `4` in *line 18* with the user's input
  - Change `p` in *line 19* with `p{i}`
  - Replace `polyfit(x,y,j)` in *line39* with `p{j}`
- Cut out lines of code
  - Remove the `if` conditionals (it was so pretty with them though :<)

### How does the script break?

- Trig functions
- Poor/Random data
- Multi-dimensional plots
- Incomplete datasets
  - Some programs will automatically parse data for `NaN` values and delete the entry
- Sparse datasets

### Why Use MATLAB

- Batch fitting
- Confidence intervals
- Intro stats stuff?

## 21.3.24 polyfit function

### Do Now - polyfit

Use the `polyfit` function to find the best fitting polynomial function for the file `DATA1.csv`

    % Import data

    importdata("DATA1.csv");
    data = ans.data;
    x = ans.data(:,1);
    y = ans.data(:,2);
    
    % Begin plotting data

    figure
    plot(x,y,'o')                       % Plot the inital values from the .csv file
    hold on
    p = polyfit(x,y,2);                 % Use the polyfit function to find the line of best fit as a second-order polynomial
    y1 = polyval(p,x);                  % Create a new vector, y1, that is the function found by polyfit for the values of the vector x
    plot(x,y1)

Extra lines and variables can be cut out by nesting functions, ie:

    % Import data

    importdata("DATA1.csv");
    x = ans.data(:,1);
    y = ans.data(:,2);

    % Begin plotting data

    figure
    plot(x,y,'o');                      % Plot the initial values from the .csv file
    hold on
    y1 = polyval(polyfit(x,y,2),x);     % Use the polyval function to create a new vector, and specify the function as the polyfit function
    plot(x,y1)

## 19.3.24 - Data sampling and MATLAB

### What is Data?

- Data is numbers that we want to interpret and measure.

- Data has to be gathered (measured) by some kind of measurement tool that converts analog to digital data

  - The tool that is used to convert data is called an ADC, or Analog to Digital Converter

  - The ADC is what controls the bitrate, bit depth, etc.

- Every number measured gets converted to a binary bin. Every number has a distinct binary bin

- 4 is the minimum bit depth to express every digit in the base 10 counting system

  - Bit depth is the number of digits that a value can store

  - Determined by the function `d = p^n` where `d` is possible number of outputs, `p` is the number of possible positions (2 because binary has 2 possible values), and `n` is the necessary bit depth

    - To represent all numbers in the base 10 system, the minimum bit depth is 4 bits.

        > 10 = 2^n; n = 3.3219 ~ 4

  - The higher bit depth, the better quality the data -- Less rounding errors

    - Think of the resolution of a photograph -- The higher resolution the photo the more information you can get from the photo

### How do we interpret data?

1. Magnitude

    When the magnitude of data correleates directly to the phenomena that you are trying to measure

    Time does not play much of a role

2. Frequency Count Measurement

    When the magnitude of data and time correlate directly to the phenomena that you are trying to measure

### NDT - Non Destructive Testing

Non-Destructive Testing

- Visual Inspection

  Looking at the thing to see if there are any visual defects with it

- Dye Penetrant

  A dye is sprayed onto the structure, wiped off, then sprayed with an activator. The activator will leave some kind of residue on where the dye was not wiped off of

- Acoustic Inspection

  Ultrasound is projected into a structure. Disruptions to the recieved wave can be mapped and used to observe

### ... Ultrasound?

- Ultrasound pulses can be sent into a structure to measure internal fatigue/failure

  Ultrasound waves are reflected off of flaws inside the material as well as the back wall

  Generally the speed of sound within a material is known and that can be used to measure the location of an internal flaw

- The first peak is known as the "Main Bang"

### MATLAB

To import data into MATLAB, use the `importdata` function

- The `importdata` function imports data from a .CSV file located in your working directory

- Creates a `struct` object with 3 fields: a data field, a textdata field, and a colheaders field

- To reference data inside the `struct` object, the syntax is `structName.field(row,col)`

  If I had a structure object named `data` and I wanted to refer to the data point in Row 5 at Column 3, the syntax would look like:

        data = importdata("DATA1.csv");

        data.data(5,3)

- You can also initialize a new variable to house just your data values ie:

        importdata("DATA1.csv");

        data = ans.data;
  
  Then this data can be plotted ie

        importdata("DATA1.csv:);
        data = ans.data;
        plot(data(:,1),data(:,2))

## 7.3.24 - Control Structures - While loops

### Do Now - while loop

Create a `while` loop that does the same things as the following `for` loop

    for i = 1:11
        variable(i) = i^2;
    end

>       variable = 1:10;            % Predefine the vector for speed
>
>       i = 1;                      % set the first value for i
>
>       while 11 >= i               % Iterate whenever i is less than or equal to 11
>
>           variable(i) = i^2;      % Write the value of i^2
>
>           i = i+1;                % Add 1 of i and run it again
>
>       end

Expand this code so that it compares the vector created by the `for` loop and the `while` loops

>       i = 1;
>
>       for j = 1:11
>           variable(j) = j^2
>       end
>
>       while 11>=i
>           variable2(i) = i^2;
>           i = i+1;
>       end
>
>       if variable == variable2
>           disp('Equal')
>       else
>           disp('Not Equal)
>       end

### While Loops

- `while` loops evaluate a boolean argument and will run for as long as that boolean value is `TRUE`
- to make a `while` loop operate like a `for` loop, you need to manually iterate the counter, akin to `i++` in similar languages

### Exam Review

yeah I don't type fast enough to cover everything on the written portion, sorry

#### Question 10

Under what circumstances are function definitions created in a '.m file' or script recognized in the comand window as a function (ie they can accept input arguments and will create outputs)

> He was looking for the definition of a local function -- They can be created and will have outputs but will not be able to be called in the command window because they are local and not global

### Final Project overview

- Project Components:
  - Description of enginering problem and solution space
  - Development of Script/Function to perform analysis on:

    1. Theoretical Solutions (ie Equations describing the engineering problem)
    2. Data sets: numerical data describing the engineering problem
  - Presentation of results
    - Short technical writeup(3-4 pages) containing:

      1. Background of Egineering Problem
      2. Pertinent Descriptions of functions or routines used for analysis
      3. Results in the form of graphs/animations depicing analysis results
    - Technical presentation(5-6 slides, 5-7 minute presentation)

### Homework Review

#### Example 1, GPT generation

Issue: Could not get the color plot working

- Cooling_coefficient(k) was hardcoded after asking for the user input
- No call of `pcolor()` command
  - `pcolor` requires a matrix argument for the `c` value, no extra dimensions to plot

#### Example 2, GPT generation

- Defined the size of the object as 20x20, arbitary unit
- Established the number of steps
- GPT showed an object cooling to room temperature without using Newton's Law of Cooling
  - Created a linear relationship of the cooling
  - Cooling is an exponential relationship

### Where is GPT Useful?

- Explaining a concept
- Really good at concept
- Commented code is really helpful

### Where does it fall short?

- It often makes mistakes
  - Pseudoscience calculations (see example 2)
- It sometimes goes back on its work (see example 1)

## 5.3.24 - Control Structures - For loops

### Control Structures

Example code:

    for i = 1:length(altitude_m)
        for j = 1:length(velocity_range_mps)
            drag_force_N(i, j) = 0.5 * density(i) * velocity_range_mps(j)^2 * drag_coefficient * surface_area
        end
    end

`for` loops

- this block of example code (found in 29.2.24 - Example Code) is an example of nested `for` loops that iterate over the length of two vectors to generate every combination of values possible.

- `for i = 1:length(altitude_m)` iterates for every value of `i` between 1 and the length of the vector `altitude_m`
  - The inner `for` loop (`for j = ...`) will iterate a number of times equal to the length of the variable `velocity_range_mps`.
  - Once the inner `for` loop finishes iterating over every possible value in that range, the outer `for` loop (`for i = ...`) will add 1 to the value of the `i` and begin the process again
  - The entire process looks like adding 1 to the variable `j` until it hits the maximum length of the vector `velocity_range_mps` at which point `j` is reassigned to a value of 1 and `i` is assigned the value of `i+1`.

- Nested `for` loops are also very useful for multi-dimensional graphs
  
  - Nested `for` loops can be used to create plots of multiple variables versus one another with every single combination being possible, ie:

            for i = 1:length(var0)
                for j = 1:length(var1)
                    for k = 1:length(var2)
                        function(t)
                    end
                end
            end

    This example takes 3 different parameters and compares all possible values. In this example, `k` is iterated across all values within the length of `var2`, then this process is repeated across all values in `j`, which is then iterated across all values of `i`.

### How to read code

- Look for variables that you recognize in functions that you recognize

- Look for nested control structures that reference variables.

## 29.2.24 - while loops and for loops

### `while` loops

- `while` loops iterate over a certain duration

        while x > 3
            do [something]
    Where `x` is some variable that determines a duration
- Useful for running for extended durations with constant data input

    Think of when to turn on a thermostat - You want the heat to stay on when it's below your set temp but turn off when its above the set temp. The while loop could take data from a temperature sensor inside your house and control the heat that way

### `for` loops

- `for` loops iterate over a certain duration

        for i = 1:10
            do [something]

    Where `i` is an indexing variable and 1:10 is your range
- Automatically iterates on `i` (automatically does the equivalent of i++ in other languages)
- `for` loops are useful for iterating over an index

    Very useful if you only want something to be iterated a couple of times or don't have a constantly updating data input

- Typically, `for` loops are used when you have a fixed set that you want to iterate over -- a number of rows or columns of data that you want to perform an operation on

### `for` loops vs `while` loops

As stated before, `for` loops are very useful for iterating over an interval `i` while `while` loops are useful for running code over an extended duration. In data handling in particular, `for` is useful for iterating across all rows/columns of a dataset (see example) and performing operations across that entire dataset. `while` loops are more effective in situations where I am performing an operation during a specific time frame. As stated prior, `while` loops are useful in situations like programming a thermostat, where you would want the heat to be on when the temperature falls below the acceptable range, and the AC to come on when the temperature rises above the acceptable range.

If we wanted to extend the thermostat example, some pseudocode could look like this:

    while(temp_sensor.Status == TRUE)
        temp = temp_sensor.input()
        tempSet = input('What Temperature would you like it to be? ')
        if(temp_sensor.Status == FALSE)
            break
        end
        if(temp<tempSet-5)
            ac off
            heat on
        elseif(temp>tempSet+5)
            ac on
            heat off
        end

The use of `while` here allows us to continuously monitor the temperature. While this operation could be performed with an `if` conditional, the `if` conditional would only run the program once and would never try again. Using a `while` loop instead of an `if` conditional means that for as long as the temperature sensor is on the loop will continue to run.

Note: I know I'm mixing coding languages but I really don't care Python and MATLAB are starting to blend together please send help I'm slowly losing my sanity

#### But that's an `if` conditional not a `for` loop, so why does it matter?

In this case, we used a while conditional because we do not know how long the temperature sensor would be on ie how many times the loop would need to run. If instead we knew the sample rate of the temperature sensor and only wanted it to run a certain number of times, we could instead use a `for` loop ie. Lets say we had a sample rate of 60 cycles per second and wanted our sensor to be on for 8 hours, we could use a `for` loop ie:

    sampleRate = 60 % 60Hz sample rate, 60 cycles per second
    duration = 28800 % 8h is 28800s
    % Number of samples, i, = 60*28800

    for i<sampleRate*duration
    temp = temp_sensor.input()
        if(temp<tempSet-5)
            ac off
            heat on
        elseif(temp>tempset+5)
            ac on
            heat off
        end
for this example, since we know how long we want our temperature sensor on for, we can iterate the loop that many times. But if we wanted to keep the temperature sensor on for the entire time or run it based off of a switch, we would use a `while` loop. This `for` loop could also be combined with some kind of timing software ie the temperature sensor turns on at certain times of day.

In the data handling example, we typically know the dimensions of the array that contains our dataset so we can set the number of iterations in a `for` loop much more easily. If, however, you're like me and are lazy or genuinely just don't know the size of your dataset, you can use a `while` loop. This isn't a great habit to get into as `while` loops can become a little bit of a headache to read. A `while` loop for data handling could look something like reading a data value and ending the loop when the read value is a `null` value, ie NaN, null, n/a, ???, etc.

### Pseudocolor charts

- Pseudocolor charts are very helpful for ploting relations of multiple variables on one point of study
- Can be easier to read than 3 dimensional plots
- Can be used for plots with more than 3 dimensions
- Pseudocolor charts are typically useful in fields of study with very small increments - think of fluid dynamics/aerodynamic analysis

### Drag example

    alt = [0:100:4000];
    v = [100:100:550];

    % generate dimensions of the plot
    for i = 1:100
        for j = 1:100
            DF(i,j) = alt(i)*v(j);
        end
    end

### Drag Example Code -- Dr. Matthew Kropf

    % Aerodynamic Drag Modeling Script with Aircraft Selection -- Formatted for readability
    % List of common aircraft with associated data
    
    aircraft_list = {
        'Boeing 737',[100,500],[0,40000],130,'ft^2','0.025;
        'Airbus A320',[100, 550], [0, 40000], 120, 'ft^2', 0.027;
        'Cessna 172', [60, 150], [0, 14000], 17, 'ft^2', 0.036;
        'Gulfstream G650', [150, 600], [0, 51000], 115, 'ft^2', 0.021;
        'Create New', [],[],[],[],[];
    };
    
    % Display the list of aircraft to the user
    
    disp('Select an aircraft');
    for i = 1:size(aircraft_list,1)
        disp([num2str(i),'.',aircraft_list{i,1}]);
    end
    
    % Prompt the user to select an aircraft
    
    selected_index = input('Enter the number corresponding to the desired aircraft: ');
    
    % If the user selects 'Create New'

    if selected_index == size(aircraft_list,1)
        % Prompt the user to enter details for the new aircraft
        aircraft_name = input('Enter aircraft name','s');
        velocity_range = input('Enter velocity range[min max] (in mph): ');
        altitude_range = input('Enter altitude range [min max] (in ft): ');
        surface_area = input('Enter surface area');
        drag_coefficient = input('Enter drag coefficient: ');
        
        % Add the new aircraft to the list
        aircraft_list{end, 1} = aircraft_name;
        aircraft_list{end, 2} = velocity_range;
        aircraft_list{end, 3} = altitude_range;
        aircraft_list{end, 4} = surface_area;
        aircraft_list{end, 5} = 'ft^2' % Hardcoded unit
        aircraft_list{end, 6} = drag_coefficient;
    end

    % Extract data for selected aircraft
    selected_aircraft = aircraft_list(selected_index,:);
    velocity_range_mph = selected_aircraft{1,2};
    altitude_range_ft = selected_aircraft{1,3};
    surface_area = selected_aircraft{1,4};
    surface_unit = selected_aircraft{1,5};
    drag_coefficient = selected_aircraft{1,6};

    % Convert altitude range from ft to m
    altitude_range_m = altitude_range_ft*0.3048

    % Generate velocity vector within the selected aircraft's range
    velocity_range_mph = linspace(velocity_range_mph(1), velocity_range_mph(2))
    velocity_range_mps = velocity_range_mph*0.44704

    % Generate altitude vector within the selected aircraft's range
    altitude_ft = linspace(altitude_range_ft(1), altitude_range_ft(2), 100);
    altitude_m = altitude_ft*0.3048;

    % Define constants
    density_sea_level = 1.225; % kg/m^3
    temperature_sea_level = 288.15; % Kelvin
    pressure_sea_level = 101325; % Pa

    % Calculate air density and pressure at each altitude
    density = density_sea_level*exp(-(altitude_m*0.0289644*9.80665)/8.31447*temperature_sea_level);
    pressure = pressure_sea_level*(1-(0.0065*altitude_m)/temperature_sea_level).^(9.80665*0.0289644.(8.31447*0.0065));

    % Initialize matrix to store drag forces
    drag_force_N = zeros(length(altitude_m),length(velocity_range_mps));

    % Calculate drag force at each combination of altitude and velocity
    for i = 1:length(altitude_m)
        for j = 1:length(velocity_range_mps)
            drag_force_N(i,j) = 0.5*density(i)*velocity_range_mps(j)^2*drag_coefficient*surface_area
        end
    end

    % Create Pseudocolor plot
    figure;
    pcolor(velocity_range_mph, altitude_ft, drag_force_N);
    shading interp;
    colorbar;
    xlabel('Velocity in MPH');
    ylabel('Altitude in ft');
    title('Drag Force in Newtons');

In this code example, `for` loops are used because we know the size of our arrays eg:

    for i = 1:size(aircraft_list,1)
        disp([num2str(i),'.',aircraft_list{i,1}]);
    end

since we know the size of the array containing our aircraft we can just iterate that many times. A `while` loop could also be used but it would be a little bit more annoying to read. It is generally a good practice to use `for` loops when you know the dimensions of your operand ie we have 5 values so iterate 5 times.
