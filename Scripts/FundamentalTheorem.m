%[text] %[text:anchor:T_361B34F4] # Fundamental Theorem of Calculus
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] One profound connection between differential and integral calculus is the relationship between [accumulation functions](file:./Riemann.m) and [derivative functions](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives). 
%[text]{"align":"center"} ![The area between a velocity as a function of time curve and the time axis tracks the positive and negative distances travelled by a skier from their starting location](text:image:89aa)
%[text] The geometric area under a curve corresponds to the total accumulation of the product of the values tracked along each axis. In this image velocity times time is distance. 
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] 
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:4892) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:741f) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning symbol](text:image:2a22)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
%%
%[text] %[text:anchor:H_05F9C18D] ## Fundamental Theorem of Calculus, Derivative Form
%[text] Let $\\displaystyle g(x) = \\int\_a^x f(t)\\; dt${"altText":"g(x) = integral from a to x of f(t) dt"}. Then
%[text]{"align":"center"}  $\\frac{d}{dx}\\left\[g(x)\\right\] = \\frac{d}{dx}\\left\[\\int\_a^x f(t)\\; dt\\right\]${"altText":"d\/dx \[g(x)\] = d\/dx \[integral from a to x of f(t) dt\]"} 
%[text]{"align":"center"}  $= \\lim\_{\\epsilon \\to 0}\\frac{\\int\_a^{x+\\epsilon}f(t)\\; dt - \\int\_a^{x}f(t)\\; dt}{\\epsilon}${"altText":"= limit as epsilon -\> 0 of (integral from a to x+epsilon of f(t) dt - integral from a to x of f(t) dt)\/(epsilon)"} 
%[text]{"align":"center"}  $=\\lim\_{\\epsilon \\to 0} \\frac{\\int\_{x}^{x+\\epsilon}f(t)\\;dt + \\int\_a^{x}f(t)\\; dt - \\int\_a^x f(t)\\; dt}{\\epsilon}${"altText":"=limit as epsilon -\> 0 of (integral from x to x+epsilon of f(t) dt + integral from a to x of f(t) dt - integral from a to x of f(t) dt)\/(epsilon)"}
%[text]{"align":"center"}  $=\\lim\_{\\epsilon \\to 0}\\frac{\\int\_x^{x+\\epsilon}f(t)\\; dt}{\\epsilon} = \\lim\_{\\epsilon \\to 0} \\frac{f(x)\\cdot (x+\\epsilon-x)}{\\epsilon} = f(x)${"altText":"=limit as epsilon -\> 0 of (integral from x to x+epsilon of f(t) dt)\/(epsilon) = limit as epsilon -\> 0 of (f(x) \* (x+epsilon-x))\/(epsilon) = f(x)"}
figure
clear f
syms t
f(t) =  t^2; %[control:editfield:282e]{"position":[8,12]}
a = -2; %[control:slider:2047]{"position":[5,7]}
x = 3; %[control:slider:05a8]{"position":[5,6]}
%[text] To consider a limit as $\\epsilon \\to 0${"altText":"epsilon -\> 0"}, it is important to consider both positive and negative values of `epsilon`. To facilitate a close approach to zero, the slider allows you to set the exponent $n${"altText":"n"} in the expression $\\epsilon = 10^n${"altText":"epsilon = 10^n"} so the slider presents values from about 1.26 to 1e-8. 
EpsNeg = false;    EpsExp = 0; %[control:checkbox:47bf]{"position":[10,15]} %[control:slider:7ca0]{"position":[29,30]}
epsilon = (-1)^EpsNeg*10^(EpsExp);
tAll = -5:.01:5;
try
    plot(tAll,f(tAll),"-",SeriesIndex="none")
catch
    plot(tAll,f(tAll),"k-")
end
ax = gca;
cmap = colororder;
hold on
if a <= x
    % If integration is left-to-right, color the base area in blue
    tVals = a:.01:x;
    % ColChoice = "#0072BD";
    ColChoice = cmap(1,:);
else
    % If the integration is right-to-left, color the base area in orange
    % and print a warning
    tVals = x:.01:a;
    % ColChoice = "#D95319";
    ColChoice = cmap(2,:);
    warning("You are inverting the direction of integration from left-to-right to right-to-left")
end
leftmax = min(a,x);
rightmin = max(a,x)+.1;
%[text] Use these controls to zoom in on your region of interest:
xleft = -5; %[control:slider:1e41]{"position":[9,11]}
xright = 5; %[control:slider:7703]{"position":[10,11]}
  %[control:button:62e4]{"position":[1,2]}
% Fix the extraArea color to be purple (neg) or golden (pos)
if EpsNeg
    ColeChoice = cmap(4,:); %#ok<UNRCH>
else
    ColeChoice = cmap(3,:);
