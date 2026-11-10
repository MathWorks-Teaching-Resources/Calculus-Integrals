%[text] %[text:anchor:T_60E8D80F] # Antiderivatives
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] The rates of change of variables turn up frequently when studying real-life interactions including position, velocity, and acceleration, or charge and current. In cases where we know the derivative and we want to determine the original function, then we want to find the *antiderivative.* 
%[text]{"align":"center"} ![A skier sliding down a red cosine curve with a blue sine curve in the background](text:image:9c2a)
%[text] By using the knowledge of derivatives, it is possible to define an operation that will undo a derivative. 
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:7063) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:8ea0) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning symbol](text:image:01ac)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
%[text] %[text:anchor:H_7407D086] ## Review of Derivatives
%[text]{"align":"center"} <u>**Power & Linearity Rules**</u> <u>**Transcendental Rules**</u> 
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[x^n\\right\] = nx^{n-1}${"altText":"d\/dx \[x^n\] = nx^(n-1)"}   for constant $n${"altText":"n"} $\\frac{d}{dx}\\left\[\\sin(x)\\right\] = \\cos(x)${"altText":"d\/dx \[sin(x)\] = cos(x)"} $\\frac{d}{dx}\\left\[e^x\\right\] = e^x${"altText":"d\/dx \[e^x\] = e^x"}
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[cf(x)\\right\] = c\\frac{df}{dx}${"altText":"d\/dx \[cf(x)\] = c df\/dx"}     for constant $c${"altText":"c"} $\\frac{d}{dx}\\left\[\\cos(x)\\right\] = -\\sin(x)${"altText":"d\/dx \[cos(x)\] = -sin(x)"} $\\frac{d}{dx}\\left\[\\ln(x)\\right\] = \\frac{1}{x}${"altText":"d\/dx \[ln(x)\] = 1\/x"} 
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[f(x)+g(x)\\right\] = \\frac{df}{dx}+\\frac{dg}{dx}${"altText":"d\/dx \[f(x)+g(x)\] = df\/dx + dg\/dx"} 
%[text] %[text:anchor:H_2B19BBCE] ## Definition of Antiderivatives
%[text] Define an antiderivative $F(x)${"altText":"F(x)"} of a function $f(x)${"altText":"f(x)"} by the relationship $\\frac{d}{dx}\\left\[F(x)\\right\] = f(x)${"altText":"d\/dx \[F(x)\] = f(x)"}. In any case where one antiderivative exists, there is an entire family of antiderivatives $F(x)${"altText":"F(x)"} for each function $f(x)${"altText":"f(x)"} because, by the linearity rule for derivatives:
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[F(x)+\\text{constant}\\right\] = \\frac{d}{dx}\\left\[F(x)\\right\] + 0 = f(x).${"altText":"d\/dx \[F(x)+constant\] = d\/dx \[F(x)\] + 0 = f(x)."}
%[text] Similarly, if we have found two different antiderivatives $F\_1(x)${"altText":"F\_1(x)"} and $F\_2(x)${"altText":"F\_2(x)"} for a function $f(x)${"altText":"f(x)"}, then we know that 
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[F\_1(x)-F\_2(x)\\right\] = \\frac{d}{dx}\\left\[F\_1(x)\\right\] - \\frac{d}{dx}\\left\[F\_2(x)\\right\] = f(x)-f(x) = 0.${"altText":"d\/dx \[F\_1(x)-F\_2(x)\] = d\/dx \[F\_1(x)\] - d\/dx \[F\_2(x)\] = f(x)-f(x) = 0."}
%[text] Because the only functions with 0 derivative are constant values, this means that $F\_1(x) -F\_2(x) = C${"altText":"F\_1(x) -F\_2(x) = C"} for some constant value $C${"altText":"C"}. This means we can define a symbol to represent the operation of finding an antiderivative:
%[text]{"align":"center"} $\\int f(x) \\; dx = F(x) +C,${"altText":"integral of f(x) dx = F(x) +C,"}
%[text] where $C${"altText":"C"} is a constant and $F(x)${"altText":"F(x)"} is any antiderivative of $f(x)${"altText":"f(x)"}.  
f = @(x) sin(x); %[control:editfield:87c7]{"position":[9,16]}
  %[control:button:4c14]{"position":[1,2]}
xVals = -5:.02:5;
syms x
F(x) = int(f,x);
figure
try
    pf = plot(xVals,F(xVals),"LineWidth",3,SeriesIndex="none");
catch
    pf = plot(xVals,F(xVals),"k","LineWidth",3);
end
hold on

Copts = [-5:.5:-.5 .5:.5:5];
FVals = F(xVals)+Copts';
pF = plot(pf.Parent,xVals,FVals,"LineWidth",1,SeriesIndex=1);
hold off
title("Plotting the family of antiderivatives $F(x)+C$","Interpreter","latex")
pfC = copyobj(pf,pf.Parent);
pfC.Color = [1 0 0];
legend(pf.Parent,["F(x)" "Family of F(x)" "F(x)+C"],"Location","bestoutside")
%%
%[text] To select a particular element of the family, choose a value of $C${"altText":"C"}.
C = -4;    %[control:slider:320c]{"position":[5,7]} %[control:button:7da5]{"position":[10,11]}
ani = false; %[control:checkbox:0a38]{"position":[7,12]}
Fx = double(F(xVals));
FxMin = min(Fx);
FxMax = max(Fx);
if ani
    pfC.Parent.YLim = [FxMin FxMax] + [-10 10]; 
    for C = [-10:.25:10 10:-.25:-10]
        pfC.YData = Fx + C;
        subtitle(pfC.Parent,"$C = $"+C,"Interpreter","latex");
        pause(0)
        drawnow
    end
else
    pfC.YData = F(xVals)+C;
    subtitle(pfC.Parent,"$C = $"+C,"Interpreter","latex");

end
drawnow
%%
%[text] %[text:anchor:H_729DB3C0] ## Antiderivatives are Linear
%[text] Just as with derivatives, antiderivatives are linear operators. Let $F(x)${"altText":"F(x)"} be an antiderivative for $f(x)${"altText":"f(x)"} and $G(x)${"altText":"G(x)"} be an antiderivative for $g(x)${"altText":"g(x)"}. Applying the derivative linearity rules and definition of an antiderivative we have: 
%[text]{"align":"center"} $\\int f(x)\\; dx + \\int g(x)\\; dx = F(x)+G(x) = \\int \\frac{d}{dx}\\left(F(x)+G(x)\\right)\\; dx = \\int f(x)+g(x)\\; dx${"altText":"integral of f(x) dx + integral of g(x) dx = F(x)+G(x) = integral of d\/dx (F(x)+G(x)) dx = integral of f(x)+g(x) dx"}
%[text]{"align":"center"} $c\\int f(x)\\; dx = cF(x) =  \\int \\frac{d}{dx}\\left\[cF(x)\\right\]\\; dx = \\int c\\frac{d}{dx}\\left\[F(x)\\right\]\\; dx  =\\int cf(x)\\; dx${"altText":"c integral of f(x) dx = cF(x) = integral of d\/dx \[cF(x)\] dx = integral of c d\/dx \[F(x)\] dx = integral of cf(x) dx"}
%[text] 
%%
%[text] %[text:anchor:H_C0CF8FA0] ### **Power Rule**
%[text] The power rule for derivatives states:  $\\frac{d}{dx}\\left\[x^n\\right\] = nx^{n-1}${"altText":"d\/dx \[x^n\] = nx^(n-1)"}   for constant $n${"altText":"n"}. This means the antiderivative of a power can be computed by taking the antiderivative of both sides:
%[text]{"align":"center"} %[text:anchor:H_732086B8] $x^n + C = \\int \\frac{d}{dx}\\left\[x^n\\right\] = \\int nx^{n-1}\\; dx = n\\int x^{n-1}\\; dx,${"altText":"x^n + C = integral of d\/dx \[x^n\] = integral of nx^(n-1) dx = n integral of x^(n-1) dx,"}
%[text] thus, for any value of $n \\neq 0${"altText":"n != 0"}, 
%[text]{"align":"center"} $\\int x^{n-1}\\; dx = \\frac{x^n}{n}+C.${"altText":"integral of x^(n-1) dx = (x^n)\/n +C."}
%[text] This is usually written as 
%[text]{"align":"center"} $\\displaystyle \\int x^n\\; dx = \\frac{x^{n+1}}{n+1}+C${"altText":"integral of x^n dx = (x^(n+1))\/(n+1) +C"} for $n \\neq -1${"altText":"n != -1"}.                $(\\star)${"altText":"(star)"}
%[text] %[text:anchor:H_7C3F8230] #### **Exercise 1**
%[text] Solve the integrals below in the variables given. In each case, you should identify the value of $n${"altText":"n"} and $n+1${"altText":"n+1"} as used in equation $(\\star)${"altText":"(star)"}. Use `C` for an arbitrary constant, as required. 
%[text] a. $\\displaystyle F(x) = \\int x^4\\; dx${"altText":"F(x) = integral of x^4 dx"} 
an = 0;         anp1 = 0;             asoln = @(x,C) x; %[control:editfield:0d6a]{"position":[6,7]} %[control:editfield:9196]{"position":[24,25]} %[control:editfield:92f0]{"position":[53,55]}
CheckExercise1(an,anp1,asoln,4)
%[text] b. $G(t) = \\displaystyle \\int t^{-7.3}\\; dt${"altText":"G(t) = integral of t^(-7.3) dt"}
bn = 0;         bnp1 = 0;             bsoln = @(t,C) t; %[control:editfield:97ba]{"position":[6,7]} %[control:editfield:06a9]{"position":[24,25]} %[control:editfield:63c6]{"position":[53,55]}
CheckExercise1(bn,bnp1,bsoln,-7.3)
%[text] c. $H(q) = \\displaystyle \\int q^{-1/7}\\; dq${"altText":"H(q) = integral of q^(-1\/7) dq"}
cn = sym(0);      cnp1 = sym(0);      csoln = @(q,C) q; %[control:editfield:258b]{"position":[10,11]} %[control:editfield:66b3]{"position":[30,31]} %[control:editfield:7741]{"position":[53,55]}
CheckExercise1(cn,cnp1,csoln,-1/7)
%[text] 
  %[control:button:6697]{"position":[1,2]}
