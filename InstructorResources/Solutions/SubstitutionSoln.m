%[text] %[text:anchor:T_3F7C96AC] # Substitution
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%[text] A thorough understanding of the integral as an antiderivative can only take you so far. Just as with derivatives, there are integration rules that can be built through the combination of functions as well. The method of substitution that will be discussed in this live script applies to nearly every integral you will ever calculate. In fact, you will likely forget that you are even applying it in some cases because it will become so natural to use!
%[text]{"align":"center"} ![f of flower](text:image:1e5f)
%[text] The method of substitution allows you to replace a complicated integral with a simpler one.
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:7220) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:7339) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning symbol](text:image:04f1)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
clear gPrime uPrime NewMeasure Measure g fa fb fc fu f dxGrp dgGrp ax ax1 ax2 ax3 MyFun MyAnswer LastFive AreaGrpdx
  %[control:button:8ad3]{"position":[1,2]}
%%
%[text] %[text:anchor:H_02C02A0A] ## Inverting the Chain Rule for Derivatives
%[text] Remember that the chain rule for derivatives looks like 
%[text]{"align":"center"} $\\frac{d}{dx}\\left\[(f\\circ g)(x)\\right\]=\\frac{df}{dg}\\cdot \\frac{dg}{dx}=f'(g)\\cdot g'(x) = f'(g(x))\\cdot g'(x)${"altText":"d\/dx \[(f composed with g)(x)\]= df\/dg \* dg\/dx =f'(g) \* g'(x) = f'(g(x)) \* g'(x)"}
%[text] %[text:anchor:H_B0ADBFB6] ### Substitution for Indefinite Integrals
%[text] If we apply the concept of antiderivatives to this rule, we see that 
%[text]{"align":"center"} $f(g(x)) + C = \\int \\frac{d}{dx}\\left\[(f\\circ g)(x)\\right\] \\; dx =\\int f'(g)\\cdot g'(x) \\; dx${"altText":"f(g(x)) + C = integral of d\/dx \[(f composed with g)(x)\] dx = integral of f'(g) \* g'(x) dx"} $(\\Delta)${"altText":"(Delta)"}
%[text] In fact, because $dx${"altText":"dx"} tracks the measure of a small step in the direction of integration while $g'(x)\\; dx${"altText":"g'(x) dx"} does the same, we can define a new measure $dg = g'(x)\\; dx${"altText":"dg = g'(x) dx"} which allows us to note that
%[text]{"align":"center"} $f(g(x))+C = \\int f'(g)\\; dg.${"altText":"f(g(x))+C = integral of f'(g) dg."}
%[text] %[text:anchor:H_B624A250] ### Substitution for Definite Integrals
%[text] Applying the fundamental theorem of calculus, we have: 
%[text]{"align":"center"} $\\int\_{g(a)}^{g(b)} f'(g) dg = \\int\_a^b f'(g(x)) \\cdot g'(x)\\; dx${"altText":"integral from g(a) to g(b) of f'(g) dg = integral from a to b of f'(g(x)) \* g'(x) dx"}
%[text] which is 
%[text]{"align":"center"} $f(g(b))-f(g(a)) = \\int\_{g(a)}^{g(b)} f'(g) dg = \\int\_a^b f'(g(x)) \\cdot g'(x)\\; dx.${"altText":"f(g(b))-f(g(a)) = integral from g(a) to g(b) of f'(g) dg = integral from a to b of f'(g(x)) \* g'(x) dx."} $(\\star)${"altText":"(star)"}
%[text] %[text:anchor:H_24A2C2B7] ### **Practice using substitution**
%[text] Rewrite each of the following integrals in terms of the new variable provided by the substitution function. Then solve the integral.
%[text] %[text:anchor:H_70519B81] #### **Exercise 1**
%[text] $\\displaystyle \\int 15\\sin(3x^5)x^4\\; dx${"altText":"integral of 15sin(3x^5)x^4 dx"} where $g(x) = 3x^5${"altText":"g(x) = 3x^5"}
%[text] First, find the derivative of $g(x)${"altText":"g(x)"} with respect to $x${"altText":"x"}:
gPrime = @(x) 15*x^4; %[control:editfield:85f7]{"position":[14,21]}
%[text] What is the new measure $dg${"altText":"dg"} going to be in terms of $x${"altText":"x"} and $dx${"altText":"dx"}?
NewMeasure = @(x,dx)15*x^4*dx; %[control:editfield:823e]{"position":[21,30]}
%[text] If we define $\\displaystyle \\int 15\\sin(3x^5)x^4\\; dx = \\int f(g)\\; dg${"altText":"integral of 15sin(3x^5)x^4 dx = integral of f(g) dg"}, what is $f(g)${"altText":"f(g)"}?
fa = @(g) sin(g); %[control:editfield:8ada]{"position":[10,17]}
%[text] Calculate the function $F(x) = \\displaystyle \\int 15\\sin(3x^5)x^4\\; dx${"altText":"F(x) = integral of 15sin(3x^5)x^4 dx"}.
Answer = @(x,C) -cos(3*x^5)+C; %[control:editfield:2239]{"position":[16,30]}
Check1a(gPrime,fa,NewMeasure,Answer);
  %[control:button:762c]{"position":[1,2]}
%%
%[text] ![](text:image:4385) **Note:** In many textbooks it is common to use a variable $u${"altText":"u"} in place of the variable $g${"altText":"g"} in equations $(\\Delta)${"altText":"(Delta)"} and $(\\star)${"altText":"(star)"}, or even to call this method $u${"altText":"u"}-substitution. 
%[text] %[text:anchor:H_73F97AC9] #### **Exercise 2**
%[text] $\\displaystyle \\int\_1^3 \\left(\\frac{1+t}{t^2+5}\\right)^{2/3}\\left(\\frac{5-2t-t^2}{(t^2+5)^2}\\right)\\; dt${"altText":"integral from 1 to 3 of ( (1+t)\/(t^2+5) )^(2\/3)( (5-2t-t^2)\/((t^2+5)^2) ) dt"} where $u(t) = \\frac{1+t}{t^2+5}${"altText":"u(t) = (1+t)\/(t^2+5)"} 
%[text] Calculate the derivative $u'(t)${"altText":"u'(t)"}.
uPrime = @(t) 1/(t^2+5)-(1+t)*(t^2+5)^(-2)*2*t; %[control:editfield:3df0]{"position":[14,47]}
%[text] Calculate the new bounds and new measure for the integral in terms of $u${"altText":"u"}. 
ua = 2/6; %[control:editfield:167e]{"position":[6,9]}
gb = 4/14; %[control:editfield:5d63]{"position":[6,10]}
NewMeasure = @(t,dt)(1/(t^2+5)-(2*t*(t+1))/(t^2+5)^2)*dt; %[control:editfield:7d6a]{"position":[21,57]}
%[text] If we define $\\displaystyle \\int\_1^3 \\left(\\frac{1+t}{t^2+5}\\right)^{2/3}\\left(\\frac{5-2t-t^2}{(t^2+5)^2}\\right)\\; dt = \\int\_{u(a)}^{u(b)} f(u)\\cdot du${"altText":"integral from 1 to 3 of ( (1+t)\/(t^2+5) )^(2\/3)( (5-2t-t^2)\/((t^2+5)^2) ) dt = integral from u(a) to u(b) of f(u) \* du"}, what is $f(u)${"altText":"f(u)"}?
f = @(u)u^(2/3); %[control:editfield:45a7]{"position":[9,16]}
%[text] Calculate the function $F(t) = \\displaystyle \\int\_1^3 \\left(\\frac{1+t}{t^2+5}\\right)^{2/3}\\left(\\frac{5-2t-t^2}{(t^2+5)^2}\\right)\\; dt${"altText":"F(t) = integral from 1 to 3 of ( (1+t)\/(t^2+5) )^(2\/3)( (5-2t-t^2)\/((t^2+5)^2) ) dt"}.
Answer =  3/5*((2/7)^(5/3)-(1/3)^(5/3)); %[control:editfield:96d0]{"position":[10,40]}
Check1b(uPrime,f,ua,gb,NewMeasure,Answer);
  %[control:button:463b]{"position":[1,2]}
%%
%[text] %[text:anchor:H_C2693311] #### **Exercise 3**
%[text] $\\displaystyle \\int e^{r}\\cos\\left(e^r-17\\right)\\; dr${"altText":"integral of e^(r)cos(e^r-17) dr"} where $q(r) = e^r-17${"altText":"q(r) = e^r-17"} 
%[text] Remember that $e^x${"altText":"e^x"} is written as `exp(x)` in MATLAB.
gPrime = @(r) exp(r); %[control:editfield:6548]{"position":[14,21]}
NewMeasure = @(r,dr)exp(r)*dr; %[control:editfield:75fb]{"position":[21,30]}
%[text] If we define $\\displaystyle \\int e^{r}\\cos\\left(e^r-17\\right)\\; dr${"altText":"integral of e^(r)cos(e^r-17) dr"} $= \\int f(q)\\cdot \\; dq${"altText":"= integral of f(q) \* dq"},
fc = @(q) cos(q); %[control:editfield:111b]{"position":[10,17]}
Answer = @(r,C) sin(exp(r)-17)+C; %[control:editfield:00d1]{"position":[16,33]}
Check1c(gPrime,fc,NewMeasure,Answer);
  %[control:button:16a8]{"position":[1,2]}
