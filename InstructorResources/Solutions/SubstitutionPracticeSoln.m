%[text] %[text:anchor:T_608363DA] # Substitution Practice
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%[text] A thorough understanding of the integral as an antiderivative can only take you so far. Just as with derivatives, there are integration rules that can be built through the combination of functions as well. The method of substitution that will be discussed in this live script applies to nearly every integral you will ever calculate. In fact, you will likely forget that you are even applying it in some cases because it will become so natural to use!
%[text]{"align":"center"} ![f of flower](text:image:6e2f)
%[text] The method of substitution allows you to replace a complicated integral with a simpler one.
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:189e) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:5216) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning symbol](text:image:296a)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
clear gPrime uPrime NewMeasure Measure g fa fb fc fu f MyFun MyAnswer LastFive
  %[control:button:0484]{"position":[1,2]}
%%
%[text] %[text:anchor:H_5CADDC26] ## **Practice using substitution**
%[text] Rewrite each of the following integrals in terms of the new variable provided by the substitution function,$\\displaystyle \\int f(g(x))g'(x)dx = \\int f'(g)\\; dg.${"altText":"integral of f(g(x))g'(x)dx = integral of f'(g) dg."}. Then solve the integral.
%[text] %[text:anchor:H_B7217F12] ### **Exercise 1**
%[text] $\\displaystyle \\int 15\\sin(3x^5)x^4\\; dx${"altText":"integral of 15sin(3x^5)x^4 dx"} where $g(x) = 3x^5${"altText":"g(x) = 3x^5"}
%[text] First, find the derivative of $g(x)${"altText":"g(x)"} with respect to $x${"altText":"x"}:
gPrime = @(x) 15*x^4; %[control:editfield:951f]{"position":[14,21]}
%[text] What is the new measure $dg${"altText":"dg"} going to be in terms of $x${"altText":"x"} and $dx${"altText":"dx"}?
NewMeasure = @(x,dx)15*x^4*dx; %[control:editfield:46f8]{"position":[21,30]}
%[text] If we define $\\displaystyle \\int 15\\sin(3x^5)x^4\\; dx = \\int f(g)\\; dg${"altText":"integral of 15sin(3x^5)x^4 dx = integral of f(g) dg"}, what is $f(g)${"altText":"f(g)"}?
fa = @(g) sin(g); %[control:editfield:67bf]{"position":[10,17]}
%[text] Calculate the function $F(x) = \\displaystyle \\int 15\\sin(3x^5)x^4\\; dx${"altText":"F(x) = integral of 15sin(3x^5)x^4 dx"}.
Answer = @(x,C)  -cos(3*x^5)+C; %[control:editfield:92de]{"position":[16,31]}
Check1a(gPrime,fa,NewMeasure,Answer);
  %[control:button:454c]{"position":[1,2]}
%%
%[text] ![](text:image:8c8c) **Note:** In many textbooks it is common to use a variable $u${"altText":"u"} in place of the variable $g${"altText":"g"} or even to call this method $u${"altText":"u"}-substitution. 
%%
%[text] %[text:anchor:H_E2E70132] ### Exercise 2
%[text] $\\displaystyle \\int\_1^3 \\left(\\frac{1+t}{t^2+5}\\right)^{2/3}\\left(\\frac{5-2t-t^2}{(t^2+5)^2}\\right)\\; dt${"altText":"integral from 1 to 3 of ( (1+t)\/(t^2+5) )^(2\/3)( (5-2t-t^2)\/((t^2+5)^2) ) dt"} where $u(t) = \\frac{1+t}{t^2+5}${"altText":"u(t) = (1+t)\/(t^2+5)"} 
%[text] Calculate the derivative $u'(t)${"altText":"u'(t)"}.
uPrime = @(t)  1/(t^2+5)-(1+t)*(t^2+5)^(-2)*2*t; %[control:editfield:08ef]{"position":[14,48]}
%[text] Calculate the new bounds and new measure for the integral in terms of $u${"altText":"u"}. 
ua = 2/6; %[control:editfield:166c]{"position":[6,9]}
gb = 4/14; %[control:editfield:4dc2]{"position":[6,10]}
NewMeasure = @(t,dt)(1/(t^2+5)-(2*t*(t+1))/(t^2+5)^2)*dt; %[control:editfield:0071]{"position":[21,57]}
%[text] If we define $\\displaystyle \\int\_1^3 \\left(\\frac{1+t}{t^2+5}\\right)^{2/3}\\left(\\frac{5-2t-t^2}{(t^2+5)^2}\\right)\\; dt = \\int\_{u(a)}^{u(b)} f(u)\\cdot du${"altText":"integral from 1 to 3 of ( (1+t)\/(t^2+5) )^(2\/3)( (5-2t-t^2)\/((t^2+5)^2) ) dt = integral from u(a) to u(b) of f(u) \* du"}, what is $f(u)${"altText":"f(u)"}?
f = @(u)u^(2/3); %[control:editfield:6601]{"position":[9,16]}
%[text] Calculate the function $F(t) = \\displaystyle \\int\_1^3 \\left(\\frac{1+t}{t^2+5}\\right)^{2/3}\\left(\\frac{5-2t-t^2}{(t^2+5)^2}\\right)\\; dt${"altText":"F(t) = integral from 1 to 3 of ( (1+t)\/(t^2+5) )^(2\/3)( (5-2t-t^2)\/((t^2+5)^2) ) dt"}.
try
    Answer =  3/5*((2/7)^(5/3)-(1/3)^(5/3)); %[control:editfield:6f53]{"position":[14,44]}