end
% ColeChoice = "#EDB120";
yVals = f(tVals);
tpeVals = linspace(x,x+epsilon,50);
ypeVals = f(tpeVals);
BaseArea = area(tVals,yVals,"FaceColor",ColChoice);
ExtraArea = area(tpeVals,ypeVals,"FaceColor",ColeChoice); %#ok<NASGU>
xlim([xleft xright])
fxVal = double(vpa(subs(f,x)));
AreaVal = double(vpa(int(f,t,x,x+epsilon)))/epsilon;
%intfVal = int(f,t,x,x+eps);
TopyVal = ax.YLim(2)+1/20*(ax.YLim(2)-ax.YLim(1));
BottomyVal = ax.YLim(1)-1/10*(ax.YLim(2)-ax.YLim(1));
LeftxVal = xleft+.1*(xright-xleft);
MidxVal = (xleft+xright)/2;
BottomxVal = xleft+.4*(xright-xleft);
text(LeftxVal,TopyVal,"$f(x) = $"+fxVal,"Interpreter","latex")
text(MidxVal,TopyVal,"$\left(\int_x^{x+\epsilon} f(t)\; dt\right)/\epsilon =$ "+AreaVal,"Interpreter","latex")
text(BottomxVal,BottomyVal,"$\epsilon = $"+epsilon,"Interpreter","latex")
hold off
%[text] ![](text:image:4890) **Try**.
%[text] 1. What happens to the yellow component of your plot when you reduce the size of epsilon? What do you notice about the values of $f(x)${"altText":"f(x)"} and $\\displaystyle \\left(\\int\_x^{x+\\epsilon}f(t)\\; dt\\right)/\\epsilon${"altText":"(integral from x to x+epsilon of f(t) dt)\/epsilon"}?
%[text] 2. What happens to the yellow component of your plot when you consider a negative value of epsilon rather than a positive one? What do you notice about the values of $f(x)${"altText":"f(x)"} and $\\displaystyle \\left(\\int\_x^{x+\\epsilon}f(t)\\; dt\\right)/\\epsilon${"altText":"(integral from x to x+epsilon of f(t) dt)\/epsilon"}?
%[text] 3. Why do you think this is called the derivative form of the Fundamental Theorem of Calculus? \
%%
%[text] %[text:anchor:H_3944348C] ## Fundamental Theorem of Calculus, Antiderivative Form
%[text] $\\displaystyle F(x) = C+ \\int\_{-\\infty}^x f(t)\\; dt${"altText":"F(x) = C+ integral from -infinity to x of f(t) dt"} is the total amount accumulated from the beginning of time up to the point $x${"altText":"x"} plus an arbitrary constant $C${"altText":"C"}. Then the total amount accumulated between $t=a${"altText":"t=a"} and $t=b${"altText":"t=b"} is 
%[text]{"align":"center"} $\\int\_a^b f(t)\\; dt = \\int\_{-\\infty}^b f(t)\\; dt - \\int\_{-\\infty}^a f(t)\\; dt = \\left(C+ \\int\_{-\\infty}^b f(t)\\; dt\\right) - \\left(C+ \\int\_{-\\infty}^a f(t)\\; dt\\right) = F(b)-F(a).${"altText":"integral from a to b of f(t) dt = integral from -infinity to b of f(t) dt - integral from -infinity to a of f(t) dt = (C+ integral from -infinity to b of f(t) dt) - (C+ integral from -infinity to a of f(t) dt) = F(b)-F(a)."}
%[text] That is, the amount accumulated between $a${"altText":"a"} and $b${"altText":"b"} is the total amount that accumulated from the beginning of time up until time $b${"altText":"b"} minus everything that had accumulated from the beginning of time up until $a${"altText":"a"}. 
figure
syms t
f(t) = sin(t); %[control:editfield:2211]{"position":[8,14]}
a = -2; %[control:slider:1302]{"position":[5,7]}
b = 1; %[control:slider:8d43]{"position":[5,6]}
C = 0; %[control:slider:6c34]{"position":[5,6]}
AreaFlag = false; %[control:checkbox:69b5]{"position":[12,17]}
if ~exist("tAll","var")
    tAll = -5:.01:5;
end
F(t) = int(f,t);
FAVal = double(subs(F,a)+C);
FBVal = double(subs(F,b)+C);
try
    plot(tAll,f(tAll),"-",SeriesIndex="none")
catch
    plot(tAll,f(tAll),"k-")
end

ax = gca;
hold on
if a <= b
    % If area is accumulated to the right of a, color the area in blue
    tVals = a:.01:b;
    ColChoice = cmap(1,:);
%    ColChoice = "#00a9e0";
else
    % If the integration is removed to the left of a, color the area orange
    tVals = b:.01:a;
    ColChoice = cmap(2,:);
%    ColChoice = "#004b87";
end
% Fix the extraArea color to be purple
ColeChoice = cmap(4,:);
% ColeChoice = "#7730ba";
yVals = f(tVals);
tpeVals = -5:.01:min(a,b);
ypeVals = f(tpeVals);
OverlapArea = area(tVals,yVals,"FaceColor",ColChoice);
if ~AreaFlag
    ExtraArea = area(tpeVals,ypeVals,"FaceColor",ColeChoice);
end
TopyVal = ax.YLim(2)+1/20*(ax.YLim(2)-ax.YLim(1));
BottomyVal = ax.YLim(1)-1/10*(ax.YLim(2)-ax.YLim(1));
LeftxVal = ax.XLim(1)+.1*(ax.XLim(2)-ax.XLim(1));
MidxVal = (ax.XLim(1)+ax.XLim(2))/2;
BottomxVal = ax.XLim(1)+.4*(ax.XLim(2)-ax.XLim(1));
text(LeftxVal,TopyVal,"$F(b) = $"+FBVal,"Interpreter","latex")
text(MidxVal,TopyVal,"$F(a) = $ "+FAVal,"Interpreter","latex")
text(BottomxVal,BottomyVal,"$F(b)-F(a) = $"+double(int(f,a,b)),"Interpreter","latex")
plot([a a],[min(yVals) max(yVals)],"r-")
plot([b b],[min(yVals) max(yVals)],"r-")
xNL = ["a = "+a "b = "+b "-5" "0" "5"];
[xNameVals,idxA,~] = unique([a b -5 0 5]);
xNameLabels = xNL(idxA);
xticks(xNameVals);
xticklabels(xNameLabels);
hold off
%[text] ![](text:image:54a6) **Try**.
%[text] 1. Change the value of $a${"altText":"a"} and/or $b${"altText":"b"}. What happens to the area if $a=b${"altText":"a=b"}? What happens if $a\>b${"altText":"a\>b"}? Or $a \< b${"altText":"a \< b"}? What happens to the value of $F(b)-F(a)${"altText":"F(b)-F(a)"}?
%[text] 2. Change the value of $C${"altText":"C"}. What happens to the values and the plot?
%[text] 3. Select and deselect the "Show only resulting area?" check box. What happens to your plot? \
%%
%[text] %[text:anchor:H_277A71EB] ## Practice Randomized Definite Integrals
%[text] ![](text:image:2cb5) **Pro-tip**. MATLAB syntax is 7`*t^(2/3)` for $7t^{2/3}${"altText":"7t^(2\/3)"}. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators.
% Clear variables that may be reused in other parts of this module
clear MyFun VarChoice                             
syms t r x z C                       % Declare symbolic variables
VarOpts = [t r x z];                 % Define the list of variables to use in the problems
ErrorCount = 0;                      % Initialize a count of errors
TotDefProbs = 0;                     % Initialize a count of total problems attempted
TotAttempts = 0;                     % Initialize a count of total solutions offered
AdjustCount = 0;                     % Preserve the counts if the user resubmits a solution
LastFive = zeros(1,5);               % Initialize a matrix to record the last five solution results
  %[control:button:1327]{"position":[1,2]}
disp("Values initialized for Antiderivative Practice.")
disp("If the integral does not exist, use DNE. "+newline+...
    "If the integral diverges towards positive or negative infinity, " + newline + ...
    "use Inf or -Inf, as appropriate.")
%%
% Check if the previous section has run
% If not, provide warning. If so, generate a problem.
if ~exist("TotDefProbs","var")
    warning("You must initialize values before you can generate a problem.")
else
    [MyFun,VarChoice,bds] = GenProbType(VarOpts);  % genProbType is defined in Helper Functions
    % genProbType sets up a variable and generates a randomized function
    TotDefProbs = TotDefProbs+1;     % Increase the count of total problems attempted
end
                                   % Run this section %[control:button:95d7]{"position":[1,2]}
%%
% Check if the previous section has run
% If not, provide warning. If so, generate a problem.
if ~exist("TotDefProbs","var")
    warning("You must initialize values before you can generate a problem.")