%%
%[text] %[text:anchor:H_98D8047F] #### **Exercise 4**
%[text] $\\displaystyle \\int\_{-1}^{2} \\left(\\ln\\left(1+w^2\\right)\\right)^{7}\\left(\\frac{w}{1+w^2}\\right)\\; dw${"altText":"integral from -1 to 2 of (ln(1+w^2))^(7)( w\/(1+w^2) ) dw"} where $g(w) = 1+w^2${"altText":"g(w) = 1+w^2"}. 
gPrime = @(w) 2*w; %[control:editfield:830d]{"position":[14,18]}
ga = 2; %[control:editfield:9094]{"position":[6,7]}
gb = 5; %[control:editfield:3cdb]{"position":[6,7]}
measure = @(w,dw)2*w*dw; %[control:editfield:4114]{"position":[18,24]}
%[text] Remember that $\\ln(g)${"altText":"ln(g)"} is written `log(g)` in MATLAB.
%[text] If we define $\\displaystyle \\int\_{-1}^{2} \\left(\\ln\\left(1+w^2\\right)\\right)^{7}\\left(\\frac{w}{1+w^2}\\right)\\; dw${"altText":"integral from -1 to 2 of (ln(1+w^2))^(7)( w\/(1+w^2) ) dw"} $= \\displaystyle \\int\_{g(a)}^{g(b)}f(g)\\cdot dg,${"altText":"= integral from g(a) to g(b) of f(g) \* dg,"}
fb = @(g) log(g)^7*1/2/g; %[control:editfield:4bb6]{"position":[10,25]}
%[text] This result is still not immediately computable, so let's make another substitution with $u(g) = \\ln(g)${"altText":"u(g) = ln(g)"}. 
%[text] If we define $\\displaystyle \\int\_{-1}^{2} \\left(\\ln\\left(1+w^2\\right)\\right)^{7}\\left(\\frac{w}{1+w^2}\\right)\\; dw${"altText":"integral from -1 to 2 of (ln(1+w^2))^(7)( w\/(1+w^2) ) dw"} $= \\displaystyle \\int\_{u(a)}^{u(b)}f(u)\\cdot du,${"altText":"= integral from u(a) to u(b) of f(u) \* du,"}
ua = log(2); %[control:editfield:6b89]{"position":[6,12]}
ub = log(5); %[control:editfield:6a2c]{"position":[6,12]}
nextMeasure = @(g,dg)1/g*dg; %[control:editfield:8b8d]{"position":[22,28]}
fu = @(u) u^7/2; %[control:editfield:3a7f]{"position":[10,16]}
%[text] Putting everything together, compute the result:
Answer = ( (log(5))^8-(log(2))^8)/16; %[control:editfield:1551]{"position":[10,37]}
Check1d(gPrime,fb,ga,gb,measure,nextMeasure,ua,ub,fu,Answer);
  %[control:button:7cb2]{"position":[1,2]}
%[text] %[text:anchor:H_74C4D543] ## Visualizing changing variables
clear x
syms x %#ok<NASGU>
%[text] It can be counterintuitive to visualize how a change of variables affects your function or the resulting integral. Use this to investigate different combinations of functions. 
%[text] %[text:anchor:H_E2A7BE6C] ### One step at a time
%[text] %[text:anchor:M_F10E59BD] Set up the functions to use:
f = @(x)sin(x); %[control:editfield:58fc]{"position":[9,15]}
g = @(x)log(x+5.001); %[control:editfield:6c92]{"position":[9,21]}
%[text] Choose a left endpoint $a${"altText":"a"} and a right endpoint $b${"altText":"b"} such that $a \\leq x \\leq b${"altText":"a \<= x \<= b"}:
a =-3.4; b = 2.1; %[control:slider:2702]{"position":[4,8]} %[control:slider:4d3f]{"position":[14,17]}
if a > b
    warning("This code assumes a<b. Please set your values accordingly.")
end
tVals = linspace(min(a,b),max(a,b),10000);
gVals = double(g(tVals));
fVals = double(f(gVals));
%[text] Visualize the graph as $f(g(x))${"altText":"f(g(x))"} vs $x${"altText":"x"} or $f(g(x))${"altText":"f(g(x))"} vs $g(x)${"altText":"g(x)"}:
displayXvsF = 1; %[control:dropdown:038e]{"position":[15,17]}
clear p2
figure

[ax,p1,yM,ym] = CreateBasePlot(tVals,gVals,fVals,displayXvsF);
  %[control:button:6510]{"position":[1,2]}
%[text] ![](text:image:2e44) **Try**.
%[text] 1. $f(x) = \\sin(x)${"altText":"f(x) = sin(x)"} and $g(x) = \\ln(x+0.001)${"altText":"g(x) = ln(x+0.001)"} with $a=0${"altText":"a=0"} and $b = 2.1${"altText":"b = 2.1"}?
%[text] 2. $f(x) = \\sin(x)${"altText":"f(x) = sin(x)"} and $g(x) = \\ln(x+0.001)${"altText":"g(x) = ln(x+0.001)"} with $a=1${"altText":"a=1"} and $b = 1.1${"altText":"b = 1.1"}? or with $a=0${"altText":"a=0"} and $b = 0.1${"altText":"b = 0.1"}?  
%[text] 3. $f(x) = \\cos(x)${"altText":"f(x) = cos(x)"} and $g(x) = e^x${"altText":"g(x) = e^x"} with $a = 0${"altText":"a = 0"} and $b=0.1${"altText":"b=0.1"}? or $a=2${"altText":"a=2"} and $b = 2.1${"altText":"b = 2.1"}? or $a = 2${"altText":"a = 2"} and $b=5${"altText":"b=5"}?
%[text] 4. $f(x) = \\cos(x)${"altText":"f(x) = cos(x)"} and $g(x) = e^x${"altText":"g(x) = e^x"} with $a = 5${"altText":"a = 5"} and $b = 5${"altText":"b = 5"}?
%[text] 5. Any other functions you like! \
%%
%[text] Choose a step size and an initial point:
Step = 0.75; x0 = -1.2; %[control:slider:0d86]{"position":[8,12]} %[control:slider:2e2a]{"position":[19,23]} %[text:anchor:M_C03C613B]
  %[control:button:9062]{"position":[1,2]}
Flag = "gdg"; %[control:dropdown:8a50]{"position":[8,13]}

if ~exist("p1","var")
    if ~exist("displayXvsF","var")
        disp("Assuming default values:")
        f = @(x)sin(x);
        g = @(x)log(x+5.001);
        tVals = linspace(-3.4,2.1,10000);
        gVals = double(g(tVals));
        fVals = double(f(gVals));
        [ax,p1,yM,ym] = CreateBasePlot(tVals,gVals,fVals,1);
    else
        [ax,p1,yM,ym] = CreateBasePlot(tVals,gVals,fVals,displayXvsF);
    end
end

y0 = double(f(g(x0)));
y1 = double(f(g(x0+Step)));
g0 = double(g(x0));
g1 = g0+Step;
g2 = double(g(x0+Step));

switch Flag
    case "gdx"
        disp("The step size shown is dg = "+Step+" and the initial point is g_0="+g0+".")
        if (g0+Step > max(gVals)) || (g0+Step < min(gVals))
            warning("This step size moves outside the domain window shown.")
        end
        title(ax,"Showing the effect of the chosen step size $dg =$"+Step,"Interpreter","latex")
        p1.XData = gVals;
        ax.XLim = [min(gVals) max(gVals)];
        xlabel(ax,"$g(x)$","Interpreter","latex")
        if exist("p2","var")
            p2(1).XData = [g0 g0];
            p2(2).XData = [g1 g1];
            ax.Legend.String = ["$g(x_0)$" "$g(x_0)+dg$"];
        else
            hold on
            yM = max(fVals);
            ym = min(fVals);
            p2 = plot(ax,[g0 g0],[ym yM],[g1 g1],[ym yM]);
            hold off
            legend(["" "$g(x_0)$" "$g(x_0)+dg$"],Interpreter="latex",Location="northwest")
        end
    case "xdx"
        disp("The step size shown is dx = "+Step+" and the initial point is x_0="+x0+".") %#ok<*UNRCH>
        if (x0+Step > max(tVals)) || (x0+Step < min(tVals))
            warning("This step size moves outside the domain window shown.")
        end
        p1.XData = tVals;
        ax.XLim = [tVals(1) tVals(end)];
        t0 = x0;
        t1 = x0+Step;
        y1 = double(f(g(x0+Step)));
        xlabel(ax,"$x$","Interpreter","latex")
        title(ax,"Showing the effect of a constant step size $dx = $"+Step,"Interpreter","latex")
        if exist("p2","var")
            p2(1).XData = [t0 t0];
            p2(2).XData = [t1 t1];
            ax.Legend.String = ["$x_0$" "$x_0+dx$"];
        else
            hold on
            p2 = plot(ax,[t0 t0],[ym yM],[t1 t1],[ym yM]);
            hold off
            legend(["" "$x_0$" "$x_0+dx$"],Interpreter="latex",Location="northwest")
        end
    case "gdg"
        disp("The step size is dx ="+Step+".")
        disp("Therefore, the step size shown is dg = "+(g2-g0)+" and the initial point is g_0="+g0+".")
        if ~isreal(g2)
            warning("This value is outside the real domain of g. Please choose a different step size.")
        else
            if (g2 > max(gVals)) || (g2 < min(gVals))
                warning("This step size moves outside the domain window shown.")
            end
            title(ax,"Showing the effect of the substitution on the step size $dg = g(x_0+dx)-g(x_0)$","Interpreter","latex")
            p1.XData = gVals;
            ax.XLim = [min(gVals) max(gVals)];
            xlabel(ax,"$g(x)$","Interpreter","latex")
            if exist("p2","var")
                p2(1).XData = [g0 g0];
                p2(2).XData = [g2 g2];
                ax.Legend.String = ["$g(x_0)$" "$g(x_0+dx)$"];
            else
                hold on
                p2 = plot(ax,[g0 g0],[ym yM],[g2 g2],[ym yM]);
                hold off
                legend(["" "$g(x_0)$" "$g(x_0+dx)$"],Interpreter="latex",Location="northwest")
            end
        end