%%
%[text] %[text:anchor:H_E45A114F] ### **Exponential Rule**
%[text] Start from $\\frac{d}{dx}\\left\[e^{ax}\\right\] = ae^{ax}${"altText":"d\/dx \[e^(ax)\] = ae^(ax)"} for constant $a\\neq 0${"altText":"a != 0"}. Taking the antiderivative of both sides we have:
%[text]{"align":"center"} $e^{ax}+C = \\int \\frac{d}{dx}\\left\[e^{ax}\\right\]\\; dx = \\int ae^{ax}\\; dx = a\\int e^{ax}\\; dx${"altText":"e^(ax)+C = integral of d\/dx \[e^(ax)\] dx = integral of ae^(ax) dx = a integral of e^(ax) dx"}
%[text] Solving for the antiderivative,
%[text]{"align":"center"} $\\int e^{ax}\\; dx = \\frac{e^{ax}}{a} + C.${"altText":"integral of e^(ax) dx = (e^(ax))\/a + C."} $(\\diamond)${"altText":"(diamond)"}
%[text] %[text:anchor:H_A8DD5961] #### **Exercise 2**
%[text] Solve the integrals below in the variables given. Use `C` for an arbitrary constant, as required and identify $a${"altText":"a"} as it is in equation $(\\diamond)${"altText":"(diamond)"} . Remember the MATLAB notation for $e^x${"altText":"e^x"} is `exp(x)`.
%[text] a. $\\displaystyle F(x) = \\int e^{6x}\\; dx${"altText":"F(x) = integral of e^(6x) dx"}
an = 0;        asoln = @(x,C) x; %[control:editfield:538b]{"position":[6,7]} %[control:editfield:620b]{"position":[30,32]}
CheckExercise2(an,asoln,6)
%[text] b. $\\displaystyle G(t) = \\int e^{-3t}\\; dt${"altText":"G(t) = integral of e^(-3t) dt"}
bn = 0;        bsoln = @(t,C) t; %[control:editfield:2d1f]{"position":[6,7]} %[control:editfield:30ea]{"position":[30,32]}
CheckExercise2(bn,bsoln,-3)
%[text] 
  %[control:button:5a62]{"position":[1,2]}
%%
%[text] %[text:anchor:H_BAE06ADB] ### Logarithm Rule
%[text] Start from $\\frac{d}{dx}\\left\[\\ln(x)\\right\] = \\frac{1}{x}${"altText":"d\/dx \[ln(x)\] = 1\/x"}, taking the antiderivative of both sides we have 
%[text]{"align":"center"} $\\ln(x) +C = \\int \\frac{1}{x}\\; dx.${"altText":"ln(x) +C = integral of 1\/x dx."} 
%[text] This only makes sense for values of $x \>0${"altText":"x \>0"}. What happens if $x \< 0${"altText":"x \< 0"}? In this case $u = -x \> 0${"altText":"u = -x \> 0"}. Then, using the chain rule for derivatives,
%[text]{"align":"center"} %[text:anchor:H_300C519F] $\\frac{d}{dx}\\left\[\\ln(u)\\right\] = \\frac{d}{dx}\\left\[\\ln(-x)\\right\] = \\frac{1}{-x}\\frac{d}{dx}\\left\[-x\\right\] = \\frac{-1}{-x} = \\frac{1}{x}.${"altText":"d\/dx \[ln(u)\] = d\/dx \[ln(-x)\] = 1\/-x d\/dx \[-x\] = -1\/-x = 1\/x ."}
%[text] This means that
%[text]{"align":"center"} $\\displaystyle \\int \\frac{1}{x}\\;dx = \\ln(|x|)+C${"altText":"integral of 1\/x dx = ln(|x|)+C"}       for $x \<0${"altText":"x \<0"} or $x\>0${"altText":"x\>0"}.
%[text] 
%[text] %[text:anchor:H_63780B43] #### **Exercise 3**
%[text] Solve the integrals below in the variables given. Use `C` for an arbitrary constant, as required. Remember that the MATLAB notation for $\\ln(x)${"altText":"ln(x)"} is `log(x)` and for $|x|${"altText":"|x|"} is `abs(x)`.
%[text] a. $\\displaystyle F(r) = \\int \\frac{1}{r}\\; dr${"altText":"F(r) = integral of 1\/r dr"}
asoln = @(r,C) r; %[control:editfield:91b2]{"position":[15,17]}
CheckExercise3(asoln,1,"ln")
%[text] b. $\\displaystyle G(t) = \\int \\frac{-2}{t}\\; dt${"altText":"G(t) = integral of -2\/t dt"}
bsoln = @(t,C) t; %[control:editfield:0fbf]{"position":[15,17]}
CheckExercise3(bsoln,-2,"ln")
%[text] c. $\\displaystyle H(w) = \\int \\frac{1}{8w}\\; dw${"altText":"H(w) = integral of 1\/(8w) dw"}
csoln = @(w,C) w; %[control:editfield:3ba7]{"position":[15,17]}
CheckExercise3(csoln,1/8,"ln")
%[text] 
  %[control:button:3dd6]{"position":[1,2]}
%%
%[text] %[text:anchor:H_3623407C] ### Cosine Rule
%[text] Start from $\\frac{d}{dx} \\sin(ax) = a\\cos(ax)${"altText":"d\/dx sin(ax) = acos(ax)"}. Taking the antiderivative of both sides, we have:
%[text]{"align":"center"} $\\sin(ax)+C = \\int \\frac{d}{dx}\\sin(ax)\\; dx = \\int a \\cos(ax)\\; dx = a\\int \\cos(ax)\\; dx.${"altText":"sin(ax)+C = integral of d\/dx sin(ax) dx = integral of a cos(ax) dx = a integral of cos(ax) dx."}
%[text] Solving for the antiderivative,
%[text]{"align":"center"} $\\int \\cos(ax)\\; dx = \\frac{1}{a}\\sin(ax) + C${"altText":"integral of cos(ax) dx = 1\/a sin(ax) + C"}
%[text] %[text:anchor:H_A6273914] #### **Exercise 4**
%[text] Solve the integrals below in the variables given. Use `C` for an arbitrary constant, as required.
%[text] a. $\\displaystyle F(r) = \\int \\cos(4r)\\; dr${"altText":"F(r) = integral of cos(4r) dr"}
asoln = @(r,C) r; %[control:editfield:177e]{"position":[15,17]}
CheckExercise3(asoln,4,"cos")
%[text] b. $\\displaystyle G(t) = \\int \\cos(-9t)\\; dt${"altText":"G(t) = integral of cos(-9t) dt"}
bsoln = @(t,C) t; %[control:editfield:684b]{"position":[15,17]}
CheckExercise3(bsoln,-9,"cos")
%[text] c. $\\displaystyle H(\\theta) = \\int \\cos\\left(\\frac{2\\theta}{3}\\right)\\; d\\theta${"altText":"H(theta) = integral of cos( (2theta)\/3 ) dtheta"}                                             Note: $\\theta${"altText":"theta"} should be `theta` in the typed solution.
csoln = @(theta,C) theta; %[control:editfield:50b0]{"position":[19,25]}
CheckExercise3(csoln,2/3,"cos")
%[text] 
  %[control:button:95d2]{"position":[1,2]}
%%
%[text] %[text:anchor:H_9DEB6BE6] ### Sine Rule
%[text] Start from $\\frac{d}{dx}\\cos(ax) = -a\\sin(ax)${"altText":"d\/dx cos(ax) = -asin(ax)"}. Taking the antiderivative of both sides, we have:
%[text]{"align":"center"} $\\cos(ax)+C = \\int \\frac{d}{dx}\\cos(ax)\\; dx = \\int -a\\sin(ax)\\; dx = -a\\int \\sin(ax)\\; dx${"altText":"cos(ax)+C = integral of d\/dx cos(ax) dx = integral of -asin(ax) dx = -a integral of sin(ax) dx"}
%[text] Solving for the antiderivative,
%[text]{"align":"center"} $\\int \\sin(ax)\\; dx = -\\frac{1}{a}\\cos(ax)+C.${"altText":"integral of sin(ax) dx = - 1\/a cos(ax)+C."}
%[text] %[text:anchor:H_5B6D5CFD] #### **Exercise 5**
%[text] Solve the integrals below in the variables given. Use `C` for an arbitrary constant, as required.
%[text] a. $\\displaystyle F(r) = \\int \\sin(9r)\\; dr${"altText":"F(r) = integral of sin(9r) dr"}
asoln = @(r,C) r; %[control:editfield:2d49]{"position":[15,17]}
CheckExercise3(asoln,9,"sin")
%[text] b. $\\displaystyle G(t) = \\int \\sin(-2t)\\; dt${"altText":"G(t) = integral of sin(-2t) dt"}
bsoln = @(t,C) t; %[control:editfield:0624]{"position":[15,17]}
CheckExercise3(bsoln,-2,"sin")
%[text] c. $\\displaystyle H(\\theta) = \\int \\sin\\left(-\\frac{\\pi \\theta}{2}\\right)\\; d\\theta${"altText":"H(theta) = integral of sin(- (pi theta)\/2 ) dtheta"}               Note: The variable $\\theta${"altText":"theta"} should be `theta` in the typed solution and the constant $\\pi${"altText":"pi"} should be `pi`.
cinput = str2sym(" theta"); %[control:editfield:332f]{"position":[18,26]}
csoln = matlabFunction(cinput,Vars=[sym("theta"),sym("C")]);
CheckExercise3(csoln,-pi/2,"sin")
%[text] 
  %[control:button:9cf2]{"position":[1,2]}