catch ME
    if contains(ME.message,"Unrecognized function or variable")
        Answer = 0;
        warning("This is a definite integral. Your solution should be a number.")
    else
        rethrow(ME)
    end
end
Check1b(uPrime,f,ua,gb,NewMeasure,Answer);
  %[control:button:8f3f]{"position":[1,2]}
%%
%[text] %[text:anchor:H_6641F298] ### **Exercise 3**
%[text] $\\displaystyle \\int e^{r}\\cos\\left(e^r-17\\right)\\; dr${"altText":"integral of e^(r)cos(e^r-17) dr"} where $q(r) = e^r-17${"altText":"q(r) = e^r-17"} 
%[text] Remember that $e^x${"altText":"e^x"} is written as `exp(x)` in MATLAB.
gPrime = @(r) exp(r); %[control:editfield:4795]{"position":[14,21]}
NewMeasure = @(r,dr)exp(r)*dr; %[control:editfield:6d08]{"position":[21,30]}
%[text] If we define $\\displaystyle \\int e^{r}\\cos\\left(e^r-17\\right)\\; dr${"altText":"integral of e^(r)cos(e^r-17) dr"} $= \\int f(q)\\cdot \\; dq${"altText":"= integral of f(q) \* dq"},
fc = @(q) cos(q); %[control:editfield:948e]{"position":[10,17]}
Answer = @(r,C) sin(exp(r)-17)+C; %[control:editfield:6bfc]{"position":[16,33]}
Check1c(gPrime,fc,NewMeasure,Answer);
  %[control:button:684f]{"position":[1,2]}
%%
%[text] %[text:anchor:H_5312F01E] ### **Exercise 4**
%[text] $\\displaystyle \\int\_{-1}^{2} \\left(\\ln\\left(1+w^2\\right)\\right)^{7}\\left(\\frac{w}{1+w^2}\\right)\\; dw${"altText":"integral from -1 to 2 of (ln(1+w^2))^(7)( w\/(1+w^2) ) dw"} where $g(w) = 1+w^2${"altText":"g(w) = 1+w^2"}. 
gPrime = @(w) 2*w; %[control:editfield:95c2]{"position":[14,18]}
ga = 2; %[control:editfield:2260]{"position":[6,7]}
gb = 5; %[control:editfield:3167]{"position":[6,7]}
measure = @(w,dw)2*w*dw; %[control:editfield:9186]{"position":[18,24]}
%[text] Remember that $\\ln(g)${"altText":"ln(g)"} is written `log(g)` in MATLAB.
%[text] If we define $\\displaystyle \\int\_{-1}^{2} \\left(\\ln\\left(1+w^2\\right)\\right)^{7}\\left(\\frac{w}{1+w^2}\\right)\\; dw${"altText":"integral from -1 to 2 of (ln(1+w^2))^(7)( w\/(1+w^2) ) dw"} $= \\displaystyle \\int\_{g(a)}^{g(b)}f(g)\\cdot dg,${"altText":"= integral from g(a) to g(b) of f(g) \* dg,"}
fb = @(g)  log(g)^7*1/2/g; %[control:editfield:71d6]{"position":[10,26]}
%[text] This result is still not immediately computable, so let's make another substitution with $u(g) = \\ln(g)${"altText":"u(g) = ln(g)"}. 
%[text] If we define $\\displaystyle \\int\_{-1}^{2} \\left(\\ln\\left(1+w^2\\right)\\right)^{7}\\left(\\frac{w}{1+w^2}\\right)\\; dw${"altText":"integral from -1 to 2 of (ln(1+w^2))^(7)( w\/(1+w^2) ) dw"} $= \\displaystyle \\int\_{u(a)}^{u(b)}f(u)\\cdot du,${"altText":"= integral from u(a) to u(b) of f(u) \* du,"}
ua = log(2); %[control:editfield:9c30]{"position":[6,12]}
ub = log(5); %[control:editfield:4811]{"position":[6,12]}
%[text] Calculating $du${"altText":"du"} as a function of $g${"altText":"g"}:
nextMeasure = @(g,dg)1/g*dg; %[control:editfield:7ee8]{"position":[22,28]}
fu = @(u) u^7/2; %[control:editfield:31b9]{"position":[10,16]}
%[text] Putting everything together, compute the result:
Answer = ((log(5))^8-(log(2))^8)/16; %[control:editfield:22f8]{"position":[10,36]}
Check1d(gPrime,fb,ga,gb,measure,nextMeasure,ua,ub,fu,Answer);
  %[control:button:683a]{"position":[1,2]}
%%
%[text] %[text:anchor:H_154EB90F] ## Practice Randomized Substitution Integrals
%[text] ![](text:image:9c4a) **Pro-tip**. MATLAB syntax is 7`*t^(2/3)` for $7t^{2/3}${"altText":"7t^(2\/3)"}. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators.
%[text] **Solution:** Answers vary
%%
%[text] %[text:anchor:H_E570A8B1] ### Practice App
%[text] You can practice in the Calculus Flashcards app. You can start the app by clicking on the image below. You should set the problem type to be "Substitution" in the Integrals section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus flashcards app screenshot](text:image:5a48)](<matlab: CalculusFlashcardsApp>)
%[text]{"align":"center"} [Calculus Flashcards App](<matlab: CalculusFlashcardsApp>)
  %[control:button:3602]{"position":[1,2]}