end
%[text] Observe the fact that the actual distance covered by a given "step size" can change quite a lot based on the choice of the initial point $x\_0${"altText":"x\_0"} as well as the choice to consider a fixed $dg${"altText":"dg"}, or a fixed $dx${"altText":"dx"} or a computed $dg = g(x\_0+dx)-g(x\_0)${"altText":"dg = g(x\_0+dx)-g(x\_0)"}. 
%[text] ![](text:image:7577) **Try**.
%[text] 1. Move the values on the $x\_0${"altText":"x\_0"} [slider](internal:M_C03C613B) all the way to the right with $dx = -0.05${"altText":"dx = -0.05"} and [$f(x) = \\sin(x)${"altText":"f(x) = sin(x)"} and $g(x) = \\ln(x+5.001)${"altText":"g(x) = ln(x+5.001)"} and $b=5${"altText":"b=5"}](internal:M_F10E59BD). What happens? 
%[text] 2.  Move the values on the $x\_0${"altText":"x\_0"} [slider](internal:M_C03C613B) all the way to the left with $dx = 0.05${"altText":"dx = 0.05"} and [$f(x) = \\sin(x)${"altText":"f(x) = sin(x)"} and $g(x) = \\ln(x+5.001)${"altText":"g(x) = ln(x+5.001)"} and $a=-5${"altText":"a=-5"}.](internal:M_F10E59BD) What happens?
%[text] 3. Move the values on the $dx${"altText":"dx"} [slider](internal:M_C03C613B) all the way to the left and to the right with a constant value of $x\_0${"altText":"x\_0"}. What happens?
%[text] 4. Change the [dropdown](internal:M_C03C613B) to view a plot of $f(x)${"altText":"f(x)"} versus $g(x)${"altText":"g(x)"} and repeat steps 1-4. What happens?
%[text] 5. Try changing the functions [$f(x)${"altText":"f(x)"} and $g(x)${"altText":"g(x)"}](internal:M_F10E59BD), for instance to `cos(x)` and `exp(x).` If the bounds on your sliders do not make sense for the new functions, you can either set values directly by editing the numerical field or you can right click on the sliders and set new minimum and maximum values. \
%%
%[text] %[text:anchor:H_3A92165C] ### Visualize the Subdivisions Over Entire Areas
%[text] Set up the functions and the bounds to use. 
clear f g p3
syms x
f(x) = sin(x); % sin(x) %[control:editfield:7657]{"position":[8,14]}
g(x) = 1/(1+x^2); % 1/(1+x^2) work well, used to use x^4 %[control:editfield:9db7]{"position":[8,17]}
  %[control:button:5106]{"position":[1,2]}
a =-1.2; b = 6.9; %[control:slider:00ed]{"position":[4,8]} %[control:slider:95b7]{"position":[14,17]}
NumIntervals = 59;
tVals = linspace(min(a,b),max(a,b),ceil(1000/NumIntervals)*NumIntervals);
gVals = double(g(tVals));
fVals = double(f(gVals));
p3 = plot(gVals,fVals);
ax3 = p3.Parent;
title(ax3,"Show the signed area between $f(g(x))$ and the $g(x)$-axis","Interpreter","latex")
hold on
xlabel(ax3,"$g(x)$",Interpreter="latex")
ylabel(ax3,"$f(g(x))$",Interpreter="latex")
ShowPosNegArea(ax3,fVals,gVals);
%%
%[text] %[text:anchor:H_00CB4EFF] #### Animate Visualization by Original or Substitution-size Steps
%[text] First, show the positions of intervals defined by a constant step size $dg${"altText":"dg"}, then subdivide the same region by intervals defined by a constant step size $dx${"altText":"dx"} under the map $g(x\_k+dx) = g(a+kdx)${"altText":"g(x\_k+dx) = g(a+kdx)"} where $x\_k${"altText":"x\_k"} is the initial point of the $k^{\\text{th}}${"altText":"k-th"} interval. Equivalently, $x = a${"altText":"x = a"} is the lower bound of the corresponding interval.  
NumIntervals =59; %[control:slider:6bf3]{"position":[15,17]}
tVals = linspace(min(a,b),max(a,b),ceil(1000/NumIntervals)*NumIntervals);
StepSize = ceil(1000/NumIntervals);
gVals = double(g(tVals));
fVals = double(f(gVals));
idx = 1:StepSize:length(tVals);
ConstdgDomain = linspace(gVals(1),gVals(end),length(idx));
ConstfVals = double(f(ConstdgDomain));
RunAnimateStripes = true;      %[control:checkbox:5053]{"position":[21,25]} %[control:button:5cad]{"position":[30,31]}
MaxContrast = round(1-ax3.Parent.Color);
if RunAnimateStripes
    delete(ax3.Children(1:end-2))
    dxGrp = hggroup;
    dgGrp = hggroup;
    subtitle("With constant $dg$","Interpreter","latex")
    dgGrp = AnimateStripes(ax3,ConstdgDomain,ConstfVals,1:length(idx),dgGrp,ContrastColor=MaxContrast);
    dgGrp = AddStartEnd(ax3,ConstdgDomain,dgGrp);
    dgGrp.Visible = "off";
    subtitle("With constant $dx$","Interpreter","latex")
    dxGrp = AnimateStripes(ax3,gVals,fVals,idx,dxGrp,ContrastColor=MaxContrast);
    dxGrp = AddStartEnd(ax3,gVals,dxGrp);
    hold off
else
    dxGrp = hggroup;
    dgGrp = hggroup;
    dgGrp = AnimateStripes(ax3,ConstdgDomain,ConstfVals,1:length(idx),dgGrp,flag=0,ContrastColor=MaxContrast);
    dgGrp.Visible = "off";
    subtitle("Showing constant $dx$","Interpreter","latex")
    dxGrp = AnimateStripes(ax3,gVals,fVals,idx,dxGrp,0);
    hold off
end
SetXTicks(ax3,[gVals(1) gVals(end)],["g(a)" "g(b)"])
%%
%[text] %[text:anchor:H_56F6B089] #### Show Only One Set of Steps
%[text] If the checkbox is selected, then the plot shows the region subdivided into constant-size intervals $dg${"altText":"dg"}. If the checkbox is not selected, then the plot shows the region subdivided into constant-size intervals $dx${"altText":"dx"}. In the latter case, the plotted interval ends occur after lengths $dg = g'(x)dx${"altText":"dg = g'(x)dx"}. Because this depends on the value of $g'(x)${"altText":"g'(x)"} it can be a linear transformation, but it can also be highly nonlinear. 
%[text] ![](text:image:6b54) **Try**.
%[text] 1. What happens when $g(x)${"altText":"g(x)"} is a linear function?
%[text] 2. What happens when $g'(x)${"altText":"g'(x)"} is periodic?
%[text] 3. What happens when $g'(x)${"altText":"g'(x)"} takes on a wide range of values over the given domain? \
Flag = true;       %[control:checkbox:0658]{"position":[8,12]} %[control:button:245d]{"position":[18,19]}
if Flag
    dgGrp.Visible = "on";
    dxGrp.Visible = "off";
    subtitle("Showing constant $dg$ steps","Interpreter","latex")
else
    dgGrp.Visible = "off";
    dxGrp.Visible = "on";
    subtitle("Showing constant $dx$ steps","Interpreter","latex")
end
%%
%[text] %[text:anchor:H_D988DEAA] ## Fully Visualizing the Substitution Process
%[text] Set up the functions and the bounds to use. 
clear f g p3
syms x f(x) g(x)
f(x) = sin(x); % sin(x) %[control:editfield:2495]{"position":[8,14]}
g(x) = 1/(1+x^2); % 1/(1+x^2) work well, used to use x^4 %[control:editfield:6a37]{"position":[8,17]}
  %[control:button:83f4]{"position":[1,2]}