%[text] %[text:anchor:H_277A71EB] ## Practice Randomized Antiderivatives
%[text] ![](text:image:840f) **Pro-tip**. MATLAB syntax is 7`*t^(2/3)` for $7t^{2/3}${"altText":"7t^(2\/3)"}. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators.
% Clear variables that may be reused in other parts of this module
clear errorCount totAntiProbs totAttempts adjustcount lastFive myFun varChoice
syms t r x z C                       % Declare symbolic variables
varOpts = [t r x z];                 % Define the list of variables to use in the problems
errorCount = 0;                      % Initialize a count of errors
totAntiProbs = 0;                    % Initialize a count of total problems attempted
totAttempts = 0;                     % Initialize a count of total solutions offered
adjustCount = 0;                     % Preserve the counts if the user resubmits a solution
lastFive = zeros(1,5);               % Initialize a matrix to record the last five solution results
  %[control:button:19f4]{"position":[1,2]}
disp("Values initialized for Antiderivative Practice.")
%%
% Check if the previous section has run
% If not, provide warning. If so, generate a problem.
if ~exist("totAntiProbs","var")
    warning("You must initialize values before you can generate a problem.")
else
    [myFun,varChoice] = GenProbType(varOpts,1);  % genProbType is defined in Helper Functions
    % genProbType sets up a variable and generates a randomized function
    totAntiProbs = totAntiProbs+1;     % Increase the count of total problems attempted
end
                                   % Run this section %[control:button:37a5]{"position":[1,2]}
%%
myAnswer = r;     % User-defined solution, default value r %[control:editfield:46ec]{"position":[12,13]}
totAttempts = totAttempts + 1;       % Updates count of total attempts at solution
[lastFive,errorCount,totAttempts,adjustCount] = ResubmissionCheck(totAttempts,totAntiProbs, ...
    adjustCount,myFun,varChoice,myAnswer,errorCount,lastFive);
% resubmissionCheck is defined in Helper Functions
% resubmissionCheck records the attempt and provides appropriate feedback
                          % Run this section %[control:button:2ba2]{"position":[1,2]}
%%
%[text] Once you have completed sufficient practice, track the overall results of your practice here:
  %[control:button:83ab]{"position":[1,2]}
AnalyzeResults(totAntiProbs,errorCount,totAttempts,adjustCount,lastFive)
%%
%[text] %[text:anchor:H_A6960D98] ### Practice App
%[text] You can practice in the Calculus Flashcards app. You can start the app by clicking on the image below. You should set the problem type to be "Integrals of Functions" in the Integrals section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus Flashcards App Settings](text:image:5257)](<matlab: CalculusFlashcardsApp>)
  %[control:button:0309]{"position":[1,2]}
CalculusFlashcardsApp
%%
%[text] [⇦ Main Menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_0AAABA39] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:1fe0) at the top right of the Live Editor pane.
%[text] **Check Exercise 1**
%[text] Check that some effort has been made and give appropriate feedback.
function CheckExercise1(n,np1,mysoln,nReal)
syms x C
if n == nReal
    if nReal+1 == np1
        if isAlways(diff(mysoln(x,C),x)==x^(nReal),"Unknown","false")
            if diff(mysoln(x,C),C)~=0
                disp("This solution is correct.")
            else
                disp("Although you have the correct identification of n and n+1, your answer is incorrect because it is missing +C")
            end
        else
            disp("Although you have the correct identification of n and n+1, your answer is incorrect. Please check the power rule.")
        end
    elseif np1 == 0
        disp("You have begun the problem. Please finish before submitting.")
    else
        disp("Although you have the correct identification of n, you have an incorrect value for n+1. Please check your arithmetic.")
    end
elseif n == 0 && np1 == 0 && isequal(mysoln(x,C),x)
    disp("Please attempt the problem before submitting.")
else
    disp("That is not the correct value for n. Please check your patterns and try again.")
end
end
%[text] **Check Exercise 2**
%[text] Check that some effort has been made and give appropriate feedback.
function CheckExercise2(n,mysoln,nReal)
syms x C
if n == nReal
    if isAlways(diff(mysoln(x,C),x)==exp(nReal*x),"Unknown","false")
        if diff(mysoln(x,C),C)~=0
            disp("This solution is correct.")
        else
            disp("Although you have the correct identification of a, your answer is incorrect because it is missing +C")
        end
    else
        disp("Although you have the correct identification of a, your answer is incorrect. Please check the exponential rule.")
    end
elseif n == 0 && isequal(mysoln(x,C),x)
    disp("Please attempt the problem before submitting.")
else
    disp("That is not the correct value for a. Please check your patterns and try again.")
end
end
%[text] **Check Exercise 3**
%[text] Check that some effort has been made and give appropriate feedback.
function CheckExercise3(mysoln,a,type)
syms x C
assume(x,"real")    % Add assumption on x to avoid complex derivatives
switch type
    case "ln"
        integrand = @(x,par) par/x;
    case "cos"
        integrand = @(x,par) cos(par*x);
    case "sin"
        integrand = @(x,par) sin(par*x);
end
if isequal(mysoln(x,C),x)
    disp("Please attempt the problem before submitting.")
elseif isAlways(diff(mysoln(x,C),x)==integrand(x,a),"Unknown","false")
    if diff(mysoln(x,C),C)~=0
        disp("This solution is correct.")
    else
        disp("Your answer is incorrect because it is missing +C")
    end
else
    switch type
        case "ln"
            disp("Your answer is incorrect. Please check the logarithm rule.")
        case "cos"
            disp("Your answer is incorrect. Please check the cosine rule.")
        case "sin"
            disp("Your answer is incorrect. Please check the sine rule.")
    end
end
assume(x,"clear")
end
%[text] **Practice Problem Generating Functions**
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
%[text] Check the submitted solution for correctness
function [lastFive,errorCount] = Check1(myFunc,myVar,myAnswer,errorCount,lastFive)
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
syms C
correctAnswer = int(myFunc,myVar)+C;
lastFive(1:4) = lastFive(2:5);
disp("When simplified, this function is: ")
disp(myAnswer)
if correctAnswer == myAnswer
    disp("That answer is correct.")
    lastFive(5) = 1;
elseif isAlways(diff(myAnswer,myVar)-myFunc==0,"Unknown","false")
    if diff(myAnswer,C) == 1
        disp("That answer is correct. Another possible form is:")
        disp(correctAnswer-C + "C")
        lastFive(5) = 1;
    else
        disp("You are missing a +C.")
        disp("The correct answer is:");
        correctAnswer %#ok<NOPRT>
        errorCount = errorCount + 1;
        lastFive(5) = 0;
    end
else
    disp("That is incorrect. The correct answer is:");
    correctAnswer %#ok<NOPRT>
    errorCount = errorCount + 1;
    disp("Please try again with a new problem.")
    lastFive(5) = 0;
end
end
%[text] Construct a problem to display
function [myFun,varChoice] = GenProbType(varOpts,probType)
% genProbType sets up a variable and generates a randomized function
%
% Inputs: varOpts is an array of possible variables
%         probType is a string that identifies the function type
% Outputs: myFun is a symbolic function
%          varChoice is the independent variable
%          probType is an integer tracking the type of question asked
%          [a, b] are the bounds for the definite integral, if required

% Randomly select a variable from the set varOpts
varChoice = varOpts(randi([1 length(varOpts)],1));

% Use genFunDiff to generate simple functions
% genFunDiff is defined in Helper Functions
% The inputs to genFunDiff are the variable varChoice, a range of values
% from which to select coefficients and a value indicating which warnings
% have already been printed during problem generation
switch probType
    case 1 % Simple integral problem
        syms f(x) x F(x) %#ok<NASGU>
        [f(x),~] = GenFunDiff([1 10],x,[1 10],0);
        myFun = diff(f(varChoice),varChoice);
        % Display the integral problem
        disp("Calculate the integral:")
        displayFormula("F(varChoice) == int(myFun,varChoice)")
end
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
    adjustCount,myFun,varChoice,myAnswer,errorCount,lastFive)
if sum(totAttempts > (totProbs + adjustCount))
    % Check if this is a resubmission after the solution has been provided
    % If so, provide feedback but do not record in errorCount or lastFive
    % If not, update the values of lastFive and errorCount using check1
    adjustCount = totAttempts-totProbs;
    [lastFive,errorCount] = Check1(myFun,varChoice,myAnswer,errorCount,lastFive);

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
        [lastFive,errorCount] = Check1(myFun,varChoice,myAnswer,errorCount,lastFive);
    end
else
    [lastFive,errorCount] = Check1(myFun,varChoice,myAnswer,errorCount,lastFive);
end
end