CalculusFlashcardsApp
%%
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_5B6995EB] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:544d) at the top right of the Live Editor pane.
%[text] **Exercise 1 Solutions**
%[text] a. $\\displaystyle \\int 15\\sin(3x^5)x^4\\; dx${"altText":"integral of 15sin(3x^5)x^4 dx"} where $g(x) = 3x^5${"altText":"g(x) = 3x^5"}
function Check1a(gp,fsub,newMeasure,soln)
syms C x g dx dg %#ok<NASGU>
fg = @(g) sin(g);
gpans = @(x) diff(3*x^5,x);
measAns(x,dx) = gpans*dx;
correctAns = @(x,C)int(15*sin(3*x^5)*x^4,x)+C;
if isequal(gp(x),x) && isequal(fsub(g),g) && isequal(newMeasure(x,dx),dx) && isequal(soln(x,C),x)
    disp("Please attempt to solve this problem before submitting.")
else
    a1 = isAlways(gp(x)==gpans(x),"Unknown","false");
    a2 = isAlways(fg(x)==fsub(x),"Unknown","false");
    a3 = isAlways(newMeasure(x,dx) == measAns(x,dx),"Unknown","false");
    a4 = isAlways(correctAns(x,C)==soln(x,C),"Unknown","false");
    if a1
        displayFormula(['"Correct.  "' "dg/dx = gpans"])
    else
        disp("You do not have the correct function for g'(x).")
    end
    if a3
        displayFormula(['"Correct. The new measure is "' "dg = measAns"])
    else
        disp("Incorrect measure.")
    end
    if a2
        displayFormula(['"Correct.  "' "f(g) = fg"])
    else
        disp("You do not have the correct function for f(g)")
    end
    if a4
        displayFormula(['"Correct.  "' "int(15*sin(3*x^5)*x^4,x) = correctAns"])
    elseif isAlways(correctAns(x,0)==soln(x,0),"Unknown","false")
        disp("Incorrect. You forgot the +C.")
    else
        disp("Incorrect final result. Did you use the correct variable?")
    end
    if any([~a1 ~a2 ~a3 ~a4])
        disp("Please try again.")
    end
end
end
%[text] b. $\\displaystyle \\int\_1^3 \\left(\\frac{1+t}{t^2+5}\\right)^{2/3}\\left(\\frac{5-2t-t^2}{(t^2+5)^2}\\right)\\; dt${"altText":"integral from 1 to 3 of ( (1+t)\/(t^2+5) )^(2\/3)( (5-2t-t^2)\/((t^2+5)^2) ) dt"} where $u(t) = \\frac{1+t}{t^2+5}${"altText":"u(t) = (1+t)\/(t^2+5)"}
function Check1b(gp,fsub,ua,ub,newMeasure,soln)
syms t u du dt a b %#ok<NASGU>
ut = @(t) (1+t)/(t^2+5);
fg = @(u) u^(2/3);
gpans = @(t) diff((1+t)/(t^2+5),t);
uaVal = ut(1);
ubVal = ut(3);
measAns = @(t,dt) gpans*dt;
correctAns = int(((1+t)/(t^2+5))^(2/3)*(5-2*t-t^2)/(t^2+5)^2,t,[1 3]);
if isequal(gp(t),t) && isequal(fsub(u),u) && ua == 1 && ub == 3 && isequal(newMeasure(t,dt),dt) && soln == 0
    disp("Please attempt to solve this problem before submitting.")
else
    a1 = isAlways(gp(t)==gpans(t),"Unknown","false");
    a2 = isAlways(fg(t)==fsub(t),"Unknown","false");
    a5 = uaVal == ua;
    a6 = ubVal == ub;
    a3 = isAlways(newMeasure(t,dt) == measAns(t,dt),"Unknown","false");
    a4 = abs(double(correctAns)-soln)<10*eps;
    if a1
        displayFormula(['"Correct.  "' "du/dt = gpans"])
    else
        disp("You do not have the correct function for u'(t).")
    end
    if a3
        displayFormula(['"Correct. The new measure is "' "du = measAns"])
    else
        disp("Incorrect measure.")
    end
    if a2
        displayFormula(['"Correct.  "' "f(u) = fg"])
    else
        disp("You do not have the correct function for f(u)")
    end
    if a5 && a6
        displayFormula(['"You have the correct values for the bounds of the integral: "' "u(a) = ua" '" and "' "u(b)=ub"])
    elseif ~a5 && ~a6
        disp("You have not calcuated the correct values for the bounds of the integral.")
    elseif a5
        disp("You have calcuated the correct lower bound, but not the correct upper bound.")
    else
        disp("You have calculated the correct upper bound, but not the correct lower bound.")
    end
    if a4
        decimalAns = vpa(correctAns); %#ok<NASGU>
        displayFormula(['"Correct, the value of this integral is "' "correctAns = decimalAns"])
    else
        disp("Incorrect final result. Did you use the correct variable?")
    end
    if any([~a1 ~a2 ~a3 ~a4 ~a5 ~a6])
        disp("Please try again.")
    end
end
end
%[text] %[text:anchor:H_753E31D3] c $\\displaystyle \\int e^{r}\\cos\\left(e^r-17\\right)\\; dr${"altText":"integral of e^(r)cos(e^r-17) dr"} where $q(r) = e^r-17${"altText":"q(r) = e^r-17"} 
function Check1c(gp,fsub,newMeasure,soln)
syms C x r q dq dr %#ok<NASGU>
fg = @(q) cos(q);
gpans = @(r) diff(exp(r)-17,r);
measAns = @(r,dr)gpans*dr;
correctAns = @(r,C)int(exp(r)*cos(exp(r)-17),r)+C;
if isequal(gp(r),r) && isequal(fsub(q),q) && isequal(newMeasure(r,dr),dr) && isequal(soln(r,C),r)
    disp("Please attempt to solve this problem before submitting.")