a =-1.2; b = 0.7; %[control:slider:3e74]{"position":[4,8]} %[control:slider:365d]{"position":[14,17]}
NumIntervals = 1000;
[tVals,uVals,fOfuVals,fVals,gPrime] = ComputeTUFGVals(a,b,@(x)g(x),@(x)f(x),NumIntervals);
tl = tiledlayout(1,2);
tl.Parent.Position = [680 458 800 420];
ax1 = nexttile(tl,[1 1]);
plot(ax1,tVals,fVals);
ax1.XLim = sort([a b]);
% ax11 = tl11.Parent;
area11 = double(int(f(g(x))*gPrime(x),x,a,b));
title("Show the signed area under $f(g(x))*g'(x)$ ","Interpreter","latex")
subtitle("Area = "+area11)
xlabel("$x$","Interpreter","latex")
ylabel("$f(g(x))g'(x)$","Interpreter","latex")
ShowPosNegArea(ax1,fVals,tVals,pnFlag=true);
ax2 = nexttile;
plot(ax2,uVals,fOfuVals);
ax2.XLim = double([min(uVals) max(uVals)]);
xlabel("$g(x)$",Interpreter="latex")
ylabel("$f(g(x))$",Interpreter="latex")
ShowPosNegArea(ax2,double(fOfuVals),double(uVals),pnFlag=true);
area12 = int(f(x),x,double(g(a)),double(g(b)));
title("Area under $f(g)$ as a function of $g$","Interpreter","latex")
subtitle("Area = "+double(area12))
%%
%[text] %[text:anchor:H_DAA6A1EE] #### Animate Visualization by Original or Substitution-size Steps
%[text] First, show the positions of intervals defined by a constant step size $dg${"altText":"dg"}, then subdivide the same region by intervals defined by a constant step size $dx${"altText":"dx"} under the map $g(x\_k+dx) = g(a+kdx)${"altText":"g(x\_k+dx) = g(a+kdx)"} where $x\_k${"altText":"x\_k"} is the initial point of the $k^{\\text{th}}${"altText":"k-th"} interval. Equivalently, $x = a${"altText":"x = a"} is the lower bound of the corresponding interval.  
%[text] How many intervals?
NumIntervals =73; %[control:slider:9076]{"position":[15,17]}
[tVals,uVals,fOfuVals,fVals,gPrime] = ComputeTUFGVals(a,b,@(x)g(x),@(x)f(x),NumIntervals);
idx = 1:StepSize:length(tVals);
ConstdgDomain = linspace(gVals(1),gVals(end),length(idx));
ConstfVals = double(f(ConstdgDomain));
minGVals = double(min(gVals));
minGtVals = double(min(g(tVals(idx))));
maxGVals = double(max(gVals));
maxGtVals = double(max(g(tVals(idx))));
BestLims = [min(minGVals,minGtVals) max(maxGVals,maxGtVals)];
clf
ax2 = axes;
ax2.XLim = BestLims;
RunAnimateStripes = true;    %[control:checkbox:5436]{"position":[21,25]} %[control:button:37e1]{"position":[28,29]}
AreaGrpdx = ShowPosNegArea(ax2,double(f(g(tVals(idx)))),double(g(tVals(idx))));
if RunAnimateStripes
    MaxContrast = round(1-ax2.Parent.Color);
    delete(ax2.Children(2:end-1))
    dxGrp = hggroup;
    dgGrp = hggroup;
    subtitle(ax2,"With constant $dg$","Interpreter","latex")
    dgGrp = AnimateStripes(ax2,ConstdgDomain,ConstfVals,1:length(idx),dgGrp,ContrastColor=MaxContrast);
    dgGrp = AddStartEnd(ax2,ConstdgDomain,dgGrp);
    dgGrp.Visible = "off";
    subtitle(ax2,"With constant $dx$","Interpreter","latex")
    dxGrp = AnimateStripes(ax2,double(g(tVals(idx))),double(f(g(tVals(idx)))),1:length(idx),dxGrp,ContrastColor=MaxContrast);
    dxGrp = AddStartEnd(ax2,gVals,dxGrp);
    hold off
else
    dxGrp = hggroup;
    dgGrp = hggroup;
    AreaGrpdg = ShowPosNegArea(ax2,double(fOfuVals),double(uVals));
    dgGrp = AnimateStripes(ax2,ConstdgDomain,ConstfVals,1:length(idx),dgGrp,flag=0,ContrastColor=MaxContrast);
    dgGrp.Visible = "off";
    AreaGrpdg.Visible = "off";
    subtitle("Showing constant $dx$","Interpreter","latex")
    dxGrp = AnimateStripes(ax2,double(g(tVals(idx))),double(f(g(tVals(idx)))),1:length(idx),dxGrp,flag=0,ContrastColor=MaxContrast);
    hold off
end
SetXTicks(ax2,[gVals(1) gVals(end)],["g(a)" "g(b)"])
%%
%[text] %[text:anchor:H_77FE9981] #### Show Only One Set of Steps
%[text] If the checkbox is selected, then the plot shows the region subdivided into constant-size intervals $dg${"altText":"dg"}. If the checkbox is not selected, then the plot shows the region subdivided into constant-size intervals $dx${"altText":"dx"}. In the latter case, the plotted interval ends occur after lengths $dg = g'(x)dx${"altText":"dg = g'(x)dx"}. Because this depends on the value of $g'(x)${"altText":"g'(x)"} it can be a linear transformation, but it can also be highly nonlinear. 
%[text] ![](text:image:697e) **Try**.
%[text] 1. What happens when $g(x)${"altText":"g(x)"} is a linear function?
%[text] 2. What happens when $g'(x)${"altText":"g'(x)"} is periodic?
%[text] 3. What happens when $g'(x)${"altText":"g'(x)"} takes on a wide range of values over the given domain? \
Flag = true;     %[control:checkbox:0e96]{"position":[8,12]} %[control:button:24f1]{"position":[16,17]}
if Flag
    dgGrp.Visible = "on";
    dxGrp.Visible = "off";
    subtitle("Showing constant $dg$ steps","Interpreter","latex")
else
    dgGrp.Visible = "off";
    dxGrp.Visible = "on";
    subtitle("Showing constant $dx$ steps","Interpreter","latex")
end

%%
%[text] %[text:anchor:H_49F51B9B] ## Practice Randomized Substitution Integrals
%[text] ![](text:image:2b47) **Pro-tip**. MATLAB syntax is 7`*t^(2/3)` for $7t^{2/3}${"altText":"7t^(2\/3)"}. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators.
%[text] **Solution:** Answers vary.
%%
%[text] %[text:anchor:H_CBD026AF] ### Practice App
%[text] You can practice in the Calculus Flashcards app. You can start the app by clicking on the image below. You should set the problem type to be "Substitution" in the Integrals section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus flashcards app screenshot](text:image:4da4)](<matlab: CalculusFlashcardsApp>)
%[text]{"align":"center"} [Calculus Flashcards App](<matlab: CalculusFlashcardsApp>)
  %[control:button:0e6b]{"position":[1,2]}
CalculusFlashcardsApp
%%
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_ECE76032] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:7f02) at the top right of the Live Editor pane.
function [tVals,uVals,fOfuVals,fVals,gPrime] = ComputeTUFGVals(a,b,g,f,NumIntervals)
syms x
gPrime(x) = diff(g(x),x);
fgp(x) = f(g(x))*gPrime(x);
tVals = linspace(a,b,ceil(1000/NumIntervals)*NumIntervals+1);
uVals = linspace(g(a),g(b),NumIntervals+1);
fOfuVals = double(f(uVals));
fVals = double(fgp(tVals));
end

function [ax,p1,yM,ym] = CreateBasePlot(tVals,gVals,fVals,displayXvsF)
p1 = plot(gVals,fVals);
ax = p1.Parent;
ylabel(ax,"$f(g(x))$","Interpreter","latex")

if displayXvsF
    p1.XData = tVals;
    ax.XLim = [tVals(1) tVals(end)];
    title(ax,"Plotting $f(x)$ against $x$","Interpreter","latex")
    xlabel(ax,"$x$","Interpreter","latex")
else
    p1.XData = gVals;
    ax.XLim = [min(gVals) max(gVals)];
    title(ax,"Plotting $f(x)$ against $g(x)$","Interpreter","latex")
    xlabel(ax,"$g(x)$","Interpreter","latex")
end

yM = ax.YLim(2);
ym = ax.YLim(1);
end

function [posRegs,negRegs,allOrderedRegs] = FindSignSwitchIndexes(fVals,dVals,f0)
% fVals is a vector of doubles to be compared to a constant f0 at
% points given by dVals, a same-sized vector of doubles.
% Each nonnegative/nonpositive region is a row in posRegs/negRegs, respectively
% The first and last columns are flags (1/0) indicating (yes/no) need for
% interpolation at the beginning/end of the region
% The second column is the index into fVals/dVals of the first pair in that region
% The third column is the index into fVals/dVals of the last pair in that region
% If there are no fVals/dVals pairs in the region the second and third
% column will contain NaN
% allOrderedRegs combines posRegs and negRegs with a fifth column that
% tracks the sign (1 for positive, -1 for negative) in the order that they
% occur moving through dVals

ddVals = dVals(2:end)-dVals(1:end-1);

posDU = ddVals > 0;
zeroDU = ddVals == 0;
negDU = ones(size(ddVals))-posDU-zeroDU;