elseif TotDefProbs == 0
    warning("You must generate a problem before you can solve a problem.")
else
MyAnswer = str2sym("0");     % User-defined solution, default value 0 %[control:editfield:2766]{"position":[20,23]}
TotAttempts = TotAttempts + 1;       % Updates count of total attempts at solution
[LastFive,ErrorCount,TotAttempts,AdjustCount] = ResubmissionCheck(TotAttempts,TotDefProbs, ...
    AdjustCount,MyFun,VarChoice,bds,MyAnswer,ErrorCount,LastFive);
% resubmissionCheck is defined in Helper Functions
% resubmissionCheck records the attempt and provides appropriate feedback
end
                          % Run this section %[control:button:8075]{"position":[1,2]}
%%
%[text] Once you have completed sufficient practice, track the overall results of your practice here:
  %[control:button:2be3]{"position":[1,2]}
AnalyzeResults(TotDefProbs,ErrorCount,TotAttempts,AdjustCount,LastFive)
%%
%[text] %[text:anchor:H_A6960D98] ### Practice App
%[text] You can practice in the Calculus Flashcards app. You can start the app by clicking on the image below. You should set the problem type to be "Definite Integrals" in the Integrals section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus Flashcards app screenshot of settings](text:image:17fe)](<matlab: CalculusFlashcardsApp>)
  %[control:button:6e1d]{"position":[1,2]}
CalculusFlashcardsApp
%%
%[text] %[text:anchor:H_D1A98339] [⇦ Main Menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_31AB08EA] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:8e11) at the top right of the Live Editor pane.
%[text] **Practice Problem Generating Functions**
%[text] Construct a problem to display
function [myFun,varChoice,bds] = GenProbType(varOpts)
% genProbType sets up a variable and generates a randomized function
%
% Inputs: varOpts is an array of possible variables
% Outputs: myFun is a symbolic function
%          varChoice is the independent variable
%          [a, b] are the bounds for the definite integral, if required

% Randomly select a variable from the set varOpts
varChoice = varOpts(randi([1 length(varOpts)],1));

% Use genFunDiff to generate simple functions
% genFunDiff is defined in Helper Functions
% The inputs to genFunDiff are the variable varChoice, a range of values
% from which to select coefficients and a value indicating which warnings
% have already been printed during problem generation
        syms f(x) x 
        [f(x),~] = GenFunDiff([1 10],x,[1 10],0);
        myFun = f(varChoice);
        bds = randi([-3,4],[1 2]);
        a = bds(1); %#ok<NASGU>
        b = bds(2); %#ok<NASGU>
        % Display the integral problem
        disp("Calculate the integral:")
        displayFormula("F(varChoice) == int(myFun,varChoice,a,b)")
end
%[text] Generate appropriate randomized functions
function [myFunc,type] = GenFunDiff(bds,var,range,prevFuncType)
syms f(t)                    % Create a symbolic function f(t)
params = randi(bds,[1 4]);   % Randomly choose parameter values
shift = randi([0 max(abs(bds))],1); % Randomly choose a shift that may be 0
sgns = randi([0 1],[1 3]);   % Randomly choose +/- signs
type = randi(range,1);


% For readability, create parameters a,b,c, and d
a = (-1)^sgns(1)*params(1);
b = (-1)^sgns(2)*params(2);
c = max(params(3),params(4));  % c > 0, it is only used as a denominator
d = (-1)^sgns(3)*shift;

switch type
    case 1
        f(t) = a*t^b+c*t^d;
    case 2
        f(t) = a*t^b+t^(d/c);
    case 3
        f(t) = t^a+c*t^b+t^d;
    case 4
        f(t) = t^a+c*t^b+d;
    case 5
        f(t) = a*t^(b);
    case 6
        f(t) = a*t^(b/c);
    case 7
        f(t) = a*log(abs(b)*t);
        if (prevFuncType ~= 7)&&(prevFuncType ~= 11)
            disp("Remember that log(x) is the notation " + ...
                "for a natural logarithm of x in MATLAB. ")
        end
    case 8
        f(t) = a*exp(b*t);
        if prevFuncType ~= 8
            disp("Remember that exp(x) is the notation " + ...
                "for $e^x$ in MATLAB. ")
        end
    case 9
        f(t) = a*sin(b*t);
    case 10
        f(t) = a*cos(b*t);
    case 11
        f(t) = a*log(ceil(c/4)*t);
        if (prevFuncType ~= 7)&&(prevFuncType ~= 11)
            disp("Remember that log(x) is the notation " + ...
                "for a natural logarithm of x in MATLAB. ")
        end
    case 12
        f(t) = a*t^c;
    case 13
        f(t) = a*sin(b*t+d)*exp(b*t);
    case 14
        f(t) = a*cos(b*t+d)*exp(b*t);
end
myFunc = f(var);
end
%[text] Handle submissions
function [lastFive,errorCount,totAttempts,adjustCount] = ResubmissionCheck(totAttempts,totProbs, ...
    adjustCount,myFun,varChoice,bds,myAnswer,errorCount,lastFive)
if sum(totAttempts > (totProbs + adjustCount))
    % Check if this is a resubmission after the solution has been provided
    % If so, provide feedback but do not record in errorCount or lastFive
    % If not, update the values of lastFive and errorCount using check1
    adjustCount = totAttempts-totProbs;
   [lastFive,errorCount] = Check1(myFun,varChoice,bds,myAnswer,errorCount,lastFive);

elseif sum(totAttempts < (totProbs + adjustCount))
    % Check if this is a submission after the generation of multiple problems that were skipped
    % If so, add the skipped problems to errorCount and adjust the totAttempts
    % to compensate. Explain to the user that skipped problems count as incorrect.
    numSkipped = totProbs + adjustCount - totAttempts;
    errorCount = errorCount + numSkipped;
    totAttempts = totProbs + adjustCount;
    for k = 1:length(totProbs)
        if numSkipped(k) < 5
            lastFive(k,:) = [lastFive(k,1+numSkipped:5),zeros(1,numSkipped)];
        else
            lastFive(k,:) = zeros(1,5);
        end
        if sum(numSkipped) > 1
            disp("The "+sum(numSkipped)+" problems generated without attempts at solution " + ...
                "have been included in the count of errors.")
        else
            disp("The problem generated without an attempt at solution has been " + ...
                "included in the count of errors.")
        end
        [lastFive,errorCount] = Check1(myFun,varChoice,bds,myAnswer,errorCount,lastFive);
    end
else
        [lastFive,errorCount] = Check1(myFun,varChoice,bds,myAnswer,errorCount,lastFive);