else
    a1 = isAlways(gp(x)==gpans(x),"Unknown","false");
    a2 = isAlways(fg(x)==fsub(x),"Unknown","false");
    a3 = isAlways(newMeasure(r,dr)==measAns(r,dr),"Unknown","false");
    try
        a4 = isAlways(correctAns(x,C)==soln(x,C),"Unknown","false");
    catch ME
        a4 = false;
        if ME.message == "Unrecognized function or variable 'q'."
            a4flag = "q";
        else
            rethrow(ME)
        end
    end
    if a1
        displayFormula(['"Correct.  "' "dq/dr = gpans"])
    else
        disp("You do not have the correct function for q'(r).")
    end
    if a3
        displayFormula(['"Correct. The new measure is "' "dq = measAns"])
    else
        disp("Incorrect measure.")
    end
    if a2
        displayFormula(['"Correct.  "' "f(q) = fg"])
    else
        disp("You do not have the correct function for f(q)")
    end
    if a4
        displayFormula(['"Correct.  "' "int(exp(r)*cos(exp(r)-17),r) = correctAns"])
    elseif exist("a4flag","var") && a4flag == "q"
        displayFormula(['"The solution should be a function of "' "r" '" not "' "q"])
    elseif isAlways(correctAns(x,0)==soln(x,0),"Unknown","false")
        disp("Incorrect. You forgot the +C.")
    else
        disp("Incorrect final result. Did you use the correct variable?")
    end
    if any([~a1 ~a2 ~a3 ~a4])
        disp("Please try again.")
    end
end
end
%[text] d. $\\displaystyle \\int\_{-1}^{2} \\left(\\ln\\left(1+w^2\\right)\\right)^{7}\\left(\\frac{w}{1+w^2}\\right)\\; dw${"altText":"integral from -1 to 2 of (ln(1+w^2))^(7)( w\/(1+w^2) ) dw"} where $g(w) = 1+w^2${"altText":"g(w) = 1+w^2"}. 
function Check1d(gp,fgsub,ua,ub,newMeas1,newMeas2,ua2,ub2,fusub,soln)
syms t w g u dg du dw a b %#ok<NASGU>
% First substitution
ut = @(w) 1+w^2;
fg = @(g) (log(g))^7*(0.5/g);
gpans = @(w) diff(1+w^2,w);
gaVal = ut(-1);
gbVal = ut(2);
% Second substitution
uw = @(w) log(1+w^2);
uaVal = uw(-1);
ubVal = uw(2);
fu = @(u) 0.5*u^(7);
measAns = @(w,dw)gpans*dw;
meas2Ans = @(g,dg)diff(log(g),g)*dg;
correctAns = int((log(1+w^2))^7*(w/(1+w^2)),w,[-1 2]);
if isequal(gp(w),w) && isequal(fgsub(g),g) && ua == -1 && ub == 2 && isequal(newMeas1(g,dg),dg) && soln == 0 ...
        && isequal(newMeas2(g,dg),dg) && ua2 == -1 && ub2 == 2 && isequal(fusub(u),u)
    disp("Please attempt to solve this problem before submitting.")
else
    a1 = isAlways(gp(t)==gpans(t),"Unknown","false");
    a2 = isequal(fg(t),fgsub(t));
    a5 = gaVal == ua;
    a6 = gbVal == ub;
    a3 = isAlways(newMeas1(w,dw) == measAns(w,dw),"Unknown","false");
    a4 = abs(double(correctAns)-soln)<10*eps;
    a7 = isAlways(newMeas2(g,dg) == meas2Ans(g,dg),"Unknown","false");
    a8 = isequal(fu(t),fusub(t));
    a9 = uaVal == ua2;
    a10 = ubVal == ub2;
    if a1
        displayFormula(['"Correct.  "' "dg/dw = gpans"])
    else
        disp("You do not have the correct function for g'(w).")
    end
    if a3
        displayFormula(['"Correct. The new measure for the first integral is "' "dg = measAns"])
    else
        disp("Incorrect measure.")
    end
    if a2
        displayFormula(['"Correct.   "' "f(g) = fg"])
    else
        disp("You do not have the correct function for f(g)")
    end
    if a5 && a6
        displayFormula(['"You have the correct values for the bounds of the first integral: "' "g(a) = ua" '" and "' "g(b)=ub"])
    elseif ~a5 && ~a6
        disp("You have not calcuated the correct values for the bounds of the first integral.")
    elseif a5
        disp("You have calcuated the correct lower bound, but not the correct upper bound of the first integral.")
    else
        disp("You have calculated the correct upper bound, but not the correct lower bound of the first integral.")
    end
    if a9 && a10
        displayFormula(['"You have the correct values for the bounds of the second integral: "' "u(a) = log(ua)" '" and "' "u(b) = log(ub)"])
    elseif ~a9 && ~a10
        disp("You have not calcuated the correct values for the bounds of the second integral.")
    elseif a9
        disp("You have calcuated the correct lower bound, but not the correct upper bound of the second integral.")
    else
        disp("You have calculated the correct upper bound, but not the correct lower bound of the second integral.")
    end
    if a7 && a8
        displayFormula(['"Correct. The new measure for the second integral is "' "du = measAns";...
            '" and the integrand is "' "f(u) = fu"])
    elseif a7 && ~a8
        disp("Correct measure, but incorrect integrand in the second integral.")
    elseif ~a7 && a8
        disp("Incorrect measure, but correct integrand in the second integral.")
    else
        disp("Incorrect measure and incorrect integrand in the second integral.")
    end 
    if a4
        displayFormula(['"Correct, the value of this integral is "' "int((log(1+w^2))^7*(w/(1+w^2)),w,[-1 2])==correctAns"])
    else
        disp("Incorrect final result. Did you use the correct variable?")
    end
    if any([~a1 ~(a2&a3) ~a4 ~a5 ~a6 ~(a7&a8)])
        disp("Please try again.")
    end