posF = fVals>=f0;
negF = fVals<=f0;

posPosVals = (posDU + posF(1:end-1) + posF(2:end))==3;
negNegVals = (negDU + negF(1:end-1) + negF(2:end))==3;
allPosVals = posPosVals + negNegVals;
startPosRegIdx = find((allPosVals - [0 allPosVals(1:end-1)])==1);
endPosRegIdx = find(([allPosVals(2:end) 0] - allPosVals)==-1);
if size(startPosRegIdx) ~= size(endPosRegIdx)
    ME = MException("IndexFinder:PairFailure","Unmatched start/end regions");
    throw(ME)
end
posRegs = zeros([length(startPosRegIdx),4]);
posRegs(:,2) = startPosRegIdx';
posRegs(:,3) = endPosRegIdx';

posNegVals = (posDU + negF(1:end-1) + negF(2:end))==3;
negPosVals = (negDU + posF(1:end-1) + posF(2:end))==3;
allNegVals = posNegVals + negPosVals;
startNegRegIdx = find((allNegVals - [0 allNegVals(1:end-1)])==1);
endNegRegIdx = find(([allNegVals(2:end) 0] - allNegVals)==-1);
if size(startNegRegIdx) ~= size(endNegRegIdx)
    ME = MException("IndexFinder:PairFailure","Unmatched start/end regions");
    throw(ME)
end
negRegs = zeros([length(startNegRegIdx),4]);
negRegs(:,2) = startNegRegIdx';
negRegs(:,3) = endNegRegIdx';

allZeroVals = zeroDU;

regIdentified = allPosVals + allNegVals + allZeroVals;

interpIdx = find(regIdentified == 0);
for k = 1:length(interpIdx)
    if ismember(interpIdx(k)+1,startPosRegIdx)
        idx = startPosRegIdx==(interpIdx(k)+1);
        posRegs(idx,1) = 1;
    elseif ismember(interpIdx(k)+1,startNegRegIdx)
        idx = startNegRegIdx==(interpIdx(k)+1);
        negRegs(idx,1) = 1;
    elseif (posDU(interpIdx(k)) && posF(interpIdx(k)+1))||(negDU(interpIdx(k)) && negF(interpIdx(k)+1))
        posRegs = [posRegs;1 nan nan 1]; %#ok<AGROW>
    elseif (negDU(interpIdx(k)) && posF(interpIdx(k)+1))||(posDU(interpIdx(k)) && negF(interpIdx(k)+1))
        negRegs = [negRegs;1 nan nan 1]; %#ok<AGROW>
    else
        warning("Unmatched index value tagged for interpolation.")
    end
    if ismember((interpIdx(k)-1),endPosRegIdx)
        idx = endPosRegIdx==(interpIdx(k)-1);
        posRegs(idx,4) = 1;
    elseif ismember((interpIdx(k)-1),endNegRegIdx)
        idx = endNegRegIdx==(interpIdx(k)-1);
        negRegs(idx,4) = 1;
    end
end

[numPosRegs,~] = size(posRegs);
[numNegRegs,~] = size(negRegs);

allRegs = [posRegs ones([numPosRegs 1]);...
    negRegs -1*ones([numNegRegs 1])];
allOrderedRegs = sortrows(allRegs,2);
end


function xz = FindInterpVal(xl,xr,fl,fr,f0)
% FindInterpVals takes coordinates of two points (xl,fl) and (xr,fr) and an
% intermediate value f0 between fl and fr and returns the coordinate xz
% estimating where the line between them crosses the value y = f0
if (fr-f0)*(fl-f0)>=0
    ME = MException("InterpVal:IntervalError","f0 ("+f0+") is not between fl ("+fl+") and fr ("+fr+")");
    throw(ME)
end
%%\ Calculate the slope between (xl,fl) and (xr,fr)
mf = (fr-fl)/(xr-xl);
%%\ Solving the linear approximation f0 = mf*(xz-xl)+fl for xz
xz = (f0-fl)/mf+xl;

end

function varargout = ShowPosNegArea(ax,fVals,dVals,opts)
arguments
    ax
    fVals
    dVals
    opts.f0 = 0
    opts.overlapsFlag = 2
    opts.pnFlag = 0
end
%plot(ax,dVals,fVals,"k")
hold on
[posRegs,negRegs,allRegs] = FindSignSwitchIndexes(fVals,dVals,opts.f0);
cols = ["b" "r"];

[numPosRegs,~] = size(posRegs);
[numNegRegs,~] = size(negRegs);
[numRegs,~] = size(allRegs);

if opts.overlapsFlag == 1
    alphaVal = 1/ceil(numRegs/2);
elseif opts.overlapsFlag == 2
    alphaVal = .5;
else
    alphaVal = 1;
end

if opts.pnFlag
    posGrp = DrawColoredPolys(ax,fVals,dVals,posRegs,numPosRegs,cols(1),opts.f0,alphaVal);
    negGrp = DrawColoredPolys(ax,fVals,dVals,negRegs,numNegRegs,cols(2),opts.f0,alphaVal);
    varargout{1} = posGrp;
    varargout{2} = negGrp;
else
    allGrp = DrawColoredPolys(ax,fVals,dVals,allRegs,numRegs,cols(1),opts.f0,alphaVal);
    varargout{1} = allGrp;
end

hold off
end

function polyGrp = DrawColoredPolys(ax,fVals,dVals,Regs,numRegs,col,f0,alphaVal)
polyGrp = hggroup;
for k = 1:numRegs
    xVals = dVals(Regs(k,2):Regs(k,3)+1);
    yVals = fVals(Regs(k,2):Regs(k,3)+1);
    if Regs(k,1)
        xnew = FindInterpVal(dVals(Regs(k,2)-1),xVals(1),...
            fVals(Regs(k,2)-1),yVals(1),f0);
        xVals = [xnew xVals]; %#ok<AGROW>
        yVals = [f0 yVals]; %#ok<AGROW>
    end
    if Regs(k,4)
        xnew = FindInterpVal(xVals(end),dVals(Regs(k,3)+2),...
            yVals(end),fVals(Regs(k,3)+2),f0);
        xVals = [xVals xnew]; %#ok<AGROW>
        yVals = [yVals f0]; %#ok<AGROW>
    end
    x = [xVals flip(xVals)];
    y = [f0*ones(size(yVals)) flip(yVals)];
    patch(ax,x,y,col,"FaceAlpha",alphaVal,"Parent",polyGrp);
    pause(.1)
end
end

function lineGroup = AddStartEnd(ax,x,lineGroup)
plot(ax,[x(end) x(end)],ax.YLim,"r-","LineWidth",2,"Parent",lineGroup);
plot(ax,[x(1) x(1)],ax.YLim,"c-","LineWidth",2,"Parent",lineGroup);
end

function lineGroup = AnimateStripes(ax,x,y,idx,lineGroup,opts)
arguments
    ax
    x
    y
    idx
    lineGroup
    opts.flag = true
    opts.ContrastColor = [0 0 0]
end
% x and y are the same length, so this is just creating and adding to
% the relevant lineGroup collection of plotted lines at the index values
% given by idx
% if the flag is set, display as animation
if length(idx)>1
    p = plot(ax,[x(idx(1)) x(idx(1))],[0 y(idx(1))],"Parent",lineGroup,Color=opts.ContrastColor);
    for k = 2:length(idx)
        copyobj(p,lineGroup)
        if x(idx(k))>= x(idx(k-1))
            lineGroup.Children(k).Color = opts.ContrastColor;
            lineGroup.Children(k).LineWidth = 1;
        else
            lineGroup.Children(k).Color = "y";
            lineGroup.Children(k).LineWidth = 1;
        end
        lineGroup.Children(k).XData = [x(idx(k)) x(idx(k))];
        lineGroup.Children(k).YData = [0 y(idx(k))];
        if opts.flag
            drawnow
        end
    end
end
lineGroup = AddStartEnd(ax,x,lineGroup);
end

function SetXTicks(ax,newVals,newNames)
XTickSpacing = .75*(ax.XTick(2)-ax.XTick(1));
remXVals = ax.XTick((abs(ax.XTick - newVals(1)) > XTickSpacing) & (abs(ax.XTick - newVals(2)) > XTickSpacing));
starXN = string(cell2mat(pad(ax.XTickLabel)));
remXN = starXN((abs(ax.XTick - newVals(1)) > XTickSpacing) & (abs(ax.XTick - newVals(2)) > XTickSpacing));
if newVals(1)==newVals(2)
    newLabel = newNames(1) + " = " + newNames(2);
    newVals = newVals(1);
else
    newLabel = newNames;