end
end
%[text] Check the submitted solution for correctness
function [lastFive,errorCount] = Check1(myFunc,myVar,bds,myAnswer,errorCount,lastFive)
% check1 generates correct answers by integrating and updates
%        errorCount and lastFive
%
% Inputs: myFunc is the symbolic function to differentiate or integrate
%         myVar is the independent variable
%         myAnswer is the symbolic test function or number
%         errorCount is an integer tracking total incorrect attempts
%         lastFive is a vector tracking the last five attempts
% Output: correctAnswer is a symbolic function that is the
%         solution to probType applied to myFunc(myVar) with bds
tol = 1e-3;
correctAnswer = int(myFunc,myVar,bds);
if isequal(myAnswer,str2sym("DNE"))
    myAnswer = nan;
end
lastFive(1:4) = lastFive(2:5);
disp("When simplified, this function is: ")
disp(myAnswer)
if correctAnswer == myAnswer
    disp("That answer is correct.")
    lastFive(5) = 1;
elseif isnan(correctAnswer) && isnan(myAnswer)
    disp("That answer is correct. This integral does not exist.")
    lastFive(5) = 1;
elseif isinf(correctAnswer) && isinf(myAnswer)
    if sign(real(correctAnswer))==sign(myAnswer)
        disp("That answer is correct. The integral diverges towards:")
        disp(correctAnswer)
        lastFive(5) = 1;
    else
        disp("You are correct that the integral diverges, but not about the direction.")
        disp("The integral diverges towards: ")
        disp(correctAnswer)
        lastFive(5) = 0;
    end
elseif ~isreal(myAnswer)
    disp("Your answer should be a finite real number. Please try again.")
elseif abs(double(myAnswer-correctAnswer))<tol
    disp("That answer is rounded. A more precise value is:")
    disp(correctAnswer)
    lastFive(5) = 1;
else
    disp("That is incorrect. Remember to be precise. The correct answer is:");
    a = bds(1); %#ok<NASGU>
    b = bds(2); %#ok<NASGU>
    displayFormula("int(myFunc,myVar,a,b)==correctAnswer")
    % correctAnswer %#ok<NOPRT>
    errorCount = errorCount + 1;
    disp("Please try again with a new problem.")
    lastFive(5) = 0;
end
end
%[text] Analyze the results and give feedback
function AnalyzeResults(totProbs,errorCount,totAttempts,adjustCount,lastFive)
% analyzeResults provides feedback in the single problem type case
%    totProbs, errorCount, totAttempts and adjustCount are integers
%    lastFive is a vector
overallRight = (1 - sum(errorCount)/sum(totProbs))*100;
if sum(totAttempts) > sum(totProbs)
    % If the user has resubmitted after seeing the solution, respond
    disp("Why are you resubmitting after you know the solution?")
    disp("Resubmissions are not included in your statistics.")
    if sum(adjustCount) > 1
        % If the user is repeatedly resubmitting, encourage them to use
        % this problem generator as intended by starting over
        disp("You have resubmitted " + sum(adjustCount) + " times.")
        disp("Please consider restarting the count using the `Initialize Values' button.")
    end
end
if totProbs >= 5
    lastCorrect = sum(lastFive);
    % If more than 5 problems have been attempted, provide grammatically
    % appropriate feedback on success rates
    if lastCorrect > 1
        str = compose("The overall success rate is %.1f%% on %i total problems \n\n" + ...
            "Of the last five, %i were correct.",overallRight,totProbs,lastCorrect);
    elseif lastCorrect == 1
        str = compose("The overall success rate is %.1f%% on %i total problems \n\n" + ...
            "Of the last five, one was correct.",overallRight,totProbs);
    elseif lastCorrect == 0
        str = compose("The overall success rate is %.1f%% on %i total problems \n\n" + ...
            "Of the last five, none were correct.",overallRight,totProbs);
    end
else
    % If fewer than 5 problems have been attempted, encourage persistence
    str = compose("The overall success rate is %.1f%% on %i total problems \n\n" + ...
        "Please do at least five problems.",overallRight,totProbs);