% Supress Code Analyzer warnings about code inaccessible behind a live
% control
%#ok<*UNRCH>

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode"}
%---
%[text:image:9c2a]
%   data: {"align":"baseline","height":122,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAABLAAAAFHCAYAAACxjrXJAAA7kElEQVR42u3dT6hlV34f+obGuG1QPLDBeNBoENztYIN6IkLSAw3aHhfo8QIxJCVPXhfhmepne2ACRQ16ooCgAkKDCFIFbyIJAkUQDzWBSMhQA4knGiFF8JR+Vf2KpxYqpBJClrtRMDd8r3y6b906a+21z97nnP3n84GD2\/Xn6tY55+6z9nf91u\/3tRMAAAAAmLCveQoAAAAAmDIBFgAAAACTJsACAAAAYNIEWAAAAABMmgALAAAAgEkTYAEAAAAwaQIsAAAAACZNgAUAAADApAmwAAAAAJg0ARYAAAAAkybAAgAAAGDSBFgAAAAATJoACwAAAIBJE2ABAAAAMGkCLAAAAAAmTYAFAAAAwKQJsAAAAACYNAEWAAAAAJMmwAIAAABg0gRYAAAAAEyaAItZ+vH\/\/\/nJaz+5f3LjzZ+dXP3R7eZH\/nz+Xh4AMCW\/uPPuyRfv3jr57NUXTz5+6ZmmR\/5s\/k7+Lnz6d\/\/jl+uca6\/f7bVGyt+588nPPYkATJYAi8nbLMIu33z\/5Inn3jr5rX\/7+snX\/uK\/jvLI18rXvPjCe6f\/DcEWAPuWwOn+y8+f3Lt+5eTulSdP\/vu\/+vbJ\/\/O\/\/N4oj3ytfM187fw38t9ieRI0Zc2S4OnC9bdP1zJjrY3yePSHt06\/5mbzLxuHAHBsAiwmJTuHN9+598uwaszFWJ\/HY8+8cfo95HvJ9wQAu\/j7v\/3s5PM3XjkNlH76l98bLajq+8h\/O99Dvpd8T8xLAqsESdlwS7h0jLXRZtMvoZZAC4BjEGAxiUVZqp+OGVi1BFoWbAC0yHG+VD+lEupYgVVLoJXv0dHD6com2jEDq5ZAK9VfCdZs9gFwCAIsjmITWiUYmmpoVXqkMkuQBcBZX35097TC6falxycbWpUe+Z7zveffwHFtQqsx2yUc6iHMAmDfBFgcTBY0WdiMXWmVr9f6GLs\/REI4CzWAdcpRvDRR38fRwFRvtTz2UZnliOHhZWMvG2T7OPLX8hi7yishXMI4ABiTAIuDGbo42jRbH+Mo36b56VjN4fN9aQAPsA45dvfhs5dHCanONlsfcpxvM8HwbHP4IY3g8+9zvHD\/hm7snW+2nrXIkI21\/P0ET5vm8EMr5W32ATAmARYHk5Cnb1+FLHoOeVwv\/60hTVKz0MvfB2B5Um21azCUY3oJhfI1DhkMbfpx5b+9y7TD\/HvzPTOehDkJiHbZODs7ZCabcYf6fjcTD3cN2\/JvzdrqUN8zAMskwOJgsviZW6P0fC+7NJhP+CXIAliGBDi79LaaYqP0TaDV99hj\/v2CrGES3vQNrjbBz9R6S20mRu+y2Zd\/j16iAOxCgMVBnV\/oJLRKQDSHHblND6++O46CLIB52iW42oRWc2iInu+xb5glyNpt\/dCnv9UmtJpLD6mEUbuEWdkc1H4BgD4EWBxUwqoszOY8yW+zg9pnoaYiC2Be+gRX+bMfv\/TMrKf45XvPv6H13y3I6rbLUcG5T\/HbTFHsW5HlaCEALQRYHHwxtyRZqKVXV5\/eFXYbAaYrjdBb+1zlz33+xiuLew769PnKn81zxoM2G3Z9Kq6WdKxuE9712ezT6B2ALgIsGEF2DrP4bF2sJvSy2wgwHalA+uDpp5pCmzREn3O1Vevz0WfS4hqekxbZpGoNbbJmSMiz9OAmVWUt0wzzfCT4A4ASARaMqO9xgTUsXAGmLkfnWib0rTGk6RNk5TnMc7lG2ZRqHfiy1rYCCfdanqM8P6rVAdhGgAV70CfIslADOI4cfWvp+aS6qF+Qled0TccK+3ze64fZHmSlWt0mHwBnCbBgjzZHC1uPFVqoAezf3\/\/tZyf3rl8RXO2gT5CV5zjP9VKlZ1Xr0TgV1w9LH9Gu45Z57uYyjRGA\/RNgwYEWuS27jRZqAPvVWnWlMXndL+6829TsPccKl9joPoFUy+ZUpi4LrupSldZVwZY1lN6hAAiw4IBadhtVYwGMr7XqKoHLZ6++6AlrlOeqpX\/YUqqxWquuBC79ZM1jkw+ALgIsOMIirWXnNgs1vbEAhku1UEvV1dKPvO1Lazg4995YrZ\/dQpbdtFar2+QDWC8BFkx8oZbjBwDsJlPxuoKVn\/7l905DLobJc5jnsuv5ntukwtYJg44LjuPa63c7jxQagAOwTgIsmMFCLccVHEUAaJdm4y09muYWpsxBS2iY12YODfJTTSVMObzW0DBVcQCshwALZrJQcywBoE2OqXX1ZVJ1tV8t1VhTb\/CeiipVV8fV2uDdawCwDgIsmJBUY3UtlgEoa6n+UXXl9ahJGNLVqF3V1eG0bvJ5PQCWT4AFE9M14Si\/Z6cR4EFpJN51ZHDuTcTnqqWJfl67qTTQ76r40UT8OFqa6GcjEIDlEmDBhHWVzuf3AdYsR9C6jgt+9uqLnqiJyGtRe73ye8dy8YX3qptH2WDi+BIeJkTUOxRgfQRYMHFdFVlZcAOsUdfxtFT96HM1PV0VWYc+Uth1ZDCfsyqupqer7UI2AIWOAMsiwIIZyMK5tjPsOAOwJjlq9uGzl6vh1QdPPzWZI2lsfw3zGpVev7y+h3j9EnCkn5UjafOU16\/ryKdqdYDlEGDBjNR2G\/XGAtYgoUbXdDtN2uejVkWX13mfIVaafpfCD03B56Ol6X76ZwEwfwIsmJnaTqNyeWDJcvSsFl6lf5J+V\/NT62OW13sfx0BTlaN\/0rLUKtW1XABYBgEWzEwW1bWdRrvGwBIlxKg1\/9bvav6vb6kvVl73MV\/byzffrwYdqpnnqxZM5vHEc295fQFmTIAFM5TFVxZhej4Aa9A1uW7fR804jNrx0LGq67qqdBJuMW8337lXrVbXcgFgvgRYMGNdC3EhFjB3CS1q\/a4O1eybw6m93kNCLJ+Z69HV3D0hlpYLAPMjwIKZ6xojbTcZmKuW8Irl6Zow2TfE6mry7ej9MrW87kIsgHkRYMECdPV80LgUmKN9VeIwfV3h5b3rV5q+jhBj3bpaLnj9AeZFgAULURsHLsQC5qZWhSO8WoehFXhd4ZVeSOtROz4qxAKYDwEWLEhXzwchFjAHpfBq7Gl0TF\/X9MlSiCW84ryuEAuA6RNgwcIkxHr0h7eEWMAsCa84r2+Ilc\/BWniVI2XCq3Wq9Q3VxB9g+gRYsEB2noE5El5R0hpiqUSmS61vqBALYNoEWLBQQixgToRXdOkKsf7bv\/s3wiuaCLEA5kmABQsmxALmoBRe3b70uPCKB3SFWE9f\/BfCK5oIsQDmR4AFC9cVYlnUA8dUmzb493\/7mSeIh3z50d2Tn\/7l95pDLJ9zlJRCLJMJAaZJgAUrIMQCpqgWXiWggJKEmy0hls83ugixAOZDgAUrIcQCpqQrvFJ9RZf7H39y8l\/+9T8rvo\/+019c9CTRRIgFMA8CLFgRIRYwBcIrxvo8+0c\/ePnkP\/\/Lf9o5nRA6b4oKayMhFsCErtWeAljnol+IBRzD\/ZefF14x6udYV4j18UvPeNLoVGvqLsQCmAYBFlj8P\/S4+qPbniRgdJ+9+qLwir18fnWFWHnvQRchFsC0CbDATYAR0sDeCa8YQ6qES59b3\/8\/36w2dhdi0aIrxLrzyc89SQBHIsCCFRNiAYfwxbu3iqHCf\/9X3z75xZ13PUl0qoVXm+PvX3509\/Q9VXq\/5b0IXWohVtZNWT8BcHgCLFi5lMNnR1GIBexDwqlSoCC8olUtvDofKHjPMQYhFsD0CLCAaoil5wOwK0ECY0hfxr5BgvceY7j2+t3ie++J597yBAEcmAALOCXEAsbUdZTr8zde8STRaUgVTN5jtaOr+q7RouXoKgCHIcACfikhVa1xKUCLBAOaaTPUzXfuDT7CZXgAYxBiAUyDAAt4QG23W78HoIvwijF0VQX3+TwSYjEGQ28Ajk+ABWxVCrLsNAIlHz57uRgU5PdgaFAw5Di79ydDdU1vfu0n9z1JAHskwAKKSiXzaagLcFatykU4QJ+AYJ9VLrUQS3UgLfQMBTgeARZQdeH628rlgapas+y7V570BDGpz5y8Jw0XYIhaiPXoD29puQCwJwIsoKpWLq9UHvjFnXeL0wb1F6KPyzffP8jR9VqftryXoUXWQEOHDADQjwAL6JRFWHYUlcoD54OAUniVX\/\/yo7ueJJocuu9i3pul967QlaHvWz1DAfZDgAU0SVA1xjQoYBm6qlhSmQUtSpUsqWLZp1L1oMpB+khf0FKIpWcowLgEWED7BUOpPPAPPnj6Kc2wGazUS+hQnyul4QN5f0Or0tAbPUMBRr4f9RQArZTKA1Gb5Hb\/5ec9QTQp9Vg89PH0vGe3vZfvXb\/iRWLQe1m7BYBxCbCAXpTKw7qVKlbySLAFrZ547q3JDAgphbKqCWlV6he6CbHufPJzTxLAQAIsoLdaqfzNd+55gmChvnj3VjG8unvlSU8Qo3yOHEupp1ve99CidCRWuwWAcQiwgJ0olYd1qU1t0\/SaPmrH0S\/ffP9o31dpMIGhBPSRjbzS+\/vC9bc9QQADCLCAndRK5fPrdhlhObomDibcghaliYNTublPUCWkZahrr9+dZEgLMHcCLGBntVL59DYBlqHWtF1lCq3SA2gOx6tK73WTCenDZEKA8QmwgEFMJoRl+\/ilZ4o39Bpc06prStuUGlzXBhXk5wFalQYVaLcAsBsBFjBYbTKhXUaYr8\/feMXEQUZRq0aZ4o38vetXiu\/9\/FxAi1pwq90CQH8CLGAU6V0yp5sToFutaTu0qlXqTnmTI5M1S33fHJ2llXYLAOMRYAGjmNPxEKBbGlZvu3m\/felxzazpdfM+12PmeZ\/n\/a6pO0PVJhNq6g7QToAFjKarQS8wH2lYrfKEIWrTaufymZD3e6kSUVN3+qi1WwCgjQALGFVtRLqm7jAPpcbtmrbTR62B9ZyqcjV1ZyyldgtaLQC0EWABo5trvxOg3Lg9Ta2hVY5FlT4HstExN5q6M4ZSuwUN3QHaCLCAvShNnDI6GqardFwqzayhVa3fT45RzZWm7oyh1NQ91VkA1AmwgL0wOhrmJQ2p05ha03b2cXO+hBt0Td0ZSynknXPAC3AIAixgb2pN3e00wrR8+OxllSUMUtu4yK8vYeOi1tQ9P0PQqtTUPeEWANsJsIC9WupREliSUpNqTdvpo9SgemlHx2tN3f3M0Me2QQdzG3IAcEgCLGDvaqOj7TTCcdUqSqDVtdfvrmp4R6mpu6pF+khVYtoqbKtYBOBhAizgIJYyTh2WpNT3atPTB1pkqmApvMo0wqWq\/ezoh0WrVCeu7WcHYFcCLOAgSruMS+qNAnOzre\/Vporky4\/ueoJouraXeh1m42LJ8jNSql784OmnvDlovyFTpQ7Qdr30FACHUtpltNMIh1fr4\/P5G694gmhSatqeUGsNGxP5WSn9HN1\/+XlvEJpcfOE9VeoADQRYwEGlF4qdRjiuWt+r9PaBITfdeSypaXuXUj+sPPTDokXXBE8AviLAAiZz02OnEfZP3yvGUNuMSEP3tbl75cmtP1O3Lz2uHxZNEvqWjuOqUgf4igALsFCDlXBskKH0Myz74t1bjhMymE0+gDIBFnA0jhPC4eQoU+nm2rFB3FyP4+OXnnGckEEcJwQoE2ABk70ZMpkQxpEjTDnK5NggQ9h0aOM4IUOpUgfYToAFHFVtp3HpI9jhUD54+qmtN9Rp5P7lR3c9QXRKdVXphvrqj257gs5ISFUakpCfxTX68Y9\/7I3Rk8AY4GECLOD4C9vKTqMbIxgmvXdKR5rSswdaONLUz9r7YX366acn165dO7l48eLJhQsXTh577LGT3\/qt3zq5evWqN0cPjuwCPEiABUxCplaVdhpf+8l9TxDsoNb3Kr16oEWOLLmJ7m+t\/bBu3rx5Gl4lxDr\/6wmxLl++7M3RSD8sgAcJsIDJuHD9bf2wYCS1vlfp0QMtsoHgGNPuxu6HlaN4Uw2AEljle6sdF0yw9bWvuf3o9ZrrhwXwSz5BgOksfivj2fXDgn5qfa80kqb1mly6cc7RJrrt0g8rR+4effTRk9dee+3B1+PTT0+P4k2xn1S+tyeeeOKhqqttfy4B1vl\/G3W1fliq1IE1EWABk5KdxtIiDWij7xVjyMZB6eiSqth2ffthJeRJr6gEPQmz7ty588vw6saNG5P8N+b7bA2lBFi7MbUZQIAFTFCpH1bCLaBO3yv2eR12Ld7NLv2wElylqumRRx457R31\/e9\/f5L\/tlSEJVxrvvlwhHAnpjYDCLCAidrWDyvHC+0yQpm+V4yhVgmbYIvd7NIPK5VX3\/rWt06++c1vngY\/U5zil++p9fvqG3bR\/rNpajOwBgIsYJJKvVcSbAHb6XvFGEq9CF1\/h9mlH1aaom\/Coc0Uv6n1wcr319pYPn8ujdzZnanNwJoJsIDJKk2\/UgEAD9P3itEWh\/rs7E2ffljpE3W+WikVWek3tanG6mqa3iLBWJrG7xos5fvI3++yORLJcKY2A6tdo3gKgClLSfy2BZoeLPAr6aFTquzQ94o+StPOVHaMp9QPKz\/DZyXASuizTX4vodG2aYV9pZorgdiuzdXzPebvXrx4sfhnErTl98cI3DC1GVgvARYHlx3Gz994xRNBs22TsEzBgl\/56V9+T98rBrvzyc+3Ht3WW2d8pX5YfSQMypG8TXg0JBzK0cRUYOVrpUoqVVl9ZDri5u+eDcHyPeX38rWFV+PSDwu65Z5z27RX5kuAxcGk98OmP4t+LPRapBf6YWWkNKzdvetX9L1iFNsmnOXX2M+aaFvVZH6et6lVY20ao29CqF3kWOImBNscCcwjAdm2MOtv\/uZvTr7xjW888Hv5\/vLnE2JtHvn\/S983w+mHBW3X2dyDWhMtgwCLg0j6fX6hpjKAPm6+c2\/rAi3HXWCtav10VLrSx+Wb7289rp2qLPa3NmrtWddSFZXwatPkve9RwPzd832sEowlzMp\/e\/N1E3Q988wzp9VWf\/RHf6SqagJK\/bBMbmbtzle65l7U2mj+BFjsXW3qjpJOel2wCg1L9cPCtbWtigO2KQ3MyMYB+7WtgnJb9WRCpFqPqY1Nr6m+xwo3fbC6\/PEf\/\/Hpn\/v2t78tvJqIWj8sleqsVWmwjer0BdwPego49kUkzYehxbbjLY64sFabI9nnH+mHZXFGn5tfR7SPJz+r23rY5ef7rPSRShVU63G8VGBtKqdSRdV0U1AJsBJWfetb3zr9M7\/7u78rvJqYWj8sQTRrUxtso3hi\/gRYTOJmC1qUGgznkeMvsBalTYE8bArQhyEZ07jZarnReuSRR05+53d+p9fXTvC16WfVdQQxgdc2qc76jd\/4jZNf+7VfO\/n93\/994dVEbZvavKlU9\/PMmpQG25zfGGCeBFgcjOMujKHUC0vDUtZ0s2tnkX3e8DqWfXjbQunzVeqbKYF\/\/dd\/3etrbxqzpxrr\/JTAs7YdUXzuuedOfv3Xf\/307\/7Jn\/yJ8GriSpXqCaphDQy2WT4BFgdValhaaloK22xrNmyXkbUo7SwajEEftSNHHMf5hsPbqtS\/853vnHz961\/fKUg62x8rzdjPH0c8f9Twr\/7qr07\/7O\/93u+d\/OAHP\/ACzUCtUj0TC2HJDLZZBwEWB1dKxm9felwyTtsi\/O\/+R3GXMdN4YG3XTzuL9L2Glpo+u4YeT36Gu6rUf\/rTn54eB0wAtXPIcefOA43eN0HW2SOGm9\/\/zd\/8zdMqLOYjQVUpnFZdyZKvn7mXdNJn+QRYTOoC42wyrWrVAzfe\/JkniMWxs8hYElJtu3Ym1FLFelwtVeo5AphwqaunVefn6I9\/fHqkcBNkvfDCC6e\/vgmvEpSlCovl\/IwbesNSlXotK5BYHgEWR1FqWOpGjD5qDUtTRg9LoYcgY0nAr4\/gdLVWWSZkSl+qMXpSbSYWJrT6sz\/7s9P\/+93vfvc04GKeStNFDb1hiWotagy2WR4BFkfz8UvPFBdpX37knD5ttk3QssvI0tSmuNpZpFUqV0s3tdkQ4Pjy89wyQSvBVQKsIUcJz9tUduXrvv22o6Rzl0BaWM3S5Z6xtMGXe02WR4DFUW1rWKoZMX3UGpa6IWMJtk0ns7PILkwom4dalfrZSaM5QjjGUcKNVFz9wR\/8wWkodr4\/FvNUGnrjuDDuJZkrARZHVUvNjYOn1c137mlYymJvZF0jGYMj1\/NSCq5zPTgbXF++fHmUo4Sbiq7N1znb6P0P\/\/APT6uzmB9Db1jrddJpnuUSYHF0n736ouoCBtOUmCUqHSWys0gftaNE2QBgmkqVBbku\/DKg+PTTUaYSfuc73zkNq87LUcJLly6dhluPPfbYaNVeHE5t6I2ff+aqVqmae0uWS4DFJOjvwlC1sfAaljJXLc2cwbVxmVqHN2x6V924caPfe+PTT0+uXbt2GlLl71+9erXzz6rEmicVmCzt2tjSK5BlEmAxGbUR8WfHR8OuizSVWMz9xtXEQfpwvHoZWiYTJmBKhVSmCbbaTB7cHBNk2Wo9Q8H9InMhwGJ2izToolExc7etKlVFKn0ksDfgYhlaqw3ShL2rkuqsswHWb\/\/2b3uiV+DGmz8TaDPra2FLVSrLJsBicpSEMlRtVPy11zV1ZNpKTUn1BKSPBPbbroEJ+Jmf1smEOeaXQCphVpfNn\/3GN75x8v3vf9+TvBLbeobmuqBKnamrtZxhPQRYzGqRpikfrRJUlY4S2mlkqkqTWU0cZKzrn34389U6cSuVVWns3jKZMEHXd7\/7Xc3ZV6RUnaknHlNm6BcbAixmvUiDmtJkQhUITNW2ClQTB+lDBeqytU4mzNTAixcvNn3NBF6as69LaTJpfh2mprS5Z4NvnQRYzHqRBjW1HjB2Gpmaj196Rv8\/Biv1AEygz\/zVesDkGrKRiqocD\/zzP\/\/zzkosAdY6ZR1k4A1zUGovY4NvnQRYTFYtbYdWtSlcdhqZitLR6c\/feMWTQzNTWNch14WWozR\/+qd\/evL1r3\/95JFHHjntd1WS44YCrHXaFngLu5mSbZt7TuWsmwCLWS7SnHWmj227jHk8+sNbbuo4ulRU3L70uLCeQUpHgvJIkM+yfPjs5a3XjFxLzlZtPvbYYyff\/OY3T48U5n9va+6eSi0B1jrlyPG2a0amFcKx1foi2+BbLwEWs1yknV+gQU1CKsdqmKqMfi7diELrNS6BvOPS61ELvs+Ok79z585peHXp0qWTCxcunIZVV69effBmQIC1atuGPhj4wJSvcbk3ZL0EWMz2AnZ2gQZdSruMdho5ptpRoC\/eveUJosnFF95TZbpCuUa0VCfcuHHjNKRKX6z87wRa6Xu16Y0lwMLAG6amtrmniGHl1ytPAXNepCkfpY9afxg7jRxaazNmqKn1+Utwz7LV+sOcvcnLRMIEVzlCmEeOE6b3Vf63AIvSwJusm+DQbO5RI8Bi1os0E7ro64nn3tq6SMuvwyF98PRTJq0ySG3SqhvP9ShN6Mo15qyEVnmk8iqPHClMqCXAQhDOVNjco4sAi9kv0oxQpY9UWrnh49juv\/x8sWrCkApalQJ5R3\/WJdeM0g1frjW\/\/Pz7h35YqcbayP9OJVZ+j3VLT1BHkTm23NfZ3KNGgMUiFmlnF2jQxU4jx5Sxzy03m1CzrfGyI9HrVQvFz46aTx+sVFylFxacZRgEU76O2dxjQ4DFIi5uLmz0VdppTOWCnUb2qbS7qJqUVgnaS5WkCbZwbalVLmQKYUKs9L+Cs177yf3iBl82\/2BfWitJQYDFLCktZSg7jRxDreHy2SoJqEnQvu3alWCe9erTOyZTCHN0cDOJEDZqA29s8LEvpV5+Nvc4T4DFLGnuxxhqO435PRhTdhdbRt6Dm0t2VZvedbZSPcFVAqwEWXCekJxDap2mCiHAYnELNONV6SPVVpqWsm9ZgLVOCoMSx3to8eGzl7dea25fevyBm8EcIUxT98uXL3vSeIBjyhxK7tts7tGHAIvZunf9StMCDbrYacT1iqlz7JlWuabk2rLtmpNr0Vlp5q6pO9vUBkUYeMOhr1WwIcBikRc9FQ30kYWYqgb2pba7qGKUVhdfeE+1KKNcd85XNaQCS1N3tnniubeKA29gqNyv2dyjLwEWs6anDGOp9ZUxkp5d1Zoq212kVYL0UsiuEoKSPn1lLly4cHqcEM5KOF46Sph1EwzR0q8PzhNgsegFmqle9FHaacyvwy5Ku4umpuIGkkNo7b2Xpu6PPfaYqYQ8pBagG3jDrnKPZiAXuxBgsegFmtGr9JFKK01LGctnr75od5HBHOFhiFxrSlWg919+\/oE\/myOEFy9e9KTxEEeYGVvu0WzusQsBFouQFL91gQY1N978WfEoIbgmcUiaKDOGXHNaK9XTC8tUQs6rDZFIuAVDr0lOztBKgMViqHZgLJk+uG2RBq227SyqCqUPFaEc4pp0vuLBVEJKDLxhDKX+xbmPgxYCLBZFvxnGUOo5o98MLfpUO0BJjgjqycdYagMlzvecMZWQktrAG0cJabGt7Yvp8fQhwGI1CzQTv+ij1LRUw1JqapNR7S7Sa4HmJpGRZTpza6V6emFlKqEQi\/OE6+wq92ItU1Ghuj7yFLA0X7x7q7hAy+9Bq8s339ewlF5aJ35BTemojmM6DPXhs5e3XqNuX3r8gZvIzVTCRx991GRCHuB4M2Pen7k3oy8BFou0LeGX8tNXqWlpgi1w3eGQ1x2NkhlDrkUJq1oq1TchVh5CLM4yYIK+151tJ2ScjmEXAiwWe6FUCcEYVELQQuUnY1H5yTGvVw99Bv74x6dHCS9cuOCJ4wGlgTc5YghnlXoU29xjFwIsFk0zZcayredDFm9QGx5hcUYrwyM4tD7NlG\/evHna2D0N3uGX74tCv1A9Q4nca5V6E+ceDXYhwGLxjLNnDKVKLP0e1q1PU2So2VbNoJKBfco1atvNZenG8saNG6chVv4vbGyrGlU5insw9kWAxeLV0v\/zo6OhesEs9HtIQ1NcW1xb2NW2fjJ6yXAI2yrVa1XqQizOS0hVmkyoUn29sg5yCoa93I95ClgDVRKMISOi9Xtgw84iYyhN9FLdyTGvZTleWLIJsa5evbr9PX3njid1ZUpV6nqGrlPurUr3XbkngyEEWKyGPjUMVepRo0\/N+uivx1hKlQtwKKUJYbVK0oRYae6eCYUJstLs\/bXXXjvtkZX\/zfpkHaRSHYO02DcBFqu6oLaOjoaSWsNSx33WodQ3Jo\/PXn3RE8QoN3xwSKVK9VqV+qeffnpy7dq10wmFeeR\/59dYr1Klen6ddcg91bZrSe7BFAwwBgEWq1IbHa2klVa10dEali6fnUXG4MgNU\/Phs5fddDJI6Ui0SvV1qLVsyT0YjEGAxeqUdgZSUWGRRouEVJmus22Blmk8LFetKanrB2NcQy6+8J4niKPINUyVOkPdePNnKtVXev0oVae7hjAmARarpIKCoV77yX3VEyujgpOxGDvPVLnGMQaV6utT6zUMYxJgsUq1HjZpzgxDbkJTPm+Btix66DGWWh+9BONwTKpMGYNK9XWpDbYx7Z2xCbBwsTVFjAFKE8Q0LF2Wbb1h9Idhl5s6\/WGYOlXqjEGl+jrknklRAIckwGLV7l55Urkrg6SfQ+mG9NrrgtAlqDUltbNIH7VjNTAVqtQZi0r15SsF3rnHgn0QYLFqtYaDKaOHFgmqNCxdLtcI9nmdyI2c6wRTo0qdsZQq1RPoM2+OHHMMAixWT3UFY1BZsVyqNBmqNlpepSZTpUqdMahUX6bcIxn6wDEIsOBEfxuGq\/W20bB0vrZVIahAoC+98pgjVeqMRQXq8q4NpcE2uaeCfRJggQsxI6k1LDVdbH5KfWD0gKGPNGfXA4a5UqXOWBLYq1RfBhv\/HJMAC\/7BF+\/eUgrLYBqWLse2xqSmcNFHKgtM4cLNKtQr1ZmPWqideynYNwEWnKEZIWMs0DQsnb9716+4DjD4WvDoD2+5FjB7tSr1XCuhVYJ7VerzvhY4VsyxCbDgHONgGapWdaFh6fSVdhdVYtLHxRfe23oNSKilGpO5UaXOWLZVqrsuzoPBDkyBAAvOSXPm0u6C3je0qjUszUQypqm0u6jKgD5KVQYqDZgzVeqMoVSdqjJ12rYNtTHYhmMQYEHPizS00rB0frbtLmZn0c0ZrRJQl\/q8pKE7zFmpSl1\/QPooVarrDThNpaE2Nvc5BgEWFGQxtu1CDa1qDUvdyE5PKbg2aYs+Sj3wBNe4kYVf2TahVZX6NAmumRIBFhSUjhJpUkgfjhLN56as1N8FhtyQuSljaRwlYizbAv9UrzMdjg4zNQIsqCg1czYmlj40c5622oQtu4u0SiBdCqtvvPkzTxCLopkzYygduTbwZhoMb2CKBFjQIc2b7TowRKlhqaal0\/Dhs5ftLjL4Z7x0XDgBNixNqUpdpTp9JeDfdu1Mnyym+TNusA3HJMCChgv4tuoMlRn0UWpYqjrjuEpVliot6SNBtCpLXD9dP9nxhrTQN9D183hKvYBzT2Rzj6NeLzwF0K3UH0fDUvrQH2da0qtFBQFD5ahLKZxWQcDSqWBlDCpYp6XU585gG6ZAgAUDL+Yu5PSR5qTbFmmalh5eaaqOHi60SkBVuvHSw4U1qPUQTJ8saFHrIZhhOBxObaiNjXumQIAFPWxrWqqUlj5KDUvzSIUWh1GbqmOKFi1ytGXbBC2BNG543fDS3+Wb76tSPzKBNHMgwIKeSou0z1590ZNDMz1zprc4y1EYaJGKANUC8CA9cxiqtsmXgIv9yX2MnnbMgQALeqpVbjhOSCuTCd1gMd+fXTdY8LDa1DKDb2hVmkpog2B\/cv+iJyhzIcCCHWw7SrjpneMmmFa1ng\/654xPU1LGUOpjl+OEsHap1FCpzlBp3l46TqhKfVy5byn1BHVskCkSYMEOatPLHEOij9JkQhPMxmV3kX3+vOamys8rfEWlOkPpMXg4tUmieoIyRQIs2NHnb7xS3GXM70GrUkWHfljjsLvIGBJQqZiENirVGeOaa+iNexk4T4AFA9y7fsWuBYPVeuroh7Xfn1M3UrT+jOpZB+1qleq5JkOLbA6UNg7ShoFh\/IwyRwIsGKhU2ZFfh1b6Ye2H3UXGYGoouP4yreuvfljDuX9hjgRYMJBdRsZS64dFf7WJWH42aVWbiKUCAOpUqjNUrQJWP6xxfzb1qWMOBFgwgkzWKe0yZiIPtCr1w7LL2F+tBwu0uPPJz\/VggYFUqjOUHoTjKk0LNSmUORBgwUhqUzz02aFVqR+WPjv9mILFGEzBguFMgWUMtX5YpsC2K1Wnm6LOXAiwYMQPBJPOGEOpH5ZdxvabpVJF5P2Xn\/cE0eTyzfeLfVdSmQW0U6nOGPQjHG5bdbrpoMyJAAsOdONsl5E+Sv2w7DLWZQF2+9LjW38GP3j6KU8Q7Qukwk7\/zXfueXJgByrVGcrU5mFK1ekq05nV+sxTAONKhYddRsawrR+WXca6hFTbfvYSarlBolUqrLbdIF184T1PDuyotsGgUp1WpjbvptT3SmU6cyPAAjfRTJR+WP0IjxnLtt5X+TXhMQxTq1SHVqUq9ayZVKo\/rBQeq0xnjgRYcMAPCh8W9KUf1vCbIsd36SNVVo7vwv6UNhscY6KP0tRmmw0PK22s21RnjgRYcIQbauW69KEfVp1jKYzlxps\/2\/qzll8H9ntDrUqdPmr9sBz3\/pVadTrMkQAL9qjULNFOI70v1qbuFG2bqKMxMH0lEN52M+RGCMaXa3Ou0arUGSJDNUr9sGw8qE5nofdEngI4zs21kbX0YerOdrWQWN8rWiUITiDsKAocjqbSjOHyzff1w9oi9xi511CdztIIsOAAHyDbdhnzyEhpaGHqTvvNj51F+koQvO3mJ9MIgf0pbULYgKCPbYM3NpsQa5V7DNXpLJEAC458o22nkValXlhr7IdVC4YdQWGMn6scTQH2b1ulupts+shmg35Yv\/LZqy+qTmexBFhwIPeuX9EPi8FKU3fW1g+rdDRXE2D6qFU2AodR2pBwzIk+9MP6Sq3vVe5FYO4EWHBApbPodhppVZu6s5Z+WMJgxlDbsU9QDBz\/ptsNN32U+mGtpVK9Vp2eexBYAgEWHNCXH90tfrDYaaTVmvthff7GK47jMopSzxTTPeE4Stf2XPehRa7da76216Yy5x4ElkCABQdW64dlp5FWa+yHVQuA9b2ij7Xv0sMU5Tru5puh1lpdW6tO1\/eKJRFgwRGkUsROI0OtqR9WbRx0ft0RXFqlF4o+KeA6z3LVKtWzAbg0qtNZEwEWHEltp1EfH1qsqR9WbRy0nxdapbrKpCqYrlzPS5W2+RyAVrVK9SVNma39zKhOZ4kEWHAkdhoZwxp2GWsVixkVDS1qvVHy6\/pewTTkuu6azxiymbftmp+NjCUcF3cvwRoJsOCI7DQyhqXvMpZuZPyM4EYGlqlUdWvaLH1kYyJtFZa6caE6nTUSYMGR1XYanVunVakf1txvztO41zhohsp0zjUcJYElKVWW5OZcZQmtlnp0XHU6ayXAggkwOYShlrjLWCqNd\/NCH7VjtplGCExTbfKs41H0URveMUcmmrNmAiyY0M26hRr7XKTN6Wa9tLNoV5E+Sj2vshuv5xXM+\/NApTpjfCbk8+DOJz+fzb2CykTWToAFE5Lz6vr9MFSCqlKIlYBr6ko7i34GGOvnQM8rmJdaTyyV6rQqTW+eS6V6aYK5nwPWRIAFE1PrifXxS894gmgy155YpSMjel7RR60SMf2wgHnpqjzJZwe0KB0rz6CPKcs9gJ5XIMCCSartNEKL7CSWjk+lV9YUdxr1vGIMCWhL4dWcG\/bC2mm1wFhKmxxTbbVQ29xWnc7aCLBgoko7jcbi0udGvjR5JxVaU1MKbr3naZU+JqX3\/BJGpsPaabXAWLKhMYdWC3nP14JbWBsBFkxUdhJvX3pcNQqD3Hzn3iyautdK46FFrepw6kdngXZaLTCWbe0WpvR5UboXyCO\/7n6ANRJgwYSVdl3suNDH1R\/dnnRTd6XxjCH9S0rv8\/Q8AZaj1mpBPyBaZeNjypNqa33fVKezVgIsmLjP33jFjT2LvblXGs8Y5j55E3Bzz3FM9di5kBa2E2DBDJSOV91\/+XlPDk2meLyqNHHQUVn6qE0c1LQdlqvW1N1kQlrVWi0c6zPEMVkoE2DBTJR2YlKhBS1qTd0PXS7fNRLd7jmt7+nSjccUBxUA4+qq4rURQotrr98tfpakDcMh1cKrD55+yovF6gmwYCZKN\/xu9hnrhv+Q5fJZhJUWaEJZWpg4CESp1UIed6886QmiSWkq4SGPogtkoZsAC2YkH1xK5RmqduQqvbL2TV8HhjJxEDjLMBDGUPpcyWPfnytdbRWs8+ErAiyYmdICzc4MfdQmE+6z54ObDPZ9k2HiIKxTbXNEz1BaZHOk1mphXyGWtgrQToAFM1MLAExto49Dl8s75sEc37fAfDiezlC1fqGP\/vDWXo6nl8IrlenwMAEWzFB2ElWxMIZaJUsm84xFXwfGUAuvTBwEVLIwhtpkwrF7LGqrAP0IsGCmah94QixaHaKXUC280teBVrXebcIrYKOrl5AQi6GfOWNOubWWh34EWDBjtVJ5uza0qpXL59eH7DTWdsPzcCPB0BsJEweB81T9MoZ99wsttQXJ+h7YToAFM9YVDgixaFULsRIQeH9yzPem8AoYKxwQYtFH7eh6Aq5dffHuLe9N2IEAC2ZOvwfGUqty2SUkEF4xVFd14L7HmgPzVusZavANrXJkcMzhIaUKwduXHhdeQQcBFixAV48hIRatrr1+d5R+D3q0MQbhFTCUzyOGqvUL7Tv0prRmt16HNgIsWIiuEMuODq1K5fKt\/R7cLDDWDcMhJmQCy+dziTE+k4ZuqtTW6jlSCHQTYMGC6PfAWHYNsWrHNTQlpc+NQmm3e5fjGgC1wTf3rl\/xBNFpyLH2WssPbRWgnQALFkaIxVhKAcLlm+9777E3tfBqSMNcYN26BotAi9pgkVKIJbyC8QiwYIGykyhIYJ9BwvkqGOEVYym958YYWQ6smyCBMdSG3pwPsQSnMC4BFixUrd+DQIFWLSFWLbxKr4cvP7rriaTJ0P5rAF2y\/in1IRJi0aorxNpMb66FV\/qvQX8CLFiwrhALWtSaaf9f\/\/E\/VMMrE3VoVQqvLlx\/25MDjKrWTFuIRataiJXNv\/\/v3\/+58ApGJsCChTN5hzFsa1r65P92VXjFKErhVW4ANrvYAGMSYjGGa6\/f3fr59fTFf2H9DXsgwIIVEGIx1PnJO\/\/kf79+8n\/\/r\/9YeMVgpfAqD+EVsE9fvHuruD4SYrHr51gtvHICAoYRYMEKdDWQFGLRYhNi1cKrPHJDALss+s9XXwHsW62Po80Y+n6edYVXetDCMAIsWAkhFmN4+403T96qhFfpiQV9FvuODgLHVgqxVBTTx3\/6i4vF9dF\/+df\/7OT+x594kmAgARasjCCLXdR6heSRfljbJhTCeYIrYIq6JuoKsiipter4z\/\/yn578ox+87HMORiLAghVqCbGUOHNWn\/BKiEVJLbzK8dQcUwU4FiEWffUJr4RYMJwAC1aqK8RyTp+WBX2ODJYCCSEWZwmvgLl\/5iXE0tydjVp49f\/+H987+edPv6riGEYmwIIVE2IxZCG\/WcQnpBJiUSO8Apby2WdCIVkb373yZOf6OQHVhetvG1YCIxJggQ9hIRa9F\/DnF+9dIVYCDNYni\/cnnnurungXXgFz+wwUYlk391k31zZxfAZCPwIsQIjFQ+6\/\/HzvRXtCrFTTCLGIhFcJqByfAOaqK8TKZyXWyy3r5VKIpQoZ+hFgAU0fyrcvPe5JWolaT4euHecswrpCLKHF8gmvgKXoCrFMb16HNPDPWnjIZm8txHrtJ\/c9ydBAgAU0hxem7yxbFl6l1z+Naz9\/45Wmr9MVYgkvli2v\/6M\/vOX1Bxbji3dvVafxmt68bFn\/1l7\/PicVascJ9QyFbgIs4CG1EEPPh2XqqsDrG14KMdYpO8jCS0CIwVJk3Tt2eHn55vvFz8lrr9\/1pEOFAAvYasgxMua3KK+FV1m47aLrGFkCLn0flkMjf2ANn5ddIdaXHwkglqLWD3To8dHaZ6bPSygTYAFF965f0fPBYnzQ0dGuECvVOjffueeFmLmrP7otvAJWIQFV16aPlgvzV9vIzSNr5KFqIVYm+KpYhocJsICqWvPSu1eeVC6\/0Nd2zOMQWYBduP52NeDQ92Ge8trW+nnkkXALYEm6jt2rVp\/3a\/vB008d7LXtOnavUh0eJMACmoKOUpXO0AodjqNWXbevhrRdQYcqnXm588nPq9V1gklg6UHHIap0OJyWlgpjB5Ndg29MKIQHCbCA5g\/12gd664Q6jr\/gTuXcsUaCdx010+R7Hiy4Ab7SFWKpVp+HrGNrLRX2eTS0ZUNIc3f4igALaNZVLv\/xS894kiasa2fxUEceupp9J\/xQMj9dWUTXXj\/N+YG16TqSf\/vS46rVJyzr166WCvtuzt\/SbiGV6jb5WDsBFtCspS9Aft9O4zQX1107i1+8e+tg309XBY\/dxulp6Xelgg5Yq3yGdn3O6os1PV3r2kNX0F2++X7n56xNItZMgAX01tU\/yU7jdLT06DhWH7OWkvnsRnJ8WSx3vVZ6mAFr11LpvI8ek+z+ek2xh1lLpboJzqyVAAvYSVdFTx73X37eEzXxhfSxK+ZaqnrsNB5XFtJd1XKatQN8paVa3QCc48sadcrVci2V6o4UskYCLGBnWXyl2krz0mkuzLoCxilNR+rqq+Q44XF09ePQrB1gu66+SvmMttF3eF0B45ROESSc6qp+dqSQtRFgAYMXAl1T7Uwp9Hq0SBBS22184rm3To8dcrjXQ78rgN11TbbbVEIzjddjqpuuXX2xsnay0cdaCLCAUXTtNGrwPo2F8iEm6QyRQCRBlUXacV+DrsVyfh+AbvnM7TrOb5Nvv1qOdU59knbLcX4bfayBAAsYTdcEnk1p9iGn3VmYTfPIYJerP7rd2dzdIm18qbp69Ie3NI4FGFnXABybfPtbm9baXRx6CvMQLcNvbPSxdAIsYFStYYqF2jhamunP9Qhn15FCi7TxtFRd2dkFGKarUnoKzcPXth6d41q06\/N685mtNxZLJMAC9qKlibgGprvLkYSuXldLCAoTrHQt0jQwHSYVVbWqK030AcbT0qsyvz\/l4\/7WoNP47O46UphHKtr1q2RJBFjA3rT0fdgs1BwrbF\/4tvQbW1I42LpIy46kRVq7hH61fmPCQYD9aQlZ8nmvWr1d1pItm3tT7wfaKmuermnBeWSTyvF\/lkKABexdS+CSx4fPXrbjWNFyXHCpO7ddzd0dK+z3XLYcP8hDIAiwPy3V1Onf5Fhh9\/OYNWTLWnPqzdp30brR51ghSyDAAg7iF3febdoVS0Bjx\/FhLZVsaziS2TKFx27jdgmjcpSg5flTeQVwOC2bU1kHqFZ\/0KYqvXVzL2vRJX\/Gt1Rj5XHxhff0tGS2BFjAQbWUzAuyfqW1HH5NTfGzSMviq2WRlt3GNINfuwR\/XX2uNhVsCbkAOJxUELU0HNd24St9gqu19VvtmiZ89vNelTVzJMACjrLwaF2obRYeawuyWoOrHC2Y44TBQy7S1hpkZWHaGlzlkZ1bO7IAx\/3sz+e6IKu8fmwNrtY88XpTcd26aSXIYk4EWMDRtfZ22vTJWloJeBZXCelaF615DhyxfHix1trXaXPEML2ylrRoy5G\/VKa1HBFUbQUwbX36Om02tJa24Zf1Xp\/nIGtJ\/cIelg28tAZo3cxaYgsGId1yCLCASei7q5ZeEFmkzHmhlp3TLMxa\/81L798whlQQtfaAONsLYq6LtU2VVUuDezuuAPPT2kP0bIiTtcVcq7Oyrsv6rqX3p7YT\/fSpys6fy1phzpXZ2djL5qYBP8siwAImt3DpE2RtSsTncowuC9F71680V1ttHhq39pPdxj6hzmaxloXOHJqXJ3DrU211NqwTXAHMT2trgfNVWVlzzGHzK+u41vYSgqthWgfinG3DkL8zh\/VDAreEVecrzrLGYxkEWMAk7RJkbcKs7Nyl9H5Ki85dQivNWodLkNW3IutsmDWVyqxNpdUuoZWKK4Dl2CXIOhtmTWlNkbVa1mx9\/y2Cq3G0VmOdD7MSEE1psy\/fS9Y5XcckDfVZBgEWMGmbUvJdwp+Un2exll29QwZaWRxmYbXLAnPJvb6OKTtyrZMLty3WsjA69MIn33NCtNa+FaXyf8EVwPL07Q+1bcMva5VDBlpZi2VNlrVZnyOCZ0O4ubePmJpsjg1ZZ2Rtla9xyEAr\/62EaNmg7LOpl++V+RNgAbMxJBDa7Njla2TBlgVQFm1Dgq38\/U1YlUXkLoux8wuzfK0pVY8tzWYyzy67jptHFnpZNOXrpEJraLCV7ylfIwvAfM0EZkO+v02pPwDLlzVD1g67bPSd3fDLOmYTaA0NtfI95WtkrbXZ0OtbUX++Gl1z9v3KOmTXjb6zFd9Zg2TzLQFTvuaQHloJqvI1sjbK99a3NcS2wA0BFsDBF2q7HsdrCbe6HkNDqrn38FqSTR+pIYuhbYujLLBaHn2PAnYtGrNgnHOzVQCG2aWPVEu41bI+GhpSlY482tQ7rGyqJXwaspFW22BreezjvzuXHl4IsICFL9T6TPGb0mMJUxSXtFjLwmaXXlnHfCS0mvMERQD2Y5dJflN4bCYo2tSbhs0Uv32EWft+pFo+QZyNPQEWwCQNaZR+qEXZpsG80GoeYdaYFVJjVnhNqbk8APMIs7IGmeqG39Say7M9zGpplH7Mx6bBvNBq2QRYwOJsptpkF++Ygdam35ZF2bwXbGMf99u1QaoFGQBDjTFoZozjgVmjTW1qNG2y2ZeNtCGDZsYKrDabeo4HrocAC1i87D5uFmzZgRx70ZaF2Nnm8KYHLlPCrLEarbc0iDfuGYB9y5plE2jtY9MvX\/fsxENV6MuUNUuqnzbN1sfu83m+OTzrJcACVmsTbOVx\/+XnTxdXLY\/0ZsjfEVQRqYzKYmozKaf1sVmE5WHnEICpyPom65ysd1rXRnlkLbVZVwmqiM06Z7MB2PLIn83fycYhnCfAAgAAAGDSBFgAAAAATJoACwAAAIBJE2ABAAAAMGkCLAAAAAAmTYAFAAAAwKQJsAAAAACYNAEWAAAAAJMmwAIAAABg0gRYAAAAAEyaAAsAAACASRNgAQAAADBpAiwAAAAAJk2ABQAAAMCkCbAAAAAAmDQBFgAAAACTJsACAAAAYNIEWAAAAABMmgALAAAAgEkTYAEAAAAwaQIsAAAAACZNgAUAAADApAmwAAAAAJg0ARYAAAAAkybAAgAAAGDSBFgAAAAATJoACwAAAIBJE2ABAAAAMGkCLAAAAAAmTYAFAAAAwKQJsAAAAACYNAEWAAAAAJMmwAIAAABg0v4n\/TsgNEJC8WYAAAAASUVORK5CYII=","width":449}
%---
%[text:image:7063]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:8ea0]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:01ac]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[control:editfield:87c7]
%   data: {"defaultValue":" sin(x)","label":"f(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:button:4c14]
%   data: {"label":"Show family of antiderivatives","run":"Section"}
%---
%[control:slider:320c]
%   data: {"defaultValue":0,"label":"C","max":10,"min":-10,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:button:7da5]
%   data: {"label":"Show Plot","run":"Section"}
%---
%[control:checkbox:0a38]
%   data: {"defaultValue":false,"label":"Animate?","run":"Section"}
%---
%[control:editfield:0d6a]
%   data: {"defaultValue":0,"label":"n = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:9196]
%   data: {"defaultValue":0,"label":"n+1 = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:92f0]
%   data: {"defaultValue":" x","label":"F(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:97ba]
%   data: {"defaultValue":0,"label":"n = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:06a9]
%   data: {"defaultValue":0,"label":"n+1 = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:63c6]
%   data: {"defaultValue":" t","label":"G(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:258b]
%   data: {"defaultValue":"0","label":"n = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:66b3]
%   data: {"defaultValue":"0","label":"n+1 = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:7741]
%   data: {"defaultValue":" q","label":"H(q) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:6697]
%   data: {"label":"Check Exercise 1","run":"Section"}
%---
%[control:editfield:538b]
%   data: {"defaultValue":0,"label":"a = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:620b]
%   data: {"defaultValue":" x","label":"F(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:2d1f]
%   data: {"defaultValue":0,"label":"a = ","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:30ea]
%   data: {"defaultValue":" t","label":"G(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:5a62]
%   data: {"label":"Check Exercise 2","run":"Section"}
%---
%[control:editfield:91b2]
%   data: {"defaultValue":" r","label":"F(r) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:0fbf]
%   data: {"defaultValue":" t","label":"G(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:3ba7]
%   data: {"defaultValue":" w","label":"H(w) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:3dd6]
%   data: {"label":"Check Exercise 3","run":"Section"}
%---
%[control:editfield:177e]
%   data: {"defaultValue":" r","label":"F(r) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:684b]
%   data: {"defaultValue":" t","label":"G(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:50b0]
%   data: {"defaultValue":" theta","label":"H(theta) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:95d2]
%   data: {"label":"Check Exercise 4","run":"Section"}
%---
%[control:editfield:2d49]
%   data: {"defaultValue":" r","label":"F(r) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:0624]
%   data: {"defaultValue":" t","label":"G(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:332f]
%   data: {"defaultValue":"\" theta\"","label":"H(theta) = ","run":"Nothing","valueType":"String"}
%---
%[control:button:9cf2]
%   data: {"label":"Check Exercise 5","run":"Section"}
%---
%[text:image:840f]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:19f4]
%   data: {"label":"Initialize Values","run":"Section"}
%---
%[control:button:37a5]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:46ec]
%   data: {"defaultValue":"r","label":"My answer is: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:2ba2]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:83ab]
%   data: {"label":"Analyze Results","run":"Section"}
%---
%[text:image:5257]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:0309]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[text:image:1fe0]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