end
[xV,idx] = sort([newVals remXVals]);
allNames = [newLabel remXN'];
xN = allNames(idx);
xticks(ax,xV);
xticklabels(ax,xN);
end

% % Practice Problem Generating Functions

function AnalyzeResults(totProbs,errorCount,totAttempts,adjustCount,lastFive)
% AnalyzeResults provides feedback in the single problem type case
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

function [lastFive,errorCount] = Check1(myFunc,myVar,myAnswer,errorCount,lastFive)
% Check1 generates correct answers by differentiating and updates
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
    case 1 % Simple derivative
        syms f(x) g(x) x
        [f(x),prevFuncType] = GenFunDiff([1 3],x,[1 10],0);
        g(x) = GenFunDiff([1 5],x,[5 10],prevFuncType);
        myFun = diff(f(g(varChoice)),varChoice);
        % Display the integral problem
        disp("Calculate the integral:")
        displayFormula("F(varChoice) == int(myFun,varChoice)")
end
end

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
        f(t) = a*log(abs(b)*t+d);
        if (prevFuncType ~= 7)&&(prevFuncType ~= 11)
            disp("Remember that log(x) is the notation " + ...
                "for a natural logarithm of x in MATLAB. ")
        end
    case 8
        f(t) = a*exp(b*t+d);
        if prevFuncType ~= 8
            disp("Remember that exp(x) is the notation " + ...
                "for $e^x$ in MATLAB. ")
        end
    case 9
        f(t) = a*sin(b*t+d);
    case 10
        f(t) = a*cos(b*t+d);
    case 11
        f(t) = a*log(ceil(c/4)*t);
        if (prevFuncType ~= 7)&&(prevFuncType ~= 11)
            disp("Remember that log(x) is the notation " + ...
                "for a natural logarithm of x in MATLAB. ")
        end
    case 12
        f(t) = a*t^c;
    case 13
        f(t) = a*sin(b*t+d)*exp(b*t+d);
    case 14
        f(t) = a*cos(b*t+d)*exp(b*t+d);
end
myFunc = f(var);
end

function [lastFive,errorCount,totAttempts,adjustCount] = ResubmissionCheck(totAttempts,totProbs, ...
    adjustCount,myFun,varChoice,myAnswer,probType,errorCount,lastFive)
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
        if length(totProbs) > 1
            [lastFive,errorCount] = check(myFun,varChoice,myAnswer,probType,errorCount,lastFive);
        else
            [lastFive,errorCount] = Check1(myFun,varChoice,myAnswer,errorCount,lastFive);
        end
    end
else
    [lastFive,errorCount] = Check1(myFun,varChoice,myAnswer,errorCount,lastFive);
end
end
%[text] **Exercise 1 Solutions**
%[text] a. $\\displaystyle \\int 15\\sin(3x^5)x^4\\; dx${"altText":"integral of 15sin(3x^5)x^4 dx"} where $g(x) = 3x^5${"altText":"g(x) = 3x^5"}
function Check1a(gp,fsub,newMeasure,soln)
syms C x g dx dg
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
syms t u du dt a b
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
        decimalAns = vpa(correctAns);
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
syms C x r q dq dr
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
syms t w g u dg du dw a b
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
%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[text:image:1e5f]
%   data: {"align":"baseline","height":109,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK0AAABtCAYAAADTR+H3AAAXZklEQVR42u2d+5NVxZ3A7zl3gGFePIaXA3ecgMKMjKjhJV5gfYCCyYgY0PEBaBTBiMNmMaC7wmAslN0lIYpavgJbFdeksCKJlf1lrcTUbu1Wpcotdrcqla3aVUzt4zfhT+g9nz70cObOOfd0n8e9d6C7qovh3vPo7vO53\/Ptb3+\/3y4IW2wZZ6Vgh8AWC+0VUM6dOyf27t1rB8JCO37KqVOnRKFQENsHBxq2jRcuXJDVQmuLLEO7HhK77nBEf3exIcE9e\/as6O6aLj799FMLrS1+WbOiV\/zkO4744lVXgnvPxltTSTXgygqwHx57Wb4F+ksFMTw8bKG1xS8dbc3it4dc8dW77gi4S\/p6EoGLVOxomyQrf6dRB5D6pRlNsm37Bxxx6Pm9FlpbLg6aJ8kAVlUJrifZlvSWjMDl2CXX9Yj9g1Nl5e8k4MvrePfmx0NbaBPQHtz3qIXWFv9V3v+1tlHQqjp4i2ME7tDubaJ8fav46pc9svI3n5lKau7JvYNtQX1Zu+oGC60tPrTlhYVQaE3A5TodbRPE2XfnjUDL33ymq99K1aJ14hhgqR8\/60G7crGF1hYhjh8\/HgpJsAJ1nI67pK8kjjw+fQRYVfmM73SBff2x8LYA7ZqlPRZaW4QYfuGA1BerQasmZ1HmsB8ee0X0z28eA6yqfMcxSYFV0HZfNdVCa4uQk5s4aKuBi\/TtaG8WHx+ZEwkt33FMmKTWAVZVJowWWlvEM09s0YJWgVua4UrpPCKpDz43avIVVTmGY8PMYzrAWmhtGSnMyJmZ60BDxWba0VIUJ999Q54fJ2UrpW2lWStOn7bQ2hIKLfqiLjhKv+SV\/v3Df15Vlw3TbU++92YiYC20tqSClnrkAUfMnu692odmaEPLsSw4cM+NN5rf00JrSypo\/2HYFa3NrjawqrZNdsXCrksrXRZaC23NoN21vigGb28zhpZzvn1b0fh+FtrLtPzff38htm1eJmfp+MjqrEQlhRbz10+en2UMLedwbl7Q0mf6zhjsfGCFHBMLbYOXvu4J4tCOmaLc3yz6F7TLB82KFD4AZ86cyQTas0d9gEyBVZVzuUYW0NIn+kYfpQuj12f6\/rNDc8eNZL7iocWs9PtTJXH+V72jzE27Bjq82XurfJADG1aNAJwEWkxkgJEUWs41MbNVQkvb6YOE1OsTfQua3ei79HsImNgstA1c1qxcNPIAg+AGnVjwB8D8hB\/tddfMEu\/tNANo\/6Ym6XqYFFrpuuhdw1S6T2l1ZZtpO30IOucEgVU\/VMbCQjsOyrbBu0cBFQZuUAIzMUJibVnVpP3KLve6ifTZoF7LNXRhHVzdJNtIW6stZAT7yhgwFlcEtOfPnxenT58WBw4cEOvWrRPTpk2TAzZ\/\/nz5\/yeffFK8\/fbb4vPPP2\/IAcBra+PKlsiHGVaRWAre\/ZuK4o8nYqDta9JaBav2Y+Ea1e5BG2iLgjVMqlbrI2PAWFzW0ALr0aNHRyCNq0uXLm3IAWA9vzR7cuxDjYL3lsWTpH\/Br\/+iftByb9pQ9toSB2tU3zpam1KF+zQ8tJ999pmUpDqwqorE1S1IZaR0sJqcbzwZI+brR12JwFU+sB0tjvjbPcWaQ8s9uXeYb64usPSdMcijINyyfpaFJMDqStdgRSrrFjpWef4nn3ySq14b9dB1wZUPvsUV+waKNYOWe3HPsB+cSV\/oe576LM8+DQ+poEUCJgHWBLqwDqIv51kwCVVzZDEBt79n4hhw84CWe3CvtMAqx5wwm3SWBfWw8rkiAHOHNkwCqgrMABeEE8iZpPE64DWR5EeBGlITe21bdX1QF9wvPuiWMB3eWgxYD4rpoe29dD2uzT24V1pg\/bi0SbmPL4BmNc\/RhhYYq02ydKBM8qMA+iSTK5UAI1irxWxtf3CTNLonffhhqoLScTFBpbXTco1LOqybiYSl0mf6XouC8MpCTdCGduvWrZESNgtgw34UQFyt7NixI7RNpVnNYnX\/1DGVGXLlsQT\/kTHmzltXiPaWYmoIRjlxexOk373kiv33uLE\/iDiwuAbX4pq6UlunrXiRLVm8QK70UYnMIKSISoYaqvrRp7UuwEnlm5T\/m5pDC7o3i5Ky2GDz0nni9GAZb+W92pIscapwGJZkqYTQTG1ztfxddcFFQvZ3+\/fo75mQGFrOldfwrqUrsXXaSF\/nzbg0BmocgpWcZUQXl\/uapTDguWBpWLPsGrHt\/g0ylCjuLRY3ZzG1JmhByys6CtospCzgm0pZVT768H35ukzib1pZn9vkiK7OYmZQ+MBNFHs3+n4AujpopY7MuVyDa2XZNvqqG29WueoG4Di2E03Rf\/VE39Fo0VyZnK+at1yYtKWaSNtC0l+HCVh5SNlR+ujgQCLP\/rA6d7qrHV2gA4ev3zqid56b2DVxYZevFujosbrASinb6WYyZsHoDJ4dro55SlstaKOsBmlsbdV0WdNZJa8mUlsyaGkHHlWjNLOYycw86Mi9ui+5E\/iKa\/XONbFw8HZKqlZFxsEFAjjjrERp3tqpoM1Cnw2bUSa5rp8PYEIiB+0wBxeTiZOOr4LUBT1paaIicGxLsy+9TH0J4iZ2ug44OhUVgzbqAFttYq8rBLWgTbtgYDrBS6onM2j82lUazqT1939tNkvXgQZJ2VsqGgc29syOl7ImwCqrBn2sF7BR8yRdm3xdoc1iJllZhp56bFTKy6TV1B6q49Y4tdURc2cUta83d+YE0dnharsXmtqPswCW0PikCaHDJmQ6q2R1hTZsApaFysHELAtw39rpg2vySq8GUVdnk7SL6khbjpna0VwVchNglR5Ln7IENo3tNkw11Fmyrxu0WasGlYWshabJLcKqWuPPAlx0yQ3r\/0RcXyqI0882i\/94dZI4d+KSTwF\/8xnfccza8k2RurUpsGE+EUkr45oW2DQqQkEX0CS1mkkszDabpc9t0qwsUeBmoSq8sqNN\/OsPpoo\/vt4k3vAk1d03OeLOJY7o7iyIm68piD\/d6Ijtax35HcecPTZFHNnWkolKkCWwjGsWvrdRgitORagbtFmtQ9cK3Lee8ME1mUiNwPWLbvGfr08W515zxYNeW6a0FGR9fpMjXh50xIF7HPHwakfs3ehDrMaDYzmHc7mGKbC0lUkXbU\/b\/5G9JQxT9CexTMVxUDdow5zI8\/CZzRJcIgSAgNAUbTvuma+JLz2p+fPvOuKui0ACLKB++1Yf1JcHC2JogyPef9oHmmN2r3PEtjWOKHlSmM+5BtfSVQdoI22tFlFhkkSPyAjmClnvTRY2Gccc1nDQ5q3PJgUXacISZVRVsVgbv+5L3dhogY\/mif95syiOPeKIF7c44nvf9FUBOeHwoN33DUdsXuGIx2\/zVYVV1\/rfKXXh6IOOhJfvUBn+17sW14yPovDaeJM7ErtWrU9xk1U54Wopyq2e8ihJ9NpCmLiurNVcEsOOVzVqJhi2Cpa332wYuEiQIw8Wpa+qMv4TZ0WegVHV+wynFelBNsOH9onb\/KVZVs+iVIbPT0yQsH33bl8FAFwmWFxHgYh68KwHL2ADKN\/x+X3LvfM8KXx00JfIh+5zxLs7HXnNKFWAtrDk++Qdfhtpq8x14LU9ql\/0mWMYgyMPuKO2mpITrrZJuW6il2R1rC7Wg7BXQlZ+DHHg9i64StzQ44qZU1xpfsJwzwPXCQhUExukmXr9zu10Rc8sV0o3Zvpqsvabl1pk0jngpA5\/yxE7b3fEnjv9\/9NndFpgfahcEI+UfaBRB1iOBuB7lxXE+usL4vtbfZ33xKOO+KcXXXlt1Rbu2e71Y9Hcopg\/pziivtBG3YkjfWcMGAvGhOuRM2HF1\/tqslWpKVt1gbYWk7DKgrQgDkqFWKfJQ1Dp0AIkXHeeJ+lmd7bI1zvSCgiRpLzm99zlS1WARYryHROtnbcXpIpw10UrQnmRD+uPd\/mqw461jthysy+VmaRxHtfm2Dkz2sTVc3x3QdqQZZ9UiDxjlvd2paaTsbpAm2TGmAbWtbfcJLc6whdVV6Ka1mAuhH98Z0BCBlj8i4Tl76c9KfvCvT6EgCuhWOP\/n+8Wz\/MAXu7DyeeHvuUDz+fBseKa3EM3x0GaPjFmjB1jmBe8pn4IdYG2FpYDtrdHSihYk\/iyJo3n+re\/9NUCQMUagIRVk7EfeP8yyWJSBrioAfu8v9\/Z6U\/E0H2Bcl1\/QU7Q1PgoMxnSmWtzjzRxZ6Y+vQpexrTeFoS6QJvHknCwsJ0REwikUK1gDVoMvjzhjukfr3UlVTcvL0i1gIkV32FFQGflmGMPO95Eyp+48R1SlnM+\/p4rnlrv67XAKyeTH82rad8YS8aUyIVqW0blPcdpGGizSJuEBOA1Vpo1oWZSaEz9cI74uwOulJZISiUhlf1VSpGVPpRSAj\/sg\/iaVzEvASgSFyktLQh3O+Ktx33pjFRmUoak5R7cqx59ZGwZY8Y6C6lrGrlSc2ijTBxpi\/SnbW+uj3QN1g+mSQmKKgB0QMjyLOoApitg5RUPlFgGntngqwOv7vAXGpDCfM6CAv\/+zW4fbD4HcsDleOpXP+2sWz9HpK435mmXdMNMoHiANQy0UaHoacqpH78jbl82U3zw4kJx4e\/Lda3nT3dLMNFdmf1vvzj7R2ICK694TF0v3e+ID\/Y4Mi4NgKn8zWd8h2mMYzmHc7kG1+KaXJt7nP+wW1z4pFzX+v7wQrF8cac4efJkptBWY+KygLahJK0n\/ZQkRCoiHZGSSg0ISlG+R7oiZTmepVw+B2BgVUu9WBGQ1srqgBRHml\/OkvaKgHaUTjt7Ut11WvRO9E\/ARB\/90XZfYgIdUKK3AiT2WCwLhz0QT+12Rxxo0HsrLQdUrgHgdddpvTEe2Lg2E532ioZ2tPWgOVcbZjXrATN7AEOy8opn5o+UVPZWoMRCgPTFYoDlAAsC3yFB5YLDct9qwPlq6TdY62E9ULborK0HFtqA1CXdT63ttKwmKTstr\/jKfmJRwAaLtAReJC42Wmy1SGUkMZM2pDNqwAubfUmMBOaHgJSup52WMc3aTmuhDdF1a70i9otXbpFQBvuHlGV1C\/0U6cmq1+aLqgJqAoBjx+VYwGXSxeoZK2Ucw6pacJWtHitieSVdbnhoa+2WGIRX+R5kvU4\/4nswoyimtfuqAc7bvNaB842L9tcdF2f\/6LH4F+BnoPRbPh\/a4E\/A1EIEEhUJi9+CAp7vvnzNv8f09iYZrZtnnxizvDOEN7ydthYrYnHLu+hjpa7pMuFcWi8vPKuunuV7RlV6eeGRhV6LzsqkDMsAsKIG4MmFRxcQot\/i6YUagKlLuS7yNxIWDzHlLYbnWKWXFx5meJrhcZbWy4t+zJnmen0qivsG7qjJMxm3K2K1glaBi2\/tjT1FcecNrlji\/ds22fEgjvanxVc16E+Lz+pV0+L9aZlYqYWFg5t9H1le\/0p9QK8FVnxqAVzFjqmlX87lGHRhvovzpyWtE76+QX9aPq\/mTyv9iEP8aQmvIVrBQivyCx3Xtue2TZLZAE0iF\/5wbGzkQmy8mDe7J9pAgYiEZWLFJEtFMKAa8B1QoiJgRVB+BxwDtMouqxO54MeF+W1UkQu0PUnkQq3AHRdeXrV0TQwWsqBwrySZApPEiMkgxJ93yfguFhRQB9BVVYQCeimfs6hAnNiudb5EVpYCjsHPlvgyrsG1dAIbs4wRqwW448KfNkkwWxbAEuuUNNeXaTTuKLgqonFVn5mcoc+i8yoHGgWsckOsjMY1zYwoE3SkjMbNG9ywTDMNF7mQd86DykLi3zQ5vrLaRebQQ+3in4\/OHMl7wESL5VmlLmBpAFSV94BjOSevXXcaAdwoa1I1r7+6QBu2aURetloGOS2wWW3KwUz\/4QfuETcvmjiSYeYPxyeM3Iu\/VYYZjrlj7dKq2RtNNy\/JAlx+AAiBPG201Ty86gZtrSwIEtjJTmJgj20zy+UVBxG5vGZ1tmrn8mqd5IqumIR1pjlp6VPaHAi6eWjzUhXrBm3ek7G0wGa9iwxLrtPbXZkJUdfIT3r52dPil2uT7rqTBlyeVxYxY5lkmKkVtHlOxvbu2Z1KJTDNT6ubDZzVK9P8tL3zss0CnlV+WpU1EZt3mpJJLq9aQRul16Zdzs0isbJJJnDdjZ\/pG1m9TTOBs+ihkwncBNysMoFj606T2yssu0ycPltXaKNMHUk2u8sSWJM9F3QhMdk3Ie25unZc+pjFngvl3qbEFgUyECVJql1XaJM2Oi9gqSx9ZrmXmHod96XY3YZzs1ZXstrdxrcoFOXWWKYlLJWAjtCqK7RhKkKSHSDTrnQF9bTSzKbMgK3XPmK6bWSi91cPZbMjEEvjJmpCElNXQ0Ab9Wsz9UPAbjiwfqXovmrqxYRrk+W+Yuw4iDeV2o0wTgqzI2KclDUBtp47Nuq0lb5i0WCc+MGqcVIZIk2TLQ\/cVdZ+ZklT1zcEtFkno+PXjimGDdgOPb9XboW5duViuQeugjqqknwt611k6rk3rk6bcc9EJwU49ghmnAinMU3rKrce9c7X8b1Nu2tjfiEDBst4pmvPeRScnatJsTS7yLCDeGwu25x2IddZpavVLuRZmTvrDm1UJ9JuzWQqndHJosxKSTblOLy1GJhhF1PFc3Eu11DX49pZbV5Cn+l7LUvaXG4NAW0Wm\/ymKagS\/fObM5GwYWv85b6m9ND2NYX6RGQhcen7mTNnajLWaTbvbiho6+WuGFQNwl7fSVSCw\/c3jbVl5gCtlLjevbJQFeg7Y1AvKWsqnBoGWqRtrTYPqSxMIiofvAmw\/j4HTuSafl7QXtJxHSOdubJv8gfnjUE9BJOuxaAhoY1a1svTz5bCbLc0e3JiBxQZPzbDrRohkCe0KqKCNtCWpA4+jEGeUbdhKmASm3zDQUtJszt1knL8+HEZmmLqS6ByHOzfdCkWq17Qqtg12mKSCyHYV8aAsajlc026ZN9w0Eb9IvOalAX1WR33QgXrYNnVNsLjnJImJwHn6jq40CbapuDVdWvErJaXXhv2Bk0zX2k4aKOW+PLa\/WbNykXywVYzCQE1CdfaWyeJmVOKMveAyWrR\/k1NRitZYXZarmFyT+BlhxqyGtJ2+lDNpMcYMBa1EELMXdJ48zUktLUsPNR\/P7VglJ0VyYbRvX9+q7Rhbrt\/vTQJSVXiRifR2jx5BpJCi66axCNLhTDRdvpAX+gTfaOPQTvvf\/30WjkW46Fc8dC2tzaJY091SqhKc1rlg17SVxJDu7eNsV0ODw\/LdXpTeJB6MtNhQmilP20Cf4CwuDv6RN\/oo0zk4fWZviPN713dbqFt9PIvv\/uN+LOdGyWMPMy42fOh\/bsSQUslfVJS18SFXcnCY3SCRekzfWcMvvPoBjkmFtrLqBzc92hiaB9Zk9wJfPMKNzdox2Ox0NYI2p8NuaK12TWGtnWyK17c6lhoLbS1hVaFXS\/o7jQObOQcGcb+qoXWQlsjaIN5Ak6+92akY06UIwvOPPi7kt3FQmuhzR1aGT812ZEh7UETm87qmHQiD5igiHolOsDkx4LTu4XWQqsNbVTuq+GDz4ny9a3xtlnvGI5VBZ9fwA1LURpWCZshCsFCa6HVgrZasjbpcB4jbZWUrQwUlLl1WydqBXBKaJddY6G10MZDq5NdkPT51XRb9p1F\/w0ruuAC7dpVN1hor\/QSt7hgkg6TFakwH1g+47tqRQdc2vnME1sstFd6qbaMy8THJH8rEcNsdRR0YvHjtSZoJXaLA5d2Eo1sobXQhkKrzFpDTz1mdL2hpx8fNSnjbz7TLdXAxbEHc5mF9govrNGXFxbGZg9MmK9VWgSuu+h66FX+Nk3mFgVuua85k1ScFtpxXoAgCC1SF2DSRLKq3XZkCHvCcJcwcFlYyHo7UAvteIV2cZuccAHvkkVzM4mr4hpprxMEFzfGWgQqWmjHCbSlWc3SF4AJV6NJMgVuf6kgU0FZaG2RkE5pb8lsv4G8wO3u6rxsLQcW2gQlbbr2Wv248t6E2UJriy0WWlsstLbYYqG1xZbk5f8BQ+p9qz1qETkAAAAASUVORK5CYII=","width":173}
%---
%[text:image:7220]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:7339]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:04f1]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[control:button:8ad3]
%   data: {"label":"Clear Variables","run":"Section"}
%---
%[control:editfield:85f7]
%   data: {"defaultValue":" x","label":"g'(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:823e]
%   data: {"defaultValue":"dx","label":"dg = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:8ada]
%   data: {"defaultValue":" g","label":"f(g) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:2239]
%   data: {"defaultValue":" x","label":"F(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:762c]
%   data: {"label":"Check the Solution to Exercise 1","run":"Section"}
%---
%[text:image:4385]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[control:editfield:3df0]
%   data: {"defaultValue":" t","label":"u'(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:167e]
%   data: {"defaultValue":"1","label":"u(1) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:5d63]
%   data: {"defaultValue":"3","label":"u(3) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:7d6a]
%   data: {"defaultValue":"dt","label":"du = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:45a7]
%   data: {"defaultValue":" u","label":"f(u) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:96d0]
%   data: {"defaultValue":" 0","label":"F(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:463b]
%   data: {"label":"Check the Solution to Exercise 2","run":"Section"}
%---
%[control:editfield:6548]
%   data: {"defaultValue":" r","label":"q'(r) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:75fb]
%   data: {"defaultValue":"dr","label":"dq = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:111b]
%   data: {"defaultValue":" q","label":"f(q) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:00d1]
%   data: {"defaultValue":" r","label":"Solution = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:16a8]
%   data: {"label":"Check the Solution to Exercise 3","run":"Section"}
%---
%[control:editfield:830d]
%   data: {"defaultValue":" w","label":"g'(w) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:9094]
%   data: {"defaultValue":"-1","label":"g(-1) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:3cdb]
%   data: {"defaultValue":"2","label":"g(2) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:4114]
%   data: {"defaultValue":"dw","label":"dg = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:4bb6]
%   data: {"defaultValue":" g","label":"f(g) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:6b89]
%   data: {"defaultValue":"-1","label":"Lower bound = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:6a2c]
%   data: {"defaultValue":"2","label":"Upper bound = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:8b8d]
%   data: {"defaultValue":"dw","label":"du = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:3a7f]
%   data: {"defaultValue":" u","label":"f(u) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:1551]
%   data: {"defaultValue":" 0","label":"Solution = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:7cb2]
%   data: {"label":"Check the Solution to Exercise 4","run":"Section"}
%---
%[control:editfield:58fc]
%   data: {"defaultValue":"sin(x)","label":"f(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:6c92]
%   data: {"defaultValue":"log(x+0.001)","label":"g(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:2702]
%   data: {"defaultValue":-3.4,"label":"a = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:4d3f]
%   data: {"defaultValue":2.1,"label":"b = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:dropdown:038e]
%   data: {"defaultValue":"1;","itemLabels":["x","g"],"items":["1;","0;"],"label":"Choose independent variable: ","run":"Section"}
%---
%[control:button:6510]
%   data: {"label":"Create Graph","run":"Section"}
%---
%[text:image:2e44]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:slider:0d86]
%   data: {"defaultValue":0.75,"label":"Step size","max":1.05,"min":-1.05,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:2e2a]
%   data: {"defaultValue":1.1,"defaultVariable":"ua","label":"Initial point x_0 = ","max":6.9,"maxLinkedVariable":"b","min":-1.2,"minLinkedVariable":"a","run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:button:9062]
%   data: {"label":"Update Graph","run":"Section"}
%---
%[control:dropdown:8a50]
%   data: {"defaultValue":"\"xdx\"","itemLabels":["x0 and x0+step","g(x0) and g(x0)+step","g(x0) and g(x0+step)"],"items":["\"xdx\"","\"gdx\"","\"gdg\""],"label":"Choose a graph:","run":"Section"}
%---
%[text:image:7577]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:editfield:7657]
%   data: {"defaultValue":"sin(x)","label":"f(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:9db7]
%   data: {"defaultValue":"1\/(1+x^2)","label":"g(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:button:5106]
%   data: {"label":"Create Graph","run":"Section"}
%---
%[control:slider:00ed]
%   data: {"defaultValue":-1.2,"label":"a = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:95b7]
%   data: {"defaultValue":6.9,"label":"b = ","max":15,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:6bf3]
%   data: {"defaultValue":73,"label":"Slider","max":100,"min":1,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:checkbox:5053]
%   data: {"defaultValue":false,"label":"Animate adding intervals? ","run":"Section"}
%---
%[control:button:5cad]
%   data: {"label":"Show Plot","run":"Section"}
%---
%[text:image:6b54]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:checkbox:0658]
%   data: {"defaultValue":false,"label":"Toggle between plots of x and g","run":"Section"}
%---
%[control:button:245d]
%   data: {"label":"Show Plot","run":"Section"}
%---
%[control:editfield:2495]
%   data: {"defaultValue":"sin(x)","label":"f(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:6a37]
%   data: {"defaultValue":"x^2","label":"g(x) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:83f4]
%   data: {"label":"Create Graph","run":"Section"}
%---
%[control:slider:3e74]
%   data: {"defaultValue":-1.2,"label":"a = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:365d]
%   data: {"defaultValue":6.9,"label":"b = ","max":15,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:9076]
%   data: {"defaultValue":73,"label":"Slider","max":100,"min":1,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:checkbox:5436]
%   data: {"defaultValue":true,"label":"Animate adding intervals? ","run":"Section"}
%---
%[control:button:37e1]
%   data: {"label":"Draw Plot","run":"Section"}
%---
%[text:image:697e]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:checkbox:0e96]
%   data: {"defaultValue":false,"label":"Toggle between plots of x and g","run":"Section"}
%---
%[control:button:24f1]
%   data: {"label":"Show Plot","run":"Section"}
%---
%[text:image:2b47]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[text:image:4da4]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:0e6b]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[text:image:7f02]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