end
disp(str)
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":40}
%---
%[text:image:89aa]
%   data: {"align":"baseline","height":250,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAAD6CAYAAACPpxFEAAAidUlEQVR42u2db4gc533H121in3SnO1mx0MnSScZO5No6ScZ2q0hX6Qq1kesSXVPbchGBAykWqDj4T0TVF8HKq8QpMipBfWGVJn0RiOs3elEIBb8QBL0MuA19G9SXhUJc6Ju+KdP7zup3+unRM7MzuzOzszufB76cbnd2dm61+3z297\/3X\/\/7f\/+KEEIIlVXvj279Z4IQQgiV0T\/e+Z+k1\/un\/0gQQgihMvr+v\/83AEEIIQRAEEIIARCEEEIABCGEEADppK7fTnqvv9v\/yeuBEEIApLCufLLxIvX6P3k9EEIIgAAQhBACIAAEIYQACABBCCEAAkAQQgiAABAAghBCAASAIIQQAAEgCCEEQNotAIIQQgAEgCCEEAABIAghBEAACEIIARAAghBCAAQBEIQQAiAABCGEAAgAQQghAAJAEEIIgAAQhBACIAiAIIQQAAEgCCEEQAAIQggBEACCEEIABIAghBAAQQAEIYQACABBCCEAAkAQQgiAABCEEAIgnQLI+ge8DgghBECGAMjr7\/I6IIQQAAEgCCEEQAAIQggBEACCEEIABIAghBAAQQAEIYQACABBCCEAAkAQqkw\/+XW\/WPbi1WT72feTva+9lWw\/cizV3hdWUm3+vnHfzJvvJb1LN5Lej37BawdAEABBndL12yksFk+dSbY\/vpS+x585dDhZW1tLrly5kurWrVtR2f2rq6vJrr370scuPn882XLuSv+8vL4ABAEQNH3Q2PHW95OdB5aTrdvmU1hcu3YthcIo686dO8lPf\/rTZH19PZmbX0h2fO1gHyayanjdAUjntXUbAEETq61vf5Ru6rMbm7s2+Zs3byZ1LsFk5eRqsmUDUnKHARIA0m09exSAoImLaWjznpmbT5YPH0k39S+++CJpcsmykZtrZgMkqUXC\/wsAASAItR8c+vavzXtU91RVIBHEFr56kKA7AAEgCLXVVSWLoy3gCJcC74q96Dr5\/wIgAAShNmjjW\/1jzx1P9uzb30pwhNbINgXaXz7D\/xsAASAIjVNpbKHXS7\/dT8pSLGbTpUWAHYAAEISaj3XI6tBG\/PnnnyeTtgQRZYQpOwyIABAAglBTuvJJmtmkDbjpzKqq19ggooJHVd4T1AcgAAR1KVCueg6l5U7LikLE\/1ubvdqmVAUOjafW5\/nVc\/0i4YtXeW8BEACCplsKPCsAPYkuq9IQ2f9M0tu5J+n92V8mvadfrMZCkbWhz3L42Q5vQwAEgKBpincIHop3TLrLqhREvnEh6T08k\/S2zFVjJbz48oOWjEDFZxuAABA0tfDY2FSnHR621J9LHX\/Tv10uJnM5qZ2QNnvFLbJeq9XX+scJNjGLRZ9jQcTuk0WicxLEByAABE0rPKYhWF42xXezTkTAEEC0yeszqJiFPo8xkNj9goJ+Cha67ZX1pPflh5PehR\/2b7NzEPsAIAAETTs8urYEkaV9+\/szR\/S52zJ7z0qQRSJLQxDQT98+XhaFbtexuv07f5v0Ht3Vv+33fh9LA4AAEAQ8urCUKKDW8DN\/8d0+AI6sPphNZSCRVWEWiX7Xv6UvP5L0HvqdpPfn3+E9BUAACOqGFANQP6uuL0EkBcLBY\/2fsZoNDxJ9TpcOJL2Vtf7vX\/py0vubf+E9BUAACOpOqm5XAuZFZ4uos3DvyUP9tN4sN5TFSGRxCB47FnFZAZAWAUQZIbwWqEbNnz4PPDK6+G7btaefzit3VdZr+Ff\/0IfHE8\/2A+lKAV45zZhdANICgFBshGquMJ+b0iLBqmpEFvY9lT1eWvUdswt9cPiguo4FIAAEgKCp1d3sIeCRv2SdzR78gz5EwoJAS889+9e8nwAIAEHdybhSY8Rp6m1Vd3rv78pFpYJBH1SXlWEZWLyvAAgAQV2QZmJ0OV132PTehxa+0g+YK8ZhwXIAAkAACOpa0JxVbt28eTOZmduwQLZtT3ozW\/vBdVWrCyC8rwAIAEFTr0s30m\/Sd+7cgQhDrGvXriWzjy324fHUkb5LC4AAEACCpl7Xb6dxD32TZo2WmbXtwOE+OF74Y3pbARAAgqZfGkX7zjvvQICKGi9u\/fqpPkTkxuL9BUAACJpWqUEgxYLVB9V7axeZLghAAAii3oNVvt2JXIJABIC0U2rWBkDQiNp5YDlty8GqJx6SDqKyxopABIC0RmqHAEDQCNp+9v3KUnYvX76cbpL6ybq\/yHDLuStABIAAEDRdrqvZnJRdA0Io3f6b3\/zmgeM\/\/PDD9H79LLMeffTR5I033phaiNy6dSvZKleWb\/EORAAIAEHT7LoygHz66aebt+nfL7300gO3j7KmHSBaep2V5bbpegYiAASAoGl2XcUAYuuFF15IN\/6YJVJm\/fa3v02fY9oBcp8ry0NEKb505QUgAARNW9ZVHkA+++yz9L4LFy484MIKj9cx3gWm3wWeLBeZPV7nM2vHFLrHfvWrX6W3f\/zxx6mefPLJzGP9dfrj9Bz+mgU1f80CZVm3XJYrK83Ksh5Zgoe69apaXUOpwk6+CIAAENTGgsEiWVd5ADHXkzbiPIDIsvCWijZ83aafHgChBaLjdW6\/cdv1+Nvs8XoOgSCEVhbM\/Dl0m+Bj8JB1pXPZNescVUFEWVma7sj7EIAAEDRxkgtFrpQyWVVZANFGq\/u16WYBZFB8IwsgefESD4o8AIUWkq5rUJaY7tNz2N8U3j7qUsKCEheic9QRAAEgqLW6O+NDrpSmACIrQhtv1jnKAsRiL+HjQyjEYivmDsuL2+jcHjq2ZKHosWY5VRZQRwAEgKCJcF2tvFJqxkcVANFmbccJJuFGPwggOpceY+cwd9UwADGYZS2zWvJUBUAUUN8mK4QZIQAEgKCJ0MZmpd5MZXpdVRED8d\/gzQLQY3xMJAYQAcCOl0Vg8YdRLJCiAGkiI0xt3xefxwoBIAAETYDmdy+lm9YwleUxIMTiCXkACR9ncYwsgFiwW9leTbuwPBTrXHv27U+2vv0R708AAkBQe2WddodtTZJXB+KDzUUAEgbCs+pAdH\/MWgitiDIAsTjGoCB6lUWSeUtzV7Y\/vnQvrRcBEACC2hY431IicD5oM9UmbPAIN9kQIPqmH6a\/xtqd6HwCg8HI14hYeq1uM6gMCxBvhYRpvPa7pfHqevzfp\/vtWqpcKydX06JO3qsABICg1kk1B2UC50V7YYVprjGAaHPXbT4AHtZ2hIF2v7lr8w+L\/cJ02rIAsevUOfy5w2sK\/\/bYMVUsFXNu9sni\/QpAAAhqjTY2pVnmm7d+aQqkMuR4zwIQAILa0+\/qyDHmfExIn6w50noByFgAoh46vBYokrY7WzJtlzW+RVovABkPQOSj5bVAWB8Tv5TWixUCQAAIGnu3XayPyVuaoY4VAkAACBqrFk+dwfqY0FhI2miRjCwAAkDQuDKv9J4g82oyl1Ku50+f530MQAAIGkPs4+z7ydraGjvxhC4VfKrtDO9lAAJA0Fh6XqlFBmty1xzzQgAIAEHjCJ7vXtrHDjzhSxbk5ux0BEAACGrE+jh9Pq1q7tqKtTPJanEyyrL2KGq7UndNCJXpAASAoMbdV8M0TRy0MdfRAwqAZC\/1x0q79PKeBiAABDXZ96qOjRmANAsQrfRzTZt3AFKrLt0AIKivi1crz76y4U8ApHmAqM07VekApPZ+RwAEWfFg2YmDecu3V\/eyNu5qh67NWRu1HSvQ6H7drrbtvoW7n61hbdpjkwFt5kc4qMq3X9f8jlEAYjNNfKv22LVYe3r7G\/Q4XUcTAFEsS4PAeG8DEACC6gfI08uVxj\/8BhqzQGwjDTdfm33uhy\/ZECdt6nmWjaCh83pACDYeQDY7xCYalgVI7G\/SufxAK3\/N9nf4Ge1NACRtrrjxpYD3NgABIKh+bbwPql6DABJaCllLc83D82jDDjdiGzlrsDDQhJMP7Xabl14UIAao2PApPzkxNu+9aReWvgzsfWGF9zUAASCo\/vfBM4cONw6QohtpbDqgrIzQjWWWQNbvtvQYf11FAWJ\/T8xdpeex6zNLIzyuSYCoLxafbQACQFD9Wv+glvYlowBEj7HxsxZH8ACJWSWh+8rHUWIqCxCDVpbs+mzm+ziD6FqzVKQDEACCao9\/fOu7tXTfHQYg2ri18ZurSO6grPnkOs5iGea+MreU3R\/byIfNwjKAWCwma2U9b9MAWV1d7Wda8h4HIAAE1aXHnjteS\/+rYQCizTcMSGcBRJu7uYq0uYfuqixX0rAAsb\/HB\/hjqw0uLC19KVBzTN7jAASAoInKwBpUB5IFEN0egsJiFuHttslbemwYtM4KZg8LEAuWDwJAFjibBogGTNHSBIAAEDRxGVh+wzU3k7cqsjZi3SZLwqfsmksoBIh3F4Xuq7BmxG\/mAo7\/3QDl4yex2zwc\/LXoWsPjLA5iGWA6xmpUmgKIvhTQ0gSAABA0kQAxAPhAuG3yWRupNm5zAdlGbbUbMYDYhh7LtvLHhIWJoVVioPG3x26zv8lfox3jXVaCpT3eig0NIk0BZLOlCe9xAAJAUF3vgacOHk5Y07kOLB+mpQkAASCovveA+iaxpnMpPVtp2rzXAQgAQRPRRJHVnqVMrL2vvcX7HIAAEFS91HCvjhoQVjsWLU0ACABBtemJ9UsAZIoXLU0ACABB9RURrryS1guwpndpzj0tTQBIfQDhzdXdIsLnj9dSRMgikA5AugIQ0vy668J6cQWATPnSbJDdJ6hIByAABNVQRCg\/OasDcRBmpAMQAIImpQq9qqXK7yart4suVZ6rqn1Qs8a2uLG2vv0R73cAAkBQRdI30gkAiOAxqCHiuJbalcRarLRtKVFi38k\/4T0PQAAIqu7\/\/8jxE623PoqOvh3HssFWg2aE4MYCIAAETd3\/v4YOtXmp+WDbv+HHmjO2cS0fPsKAKQACQFBFev3d5J133mnthmft4AcNcBr3ig2zauNSwejOb36b9z0AASCoghqQmkbZVum+ik32k0ViwetYy\/RYsNu3X1dMJQal8LjYkKrYsnG6bQ+mK11754Fl3vsABICg6a9C1xyP2GxxQUO3CyIGApsZotv9Ri6g2FAri6NkTQzU+Xy2l84t62JQ\/MWmF9rwqDYv4iAApDqpAh2AdFZqstfmIsIs15BZHeE3fgtoe6vBJhxmncMsFntsbPxuEVfbsI9teh09cZLPe+0AWbvY10\/+rRN1ALyhOtqJd24++fzzz1u72WmTj9V\/2OYfswzMMvFQCMfNxoBhI2z1fGVdUZMEEMW81IGZ939dAHnrB\/dGVQoiAARRRDhRADG3l8UmYhu7AcNnePnxu3J5FQXCJAFEbU0WT53hvT8SQJ48dNcXGLEwfvzLpLdrX\/\/+7\/0MgKCpdV\/Ozi9MZHZTXQDxsReBy0AyTQBhPkgVAJldyAZIB7+FApBuJlC0fZRtXhA9BhCDgm36ZVxYsaVYShEwTFIQ\/c6dO4xwACAABI2o9Q+S9fX1Vm92eWm8MYDEsquKBtHzwGDnM4smTAGelDReMrGqAIigYTEOAAJAqAGZuEJC2\/x93YfFL0KXU14ar8\/W0nOE9SEhZLLcWpNSSGjrwPJhPvNDAcQsj5je+7sHAfPDf34QPIqP6Pezl+\/FSqRDf9iPn1gcRb\/bfYq52PmzoKaAvb8ePT7vMQAEjaDtR45NxCTCWCsT29i12fvCv5irqmghoVxaAooF0Q0U3i1l4AkfOymtTGypfU3v4lU+B2MBiM7h4eAloJy9nP0c\/nyxoH1MygoDIKhqC+Tp5YkYJBVrppgXRG96TUozRb9keW4\/+z6fg6FcWNrE81xYgwBi+vqf3nt8CA0BwYCkcxggXjr74PPZfWHKsMAhWEkABNXw\/z4pg6TCdu5tAsiktHP3S5anuhDwORgXQASMLBDIXRWe1wCj+2K3x87n76\/TCgEg3dP1261P4Q2tEB9jaAtAZHVMykCpMJVXFiifhXEBJOaKkkWSVXwoa8TcX\/72LFdYqCzAABA0ZAqvWlpM6mqTBTKpi1TeaQBIXuwDgKAOp\/CyyMQCIIMAYkH9JrKtAAi6qyfWL7U+hZdV79IXiC3nrvB5mAoX1jh7bgGQ7rVxf+54cvPmTXbRDi8F0nefIJA+2QCxILlutxoSAILqrgF5fKnVXXhZ9S+1NJnZNs\/nYaRWJn6ztw28SYD4OIh++mwrXY\/Sfuu2TgAIXXhZnVx79u3nsz8UQGyzjwWqmwaIrxPJKk4EIKjCDCwFUFkszQaZP32ez8RQ80D07d42aW3s9u2\/aYCY9DhfKa+akTqzrzxA1j\/gjdMVXbyatrJgseTGnN+9xGdiKICgewB5\/V1eh67EP86+TwYWa3PtXtrXH23NZ6MgQF49l\/SePYpMGwD50sJX0uZ6aPr1yLaF5Omnn06tEIT27NmTPLxrb\/f2vZxmkgCkJEAeeuih5OjRo3ygOqCHH3kk6e1\/lvc96raGBgh6wIW1dXFpIlp7s0ZftLBAiBhIpQCZOXQszchgTfdSEz3VgPC+RwiAVBdEX309eeYQqZ1dqD6mjTdCAKT6LKwWz4ew2diaC8EafjFICCEAUgtAFp9vrj+SASGU2nT7EaK2bOpbOIt60NL5NM2O1V\/pKNNLN3jPI9RJgKi9iYoLYz28RgSIvpk21eLbAOKnzGkoj815qGq+NAC5f+3aS84\/Qt0FiK9oV+V7FW3gzYV15ZO0qGhcALF14cKF9L6PP\/545OeRywuA9Jfck2RgIdR1C0Tg8C1P1CtLbVli7VWKSDnRdyvR1Z1TXTrHCRAtbfp+hKlGh8aO\/\/DDD9Nj7bWQi0vnznKR2eMFJ7N2vPssZsHoOjT5zh8vMMXGmOp5dQ12nB6ra8y7ZgGzqQysnQcYY4oQMRBJvbvCppDWP6tMa3gHEM0HuHbt2tgBYpu1bdIxgGgj9paKbfI+hqKNOmaBCAA6l41EtesJIWIuMMnOq2vS72FAX9cRnkPX6K\/ZgOTPpfOUje0Ms\/T\/unjqDBsEQgAkEhcJ56sLLr49fAGAqDpzbW1t7ADR7brfNtoYQLTpDnJPZQEktmLnM5Dp+WNuNgOcQBSDSuxvDpME7HYlCtS5VOcz8+Z7bBAIAZAcmAgaHiZyd6nTb1bg3QPk+u1GZkVUARDbxEMX0bAAsef0sDCAmKWSdWxoDWUByrvlfPLAoL+jirVycpW2\/QgBkBKWiI+V6N+x9vAeIBva8bWDtafzVgEQ25R9fCOMS+QBRMfqMf4cwwLEYBZaKn4JHpkzXxoASPo8+oLABoEQANmcURJzX+l3g4WBxWASurUCgDSRzjsIILap58VAfIDdNvDQRZQFEDtez2PnHMUCKQqQcWWEpeNL5xhfihAA8QH0MBtLoMjKxvrez+4F2nMAojqBufmFsQEkFk\/IA4i3KMJNOgYQC3aH3\/ibcGF5KDa5lIGlQlE2B4S6DBBBIHRLCSS6vcjjBQ89zsdDQoBsSFPKNK1snHUg3pIoApBY4WCsDsQ2+6zA+DAAsThGkSB6VUWSZVuY7H3tLTYHhDoNkLOX73dRla1ILwqQ0+dr7c4b20y1Gdu39NA6iAFEm7U2fdvcdYxg4dNobaO3DCdt9Pbcvv7CwDMsQDyYwjRe\/7udz\/99slrqjn8os46xxQhhgSS9D35eLkYS\/h66uCIAkRtrz779Y+mFFYsjhAARCLTxhgHw2Ld7f4zVW9hm74v97JqGBYjBQGDzBYe+3sSe2wfU9e+6rZIDy4fJwEKo8wBROq42niItTGRtyFIpUwfitGNPvW4sVnOLFiYIAZDyAFFgfUiA7PzmtxkyNQWLIVIIAZD7ATKo75VcVYKHguxDAqRuNxarmcUQKYS6DBBZEiZBwVJxzUUlqHipsaIdN4ILq4lsLFb9S1YkQ6QQ6iJAZEnkVC\/nStZHkQ69eQCpORuLVf+ihQlCXbZABBFVkyvuYd13Q6sjVJkU3xyANFFUyGoggE4LE4SIgWzGQKqcSJgHkLturKZG3bKqXXI\/0sIEIQByr69VFVMIQ4C8ei7z\/iZH3bJqCKA\/RwsThABIXRJApKz7r99OZucX0pGoLALoCAGQSZAsDZswGFogRVR0KuEggNxt8a5vs6zJWkdPnCSAjlAnAWJ9q3wth8VAikrHVwCQrW9\/lGbzdHHFJg1mtTgZZYUzUCoLoP\/k12wKCHUOINY4UXUd\/jZfFxLK6j8qBog2oS3b5tO5ElVuzOEMcgBSHUBUgb7zwDIbAkKdrgMZ5jGmilxYqRvr5TOVBtMBSL0AUQv3xVNn2BAQIog+xiB6DcF0bbxh63MAUi1AVldXk97Fq7y\/EQIgLQDIhjTV7tq1a5VslKFs49TmrA1bm7O1Yvdt2MMW7n6WRt5kQLvPb9Bh+3WdOzZXvShA\/EwTa+ceA0J4nM4Xuz4KCBECINUXEw5yTylW4rO3KgJI79KNShos2nyPmAViw520wfrN1EbWemAYjOw2G4drwPFLm7keHwLFn0+P0zEeDEUBEhtoZc9hA6209G+DlT1eILOBVlUARPEPFYCyGSAEQB7MwsoLjvtOvEXiIGUAsqG5xaWRU3oHAaTMRhoCwwDkN3cbOWuDmww04SAnu91DpShAdExspK1u89dnY3azhlRVARDVf6gdP5sBQgDkngSFIjM+3vpBHzRFrJCSAFFK79KIVkgRgBSNL4Rzz\/VtPnRjhXPQ7ffQXaUlC8RfVxGAmFURc51pdK5dnx3nx+nWAZBnDh1OrUU2A4QAyP2dedVQscpjSwIkbW\/y+GhWyCgA0QarzdbHLjxAYlaJuab8pp5XP1MWIAatLNn12djc2Az0qgCiVGsmECIEQOJQUL1HkZ5ZReeBqJFiSYCMaoUMAxAfVBcAbBMOLZDwW7+5r\/ymbQCJzV8fJgvLABIDg195x1UFECU57D7BACmEAEioorENK0IsUkg4BEBGtUKGAYht+j4gnQUQ+6avDds2bQ+LvGytYQCS55ryqwkX1qvfOE36LkIAJCeILiska1iU+mAJMkVG344AEG1Sw2Zk5dWBZAFE1kcICotZZN2ujVqPCwFgwfJY0HvYOpCs4Hjsurw7rUqAqEaH9iUIAZBsN5b1yLIYhx8kJZeV3edboNQBkLt1Iap4HmZZWq1tuBbQzgKIbbBmNeh4g0oMIObGCrOqQivEQ0xWSmgdxDZ8s4Z8EN7SeH0tif4GHeutH7OIfIxG11JFGi\/uK4QAyGCI2GTCLBWFx4gAUafXYavTtcn6QLht8nlBdLvPNmALqMcAYu6irGwrc3WFhYk6nz\/eQOOtEINFLF3YX6MBKoSCICIo+b\/drncUgCwfPoL7CiEAUkDf+1kfFL6ZomIfRdxWVQFEVsipMwycasFKpw9uY\/ogQgCkSY0IEOvUq+pn1viWID5\/+jzvZ4QASAHJ0pDFYfGPYayPKgCyoS3nroxcXMgafsmFKFciva8QAiCjxUB0X5k28BUARFr46sGhA+qs0ZZed2afIwRAymVhhQOl7PaifbAqBEjvR79In1u+eFazS+nUjK5FCIDkyywP\/Yy5q3SbHVOkCr1KgGxo5s330kygKmaGsIotFXMqnZoPPkIAJD\/mURQMVg9SZyFhhuRKUTdYVjOxD6wPhADIYKnCvGiHXWtlUuTYigGiQK7SSW\/evMkO30DsA+sDIQBSLUDKtHOvGiAbmr3898nc\/ELaGZZVc+YV1gdCAKRQ4WDRFu0WBxF0xgAQSQON6o6HWE+rrErzcS5VlBfptTVK3YeKOPnAIwRAiskyrfIsC3NfFRk8VSNALLW3zip1mwvS1hWO4K1qqWgzrTqnaSJCAKRUIN067QoQamUiYMhlpWJCn8pbxPqoGSDa4NT2XU3+6rI+qpjgV9cSPGKdd6sInKt4kw87QgCkPEQEj6xCQgFGQGm4kDCvPkStTkado97E5lz1smFWVUJOFt32I8f4oCMEQEaQLA\/FOqyIUKm7uq1MFboBZP8z9V7rpRtpUL3KIkO5rgYNcGqLG6uq6xSEcV0hBEDa1UyxgRnaGoNbFURsIFU4UdBar+ubv\/3bZpLHrACb1+GPi8UswvbrYfv3vKXzV2Ep6XUj6wohANJJgFQJEZudEY63NWiEIIhNC9S\/dbsfACXIhI8N55hrFoiAUDR4b9c0aFLhoLjHto3XjbgHQgCkfv34l\/0gun62CCBVQcQ29TB91zbr0Iqw473FYoOoYpMP\/YCqGCzseUKAZaXzhjPZy8JD6dA7XiZlFyEAUrTmQwAYVjY7vWgdSIMAqQIiWd\/q7fbQXWWbuAeLIBGLTRhstOFnzW638xUJjo8CEOCBEAAZvt5jVAlELQTIqBAZFSCWHZUn2\/BjM9F9rKUugBg8tjz5LB9qhABICYWjagcp3ACV5isrpGUxkBhE9NxlU3wHubCKAiS0LPJg5WMgWdZLVQAxeMwdPkbGFUIApGYpdderpUH0qK58ktaJlBlGNSiIXtSFVSQ7yoLmOt4AXaa6vGwQXf3DcFshBEDIwipRbLjzwHKytrZWqHfWoDTeIgBRsLxIHMMytQYtWSSxvlxl0njlzpNbD3ggBEDqrUb389CLZFu1GSB32548tvJKOlu9SFwkVkhYBiCWxqvN3R+vYzyY7LF5NSAGtJh1UrSQUO1e9PjUrceHGCEAUourKjYP3WdbCS6qSi8yTKpNALmrtNZh43oG9c+KtTIpA5DQEjHJ2ghrSGLFgmFsRPGU0AIp0spEFpcsL\/UMS8cC8wFGCIDUmp1lbUus864HiKyRom3fWwgQ79JaObmaOVOkiWaKPqU3y42WF4gf1K9LQ7dUILhw7BTBcoQASI2yIVHK0LLbbMhUWO8hwKip4qQC5K5La\/70+bR9R1aAve527gaQWMFgnlUzqJ27oCirY2ZuPh2+xYcWIQBSr6w40Mc7sgBixxbJyLp0o50AcdaIxraqhXk4JteskGGrvIsE660S3T+HoKDnzQuuCz4h3OSuEgxnLVCO1YEQAGlEsipCKGQBRFZKUYCoOV+bAeJqRhQnkFtLA5WabMkuN5WPkwgMZQdFqdZF7qrHnjtOrAMhADImC8TDIgsgKiQs6sKaEICYW2vmzfdS10\/TIBm2j5UsDoFDVhSddBECIONL3dVGr0C6WRYxgJj1UTSIPkkAcSBRtpYsErm29O2+ztnrw7Re1+CnWbM4AAdCAKQ1VoisCxtnazPSJZtUqPuLVqRPIkC8Ll7tf7vf+Bu0aYdxkiahIWtDQNPQJyUA9K7f5gOJEABpkQQKm4sekyyUojUg0wAQ08ZmLatkx9cOpn+PspxUS1LlFMTQPSVYCVoGjTQwrqQEPoQIAZDWSplYAolvqCiXVZlZ6NMGkAAmskx2n3ilnyo7v5Csrq6mFoLcXYqdFHV56TgdL1jo8QLT7qW+pSfLZ\/vZ9wmKIwRAOqppBEgMKBuWgTb77UeOJU+8uHKf1bZr777kyPETm9Lv\/n4dr8ctfuu7KZgABkIAZPKC6GVcUwCkVK1J+jqYAARCAGSqZBlXclfJfTVKA0UAghBCHQKIpgvuut+1stkTC4AghBAAKQQSpfB6mCgrS0H0IjPQAQhCCBFEj8JE\/9ZtReahAxCEECIL6wGYKFYCQBBCCIAUrg2xposABCGEAEhuaq+Hhq9GLxpcByAIIdQRgBg0bDqhj33o9rK1IgAEIYQ6UAcSg0aZgDkAQQihDgLEd+IdNmUXgCCEUAcBokaJwzRLBCAIIUQMpBYBEIQQAiAABCGEAAgAQQghAAJAEEIIgAAQhBACIAiAIIQQABlFmr737FFeB4QQAiAIIYQACEIIIQCCEEIIgCCEEAIgCCGE0P0A+X+a9sDQdCqBOwAAAABJRU5ErkJggg==","width":400}
%---
%[text:image:4892]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:741f]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:2a22]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[control:editfield:282e]
%   data: {"defaultValue":" t^2","label":"f(t) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:2047]
%   data: {"defaultValue":-2,"label":"a = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:slider:05a8]
%   data: {"defaultValue":3,"label":"x = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:checkbox:47bf]
%   data: {"defaultValue":false,"label":"Select to make epsilon negative.","run":"Section"}
%---
%[control:slider:7ca0]
%   data: {"defaultValue":0,"label":"Set the exponent of epsilon:","max":0,"min":-8,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:1e41]
%   data: {"defaultValue":-5,"label":"Minimum x value?","max":-2,"maxLinkedVariable":"leftmax","min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:7703]
%   data: {"defaultValue":5,"label":"Maximum x value?","max":5,"min":3.1,"minLinkedVariable":"rightmin","run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:button:62e4]
%   data: {"label":"Show Plot","run":"Section"}
%---
%[text:image:4890]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:editfield:2211]
%   data: {"defaultValue":"sin(t)","label":"f(t) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:1302]
%   data: {"defaultValue":-2,"label":"a = ","max":3.1415926535897931,"maxLinkedVariable":"b","min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:8d43]
%   data: {"defaultValue":1,"label":"b = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:6c34]
%   data: {"defaultValue":0,"label":"C = ","max":100,"min":-100,"run":"Section","runOn":"ValueChanging","step":10}
%---
%[control:checkbox:69b5]
%   data: {"defaultValue":false,"label":"Show only resulting area? ","run":"Section"}
%---
%[text:image:54a6]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:2cb5]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:1327]
%   data: {"label":"Initialize Values","run":"Section"}
%---
%[control:button:95d7]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:2766]
%   data: {"defaultValue":"\"0\"","label":"My answer is: ","run":"Nothing","valueType":"String"}
%---
%[control:button:8075]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:2be3]
%   data: {"label":"Analyze Results","run":"Section"}
%---
%[text:image:17fe]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:6e1d]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[text:image:8e11]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