end
end
%[text] 
%[text] 
%[text] 
%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[text:image:6e2f]
%   data: {"align":"baseline","height":109,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK0AAABtCAYAAADTR+H3AAAXZklEQVR42u2d+5NVxZ3A7zl3gGFePIaXA3ecgMKMjKjhJV5gfYCCyYgY0PEBaBTBiMNmMaC7wmAslN0lIYpavgJbFdeksCKJlf1lrcTUbu1Wpcotdrcqla3aVUzt4zfhT+g9nz70cObOOfd0n8e9d6C7qovh3vPo7vO53\/Ptb3+\/3y4IW2wZZ6Vgh8AWC+0VUM6dOyf27t1rB8JCO37KqVOnRKFQENsHBxq2jRcuXJDVQmuLLEO7HhK77nBEf3exIcE9e\/as6O6aLj799FMLrS1+WbOiV\/zkO4744lVXgnvPxltTSTXgygqwHx57Wb4F+ksFMTw8bKG1xS8dbc3it4dc8dW77gi4S\/p6EoGLVOxomyQrf6dRB5D6pRlNsm37Bxxx6Pm9FlpbLg6aJ8kAVlUJrifZlvSWjMDl2CXX9Yj9g1Nl5e8k4MvrePfmx0NbaBPQHtz3qIXWFv9V3v+1tlHQqjp4i2ME7tDubaJ8fav46pc9svI3n5lKau7JvYNtQX1Zu+oGC60tPrTlhYVQaE3A5TodbRPE2XfnjUDL33ymq99K1aJ14hhgqR8\/60G7crGF1hYhjh8\/HgpJsAJ1nI67pK8kjjw+fQRYVfmM73SBff2x8LYA7ZqlPRZaW4QYfuGA1BerQasmZ1HmsB8ee0X0z28eA6yqfMcxSYFV0HZfNdVCa4uQk5s4aKuBi\/TtaG8WHx+ZEwkt33FMmKTWAVZVJowWWlvEM09s0YJWgVua4UrpPCKpDz43avIVVTmGY8PMYzrAWmhtGSnMyJmZ60BDxWba0VIUJ999Q54fJ2UrpW2lWStOn7bQ2hIKLfqiLjhKv+SV\/v3Df15Vlw3TbU++92YiYC20tqSClnrkAUfMnu692odmaEPLsSw4cM+NN5rf00JrSypo\/2HYFa3NrjawqrZNdsXCrksrXRZaC23NoN21vigGb28zhpZzvn1b0fh+FtrLtPzff38htm1eJmfp+MjqrEQlhRbz10+en2UMLedwbl7Q0mf6zhjsfGCFHBMLbYOXvu4J4tCOmaLc3yz6F7TLB82KFD4AZ86cyQTas0d9gEyBVZVzuUYW0NIn+kYfpQuj12f6\/rNDc8eNZL7iocWs9PtTJXH+V72jzE27Bjq82XurfJADG1aNAJwEWkxkgJEUWs41MbNVQkvb6YOE1OsTfQua3ei79HsImNgstA1c1qxcNPIAg+AGnVjwB8D8hB\/tddfMEu\/tNANo\/6Ym6XqYFFrpuuhdw1S6T2l1ZZtpO30IOucEgVU\/VMbCQjsOyrbBu0cBFQZuUAIzMUJibVnVpP3KLve6ifTZoF7LNXRhHVzdJNtIW6stZAT7yhgwFlcEtOfPnxenT58WBw4cEOvWrRPTpk2TAzZ\/\/nz5\/yeffFK8\/fbb4vPPP2\/IAcBra+PKlsiHGVaRWAre\/ZuK4o8nYqDta9JaBav2Y+Ea1e5BG2iLgjVMqlbrI2PAWFzW0ALr0aNHRyCNq0uXLm3IAWA9vzR7cuxDjYL3lsWTpH\/Br\/+iftByb9pQ9toSB2tU3zpam1KF+zQ8tJ999pmUpDqwqorE1S1IZaR0sJqcbzwZI+brR12JwFU+sB0tjvjbPcWaQ8s9uXeYb64usPSdMcijINyyfpaFJMDqStdgRSrrFjpWef4nn3ySq14b9dB1wZUPvsUV+waKNYOWe3HPsB+cSV\/oe576LM8+DQ+poEUCJgHWBLqwDqIv51kwCVVzZDEBt79n4hhw84CWe3CvtMAqx5wwm3SWBfWw8rkiAHOHNkwCqgrMABeEE8iZpPE64DWR5EeBGlITe21bdX1QF9wvPuiWMB3eWgxYD4rpoe29dD2uzT24V1pg\/bi0SbmPL4BmNc\/RhhYYq02ydKBM8qMA+iSTK5UAI1irxWxtf3CTNLonffhhqoLScTFBpbXTco1LOqybiYSl0mf6XouC8MpCTdCGduvWrZESNgtgw34UQFyt7NixI7RNpVnNYnX\/1DGVGXLlsQT\/kTHmzltXiPaWYmoIRjlxexOk373kiv33uLE\/iDiwuAbX4pq6UlunrXiRLVm8QK70UYnMIKSISoYaqvrRp7UuwEnlm5T\/m5pDC7o3i5Ky2GDz0nni9GAZb+W92pIscapwGJZkqYTQTG1ztfxddcFFQvZ3+\/fo75mQGFrOldfwrqUrsXXaSF\/nzbg0BmocgpWcZUQXl\/uapTDguWBpWLPsGrHt\/g0ylCjuLRY3ZzG1JmhByys6CtospCzgm0pZVT768H35ukzib1pZn9vkiK7OYmZQ+MBNFHs3+n4AujpopY7MuVyDa2XZNvqqG29WueoG4Di2E03Rf\/VE39Fo0VyZnK+at1yYtKWaSNtC0l+HCVh5SNlR+ujgQCLP\/rA6d7qrHV2gA4ev3zqid56b2DVxYZevFujosbrASinb6WYyZsHoDJ4dro55SlstaKOsBmlsbdV0WdNZJa8mUlsyaGkHHlWjNLOYycw86Mi9ui+5E\/iKa\/XONbFw8HZKqlZFxsEFAjjjrERp3tqpoM1Cnw2bUSa5rp8PYEIiB+0wBxeTiZOOr4LUBT1paaIicGxLsy+9TH0J4iZ2ug44OhUVgzbqAFttYq8rBLWgTbtgYDrBS6onM2j82lUazqT1939tNkvXgQZJ2VsqGgc29syOl7ImwCqrBn2sF7BR8yRdm3xdoc1iJllZhp56bFTKy6TV1B6q49Y4tdURc2cUta83d+YE0dnharsXmtqPswCW0PikCaHDJmQ6q2R1hTZsApaFysHELAtw39rpg2vySq8GUVdnk7SL6khbjpna0VwVchNglR5Ln7IENo3tNkw11Fmyrxu0WasGlYWshabJLcKqWuPPAlx0yQ3r\/0RcXyqI0882i\/94dZI4d+KSTwF\/8xnfccza8k2RurUpsGE+EUkr45oW2DQqQkEX0CS1mkkszDabpc9t0qwsUeBmoSq8sqNN\/OsPpoo\/vt4k3vAk1d03OeLOJY7o7iyIm68piD\/d6Ijtax35HcecPTZFHNnWkolKkCWwjGsWvrdRgitORagbtFmtQ9cK3Lee8ME1mUiNwPWLbvGfr08W515zxYNeW6a0FGR9fpMjXh50xIF7HPHwakfs3ehDrMaDYzmHc7mGKbC0lUkXbU\/b\/5G9JQxT9CexTMVxUDdow5zI8\/CZzRJcIgSAgNAUbTvuma+JLz2p+fPvOuKui0ACLKB++1Yf1JcHC2JogyPef9oHmmN2r3PEtjWOKHlSmM+5BtfSVQdoI22tFlFhkkSPyAjmClnvTRY2Gccc1nDQ5q3PJgUXacISZVRVsVgbv+5L3dhogY\/mif95syiOPeKIF7c44nvf9FUBOeHwoN33DUdsXuGIx2\/zVYVV1\/rfKXXh6IOOhJfvUBn+17sW14yPovDaeJM7ErtWrU9xk1U54Wopyq2e8ihJ9NpCmLiurNVcEsOOVzVqJhi2Cpa332wYuEiQIw8Wpa+qMv4TZ0WegVHV+wynFelBNsOH9onb\/KVZVs+iVIbPT0yQsH33bl8FAFwmWFxHgYh68KwHL2ADKN\/x+X3LvfM8KXx00JfIh+5zxLs7HXnNKFWAtrDk++Qdfhtpq8x14LU9ql\/0mWMYgyMPuKO2mpITrrZJuW6il2R1rC7Wg7BXQlZ+DHHg9i64StzQ44qZU1xpfsJwzwPXCQhUExukmXr9zu10Rc8sV0o3Zvpqsvabl1pk0jngpA5\/yxE7b3fEnjv9\/9NndFpgfahcEI+UfaBRB1iOBuB7lxXE+usL4vtbfZ33xKOO+KcXXXlt1Rbu2e71Y9Hcopg\/pziivtBG3YkjfWcMGAvGhOuRM2HF1\/tqslWpKVt1gbYWk7DKgrQgDkqFWKfJQ1Dp0AIkXHeeJ+lmd7bI1zvSCgiRpLzm99zlS1WARYryHROtnbcXpIpw10UrQnmRD+uPd\/mqw461jthysy+VmaRxHtfm2Dkz2sTVc3x3QdqQZZ9UiDxjlvd2paaTsbpAm2TGmAbWtbfcJLc6whdVV6Ka1mAuhH98Z0BCBlj8i4Tl76c9KfvCvT6EgCuhWOP\/n+8Wz\/MAXu7DyeeHvuUDz+fBseKa3EM3x0GaPjFmjB1jmBe8pn4IdYG2FpYDtrdHSihYk\/iyJo3n+re\/9NUCQMUagIRVk7EfeP8yyWJSBrioAfu8v9\/Z6U\/E0H2Bcl1\/QU7Q1PgoMxnSmWtzjzRxZ6Y+vQpexrTeFoS6QJvHknCwsJ0REwikUK1gDVoMvjzhjukfr3UlVTcvL0i1gIkV32FFQGflmGMPO95Eyp+48R1SlnM+\/p4rnlrv67XAKyeTH82rad8YS8aUyIVqW0blPcdpGGizSJuEBOA1Vpo1oWZSaEz9cI74uwOulJZISiUhlf1VSpGVPpRSAj\/sg\/iaVzEvASgSFyktLQh3O+Ktx33pjFRmUoak5R7cqx59ZGwZY8Y6C6lrGrlSc2ijTBxpi\/SnbW+uj3QN1g+mSQmKKgB0QMjyLOoApitg5RUPlFgGntngqwOv7vAXGpDCfM6CAv\/+zW4fbD4HcsDleOpXP+2sWz9HpK435mmXdMNMoHiANQy0UaHoacqpH78jbl82U3zw4kJx4e\/Lda3nT3dLMNFdmf1vvzj7R2ICK694TF0v3e+ID\/Y4Mi4NgKn8zWd8h2mMYzmHc7kG1+KaXJt7nP+wW1z4pFzX+v7wQrF8cac4efJkptBWY+KygLahJK0n\/ZQkRCoiHZGSSg0ISlG+R7oiZTmepVw+B2BgVUu9WBGQ1srqgBRHml\/OkvaKgHaUTjt7Ut11WvRO9E\/ARB\/90XZfYgIdUKK3AiT2WCwLhz0QT+12Rxxo0HsrLQdUrgHgdddpvTEe2Lg2E532ioZ2tPWgOVcbZjXrATN7AEOy8opn5o+UVPZWoMRCgPTFYoDlAAsC3yFB5YLDct9qwPlq6TdY62E9ULborK0HFtqA1CXdT63ttKwmKTstr\/jKfmJRwAaLtAReJC42Wmy1SGUkMZM2pDNqwAubfUmMBOaHgJSup52WMc3aTmuhDdF1a70i9otXbpFQBvuHlGV1C\/0U6cmq1+aLqgJqAoBjx+VYwGXSxeoZK2Ucw6pacJWtHitieSVdbnhoa+2WGIRX+R5kvU4\/4nswoyimtfuqAc7bvNaB842L9tcdF2f\/6LH4F+BnoPRbPh\/a4E\/A1EIEEhUJi9+CAp7vvnzNv8f09iYZrZtnnxizvDOEN7ydthYrYnHLu+hjpa7pMuFcWi8vPKuunuV7RlV6eeGRhV6LzsqkDMsAsKIG4MmFRxcQot\/i6YUagKlLuS7yNxIWDzHlLYbnWKWXFx5meJrhcZbWy4t+zJnmen0qivsG7qjJMxm3K2K1glaBi2\/tjT1FcecNrlji\/ds22fEgjvanxVc16E+Lz+pV0+L9aZlYqYWFg5t9H1le\/0p9QK8FVnxqAVzFjqmlX87lGHRhvovzpyWtE76+QX9aPq\/mTyv9iEP8aQmvIVrBQivyCx3Xtue2TZLZAE0iF\/5wbGzkQmy8mDe7J9pAgYiEZWLFJEtFMKAa8B1QoiJgRVB+BxwDtMouqxO54MeF+W1UkQu0PUnkQq3AHRdeXrV0TQwWsqBwrySZApPEiMkgxJ93yfguFhRQB9BVVYQCeimfs6hAnNiudb5EVpYCjsHPlvgyrsG1dAIbs4wRqwW448KfNkkwWxbAEuuUNNeXaTTuKLgqonFVn5mcoc+i8yoHGgWsckOsjMY1zYwoE3SkjMbNG9ywTDMNF7mQd86DykLi3zQ5vrLaRebQQ+3in4\/OHMl7wESL5VmlLmBpAFSV94BjOSevXXcaAdwoa1I1r7+6QBu2aURetloGOS2wWW3KwUz\/4QfuETcvmjiSYeYPxyeM3Iu\/VYYZjrlj7dKq2RtNNy\/JAlx+AAiBPG201Ty86gZtrSwIEtjJTmJgj20zy+UVBxG5vGZ1tmrn8mqd5IqumIR1pjlp6VPaHAi6eWjzUhXrBm3ek7G0wGa9iwxLrtPbXZkJUdfIT3r52dPil2uT7rqTBlyeVxYxY5lkmKkVtHlOxvbu2Z1KJTDNT6ubDZzVK9P8tL3zss0CnlV+WpU1EZt3mpJJLq9aQRul16Zdzs0isbJJJnDdjZ\/pG1m9TTOBs+ihkwncBNysMoFj606T2yssu0ycPltXaKNMHUk2u8sSWJM9F3QhMdk3Ie25unZc+pjFngvl3qbEFgUyECVJql1XaJM2Oi9gqSx9ZrmXmHod96XY3YZzs1ZXstrdxrcoFOXWWKYlLJWAjtCqK7RhKkKSHSDTrnQF9bTSzKbMgK3XPmK6bWSi91cPZbMjEEvjJmpCElNXQ0Ab9Wsz9UPAbjiwfqXovmrqxYRrk+W+Yuw4iDeV2o0wTgqzI2KclDUBtp47Nuq0lb5i0WCc+MGqcVIZIk2TLQ\/cVdZ+ZklT1zcEtFkno+PXjimGDdgOPb9XboW5duViuQeugjqqknwt611k6rk3rk6bcc9EJwU49ghmnAinMU3rKrce9c7X8b1Nu2tjfiEDBst4pmvPeRScnatJsTS7yLCDeGwu25x2IddZpavVLuRZmTvrDm1UJ9JuzWQqndHJosxKSTblOLy1GJhhF1PFc3Eu11DX49pZbV5Cn+l7LUvaXG4NAW0Wm\/ymKagS\/fObM5GwYWv85b6m9ND2NYX6RGQhcen7mTNnajLWaTbvbiho6+WuGFQNwl7fSVSCw\/c3jbVl5gCtlLjevbJQFeg7Y1AvKWsqnBoGWqRtrTYPqSxMIiofvAmw\/j4HTuSafl7QXtJxHSOdubJv8gfnjUE9BJOuxaAhoY1a1svTz5bCbLc0e3JiBxQZPzbDrRohkCe0KqKCNtCWpA4+jEGeUbdhKmASm3zDQUtJszt1knL8+HEZmmLqS6ByHOzfdCkWq17Qqtg12mKSCyHYV8aAsajlc026ZN9w0Eb9IvOalAX1WR33QgXrYNnVNsLjnJImJwHn6jq40CbapuDVdWvErJaXXhv2Bk0zX2k4aKOW+PLa\/WbNykXywVYzCQE1CdfaWyeJmVOKMveAyWrR\/k1NRitZYXZarmFyT+BlhxqyGtJ2+lDNpMcYMBa1EELMXdJ48zUktLUsPNR\/P7VglJ0VyYbRvX9+q7Rhbrt\/vTQJSVXiRifR2jx5BpJCi66axCNLhTDRdvpAX+gTfaOPQTvvf\/30WjkW46Fc8dC2tzaJY091SqhKc1rlg17SVxJDu7eNsV0ODw\/LdXpTeJB6MtNhQmilP20Cf4CwuDv6RN\/oo0zk4fWZviPN713dbqFt9PIvv\/uN+LOdGyWMPMy42fOh\/bsSQUslfVJS18SFXcnCY3SCRekzfWcMvvPoBjkmFtrLqBzc92hiaB9Zk9wJfPMKNzdox2Ox0NYI2p8NuaK12TWGtnWyK17c6lhoLbS1hVaFXS\/o7jQObOQcGcb+qoXWQlsjaIN5Ak6+92akY06UIwvOPPi7kt3FQmuhzR1aGT812ZEh7UETm87qmHQiD5igiHolOsDkx4LTu4XWQqsNbVTuq+GDz4ny9a3xtlnvGI5VBZ9fwA1LURpWCZshCsFCa6HVgrZasjbpcB4jbZWUrQwUlLl1WydqBXBKaJddY6G10MZDq5NdkPT51XRb9p1F\/w0ruuAC7dpVN1hor\/QSt7hgkg6TFakwH1g+47tqRQdc2vnME1sstFd6qbaMy8THJH8rEcNsdRR0YvHjtSZoJXaLA5d2Eo1sobXQhkKrzFpDTz1mdL2hpx8fNSnjbz7TLdXAxbEHc5mF9govrNGXFxbGZg9MmK9VWgSuu+h66FX+Nk3mFgVuua85k1ScFtpxXoAgCC1SF2DSRLKq3XZkCHvCcJcwcFlYyHo7UAvteIV2cZuccAHvkkVzM4mr4hpprxMEFzfGWgQqWmjHCbSlWc3SF4AJV6NJMgVuf6kgU0FZaG2RkE5pb8lsv4G8wO3u6rxsLQcW2gQlbbr2Wv248t6E2UJriy0WWlsstLbYYqG1xZbk5f8BQ+p9qz1qETkAAAAASUVORK5CYII=","width":173}
%---
%[text:image:189e]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:5216]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:296a]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[control:button:0484]
%   data: {"label":"Clear Variables","run":"Section"}
%---
%[control:editfield:951f]
%   data: {"defaultValue":" x","label":"g'(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:46f8]
%   data: {"defaultValue":"dx","label":"dg = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:67bf]
%   data: {"defaultValue":" g","label":"f(g) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:92de]
%   data: {"defaultValue":" x","label":"F(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:454c]
%   data: {"label":"Check the Solution to Exercise 1","run":"Section"}
%---
%[text:image:8c8c]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[control:editfield:08ef]
%   data: {"defaultValue":" t","label":"u'(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:166c]
%   data: {"defaultValue":"1","label":"u(1) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:4dc2]
%   data: {"defaultValue":"3","label":"u(3) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:0071]
%   data: {"defaultValue":"dt","label":"du = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:6601]
%   data: {"defaultValue":" u","label":"f(u) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:6f53]
%   data: {"defaultValue":" 0","label":"F(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:8f3f]
%   data: {"label":"Check the Solution to Exercise 2","run":"Section"}
%---
%[control:editfield:4795]
%   data: {"defaultValue":" r","label":"q'(r) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:6d08]
%   data: {"defaultValue":"dr","label":"dq = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:948e]
%   data: {"defaultValue":" q","label":"f(q) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:6bfc]
%   data: {"defaultValue":" r","label":"F(r) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:684f]
%   data: {"label":"Check the Solution to Exercise 3","run":"Section"}
%---
%[control:editfield:95c2]
%   data: {"defaultValue":" w","label":"g'(w) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:2260]
%   data: {"defaultValue":"-1","label":"g(-1) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:3167]
%   data: {"defaultValue":"2","label":"g(2) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:9186]
%   data: {"defaultValue":"dw","label":"dg = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:71d6]
%   data: {"defaultValue":" g","label":"f(g) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:9c30]
%   data: {"defaultValue":"-1","label":"Lower bound = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:4811]
%   data: {"defaultValue":"2","label":"Upper bound = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:7ee8]
%   data: {"defaultValue":"dg","label":"du = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:31b9]
%   data: {"defaultValue":" u","label":"f(u) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:22f8]
%   data: {"defaultValue":" 0","label":"Solution = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:683a]
%   data: {"label":"Check the Solution to Exercise 4","run":"Section"}
%---
%[text:image:9c4a]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[text:image:5a48]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:3602]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[text:image:544d]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
