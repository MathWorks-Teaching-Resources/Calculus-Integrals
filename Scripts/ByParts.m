%[text] %[text:anchor:T_361B34F4] # Integration by Parts
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] Integration by parts is an extremely powerful method of integration that will only come into full focus once you apply it to solving differential equations. For the moment, however, it will allow you to solve some integrals that substitution is no help with. 
%[text]{"align":"center"} ![An area u(b)\*v(b)-u(a)\*v(a) represented as the difference of two overlapping rectangles is divided into two parts by a curve. The upper area is the integral along the curve u(v)\*dv while the lower area is the integral along the curve v(u)\*du](text:image:96f3)
%[text] Integration by parts allows you to subdivide your integrand into integrated and differentiated components and recombine those pieces in ways that can be easier to compute.
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:70e2) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:2417) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning symbol](text:image:4d13)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if run out of order.
%[text] %[text:anchor:H_8C1C330D] ## Integration by Parts Geometrically
%[text] Consider the relationship given by the product rule for derivatives:
%[text]{"align":"center"} %[text:anchor:M_9CAEE30F] $\\frac{d}{dt}\\left\[u(t)\\cdot v(t)\\right\] = u(t)\\cdot \\frac{dv}{dt} + \\frac{du}{dt}\\cdot v(t).\\;\\;\\;\\;\\;\\;\\; (\\star)${"altText":"d\/dt \[u(t) \* v(t)\] = u(t) \* dv\/dt + du\/dt \* v(t). (star)"}
%[text] By applying the [Fundamental Theorem of Calculus](file:./FundamentalTheorem.m) and linearity, we can see that
%[text]{"align":"center"} $\\int\_a^b \\frac{d}{dt}\\left\[u(t)\\cdot v(t)\\right\] \\; dt = \\int\_a^b u(t)\\cdot \\frac{dv}{dt} \\; dt + \\int\_a^b \\frac{du}{dt}\\cdot v(t)\\; dt \\;\\;\\;\\;\\;\\;\\; (1)${"altText":"integral from a to b of d\/dt \[u(t) \* v(t)\] dt = integral from a to b of u(t) \* dv\/dt dt + integral from a to b of du\/dt \* v(t) dt (1)"} 
%[text]{"align":"center"} $u(b)v(b)-u(a)v(a) = \\int\_{a}^{b}u(t)\\cdot\\frac{dv}{dt}\\;dt + \\int\_{a}^{b}v(t)\\cdot \\frac{du}{dt}\\;dt \\;\\;\\;\\;\\;\\;\\; (2)${"altText":"u(b)v(b)-u(a)v(a) = integral from a to b of u(t) \* dv\/dt dt + integral from a to b of v(t) \* du\/dt dt (2)"} 
%[text] To understand the geometry, we are going to look at, let's express equation (2) in a slightly different way. Notice that 
%[text]{"align":"center"} $\\frac{dv}{dt}\\; dt = \\lim\_{dt \\to 0} \\frac{v(t+dt)-v(t)}{dt}\\cdot dt = \\lim\_{dt \\to 0} v(t+dt)-v(t) = dv,${"altText":"dv\/dt dt = limit as dt -\> 0 of (v(t+dt)-v(t))\/dt \* dt = limit as dt -\> 0 of v(t+dt)-v(t) = dv,"}
%[text] where $dv${"altText":"dv"} is the change in the value of $v${"altText":"v"} as that change approaches $0${"altText":"0"}! If we also note that, where the functions are invertible, we can write $u(v)${"altText":"u(v)"} and $v(u)${"altText":"v(u)"}, this means we could say:
%[text]{"align":"center"} $u(b)v(b)-u(a)v(a) = \\int\_{v(a)}^{v(b)}u(v)\\;dv + \\int\_{u(a)}^{u(b)}v(u)\\; du \\;\\;\\;\\;\\;\\;\\; (3)${"altText":"u(b)v(b)-u(a)v(a) = integral from v(a) to v(b) of u(v) dv + integral from u(a) to u(b) of v(u) du (3)"}
%[text]{"align":"center"} ![An area u(b)\*v(b)-u(a)\*v(a) represented as the difference of two overlapping rectangles is divided into two parts by a curve. The upper area is the integral along the curve u(v)\*dv while the lower area is the integral along the curve v(u)\*du](text:image:0515)
%[text] The left-hand side of equation $(3)${"altText":"(3)"} is the difference of the two rectangles while the right-hand side of equation $(3)${"altText":"(3)"} subdivides the same region into a sum of two pieces divided by the curve $(u,v)${"altText":"(u,v)"}. Practically, expressing $u${"altText":"u"} as a function of $v${"altText":"v"} or vice versa may be complex algebraically, but is straightforward geometrically using the parametrization in terms of $t${"altText":"t"}:
figure
syms t
u(t) = t^2; %[control:editfield:7022]{"position":[8,11]}
v(t) = 1-cos(t); %[control:editfield:2a36]{"position":[8,16]}
  %[control:button:5896]{"position":[1,2]}
tl = tiledlayout(1,2); %#ok<NASGU> 
tVals = -5:.01:5;
uVals = u(tVals);
vVals = v(tVals);
nexttile
plot(uVals,vVals)
title("Plotting $v$ against $u$","Interpreter","latex")
xlabel("$u(t)$","Interpreter","latex")
ylabel("$v(t)$","Interpreter","latex")
axis square
nexttile
plot(vVals,uVals)
title("Plotting $u$ against $v$","Interpreter","latex")
xlabel("$v(t)$","Interpreter","latex")
ylabel("$u(t)$","Interpreter","latex")
axis square
% Add layout title
% title(tl,"Thinking in Curves: Two Rotations/Reflections of $u$ and $v$","Interpreter","latex")
% subtitle(tl,"$t \in [-5,5]$","Interpreter","latex")
%%
%[text] In many cases, including with $u(t) = t^2${"altText":"u(t) = t^2"} and $v(t) = 1-\\cos(t)${"altText":"v(t) = 1-cos(t)"}, one or more of the resulting plots are not functions. A sufficient restriction of the domain, however, will result in a functional relationship for any sufficiently nice parametrized functions $u(t)${"altText":"u(t)"} and $v(t)${"altText":"v(t)"}. 
%[text] ![](text:image:642b) **Try**. Can you restrict the domain from $t=a${"altText":"t=a"} to $t=b${"altText":"t=b"} such that both $u(v)${"altText":"u(v)"} and $v(u)${"altText":"v(u)"} are $1:1${"altText":"1:1"} functions over that domain?
figure
syms t
u(t) = t^2; %[control:editfield:4afb]{"position":[8,11]}
v(t) = 1-cos(t); %[control:editfield:681d]{"position":[8,16]}
a = -5; %[control:slider:67c7]{"position":[5,7]}
b = 5; %[control:slider:2b50]{"position":[5,6]}
  %[control:button:8ade]{"position":[1,2]}
tl = tiledlayout(1,2);
if a < b
    tVals = a:.01:b;
else
    warning("You should choose a < b.")
    tVals = b:.01:a;
end
uVals = u(tVals);
vVals = v(tVals);
nexttile
plot(uVals,vVals)
title("Plotting $v$ as a function of $u$","Interpreter","latex")
xlabel("$u(t)$","Interpreter","latex")
ylabel("$v(t)$","Interpreter","latex")
axis square
nexttile
plot(vVals,uVals)
title("Plotting $u$ as a function of $v$","Interpreter","latex")
xlabel("$v(t)$","Interpreter","latex")
ylabel("$u(t)$","Interpreter","latex")
axis square
% Add layout title
% title(tl,"Thinking in Curves: Two Rotations/Reflections of $u$ and $v$","Interpreter","latex")
% subtitle(tl,"$t \in ["+a+","+b+"]$","Interpreter","latex")
%%
%[text] ![](text:image:978a) **Try**.
figure
syms t
u(t) = t^2; %[control:editfield:6cfb]{"position":[8,11]}
v(t) = 1-cos(t); %[control:editfield:7fad]{"position":[8,16]}
a = 1; %[control:slider:4a41]{"position":[5,6]}
b = 3; %[control:slider:08af]{"position":[5,6]}
  %[control:button:4fc8]{"position":[1,2]}
if a>b
    disp("This code requires that b>a. Your endpoints have been reversed.")
    ar = b;
    br = a;
else
    ar = a;
    br = b;
end
tVals = ar:.01:br;
numSteps = length(tVals);
uVals = u(tVals);
vVals = v(tVals);
z = zeros(size(tVals));
p = plot(uVals,vVals);
ax = p.Parent;
title("Geometric Integration by Parts")
hold on
xlabel("u(t)")
ylabel("v(t)")
v0 = double(v(0));
u0 = double(u(0));
[hx,hy,dUPosRegions,dUNegRegions,dULines] = PlotRegions(vVals,uVals,v0,["r" "b"],"h");
[vx,vy,dVPosRegions,dVNegRegions,dVLines] = PlotRegions(uVals,vVals,u0,["r" "b"],"v");
rectGrp = DrawRectangles(ax,uVals,vVals,u0,v0);
surface([uVals;uVals],[vVals;vVals],[z;z],[tVals;tVals],...
    "FaceColor","none","EdgeColor","interp","LineWidth",2)
hold off
SetXTicks(ax,double([u(ar) u(br)]),["u(a)" "u(b)"])
SetYTicks(ax,double([v(ar) v(br)]),["v(a)" "v(b)"])
%%
showPosdUReg = true; showNegdUReg = true; %[control:checkbox:7dcd]{"position":[16,20]} %[control:checkbox:665f]{"position":[37,41]}
showPosdVReg = false; showNegdVReg = false; %[control:checkbox:92e1]{"position":[16,21]} %[control:checkbox:412a]{"position":[38,43]}
showRectSubs = true; hideVertStripes = false;    hideHorizStripes = true; %[control:checkbox:2f4b]{"position":[16,20]} %[control:checkbox:2b56]{"position":[40,45]} %[control:checkbox:43a9]{"position":[69,73]}
if showPosdUReg
    dUPosRegions.Visible = "on";
else
    dUPosRegions.Visible = "off"; %#ok<*UNRCH> 
end
if showNegdUReg
    dUNegRegions.Visible = "on";
else
    dUNegRegions.Visible = "off";
end
if showPosdVReg
    dVPosRegions.Visible = "on";
else
    dVPosRegions.Visible = "off";
end
if showNegdVReg
    dVNegRegions.Visible = "on";
else
    dVNegRegions.Visible = "off";
end
if hideVertStripes
    dULines.Visible = "off";
else
    dULines.Visible = "on";
end
if hideHorizStripes 
    dVLines.Visible = "off";
else
    dVLines.Visible = "on";
end
if showRectSubs
    rectGrp.Visible = "on";
else
    rectGrp.Visible = "off";
end
%%
%[text] ![](text:image:3d51) **Try**.
%[text] 1. What if you keep the default values of $u(t) = t${"altText":"u(t) = t"} and $v(t) = 1-\\cos(t)${"altText":"v(t) = 1-cos(t)"} but change the domain of integration from $a = 0${"altText":"a = 0"} to $b=3${"altText":"b=3"} to be $a=0${"altText":"a=0"} to $b=5${"altText":"b=5"}?
%[text] 2. What if you use $u(t) = t^2${"altText":"u(t) = t^2"} and $v(t) = \\sin^2(t)${"altText":"v(t) = sin^2(t)"} with $a=0${"altText":"a=0"} to $b=3${"altText":"b=3"}?
%[text] 3. What if you use $u(t) = e^t${"altText":"u(t) = e^t"} and $v(t) = t${"altText":"v(t) = t"} with any values of $a${"altText":"a"} and $b${"altText":"b"}?
%[text] 4. What if you use $u(t) = e^t${"altText":"u(t) = e^t"} and $v(t) = t^2${"altText":"v(t) = t^2"} with $a=0${"altText":"a=0"} and $b=5${"altText":"b=5"}? Or $a=-3${"altText":"a=-3"} and $b=3${"altText":"b=3"}? \
%[text] %[text:anchor:H_16EDCB9D] ## Integration by Parts Algebraically
%[text] Starting with the product rule for derivatives in [equation $(\\star)${"altText":"(star)"}](internal:M_9CAEE30F) and reordering the parts, we have:
%[text]{"align":"center"} $u(t)\\cdot \\frac{dv}{dt} = \\frac{d}{dt}\\left\[u(t)\\cdot v(t)\\right\] - \\frac{du}{dt}\\cdot v(t) .${"altText":"u(t) \* dv\/dt = d\/dt \[u(t) \* v(t)\] - du\/dt \* v(t) ."}
%[text] Integrating, this becomes
%[text]{"align":"center"} $\\int u(t)\\cdot \\frac{dv}{dt}\\; dt = \\int \\frac{d}{dt}\\left\[u(t)\\cdot v(t)\\right\] - \\frac{du}{dt}\\cdot v(t)\\; dt${"altText":"integral of u(t) \* dv\/dt dt = integral of d\/dt \[u(t) \* v(t)\] - du\/dt \* v(t) dt"}
%[text]{"align":"center"} $\\int u(t)\\cdot \\frac{dv}{dt}\\; dt = \\int \\frac{d}{dt}\\left\[u(t)\\cdot v(t)\\right\]\\; dt - \\int v(t) \\frac{du}{dt}\\; dt${"altText":"integral of u(t) \* dv\/dt dt = integral of d\/dt \[u(t) \* v(t)\] dt - integral of v(t) du\/dt dt"}
%[text]{"align":"center"} $\\int u(t)\\cdot \\frac{dv}{dt}\\; dt = u(t)\\cdot v(t) - \\int v(t) \\frac{du}{dt}\\; dt \\;\\;\\;\\;\\;\\;\\; (\\diamond)${"altText":"integral of u(t) \* dv\/dt dt = u(t) \* v(t) - integral of v(t) du\/dt dt (diamond)"}
%[text] This is frequently shortened to $\\int u\\; dv = uv-\\int v\\; du${"altText":"integral of u dv = uv- integral of v du"}. This is important because it lets us replace components we may not know how to integrate (like $u(t)${"altText":"u(t)"}) with terms that may be easier to work with (like $\\frac{du}{dt}${"altText":"du\/dt"}). This does require that the remaining part of the integrand, expressed here as $\\frac{dv}{dt}${"altText":"dv\/dt"} is an integrable function.
%[text] %[text:anchor:H_6D9E1B5A] ## Identifying integrable and differentiable components
%[text] %[text:anchor:H_457B1D5D] ### Powers and Logarithms
%[text] When there is a natural logarithm in an integrand that doesn't exist as part of a substitution, the only exact method available is to use integration by parts with the natural logarithm as $u${"altText":"u"} in equation $(\\diamond)${"altText":"(diamond)"}. 
%[text] %[text:anchor:H_8C898B6B] **Example:** $\\int t^{3/4}\\ln(t)\\; dt${"altText":"integral of t^(3\/4)ln(t) dt"}
%[text] Let $u(t) = \\ln(t)${"altText":"u(t) = ln(t)"} so then $\\frac{dv}{dt} = t^{3/4}${"altText":"dv\/dt = t^(3\/4)"}. This means that 
%[text]{"align":"center"} $\\frac{du}{dt} = \\frac{d}{dt}\\left\[\\ln(t)\\right\] = \\frac{1}{t}${"altText":"du\/dt = d\/dt \[ln(t)\] = 1\/t"} 
%[text] and 
%[text]{"align":"center"} $v(t) = \\int \\frac{dv}{dt}\\; dt = \\int t^{3/4}\\; dt = \\frac{4}{7}t^{7/4}.${"altText":"v(t) = integral of dv\/dt dt = integral of t^(3\/4) dt = 4\/7 t^(7\/4)."}
%[text] Putting all of these pieces together into equation $(\\diamond)${"altText":"(diamond)"}, we have
%[text]{"align":"center"} $\\int t^{3/4}\\ln(t)\\; dt = \\ln(t)\\cdot \\frac{4}{7}t^{7/4}-\\int \\frac{4}{7}t^{7/4}\\cdot \\frac{1}{t}\\; dt${"altText":"integral of t^(3\/4)ln(t) dt = ln(t) \* 4\/7 t^(7\/4)- integral of 4\/7 t^(7\/4) \* 1\/t dt"} 
%[text] which evaluates to 
%[text]{"align":"center"} $\\int t^{3/4}\\ln(t)\\; dt = \\frac{4}{7}t^{7/4}\\ln(t) - \\frac{4}{7}\\int t^{3/4}\\; dt${"altText":"integral of t^(3\/4)ln(t) dt = 4\/7 t^(7\/4)ln(t) - 4\/7 integral of t^(3\/4) dt"}
%[text]{"align":"center"}  $= \\frac{4}{7}t^{7/4}\\ln(t)-\\frac{16}{49}t^{7/4}+C${"altText":"= 4\/7 t^(7\/4)ln(t)- 16\/49 t^(7\/4)+C"}
%[text]{"align":"center"}  $= \\frac{4}{7}t^{7/4}\\left(\\ln(t)-\\frac{4}{7}\\right)+C${"altText":"= 4\/7 t^(7\/4)(ln(t)- 4\/7 )+C"}
%[text] %[text:anchor:H_1520D652] #### Practice
%[text] ![](text:image:200d) **Pro-tip**. MATLAB syntax is 7`*t^(2/3)` for $7t^{2/3}${"altText":"7t^(2\/3)"}. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators.
if ~exist("varOpts","var")
    syms t r x z C                       %#ok<NASGU> % Declare symbolic variables
    varOpts = [t r x z];                 % Define the list of variables to use in the problems
end
    [myFun,varChoice] = GenProbType(varOpts,3);  % genProbType is defined in Helper Functions
    % genProbType sets up a variable and generates a randomized function
    
                                   % Run this section %[control:button:57ce]{"position":[1,2]}
%%
myAnswer = r;     % User-defined solution, default value r %[control:editfield:5431]{"position":[12,13]}
assume(varChoice>0)
Check1(myFun,varChoice,myAnswer);
                          % Run this section %[control:button:68f5]{"position":[1,2]}
%%
%[text] %[text:anchor:H_9F2F742D] ### Polynomials and Cosines, Sines or Exponentials
%[text] If we integrate sines and/or cosines, we find cosines and/or sines. If we integrate exponentials, we find ourselves with multiples of the same exponential remaining. This means that if we choose $\\frac{dv}{dt}${"altText":"dv\/dt"} to involve sines, cosines or exponentials, the resulting $v${"altText":"v"} will not be any more difficult to integrate than the original, although it will not be any simpler either. However, if this repeatedly integrable term is multiplied by an $n^{\\text{th}}${"altText":"n-th"} degree polynomial, then with $n${"altText":"n"} applications of integration by parts the polynomial term will disappear leaving only the integrable function behind.
%[text] **Example:** $\\int (x^2-3x+7)\\cos(4x)\\; dx${"altText":"integral of (x^2-3x+7)cos(4x) dx"}
%[text] Apply equation $(\\diamond)${"altText":"(diamond)"} with  $\\frac{dv}{dx} = \\cos(4x)${"altText":"dv\/dx = cos(4x)"} and $u = x^2-3x+7${"altText":"u = x^2-3x+7"} so we have $v = -\\frac{1}{4}\\sin(4x)${"altText":"v = - 1\/4 sin(4x)"} and $\\frac{du}{dx} = 2x-3${"altText":"du\/dx = 2x-3"}. Recombining into the first integration by parts we have:
%[text]{"align":"center"} $\\int (x^2-3x+7)\\cos(4x)\\; dx = -\\frac{(x^2-3x+7)}{4}\\sin(4x)+\\frac{1}{4}\\int (2x-3)\\sin(4x)\\; dx${"altText":"integral of (x^2-3x+7)cos(4x) dx = - ((x^2-3x+7))\/4 sin(4x)+ 1\/4 integral of (2x-3)sin(4x) dx"}
%[text] Repeating this procedure, we have $\\frac{dv}{dx} = \\sin(4x)${"altText":"dv\/dx = sin(4x)"} and $u(x) = 2x-3${"altText":"u(x) = 2x-3"} so $v = -\\frac{1}{4}\\cos(4x)${"altText":"v = - 1\/4 cos(4x)"} and $\\frac{du}{dx} = 2${"altText":"du\/dx = 2"}. Recombining into equation $(\\diamond)${"altText":"(diamond)"} we have:
%[text]{"align":"center"} $\\int (x^2-3x+7)\\cos(4x)\\; dx = -\\frac{(x^2-3x+7)}{4}\\sin(4x)+\\frac{1}{4}\\left\[\\frac{(3-2x)}{4}\\cos(4x)+\\frac{1}{2}\\int\\cos(4x)\\; dx\\right\]${"altText":"integral of (x^2-3x+7)cos(4x) dx = - ((x^2-3x+7))\/4 sin(4x)+ 1\/4 \[ ((3-2x))\/4 cos(4x)+ 1\/2 integral of cos(4x) dx\]"}
%[text]{"align":"center"}  $= -\\frac{(x^2-3x+7)}{4}\\sin(4x)+\\frac{(3-2x)}{16}\\cos(4x)+\\frac{1}{32}\\sin(4x)+C${"altText":"= - ((x^2-3x+7))\/4 sin(4x)+ ((3-2x))\/16 cos(4x)+ 1\/32 sin(4x)+C"}
%[text] %[text:anchor:H_05348858] #### Practice
if ~exist("varOpts","var")
    syms t r x z C                       %#ok<NASGU> % Declare symbolic variables
    varOpts = [t r x z];                 % Define the list of variables to use in the problems
end
    [myFun,varChoice] = GenProbType(varOpts,2);  % genProbType is defined in Helper Functions
    % genProbType sets up a variable and generates a randomized function
    
                                   % Run this section %[control:button:2bfa]{"position":[1,2]}
%%
myAnswer = r;     % User-defined solution, default value r %[control:editfield:0908]{"position":[12,13]}
assume(varChoice>0)
Check1(myFun,varChoice,myAnswer);
                          % Run this section %[control:button:1ee8]{"position":[1,2]}
%[text] %[text:anchor:H_CAD4E67A] ### Cosines, Sines, and Exponentials
%[text] If you are trying to integrate a product of sines, cosines, or exponentials, then you can choose either component to be $u${"altText":"u"} or $v${"altText":"v"}, but you will need to pay close attention to the form of your integral at each step. These integrals are solved using both algebra and integration by parts.
%[text] **Example:** $\\int  \\cos(4t-3)e^{-7t}\\; dt${"altText":"integral of cos(4t-3)e^(-7t) dt"}
%[text] Let $u = \\cos(4t-3)${"altText":"u = cos(4t-3)"} and $\\frac{dv}{dt} = e^{-7t}${"altText":"dv\/dt = e^(-7t)"}. Then $\\frac{du}{dt} = -4\\sin(4t-3)${"altText":"du\/dt = -4sin(4t-3)"} and $v = -\\frac{1}{7}e^{-7t}${"altText":"v = - 1\/7 e^(-7t)"}. Thus,
%[text] $\\int \\cos(4t-3)e^{-7t}\\; dt = -\\frac{1}{7}\\cos(4t-3)e^{-7t}-\\frac{4}{7}\\int\\sin(4t-3)e^{-7t}\\; dt.${"altText":"integral of cos(4t-3)e^(-7t) dt = - 1\/7 cos(4t-3)e^(-7t)- 4\/7 integral of sin(4t-3)e^(-7t) dt."} 
%[text] Applying equation $(\\diamond)${"altText":"(diamond)"} again with $u = \\sin(4t-3)${"altText":"u = sin(4t-3)"} and $\\frac{dv}{dt} = e^{-7t}${"altText":"dv\/dt = e^(-7t)"} so $\\frac{du}{dt} = 4\\cos(4t-3)${"altText":"du\/dt = 4cos(4t-3)"} and $v = -\\frac{1}{7}e^{-7t}${"altText":"v = - 1\/7 e^(-7t)"} we have
%[text]{"align":"center"}  $\\int \\cos(4t-3)e^{-7t}\\; dt = -\\frac{1}{7}\\cos(4t-3)e^{-7t}-\\frac{4}{7}\\left\[-\\frac{1}{7}\\sin(4t-3)e^{-7t}+\\frac{4}{7}\\int \\cos(4t-3)e^{-7t}\\; dt\\right\]${"altText":"integral of cos(4t-3)e^(-7t) dt = - 1\/7 cos(4t-3)e^(-7t)- 4\/7 \[- 1\/7 sin(4t-3)e^(-7t)+ 4\/7 integral of cos(4t-3)e^(-7t) dt\]"}
%[text]{"align":"center"}  $\\int \\cos(4t-3)e^{-7t}\\; dt = -\\frac{1}{7}\\cos(4t-3)e^{-7t}+\\frac{4}{49}\\sin(4t-3)e^{-7t}-\\frac{16}{49}\\int \\cos(4t-3)e^{-7t}\\; dt${"altText":"integral of cos(4t-3)e^(-7t) dt = - 1\/7 cos(4t-3)e^(-7t)+ 4\/49 sin(4t-3)e^(-7t)- 16\/49 integral of cos(4t-3)e^(-7t) dt"} 
%[text] %[text:anchor:T_133CFB12] Observe that the original integral is now present on both sides of the equation. Combining them and simplifying, we have:
%[text]{"align":"center"} $\\int \\cos(4t-3)e^{-7t}\\; dt + \\frac{16}{49}\\int \\cos(4t-3)e^{-7t}\\; dt = -\\frac{1}{7}\\cos(4t-3)e^{-7t}+\\frac{4}{49}\\sin(4t-3)e^{-7t}${"altText":"integral of cos(4t-3)e^(-7t) dt + 16\/49 integral of cos(4t-3)e^(-7t) dt = - 1\/7 cos(4t-3)e^(-7t)+ 4\/49 sin(4t-3)e^(-7t)"} 
%[text]{"align":"center"} $\\frac{65}{49}\\int \\cos(4t-3)e^{-7t}\\; dt = -\\frac{1}{7}\\cos(4t-3)e^{-7t}+\\frac{4}{49}\\sin(4t-3)e^{-7t}${"altText":"65\/49 integral of cos(4t-3)e^(-7t) dt = - 1\/7 cos(4t-3)e^(-7t)+ 4\/49 sin(4t-3)e^(-7t)"} 
%[text]{"align":"center"} $\\int \\cos(4t-3)e^{-7t}\\; dt = -\\frac{7}{65}\\cos(4t-3)e^{-7t}+\\frac{4}{65}\\sin(4t-3)e^{-7t} + C${"altText":"integral of cos(4t-3)e^(-7t) dt = - 7\/65 cos(4t-3)e^(-7t)+ 4\/65 sin(4t-3)e^(-7t) + C"} 
%[text] %[text:anchor:H_4E671AC3] #### Practice
if ~exist("varOpts","var")
    syms t r x z C                       %#ok<NASGU> % Declare symbolic variables
    varOpts = [t r x z];                 % Define the list of variables to use in the problems
end
    [myFun,varChoice] = GenProbType(varOpts,4);  % genProbType is defined in Helper Functions
    % genProbType sets up a variable and generates a randomized function
    
                                   % Run this section %[control:button:240d]{"position":[1,2]}
%%
myAnswer = r;     % User-defined solution, default value r %[control:editfield:9377]{"position":[12,13]}
assume(varChoice>0)
Check1(myFun,varChoice,myAnswer);
                          % Run this section %[control:button:2391]{"position":[1,2]}
%%
%[text] %[text:anchor:H_89744528] ## Integration by Parts can generate surprising results
%[text] Unlike the other simple methods of integration, integration by parts is unique in that it can be applied to every integrable function. The trouble is that the resulting equivalent expression may or may not be helpful in determining the value. 
%[text] %[text:anchor:H_09AE4AAD] #### Stick to one choice
%[text] If you switch components between multiple applications of integration by parts you can prove true statements that are equivalent to $0=0${"altText":"0=0"}. If you do encounter this type of result, go back and check each of your choices for $u${"altText":"u"} and $\\frac{dv}{dx}${"altText":"dv\/dx"}. 
%[text] **Example** $\\int x^2e^x\\; dx${"altText":"integral of x^2e^x dx"}
%[text] Apply equation $(\\diamond)${"altText":"(diamond)"} with $u = x^2${"altText":"u = x^2"} and $\\frac{dv}{dx} = e^x${"altText":"dv\/dx = e^x"}. Then $\\frac{du}{dx} = 2x${"altText":"du\/dx = 2x"} and $v = e^x${"altText":"v = e^x"}, so
%[text] $\\int x^2e^x\\; dx = x^2e^x-2\\int xe^x\\; dx${"altText":"integral of x^2e^x dx = x^2e^x-2 integral of xe^x dx"}
%[text] We're not done, so apply equation $(\\diamond)${"altText":"(diamond)"} again with $u = e^x${"altText":"u = e^x"} and $\\frac{dv}{dx} = x${"altText":"dv\/dx = x"} so $\\frac{du}{dx} = e^x${"altText":"du\/dx = e^x"} and $v = \\frac{x^2}{2}${"altText":"v = (x^2)\/2"}. Plugging these values in we have
%[text] $\\int x^2e^x\\; dx = x^2e^x - 2\\left\[e^x\\left(\\frac{x^2}{2}\\right) - \\frac{1}{2}\\int x^2e^x\\; dx\\right\].${"altText":"integral of x^2e^x dx = x^2e^x - 2\[e^x( (x^2)\/2 ) - 1\/2 integral of x^2e^x dx\]."} Simplifying, this becomes 
%[text] $\\int x^2e^x\\; dx = x^2e^x-e^xx^2+\\int x^2e^x${"altText":"integral of x^2e^x dx = x^2e^x-e^xx^2+ integral of x^2e^x"} 
%[text] or in other words, $\\int x^2 e^x\\; dx = \\int x^2 e^x \\; dx${"altText":"integral of x^2 e^x dx = integral of x^2 e^x dx"} or $0=0${"altText":"0=0"}. True, but not satisfying if we're trying to determine the value of the integral. This will occur if you switch the portions of the integrand that are representing the $u${"altText":"u"} and $v${"altText":"v"} components in subsequent applications of equation $(\\diamond)${"altText":"(diamond)"}. 
%[text] %[text:anchor:H_05C187D5] #### Functions defined by their integrals
%[text] In other cases, the equations you discover by integration by parts can relate to more complicated functions defined in terms of integrals. You are unlikely to recognize these unless you are checking an integral calculator or know that you are in a domain where a particular special integral function is likely to occur. 
%[text] **Example** $\\int \\ln(x)\\sin(x)\\; dx${"altText":"integral of ln(x)sin(x) dx"}
%[text] Apply equation $(\\diamond)${"altText":"(diamond)"} with $u(x) = \\ln(x)${"altText":"u(x) = ln(x)"} and $\\frac{dv}{dx} = \\sin(x)${"altText":"dv\/dx = sin(x)"}. Then we have
%[text]{"align":"center"} $\\int \\ln(x)\\sin(x)\\; dx = -\\ln(x)\\cos(x)+\\int \\frac{\\cos(x)}{x}\\; dx.${"altText":"integral of ln(x)sin(x) dx = -ln(x)cos(x)+ integral of (cos(x))\/x dx."}
%[text] In fact, this is the best we can do with the tools available. For further details you can see the [MATLAB documentation on cosint](https://www.mathworks.com/help/symbolic/sym.cosint.html) or the Wikipedia page on [trigonometric integrals](https://en.wikipedia.org/wiki/Trigonometric_integral).
%[text] **Example** $\\int t^{-3/2}\\cos(t)\\; dt${"altText":"integral of t^(-3\/2)cos(t) dt"}
%[text] Apply equation $(\\diamond)${"altText":"(diamond)"} with $u = t^{-3/2}${"altText":"u = t^(-3\/2)"} and $\\frac{dv}{dt} = \\cos(t)${"altText":"dv\/dt = cos(t)"}. Then $\\frac{du}{dt} = -\\frac{3}{2}t^{-5/2}${"altText":"du\/dt = - 3\/2 t^(-5\/2)"} and $v(t)= \\int \\cos(t)\\; dt = \\sin(t)${"altText":"v(t)= integral of cos(t) dt = sin(t)"}. This gives us
%[text]{"align":"center"} $\\int t^{-3/2}\\cos(t)\\; dt = -\\frac{3}{2}t^{-5/2}\\sin(t) + \\int \\frac{3}{2}t^{-5/2}\\sin(t)\\; dt.${"altText":"integral of t^(-3\/2)cos(t) dt = - 3\/2 t^(-5\/2)sin(t) + integral of 3\/2 t^(-5\/2)sin(t) dt."}
%[text] This is true, but not actually helpful because the comprehensible solution in terms of a [Fresnel integral](https://www.mathworks.com/help/symbolic/sym.fresnelc.html) requires making the opposite choice with $\\frac{dv}{dt} = t^{-3/2}${"altText":"dv\/dt = t^(-3\/2)"} and $u = \\cos(t)${"altText":"u = cos(t)"}.
%%
%[text] %[text:anchor:H_B390829D] ## Practice Randomized Integration by Parts Integrals
%[text] ![](text:image:9e3b) **Pro-tip**. MATLAB syntax is 7`*t^(2/3)` for $7t^{2/3}${"altText":"7t^(2\/3)"}. The variable you use in the solution matters, as does appropriate use of parentheses and multiplication operators.
% Clear variables that may be reused in other parts of this module
clear errorCount totIPProbs totAttempts adjustcount lastFive myFun varChoice
syms t r x z C                       % Declare symbolic variables
varOpts = [t r x z];                 % Define the list of variables to use in the problems
errorCount = 0;                      % Initialize a count of errors
totIPProbs = 0;                    % Initialize a count of total problems attempted
totAttempts = 0;                     % Initialize a count of total solutions offered
adjustCount = 0;                     % Preserve the counts if the user resubmits a solution
lastFive = zeros(1,5);               % Initialize a matrix to record the last five solution results
  %[control:button:9e96]{"position":[1,2]}
disp("Values initialized for Integration by Parts Practice.")
%%
% Check if the previous section has run
% If not, provide warning. If so, generate a problem.
if ~exist("totIPProbs","var")
    warning("You must initialize values before you can generate a problem.")
else
    [myFun,varChoice] = GenProbType(varOpts,1);  % genProbType is defined in Helper Functions
    % genProbType sets up a variable and generates a randomized function
    totIPProbs = totIPProbs+1;     % Increase the count of total problems attempted
end
                                   % Run this section %[control:button:7ec6]{"position":[1,2]}
%%
myAnswer = r;     % User-defined solution, default value r %[control:editfield:82d5]{"position":[12,13]}
totAttempts = totAttempts + 1;       % Updates count of total attempts at solution
[lastFive,errorCount,totAttempts,adjustCount] = ResubmissionCheck(totAttempts,totIPProbs, ...
    adjustCount,myFun,varChoice,myAnswer,errorCount,lastFive);
% resubmissionCheck is defined in Helper Functions
% resubmissionCheck records the attempt and provides appropriate feedback
                          % Run this section %[control:button:3b10]{"position":[1,2]}
%%
%[text] Once you have completed sufficient practice, track the overall results of your practice here:
  %[control:button:0b8a]{"position":[1,2]}
AnalyzeResults(totIPProbs,errorCount,totAttempts,adjustCount,lastFive)
%%
%[text] %[text:anchor:H_760836CD] ### Practice App
%[text] You can practice in the Calculus Flashcards app. You can start the app by clicking on the image below. You should set the problem type to be "Integration by Parts" in the Integrals section. The app will open in a new window.
%[text]{"align":"center"} [![Calculus flashcards app screenshot of settings](text:image:2c40)](<matlab: CalculusFlashcardsApp>)
  %[control:button:59a5]{"position":[1,2]}
CalculusFlashcardsApp
%%
%[text] [⇦ Main Menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_31AB08EA] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:6e9f) at the top right of the Live Editor pane.
%[text] **Create visualizations of Integration by Parts**
%[text] Plot regions
function [x,y,posRegGroup,negRegGroup,LinesGroup] = PlotRegions(fVals,dVals,f0,cols,hvflag)
posRegGroup = hggroup;
negRegGroup = hggroup;
LinesGroup = hggroup;
regGrpChoice = [negRegGroup posRegGroup];
dU = double(dVals(2:end)-dVals(1:end-1));
posDU = dU >= 0;
posF = double(fVals(1:end-1))>=0;
fSignChange = posF(2:end)-posF(1:end-1);
fSignChangeIdx = find(fSignChange~=0);
dUSignChange = (posDU(2:end)-posDU(1:end-1));
dUSignChangeIdx =  find(dUSignChange~=0);
dUSignChangeIdx = [1 (dUSignChangeIdx + 1) length(dVals)];
scIdx = unique(sort([dUSignChangeIdx fSignChangeIdx]),"sorted");
scVal = (posDU(scIdx(1:end-1))==posF(scIdx(1:end-1)))+1;
alphaVal = 1/(length(scIdx)-1);
for k = 1:length(scIdx)-1
    xU = dVals(scIdx(k):scIdx(k+1)-1);
    x = double([xU flip(xU)]);
    yV = fVals(scIdx(k):scIdx(k+1)-1);
    y = double([f0*ones(size(yV)) flip(yV)]);
    if hvflag == "h"
        patch(x,y,cols(scVal(k)),"FaceAlpha",alphaVal,"Parent",regGrpChoice(scVal(k)));
        LinesGroup = AddStripes(x,y,"v",10,LinesGroup);
    else
        patch(y,x,cols(scVal(k)),"FaceAlpha",alphaVal,"Parent",regGrpChoice(scVal(k)));
        LinesGroup = AddStripes(x,y,"h",10,LinesGroup);
    end
end
end
%[text] Add stripes
function lineGroup = AddStripes(x,y,hvflag,step,lineGroup)
    % x and y are the same length, so this is just determining the bin
    % index value based on the relative sizes of the number of rectangles
    % length(x)/2 and step
    idx = DefStripes(length(x)/2,step);
    if length(idx)>1
        if hvflag == "v"       
            try
                p = plot([x(idx(1)) x(idx(1))],[y(idx(1)) y(end-idx(1))],"Parent",lineGroup,SeriesIndex="none");
            catch
                p = plot([x(idx(1)) x(idx(1))],[y(idx(1)) y(end-idx(1))],"k","Parent",lineGroup);
            end
            for k = 2:length(idx)
                copyobj(p,lineGroup)
                lineGroup.Children(k).XData = [x(idx(k)) x(idx(k))];
                lineGroup.Children(k).YData = [y(idx(k)) y(end-idx(k))];
            end
            drawnow
        else
            try
                p = plot([x(idx(1)) x(end-idx(1))],[y(idx(1)) y(idx(1))],"Parent",lineGroup,SeriesIndex="none");
            catch
                p = plot([x(idx(1)) x(end-idx(1))],[y(idx(1)) y(idx(1))],"k","Parent",lineGroup);
            end
            for k = 2:length(idx)
                copyobj(p,lineGroup)
                lineGroup.Children(k).XData = [y(idx(k)) y(end-idx(k))];
                lineGroup.Children(k).YData = [x(idx(k)) x(idx(k))];
            end
            drawnow
        end
    end
end

function idx = DefStripes(numRect,step)
    numBins = floor(numRect/step);
    if numRect > step
         rem = mod(numRect,step);
         if (rem == 0) && (numBins > 0)
             idx = 0:step:numRect;
             idx(1) = 1;
         elseif numBins >= rem
             intro = 1:(step+1):floor(rem/2)*(step+1);
             middle = floor(rem/2)*(step+1):step:(numRect-(step+1)*ceil(rem/2));
             last = (numRect-(step+1)*ceil(rem/2)):step+1:numRect;
             idx = [intro middle(2:end-1) last];
         else
            idx = 1:(ceil(rem/numBins)+step):numRect;
            if idx(end) ~= numRect
                idx = [idx numRect];
            end
         end
    else
        idx = unique([1 numRect]);
    end
end
%[text] Draw rectangles
function rectObj = DrawRectangles(ax,uVals,vVals,u0,v0)
rectObj = hggroup;
ua = double(uVals(1));
ub = double(uVals(end));
va = double(vVals(1));
vb = double(vVals(end));
col = colormap;
fgcol = round(ax.Parent.Color); % main figure color pinned to white/black
bkcol = round(ax.GridColor); % accent color pinned to black/white
if (ua>u0)~=(va>v0)
    fCol = fgcol;
else
    fCol = bkcol;
end
if (ub>u0)~=(vb>v0)
    lCol = col(3,:); % 3rd accent color, generally yellow
else
    lCol = bkcol;
end
rectangle("Position",[min(u0,ua) min(v0,va) abs(ua-u0) abs(va-v0)],...
    "FaceColor",fCol,"EdgeColor",bkcol,"LineWidth",2,"Parent",rectObj);
rectangle("Position",[min(u0,ub) min(v0,vb) abs(ub-u0) abs(vb-v0)],...
    "FaceColor","none","LineWidth",3,"Parent",rectObj,"EdgeColor",lCol);
end

%[text] **Generate randomized functions for integral practice**
%[text] Generate randomized functions
function [myFunc,type] = GenFunDiff(bds,var,range)
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
        f(t) = a*t^c*sin(b*t+d);
    case 2
        f(t) = a*t^c*cos(b*t+d);
    case 3
        f(t) = a*t^c*exp(b*t+d);
    case 4
        f(t) = a*t^b*log(c*t);
    case 5 
        f(t) = sin(b*t+d)*cos(c*t+a);
    case 6
        f(t) = a*sin(b*t+d)*exp(b/c*t+c*d);
    case 7
        f(t) = a*cos(b*t+d)*exp(b/c*t+c*d);
end
myFunc = f(var);
end
%[text] Print the problem that has been created
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
syms f(x) x 
switch probType
    case 1 % By parts derivative, general
        [f(x),~] = GenFunDiff([1 3],x,[1 7]);
    case 2 % By parts, poly * cos/sin/exp
        [f(x),~] = GenFunDiff([1 3],x,[1 3]);
    case 3 % By parts, poly * log
        [f(x),~] = GenFunDiff([1 3],x,[4 4]);
    case 4 % By parts, cos/sin * cos/sin/exp
        [f(x),~] = GenFunDiff([1 3],x,[5 7]);
end
myFun = f(varChoice);
% Display the integral problem
disp("Calculate the integral:")
displayFormula("F(varChoice) == int(myFun,varChoice)")
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
%[text] Check solutions
function [lastFive,errorCount] = Check1(myFunc,myVar,myAnswer,varargin)
% check1 generates correct answers by differentiating and updates
%        errorCount and lastFive
%
% Inputs: myFunc is the symbolic function to differentiate or integrate
%         myVar is the independent variable
%         myAnswer is the symbolic test function or number
% Optional Inputs:
%         errorCount is an integer tracking total incorrect attempts
%         lastFive is a vector tracking the last five attempts
% Output: correctAnswer is a symbolic function that is the
%         solution to probType applied to myFunc(myVar) with bds
syms C
correctAnswer = int(myFunc,myVar)+C;
if ~isempty(varargin)
    errorCount = varargin{1};
    lastFive = varargin{2};
    lastFive(1:4) = lastFive(2:5);
else
    errorCount = 0;
    lastFive = zeros([1 5]);
end
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
%[text] Analyze results
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
%[text] **Add endpoint labels to axes**
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

function SetYTicks(ax,newVals,newNames)
TickSpacing = .5*(ax.YTick(2)-ax.YTick(1));
remYVals = ax.YTick((abs(ax.YTick - newVals(1)) > TickSpacing) & (abs(ax.YTick - newVals(2)) > TickSpacing));
starYN = string(cell2mat(pad(ax.YTickLabel)));
remYN = starYN((abs(ax.YTick - newVals(1)) > TickSpacing) & (abs(ax.YTick - newVals(2)) > TickSpacing));
if newVals(1)==newVals(2)
    newLabel = newNames(1) + " = " + newNames(2);
    newVals = newVals(1);
else
    newLabel = newNames;
end
[yV,idx] = sort([newVals remYVals]);
allNames = [newLabel remYN'];
yN = allNames(idx);
yticks(ax,yV);
yticklabels(ax,yN);
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":40}
%---
%[text:image:96f3]
%   data: {"align":"baseline","height":422,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgQAAAGmCAYAAAADPpzuAAAv2klEQVR42u3dX6hd55nfcTODxz7jzHg0QTgXQz1VOQ6dwPE0aicwhDoJ8gSGNoYwCjOFOmUKSlxodDNUhMC4d9LVyFCI0UVxfeVWEAncCxVEY4ovNCGiuoiJphcnLm0cxWCkm8SKFCe7frbyqkvrvGvvvdZea+\/15\/ODLzraZ6+199lnn\/1+1\/s+7\/s+NJvNHqrgrz7kf6+AiIiIDDwPLeA\/eXlEREQIASEQEREhBIRARESEEBACERERQkAIRERECAEhEBERIQSEQEREhBAQAhEREUJACERERAgBIRARESEEhEBERIQQEAIRERFCQAhEREQIASEQEREhBIRARESEEBACERERQkAIRERECEFnQnDmzJk5kcuXL88eeuihOavm5s2b8+PPnz\/vNyYiIjJEIYiGPBr\/EIGmQlA8z9WrV\/3WREREhiQEcWV\/6NCh2fHjx+\/f1lQI0rmOHTvmtyYiIjIkIchd1TcVglxvg4iIiAxACOKK\/ujRow\/cto4QRC9BHFfscRAREZEeC0Fq+FMxYRtCEAkZiGNDDkRERGRDQhCV\/akBr2qEU1d+sTegqnu\/LARx\/tTIp3OcO3eu8gkbNhAREdlSD8GRI0fmjXBVQ537fhT\/5XoBikJQFIm4fzpPcOLEiVo9DyIiItKxEJw6dWreCOcq\/KNgML4X9QLFHoRo5KOBXyQEcUz5Sj+kIn0\/JyD7+\/vz78VzEhERkQ0KQWqEg\/i6mCQL5Sv6KoEo9xDkEueK7+eEYtG5RUREpEMhiKQhgHIjnrr5ywsGrSIEVTUJqdchJyCEQEREZItCkLryi4WDqeEuTy1cVQgWPrFf3SdXPEgIREREtiQEaaXA4lV76trPjfV3LQRtr0XwxhtvAAAwGLYmBEUBSAV9IQjlYsKUVWYZVKU4ZFB1fNuzDNLjAQCwbR59+PCcx3f+YPbEbz8z58mP\/tmcddbyaU0IUkMddQNpfYKq6YFJHsqyUBSCqmmMaTpirhcgPe6itQoIAQBgKI19NPIf\/9gLs73f++s5\/\/Sp\/7yQXghBJBURph6Aqt0HU6Ne3rJ42bTDdFzVcEGa1dD2rofepACANhv8dGVfp7FfhTh3L4Sg2GDniglT0lTFcg9CEoIQiiQVuYWJFi2CVDUdsU0h+P3f\/8zgeOyxTwzyeQcPP7w7+93f\/aTn7rl77T33wTz3jx3+J7MnDv3xA1f46zT0f\/KP\/uucL3z627M\/+dR\/mfOpvRdnH\/97X549\/Q\/\/dN6jkGSgF0KQNhhapds+GvroBcgJQapDCMEoikAME1QtS5yGLLpYpbAsBC++OBsce3sXBvm803Mf6vP33D1\/z33cz\/3UX\/1kdvKFd2dfef4Hsy99\/jv3GuwPG+6mjX2c4\/kvfm9+vjhvsOjx\/\/AP\/9XsM5\/5zIF2autCUCdpqmJb4\/2pLiG3NgEhAACsQ67hr9vo5xr8OO86z2sUQpB6CaIHYN3dCbvsHSAEADC9xr\/pFX+62o9j\/\/LP\/27pFf66jEYIUkNeNRthlYRMtCUWhAAApt34N7nib+tqf9JCMJQQAgCYZuNfvOLfZsNPCAgBAKCFMf+mV\/19\/zkJASEAAKxx9T\/Exp8QEAIAQAsCMPTGnxAQAgAgADUEIF39x\/S+MTX+hIAQAMBkawBWFYAxXv0TAkIAAJMWgX\/xz\/8nASAEhAAApjoUcPyz3yQAhIAQAMCUJCDG96uGAj73iW9NpgaAEBACAJhkPcCiZYBTT0CfFv4hBISAEABAS0MBy2YDGAogBIQAAEYoAYtmBRTrAbxmhIAQAMDEJEA9ACEgBAAw0m7\/Ype\/14sQEAIAGBmpAJAEEAJCQAgATLA3ILr1q2YBpG5\/rxUhIASEAMDExv+N\/RMCQjBhIXjllTdmb7zx4n3i\/\/7ogPGJwKIhgfgeCSAEhGCiQnD69K3Z228\/k\/113779+FwO4j7+AIHxDQmYCkgICAEhuE+VDBS5devJ2csvX+vk8V96aX92\/vz5+\/+Px7t588jS4+KYONYHA9CsQFBdACEgBITgPpcunV0qA8Xegral4MyZm\/PG\/803T9UWgjgm7hfn8OEArN4bYEiAEBACQnBgqCAa+VzDf+XKybksXLv25Qfu07YUpEa9eNuqQhCUZQKYKt\/4+h29AYSAEBCCZkRtQPnXG8MH5XqB+H8IQlEK2qopeP\/9Q7PLl880FoKQgTiHXgJMfbZAuUdAbwAhIASEYCXOnn37wK82egMWHfPaaxfv9xYsu+8qvP76ufm5zp272lgI4ti4f1kqgKkMDegNIASEYEtCsLd3Yc7Q30jFK\/5UNLjKVX8MFyQpCKnIFQhWNejpe++8c3T+\/7feOn7\/65wQRGO\/v39s\/nX0AsT9cz0BcY74ng8ITHnaYKwnoDdgOkQ7dPjws7OdnR1CQAjWo1w7cPHiK7ULEWPIIff9aJzj+6++evmB2+Mqvng1Hw19NPhVQpDqA2I2Qfwbt+eGB5I0+JDAFBcRSj0CUUPgtZqeEOzu7hICQwbNica\/XERY9xw3bjw9u379uYVDAVevnjjQcBcb9LhPriAwPa84T04oyudNsuBDAlObMWDtAEMGhgwIwVpEQ178lVZd6S8rSIwCxEXFgsWr9jRcUOzaXyQEVVf8cd7yMAMhwJTqAxQKghAQgs6GC5rMGIhhg6hDqPp+XMUXhw3S1X15AaK6QhC3lxt\/QoCxicDxz34zOywQ3\/c6gRAQglaIosA6MwuqSPseVH0\/RKDYvZ8b54+r\/baEQA0BxlgoaMYACAEh2Fj9QNMNjOK4ZcdG13401Gm4oNz4p8LBnBDkZh9UDRlUnQcYgggsKhT0GoEQEIKNLUa0zjoGy+6ThglSl355vYG0qFBVUWFxeCE3S2FZTwPQVxbNGFAoCEJACDZCcSOjRUWBbZB6BqLBzk0vTMMK5emJacggNfQhBqkmodw7UHUOYGgioFAQhIAQbE0I2lhtcBkhAotWEoyGv7yoUOpVCBFINQNpTYLyGgRxrOECDFUEzBgAISAEvZhh0GS6YdtULV+8CmnZ4vJ6BQARACEgBIRgCeuuP9AFMQxQVUS4iOgdsGQxiAAIASEgBCMRAmDsswaIAAgBISAEABHwGoEQEAJCAExxQSEiAEJACAgBMBERqNprgAiAEBCCwU07JAQAEQAhIASEYOHmRABWEwErC4IQEIJBUtz6uOuVCoGxTCGMht9eAyAEhGC0exkQAqDezAEiAEJACEYjBJcunb3\/q4xVC\/1RAcuHB5IIxPe8RiAEhGAUQhBbFrex2yEwlTqBmEJIBEAICMHohOD06VsP\/DpffvmaP6w1ia2gYyimTMiX12cYhAjk6gTMHAAhIASjFYLyWgQarXZ6XX7+80cP\/KmY1jkM\/vLP\/5c6ARACQjBNIbAWQftCcPv2IUIw8CECIgBCQAgmJwTXrn35\/q8zvvaHRQimXisQswnUCYAQEILJCYGph4RgyjJQrhX40uf\/1msDQkAIpikEZhoQAr0ChghACAgBIZjPLDDTgBCYSmiIAISAEExcCMozDV577aI\/LkIwmZUGTSUEISAEhOBFMw0IgeEBgBAQAkLwYn6mgcJCQjAW4uq\/XDRoBgEIASEgBAuwpwEh0CsAEAJCQAgOzDSI5Xf9gRGCIZIrGiQCIASEoHMh2Nu7MEdh4WoNZW6N\/zry0cY5mhKPUX78+H\/5sVcVguiVaetniZkhuXNNqUBU0SCmTLRDhw8\/O9vZ2SEEhKDdwsIrV052ugBSItb8r7N\/QhvnqMvFi6\/M3nvvqV8Npxz68PEeKQyv3Gv44\/txvzpC8L3v\/UX2ZwlRqPscc+f6xS9+\/f5zMjwATEMIdnd3CYEhg\/UJCeiysDDXmEfDua4Q1D1HnavuaOhzGxXliPv98Iefml+VryIE8Zzv3v3NA\/eLx6z7XO\/e3TlwnrgtdrOcYq+AokEYMiAEhGDNK+EuVywckhDEa7GqCBT54IPfmN2585GVawh++tPD2XPUGTYIAcmJRfQa6BUACAEhIARrr1jYdiM7FCG4t33xI5Vv+WJjH\/e7e\/exUoP+8IdS8FsrCUHcFgJQFoI6wwa54YI4x1hXnNQrABACQrABYsph+tU2GcseuhBEF3vuajs19N\/\/\/hfnV+SpKz6u5KM34Sc\/eSLbbb9MCOL43H2j52Cd4YKbN49MYgaBXgGAEBCCDRQWtr0V8hCEIK62y1fsaTx+WcV+HBuFfHWEIPjRjz7Z+Ao\/nlO5NyJ6LNqWOb0CACEgBBMTgmKDe+vWk5MSgrhazw0VxG2rnj+koKr2oEoIooehfJUfQrDKTI\/oscg91piKCfUKAISAEGyBLhco6rsQfPe7X82O59cpzrs35LBTSwjimJxErDJskDsuJGHo78OvPP+DB5YcJgEAISAEGyYap64WKOq7EOQq\/ptIUXH65qorFeYKA2O2wqJhg1zPQtQ\/DHkxoqrZA4YGAEJACLZADBV0sUBRn4Wgarjgxz\/eq32uVdchWLYmQTyfRa\/\/\/v6xtYoR+ygDegUAQkAIekRXOx\/2WQja3H+g6blyPRTvv\/\/RlXpy0vDGEPdLqOoVsOQwQAgIwZYp7nzY5gJFfRaCOG+5hyDO26T7vakQ5NYkiF6D3LBBbrhgiJtS5WYP6BUACAEh6AldLVDUdyFo67xNhaBq2CJX1JgbLojbzB4ACAEhIASdLVDUVjc0IVj+OubWJIiegGXDBbEWwVA2MlI4CBACQjAgigsUXb\/+HCHYkBBEo35woaEHZw7k77OjcBAgBISAEHS7QFH0FoxdCJrMDOhCCKrWJCgOG5SHC6LuINZQGOIQgcJBgBAQgp5TXqCojY1ycoV7scxuna7u4gyItmcZ5PYwaDLLYl25yK1JkHoAqmYX9Hkjo9wQQRQS+gAHCAEhGAjFX3Mb49NVV851rm5j056uFiaqeovXrdyPn6fuwkTL5OT27d+Zi8a92QUP7q743ntPGSIAQAgIwWbqCNrY6CiuYmP1vaaL6URDmdt4qC0hyFXu1+2Or+ryrzv8kFuTIHoOir+Te4sXPdrbYkKFgwAhIAQjobgeQVsbHeXmzq\/SqEVDG1sM596CbQlBXIHnhg1CClZdjyBmCeSmDtYVgtyaBFVLK\/dtI6PcEIFeAYAQEIIBU16PoI2Gp2p3vhCFqnHwuD26xXO9A21vf5wbkkgs2lI4hhXiOVZtbFRXCHJrEsT\/y7ML6my8ZIgAIASEgBA0privQRub5lR1+6cGL4QhegviftEARzd+1f27EII4T9UVfvRkRC9FNOxxvyCea5KcquOazlgor0lQPn8Mv7T1c7fB1776riECgBAQgrFSrOpva4GiZY18FM1FI18unqtqdNsUgtRdv+hKP55DPGbVc4yf7c6dx9YWgtx6A33dyOjeEsT\/3SwCgBAQgrESjVLbGx3F0EPVePgioiGO51PstehCCNLUvw8+eLj2cwwZiGNzBYp1hWBRgWKIyKIhjG0NExgiAAgBIRgp5XnvbZ03jblXNXjlrvoo9kuNfmxJ3LUQJBmKx142ZJFEIO6bGuncAkpNelhyaxL0aSOjogx87hPfmn3l+R\/4YAYIASEYKzduPD1rc4Gicvd8bPEb4+HRsEej+rOfPf6rrx+Z9yTEfYoFjWUh+OUvf62zq+VodKNRjiGEkJLiEEF8fe+2nfl9ig10Tgia9LBULZjUh42MzCQACAEhmJgQXLlycrZKpf26MxqiaDEa0lS0VyUfceWe7le8\/yZWb4yfPz1mfF31uHF7+Tk2XS+gfJ5gmysTmlYIEAJCMFEhiIa6zQWKMFxMKwQIASGYsBBEV3j6dcfwgT+8aRIbEZlWCBACQjBhISivR9C3lfFgGWIAhIAQbIjr15+7\/yvv02I4UC8AgBAQgg1SrJpva4EiqBcAQAhGIwR7exfmjP2NFr0C6VcevQX++KYnA4YIgP4S7dDhw8\/OdnZ2CAEh2NwCRW3tfAj1AgDaFYLd3V1CYMhgs4WF\/gDHKwPHP\/tN9QKAIQNCQAiqiZX2FBZOo3hQvQBACAgBIVipsLAvG+tA8SAAQkAINowVCxUPAiAEhIAQPDDToK2tkLE9YmdCxYMAISAEhKARXWyFjO3PJDBEABACQkAIGs80KG73i2EVD5pJABACQkAIzDSYuAwoHgQIASEgBGtz5crJmSWMx1E8GLsXem0AQkAICMHaUw9DDvwRmkkAgBAQggkKgZkGw5MBMwkAQkAICEGnQmBPg2FNK\/zS57\/jdQEIASEgBKYemlbodQEIASEgBB0JgamHZAAAISAEExWCGzeenpl6aFohAEJACCYuBMW1CGJ\/A3+I\/ZSBqCHw2gCEgBAQgs6IjY2sRdAvGfjCp79tJgFACAgBIdjeWgSEwBoDAAgBIZioEFy6dJYQkAEAhIAQTF0IimsREIL+yIDXBSAEhIAQEIKJyYAFhwAQAkJACCZMefVB0woBEAJC0JjTp28RAjIAgBAQgqkLwbqNeFEILl58xR\/iBrD6IABCQAhaJxrxdRry4rRDKxWSAQCEgBAMVAhi\/4Hbtx9vPHRw5crJmb0MNi8DliIGQAgIQSerDV6\/\/lyjY9PSxSEV\/gi7mUVABAAQAkKw0V6CuNqve1z61YdU+CPsXgZOvvCu1wYAISAE3dYS1C0MjF4FwwVkAAAhIAQjW4cgNfCr9BQkgVj1\/lhPBixDDIAQEIKNrklw48bTS4cAijIQ92\/6eC+9tD87f\/58Z\/cfIt\/4+h0yAIAQEIL+1BPEr\/PWrSfn0wpjOmGiuN1xyEDT2Qlnztyc3bx5ZPbmm6dqHfP++4dmly+fGe0f8b\/51\/+XDAAgBEMXgr29C3PGIAWpp6CKdWQgCBEIIah7XMhASEHIwRiHCtImRWQAQFOiHTp8+NnZzs4OISAE7RUapmmFRRFoY0XCplf6qZegTs\/CUGTgC5\/+NhkA0JoQ7O7uEgJDBv3m9dfPzd8u585dbXT8W28db9S7MAQZ+NwnvkUGABgyIATDJQr+4i2Qa6jT99555+j9Bj19XR4OiOOjByDY3z+WlYZ1haKvMmApYgCEgBCMgmjo423w6quXDzT0cXsaIohGPxr78vGpyDBmEsR9QxpCDEIoiveL88f5hj7joCwDMVQQswx8mAEgBIRgFEMBV6+eeOD2aPyLhYBxn1VqAFLDn7vvqucYkgwYKgBACAjBaIiGvzhskIYLovegTmMeMhA9AFXDEEMWAjIAgBAQgtETvQPFYYM0XFDs3q9qzKMmIHoTym+rMQmBVQgBEAJCMAlSN38aNogGvtyg56YNhgzE7VE3EEMPxYa\/SgiGtkARGQBACAjBpIhGPRrxNFxQbvzje+VGPhUklmcO5IQgDSUMqaiQDAAgBIRgcqRhghCBXCMft0dvQFkS4r7FGQVVNQTp\/GQAAAgBIegxqWcgrSVQNaxQnJ6YGvnoKQgRSEsb53oT4py58\/YVMgCAEBCCyZKKA6vG+aORL848SD0HaWGitChR\/L+4iFHcNqT6gbIMnHzhXe8PAISAEGDd1QarVjkkAwBACAjBgIsP6zTuuaEGMgAAhIAQgAygE6KOJRW4poLXVWpnhr6cNggBISAEaImvPP+DB2TAZkXNeeWVN2ZvvPHifeL\/m5olU1xqe1UhSFtzD219DBACQkAIQAZ6yenTt2Zvv\/1M9iPm9u3H53IQ9+nisXON+qpCkJMJgBAQAkxYBmxjvB5VMlDk1q0nZy+\/fK2z3oHcGhl1hGLIG2+BEBACQoCGxLoCZKAdLl06u1QGir0FbUtBFLmWp8PWEYI0Eya33DZACAgByABWHCqIRj7X8F+5cnIuC9euffmB+6wiBYv2wyjenta4KO6lURSCKBpMjX30AsTXxZU1151SCxACQoCB8jd\/83\/mtQJkoB2iNqD8kRLDB+V6gfh\/CEJRChbVFKwqBGmp7PK01iQEqfcgraQZUpCrF0jTY804ACEgBJhIz0BRBr70+e94Xdbg7Nm3D3ycRG\/AomNee+3i\/d6CRfddVQjS3hvl+yUhKNcFpOW2086e5XOrIwAhIAQgA6hJ8Yo\/FQ2uMpMghguSFIRUdCkEueGBtGU3IQAhIASEYIIy8IVPf\/uB6YVel\/Up1w5cvPhK7ULEGHLoUghy5676HiEAISAEIAOoSTT+5SLCuue4cePp2fXrz60lBFXbajcVAgsUgRAQAowU2xh3QzTkxY+Rqiv9ZQWJUYDYRlFhuRiw7pBB1XkAQkAIQAZQY7igySqEMWwQdQhVawuUG\/TUG1AWhdyVfRKC8u3pHFXFhn63IASEACOXAZsVtUcUBdaZWVBF2vegavXBNG0wTRmMRj5RvO\/+\/rE5ZSGIY6M3IGYUFKcdxu3laYe5cwCEgBBg4JT3JyAD3dYPNN3AKI5bdGySgGjEo7GORYNyQpDkobioULpf3BbHxjni\/yEHZRlIixupHwAhIAQYEdH4W4Vws4sRrbOOQVvPKbd88arEcblpiAAhIAQYKJYk3gzFjYyqigI3TdOiwLRCYXmlQ4AQEAIMWAYsSbx5IWhaPwCAEBACWIVw4BRnGDSZbgiAEPRSCPb2LszxZrTwEFZj3fUHABwk2qHDh5+d7ezsEAJCgDamF3pNCAEwZCHY3d0lBIYMYOEhQgAYMjBkQAhg4SFCABACQkAIYOEhQgAQAkJACFCjiNBaA\/2ZdkgIAEJACGCtAUJQuTkRAEJACLCR6YXWGtgexa2P+7JSIUAICAEhmKAMmF64XYp7GRACgBAQApheOFEuXTp7\/+MjVi30mgCEgBCADEyQ2LK4jd0OARACQgDTCwfM6dO3HvgIefnla14XgBAQApheOPW1CKLHwGsCEAJCALMJJoi1CABCQAiw0ZoBr0k\/uXbty\/c\/QuJrr0kzzp59ey5UZfS6EAJCQAjIgAJCUw8nVqD5858\/euBjWa8LISAEhEABoQJCMw0m9jrevn2IEIAQEALkCghDDrwu\/SZmFphpQAhACAgBWpUB+xMMf6bBa69d9JoQAhACQoBmfOPrd8woGDBmGhACEAJCgFb42lffNaNgwBRnGigsJAQgBIQAjfni5940o2DA2NOAEIAQEAKsTcwiMKNgXDMNYk6914UQgBAQAjQqJFREqLCQEBACEAJCMFEZSIWEf\/pH\/81rMqLCwitXTnpNCAEIASHAasRMglRIeOJfWm9g6IQEKCwkBCAEhAC1KC9NHNMOvS7D5uLFV2ZdrVgYRYu5df6b1CrEwkm5c3U1zBHPMRr78v4E5efeRAjK523yurRxDhACQoC1iggVEo57xcI2N+X53vf+4sDHVaz7H6LQxrl+8YtfnwtN24L03ntPze7NvDj04fN9ZPb\/Z2Lca\/jj++lxmwhBcR+J4utS57Vv4xwgBIQAjeoGiksTKyQcFzHlMH2cNGmsF13F3r37mwc+sqJBrXuuu3d3Dpwnbjt9+lZrYhTPK7dRUY643w9\/+Kl5D0UbQhDnWFcI6p4DhIAQoHERIRkYf2Fh21sh\/\/Snhw98ZH3wwW\/U6tqORjcnFtFr0FavwKoiUP457tz5CCEAISAE06sbCDHwmoyPYuNy69aTrZ87Gs5yQ1qnJyI3XBDnaGNDpnvbFz9S+fFabOzjfnfvPlZ6Hg9\/KAW\/RQhACAjBtIoIrUZogaImxXm5j63oOVhnuODmzSNrP7cYbsj1PKSG\/vvf\/+K8dyINS8TPEr0JP\/nJE9nnRAhACAiBIkIMmmjwulyg6Ec\/+mTjK\/x4LuUr8LhKb6PWIXoeyr0XqTZh2WsQx0ZRIyEAIeiREOztXZjjzdjNSoTqBqZBDBV0tUBRXFWXr6ijIV7lceIqPfext24xYVzt54YK4rZVG9WQgqraA0IwPaIdOnz42dnOzg4hIATjLCK0pfE06HLnw2i8cw3nKsMGueNCEtZ9Tt\/97leztQ11ChXvDTnsEAI8IAS7u7uEwJDBOOsGvCbToLjzYdsLFFUVBkaF\/qJhg1zPQoz5tzGkkZv90KR+orjSIyGAIQNCMBq+8vwPFBFOlC4XKKpakyC65xcNG+zvH1urGLHucMGPf7xX+1zWIQAhIASjXnxIEaEFirpYiz93Vf7++x9dqdAxdem38bza3H+grZUKCQEhIASEQBEherlA0fXrz3Wy3kF53D56DXLDBrnhgramRMbzKPcQRGPaZCiCEIAQEIJRUdzBUBGhBYruNS6Pt37+qq76XCFfbrggbmv751y3MSUEIASEQBEhRr9AURsrAa6yJkH0BCwbLoi1CNrayIgQgBAQAqgbwBKKHy1t7ySYhgIOLjT04MyB\/H12OukJIQQgBISADKgbwJI6grY3Olq0JkFx2KA8XBB1B7FuQFvPocnMAEIAQkAILD6Eya5H0PZGR4vWJEg9AFWzC9ocvqjalrnJgkxNpx2WayliOeY6PTLFhaQIASEgBIRA3QA6X49g3SWCV22Qb9\/+nXnjem92wYM7Cr733lOdDo2sM4shei7qLkxU1atQpxckNnciBISAEBCCtShvWmTxIZQp7mvQ9kZHi9YkiJ6D4pDFvcWLHu2kliE3i6Hu0ETV8McyIQjpilUamy66FI1+blMmQkAICIE3YeO6gViZ0OuCRd3RXSxQVLUmQdVywl30UoTo5IYN4jmtKkExYyI3jXKV1y23xsIq8hOvRWy\/nHtMQkAICIE3oboBtD4ToKuNjhatSRD\/L88uqLPZUF1y3e6JRdsrx3OPYYyqjY1WEYKqXRzjnFX1EnF7PG6ud4AQEAJCQAjUDaCTmQBdbnRUtSZBWRCiW73LBi7OXXWFH1frcSUeDXvcLwhRSg151XGrCkFVt386dzxOPF7cL+Qkhjiq7k8ICAEhIATqBtAZN248PetygaKq9Qba3sholaGLRVf60ThHQxuUix3TEMOdO4\/NmkxhXNbIx+NVPW5OSAgBISAE3oTqBtA6xW19F3Wfd7EmQWoMu3rc3DTIDz54eMnH7ENZGYhjcwWKqwhB\/PxVdROLCBkImSoWfxICQkAICIG6AXRCFNZ1uUDRojUJ2tzIqE5vRcjJsm75JAJx3yQsuUWCVi3GTPUIVWJUHsaIQsjU6Md2zYSAEBACQrAS\/+7f\/g91A2hc9Jc+YmL4oMtx\/Fy1f1sbGdX9mUNQYgghnlOxqz6+vnfbzvw+RVnJCUHdYsw4R2wFHXUT0bBH4\/+znz3+q68fmfckxH2KMy7KQvDLX\/7axnpVQAgIgboBTIhil3QXU\/+KjWGZruoW6ohKNK7p+cTXVVffcXv5+TddOyF+7uidSeeJc1e9FvEY5cfVQ0AICAHUDaB1rl9\/7v7HjIYGIASEYICoG0BbV+5dL1AEEAJCQAg6wnoDaLPbPH3MRG+B1wQgBIRgQEMFRRmIOgKvC9pYoKirnQ8BQkAICEHHdQPRU+B1QZuFhV4PgBAQggEQtQLqBtA2xd0HFRYChIAQ9JyYRaBuAF0XFprjDhACQqBuABNlUysWAoSAEBCCNWWgOMVQ3QC6nGnQ1VbIACEgBIRgTYpTDEMM\/EGiCzaxFTJACAgBIWiIpYmxjZkGm9xwCCAEhIAQrDBUYGlimGkAEAJCMGEhMKMAm+bKlZMzSxgDhKD3QrC3d2GOGQVA91MPQw68JsBBoh06fPjZ2c7ODiEgBGYUwEwDYOpCsLu7SwgMGZhRgPELgT0NAEMGhKBHQwVmFMDUQ4AQEIKJCYEZBeibEJh6CBACQrAFbFqEPnDjxtMzUw8BQkAItoQphujjWgSxv4HXBCAEhGALQwWmGGLbxMZG1iIACAEh2AKmGKKvaxEQAoAQEAJDBZgoly6dJQQAISAE25xiaKgAfVuLgBAAIxeC8+fPz86cOTO7efNm7WPjuIAQWI0QhAAgBAMWgqtXr86fdNNG\/fLly2sdTwisRghCABCCHgjBsWPHZkeOHGnUO1A8x6FDh9Y6x5SFIHoHjn\/2m1YjRCecPn2LEACEYDNX95vqJRijEJSHCqxGiC5mCbQlBBcvvuI1BcYoBMePH58\/4Tau7I8ePTrvJSAEzYcKrEaILohGfJ2GvDjt0EqFwEiFIJ5sSEEbid6BOF8UKBKCZrMKDBWgC2L\/gdu3H288dHDlysmZvQyAgQhBXJ3HA586dSp7gugBiKv3YoO9qJs\/vnfixIn75w2izmDRTIRNDBuMSQhsXIRNEqsNXr\/+XKNj09LFIRVeS6DnQnDu3Ln7jXYuue+nK\/poyMtJ8hDFgon0w4UkVElBOoYQGCpAP3sJ4mq\/7nHp4yakwmsJ9FwIooFOD55r4FOtQPHqPXoT4rb9\/f0D949ehHKjH\/9f1hMRwhH3IQSLiQWHrEaIbdQS1C0MjF4FwwXAwGoIoos\/Hjz+LTfk6YkVG\/901V8nqaehqtFvcs6pCcE3vn7ngaECqxFik6QGfpWegiQQq94fIAQ9EYI0hl+u9E+NeLl4cNXGO84b54jehSQdVccRguV87avvGirAVtckuHHj6aVDAEUZiPt77YCBzTKILvtypX8aLihX\/y9qvKNXodj45+iDEJw8+fbg+NLn\/9ZQAXpRTxAfIbduPTmfVhjTCRPF7Y5DBtZd2AggBFsQglQomIYNYoigqtiwqvGOpYxTUWGcJ3oIUj1B6oVYJARdrkWwSFCGwKMPH5798T\/4j4YK0AspSD0FVZABYMBCkAQgLTaUBCE3FbBqlkGuALE8LFH1Q256lsHQ+PjHXjBUgN4VGqZphUURsCIhMIKFiVKDHuP+aVZAbiZBqi0oDyUsmq2Qjsn9kKl4sVzUSAju8fjOH8xlIHoInnnm3\/sDAgBC0K0QpEY7DQlUrUSYdjksTyFMdQjlhj0EIQ0l5H7IEItNL0w0pKGCP\/r7\/2EuBE898QIhAABC0L0QRIoN96KlhKPxL9cXFHsB4nshFqmnYdEsg\/S9XG\/E1IXgyY\/+2f2ZBR\/9yD8mBJgE8dnz0kv7nd0fIAQrCEFadKhq5cLy\/aK3oHy1X1y2OHoZkljk1jRIEtJl\/cBQhSANFQTRSxC3EQKMncuXz8zef\/\/Q7MyZmysf8+abp2Y3bx6pdQxACFra3CgVIa477p96FeJfQpAfKghCDggBxk406CEDIQV1jw0hCDHwOoIQbFgIFvUSrJooJkxDC11nyEMFMcMg3U4IMIXegSbHhgzU7VkACEFLQpAa9EWbFi1Kqh1oKhRjFYLcUAEhwBR4552js7feOt7o2HPnrs4\/2pr0LgCEYEIZ0lDB3u\/99YGhAkKAoRIfN9Gdv+z21KC\/\/vq5A70Gcb+4+k\/HlO\/ThlAAhIAQDGKogBBg7EJwr\/j4odmrr14+UBtw9eqJ+fdDBKLRz4lDsL9\/LPtYACEgBIMSgugdKA4VxP8JAaYiBFEDELetWniYO+eq5wD6wt7ehdnhw8\/OdnZ2CAEhyA8VPPHbz2TvRwgwZSGItQaipyD1EhACjEUIdnd3CQEhODhUEGJQdT9CgKkJQUhA1AWkGoIihACGDAjBqIRglaECQoCxC0EUD5Yb85CBEIHoEYiagTSlMI6rEgI1BCAEhGCQQrDqUAEhwFSKCuPfdFv0DMRtMQOhXGiYE4K4nRCAEBCCQQpBCMAqQwWEAENeWyA+cop7DaTegHLjXV5HIDX8xWNTUWFOCOJ2qxWCEBCCwQlBnaECQoAhrz4YHzkhBnH1n7r1c1fzMW0wKB8bPQVxbFqTIFdUGNMVc9MWAUJACHovBMWhgigqXOUYQoAhkiQgruCjwY8hgJwQJAEoDhGUj01SUe45CGkwXABCQAgGJwTFoYLy8sSEAJYvrrfaYNUqhwAhIAS9FoLiTobxb3l5YkKAKZMrLlxGCIQli0EICMHghCCWJF60PDEhAABCQAhGLgSLdjIkBABACAjBBIRg2U6GhAAACAEhmIAQLNvJkBAAACEgBCMXgiZrDhACACAEhGBkQlBneWJCAACEgBCMUAjqLk9MCACAEBCCkQlBDA0c\/+w3G605QAgAgBAQghEIwbpTDAkBABACQjBwISiuRth0iiEhAABCQAgGLgRtTDEkBABACAjBgIWgPMWwzXMTAgAgBIRgIELQ1hRDQgAAhIAQDFQI2pxiSAgAgBAQggEKwTrbGhMCACAEhGAkQrDOtsaEAAAIASEYgRB0WUhICACAEBCCAQhBG9saEwIAIASEYOBC0HUhISEAAEJACHouBG1ta0wIAIAQEIIBC0GxkDBWJ+y6VoEQAAAhIAQ9E4IuNi8iBABACAjBgIRgk4WEhAAACAEh6KkQFAsJu1pzgBAAwLjZ27swO3z42dnOzg4hGKIQbLqQkBAAwLiFYHd3lxAMUQg2XUhICADAkAEh6JkQbKOQkBAAACEgBD0Sgm0VEhICACAEhKBHQrCtQkJCAACEgBD0RAi2WUhICACAEBCCngjBNgsJCQEAEAJC0AMh2HYhISEAAEJACLYsBH0oJCQEAEAICMGWhaAPhYSEAAAIASHYohD0pZCQEAAAISAEWxSCvhQSEgIAIASEYEtCUO4d6IMMEAIAIASEYMNC0KdCQkIAAISAEGxBCIqFhCEGfZEBQgAAhIAQbEgIYqgghgjSUEGfegcIAQAQAkKwISGI4sE+TTMkBABACAjBhoWgr4WEhAAACAEh2KAQFAsJo46AEAAACMHEhKBP+xUQAgAgBIRgC0LQt\/0KCAEAEAJCsAUh6Nt+BYQAAAgBIdiwEPRxvwJCAACEgBBsWAiK+xX0vXeAEAAAISAEHQjBEKYZEgIAIASEoGMhGMI0Q0IAAISAEHQoBEOZZkgIAIAQEIKOhGBI0wwJAQAQAkLQkRAMaZohIQAAQkAIOhCCoU0zJAQAQAgIQQdC0PfdDMcqBHt7F+Z47p67195z99wJwdaFYIjTDAmB504IvPaeOyEgBC0LwRCnGQIApgkh2IAQDLV3AABACAhBSzUEMcVwSNMMAQCEgBB0NO0QAABCMFEhEBERmXIIgYiIiBACERERIQQiIiJCCERERIQQiIiICCEQERERQiAiIiKEQERERAiBiIiIEAIREREhBCIiIkIIREREhBCIiIgIIRARERFCICIiIoRARERECIGIiIgQAhERESEEIiIiQghERESEEIiIiAghmFrOnz8\/O3PmzOzmzZu1j41j4tg4h4iIEAIZaK5evTp76KGH5o1608SxcY44l4iIEAIZYI4dOzY7cuRIo96BYi\/BoUOH5ucSEZHtJC7O0sXd5cuX5xdqQdNzEIIJJb1h1ukdKPcSxDlFRGTzMlD8DG4qBKu0C4RghDl+\/Pj8F79O70CxlyDOFecUEZHNJfXSFj9\/mwpBJHp743xVbQMhGGHabsDbFAwREanXO1Cs41pHCJb1EhCCnmbZL73q+4t+4fG9EydOzI4ePXr\/2KgzWDYTwbCBiMjmE1fz8Xldp21YljhfnJcQTEAIFjXe8SaI70W3USKdI94kVVLQZk2CiIg0v5pfVwhSG5GbUk4IRiYEp06dmt+2v79\/4Jh4A5Qb\/fh\/6jGIY3OJcy36voiI5JM+p6t6WKu+X3VxV\/7sj8\/1NKybLu7OnTtXWzQIwQiFIF3110m8edIbadGb2vRDEZHNCEHVZ3nxsz9JQ3x2p6nm6XsxPFz385wQTFQI4vgQgXhDxRtnWRcUIRAR2ZwQRCMfDfyiz\/4YBi4fly7wgqqegjhv7gKQEExICGJ4oNj45yAEIiLbF4Kqz9xyD0Eu6XM+JxSL2glCMBEhiGkrqagw3ixxfKonWKVIxVoEIiL9EoKqQvC0dH1VPRkhmIgQVBWipKKTqumIqzyWWQYiIv0RgqaPSwgGlrRCYNXmQqnhL\/9S0\/hReUrJojdHccwplzjXovEoEREZlhDk1iIgBD1Omg4Yv7xi11CxAS+\/KVJXUXmKYKo+LVeexpslDSVUvcHSVEa7HoqIbEYIVpllUJXikEHVY5plMLCkK\/NUHBK\/wCQJVT0EqfEvF5MUJaJ8rmWzDHLnExGR1S\/slg3XloUgfS6X6wSKx1T12qb2IVf3lXqfc9MSCUHPE7\/84oqC8XUaDqhqxKuu6OO44rLF8WYpn6tcgJJMU\/2AiEj9pM\/j6Iktfr4WC70XLUxUHv5dNu2weLGY65VIF5oWJppI0sqCixamWDXJUnOVqiIisvzzODX88W9x2fi4KEtflxvvqs\/xJATF8+QWJqrqPVj0mU4IRm6l64z76x0QEWlHCqLxT2IQDXj6XK0SgkhuI6IkBKlOLM5TFIF4nEUb0SUpyYUQjDQxTpRWo2qybXHa4yDOYdtjEZHNJ9V+tTXDa9n5CIGIiEhP09aFWbpIXLTiLCEQERHpadLQ7bo1Yal2YNEwMiEQERERQiAiIiKEQERERAiBiIiIEAIREREhBCIiIkIIREREZAUh+Ge\/koIp8JklrwUAAKPm\/wEXmCnc3ELyhwAAAABJRU5ErkJggg==","width":516}
%---
%[text:image:70e2]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:2417]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:4d13]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:0515]
%   data: {"align":"baseline","height":422,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgQAAAGmCAYAAAADPpzuAAAv2klEQVR42u3dX6hd55nfcTODxz7jzHg0QTgXQz1VOQ6dwPE0aicwhDoJ8gSGNoYwCjOFOmUKSlxodDNUhMC4d9LVyFCI0UVxfeVWEAncCxVEY4ovNCGiuoiJphcnLm0cxWCkm8SKFCe7frbyqkvrvGvvvdZea+\/15\/ODLzraZ6+199lnn\/1+1\/s+7\/s+NJvNHqrgrz7kf6+AiIiIDDwPLeA\/eXlEREQIASEQEREhBIRARESEEBACERERQkAIRERECAEhEBERIQSEQEREhBAQAhEREUJACERERAgBIRARESEEhEBERIQQEAIRERFCQAhEREQIASEQEREhBIRARESEEBACERERQkAIRERECEFnQnDmzJk5kcuXL88eeuihOavm5s2b8+PPnz\/vNyYiIjJEIYiGPBr\/EIGmQlA8z9WrV\/3WREREhiQEcWV\/6NCh2fHjx+\/f1lQI0rmOHTvmtyYiIjIkIchd1TcVglxvg4iIiAxACOKK\/ujRow\/cto4QRC9BHFfscRAREZEeC0Fq+FMxYRtCEAkZiGNDDkRERGRDQhCV\/akBr2qEU1d+sTegqnu\/LARx\/tTIp3OcO3eu8gkbNhAREdlSD8GRI0fmjXBVQ537fhT\/5XoBikJQFIm4fzpPcOLEiVo9DyIiItKxEJw6dWreCOcq\/KNgML4X9QLFHoRo5KOBXyQEcUz5Sj+kIn0\/JyD7+\/vz78VzEhERkQ0KQWqEg\/i6mCQL5Sv6KoEo9xDkEueK7+eEYtG5RUREpEMhiKQhgHIjnrr5ywsGrSIEVTUJqdchJyCEQEREZItCkLryi4WDqeEuTy1cVQgWPrFf3SdXPEgIREREtiQEaaXA4lV76trPjfV3LQRtr0XwxhtvAAAwGLYmBEUBSAV9IQjlYsKUVWYZVKU4ZFB1fNuzDNLjAQCwbR59+PCcx3f+YPbEbz8z58mP\/tmcddbyaU0IUkMddQNpfYKq6YFJHsqyUBSCqmmMaTpirhcgPe6itQoIAQBgKI19NPIf\/9gLs73f++s5\/\/Sp\/7yQXghBJBURph6Aqt0HU6Ne3rJ42bTDdFzVcEGa1dD2rofepACANhv8dGVfp7FfhTh3L4Sg2GDniglT0lTFcg9CEoIQiiQVuYWJFi2CVDUdsU0h+P3f\/8zgeOyxTwzyeQcPP7w7+93f\/aTn7rl77T33wTz3jx3+J7MnDv3xA1f46zT0f\/KP\/uucL3z627M\/+dR\/mfOpvRdnH\/97X549\/Q\/\/dN6jkGSgF0KQNhhapds+GvroBcgJQapDCMEoikAME1QtS5yGLLpYpbAsBC++OBsce3sXBvm803Mf6vP33D1\/z33cz\/3UX\/1kdvKFd2dfef4Hsy99\/jv3GuwPG+6mjX2c4\/kvfm9+vjhvsOjx\/\/AP\/9XsM5\/5zIF2autCUCdpqmJb4\/2pLiG3NgEhAACsQ67hr9vo5xr8OO86z2sUQpB6CaIHYN3dCbvsHSAEADC9xr\/pFX+62o9j\/\/LP\/27pFf66jEYIUkNeNRthlYRMtCUWhAAApt34N7nib+tqf9JCMJQQAgCYZuNfvOLfZsNPCAgBAKCFMf+mV\/19\/zkJASEAAKxx9T\/Exp8QEAIAQAsCMPTGnxAQAgAgADUEIF39x\/S+MTX+hIAQAMBkawBWFYAxXv0TAkIAAJMWgX\/xz\/8nASAEhAAApjoUcPyz3yQAhIAQAMCUJCDG96uGAj73iW9NpgaAEBACAJhkPcCiZYBTT0CfFv4hBISAEABAS0MBy2YDGAogBIQAAEYoAYtmBRTrAbxmhIAQAMDEJEA9ACEgBAAw0m7\/Ype\/14sQEAIAGBmpAJAEEAJCQAgATLA3ILr1q2YBpG5\/rxUhIASEAMDExv+N\/RMCQjBhIXjllTdmb7zx4n3i\/\/7ogPGJwKIhgfgeCSAEhGCiQnD69K3Z228\/k\/113779+FwO4j7+AIHxDQmYCkgICAEhuE+VDBS5devJ2csvX+vk8V96aX92\/vz5+\/+Px7t588jS4+KYONYHA9CsQFBdACEgBITgPpcunV0qA8Xegral4MyZm\/PG\/803T9UWgjgm7hfn8OEArN4bYEiAEBACQnBgqCAa+VzDf+XKybksXLv25Qfu07YUpEa9eNuqQhCUZQKYKt\/4+h29AYSAEBCCZkRtQPnXG8MH5XqB+H8IQlEK2qopeP\/9Q7PLl880FoKQgTiHXgJMfbZAuUdAbwAhIASEYCXOnn37wK82egMWHfPaaxfv9xYsu+8qvP76ufm5zp272lgI4ti4f1kqgKkMDegNIASEYEtCsLd3Yc7Q30jFK\/5UNLjKVX8MFyQpCKnIFQhWNejpe++8c3T+\/7feOn7\/65wQRGO\/v39s\/nX0AsT9cz0BcY74ng8ITHnaYKwnoDdgOkQ7dPjws7OdnR1CQAjWo1w7cPHiK7ULEWPIIff9aJzj+6++evmB2+Mqvng1Hw19NPhVQpDqA2I2Qfwbt+eGB5I0+JDAFBcRSj0CUUPgtZqeEOzu7hICQwbNica\/XERY9xw3bjw9u379uYVDAVevnjjQcBcb9LhPriAwPa84T04oyudNsuBDAlObMWDtAEMGhgwIwVpEQ178lVZd6S8rSIwCxEXFgsWr9jRcUOzaXyQEVVf8cd7yMAMhwJTqAxQKghAQgs6GC5rMGIhhg6hDqPp+XMUXhw3S1X15AaK6QhC3lxt\/QoCxicDxz34zOywQ3\/c6gRAQglaIosA6MwuqSPseVH0\/RKDYvZ8b54+r\/baEQA0BxlgoaMYACAEh2Fj9QNMNjOK4ZcdG13401Gm4oNz4p8LBnBDkZh9UDRlUnQcYgggsKhT0GoEQEIKNLUa0zjoGy+6ThglSl355vYG0qFBVUWFxeCE3S2FZTwPQVxbNGFAoCEJACDZCcSOjRUWBbZB6BqLBzk0vTMMK5emJacggNfQhBqkmodw7UHUOYGgioFAQhIAQbE0I2lhtcBkhAotWEoyGv7yoUOpVCBFINQNpTYLyGgRxrOECDFUEzBgAISAEvZhh0GS6YdtULV+8CmnZ4vJ6BQARACEgBIRgCeuuP9AFMQxQVUS4iOgdsGQxiAAIASEgBCMRAmDsswaIAAgBISAEABHwGoEQEAJCAExxQSEiAEJACAgBMBERqNprgAiAEBCCwU07JAQAEQAhIASEYOHmRABWEwErC4IQEIJBUtz6uOuVCoGxTCGMht9eAyAEhGC0exkQAqDezAEiAEJACEYjBJcunb3\/q4xVC\/1RAcuHB5IIxPe8RiAEhGAUQhBbFrex2yEwlTqBmEJIBEAICMHohOD06VsP\/DpffvmaP6w1ia2gYyimTMiX12cYhAjk6gTMHAAhIASjFYLyWgQarXZ6XX7+80cP\/KmY1jkM\/vLP\/5c6ARACQjBNIbAWQftCcPv2IUIw8CECIgBCQAgmJwTXrn35\/q8zvvaHRQimXisQswnUCYAQEILJCYGph4RgyjJQrhX40uf\/1msDQkAIpikEZhoQAr0ChghACAgBIZjPLDDTgBCYSmiIAISAEExcCMozDV577aI\/LkIwmZUGTSUEISAEhOBFMw0IgeEBgBAQAkLwYn6mgcJCQjAW4uq\/XDRoBgEIASEgBAuwpwEh0CsAEAJCQAgOzDSI5Xf9gRGCIZIrGiQCIASEoHMh2Nu7MEdh4WoNZW6N\/zry0cY5mhKPUX78+H\/5sVcVguiVaetniZkhuXNNqUBU0SCmTLRDhw8\/O9vZ2SEEhKDdwsIrV052ugBSItb8r7N\/QhvnqMvFi6\/M3nvvqV8Npxz68PEeKQyv3Gv44\/txvzpC8L3v\/UX2ZwlRqPscc+f6xS9+\/f5zMjwATEMIdnd3CYEhg\/UJCeiysDDXmEfDua4Q1D1HnavuaOhzGxXliPv98Iefml+VryIE8Zzv3v3NA\/eLx6z7XO\/e3TlwnrgtdrOcYq+AokEYMiAEhGDNK+EuVywckhDEa7GqCBT54IPfmN2585GVawh++tPD2XPUGTYIAcmJRfQa6BUACAEhIARrr1jYdiM7FCG4t33xI5Vv+WJjH\/e7e\/exUoP+8IdS8FsrCUHcFgJQFoI6wwa54YI4x1hXnNQrABACQrABYsph+tU2GcseuhBEF3vuajs19N\/\/\/hfnV+SpKz6u5KM34Sc\/eSLbbb9MCOL43H2j52Cd4YKbN49MYgaBXgGAEBCCDRQWtr0V8hCEIK62y1fsaTx+WcV+HBuFfHWEIPjRjz7Z+Ao\/nlO5NyJ6LNqWOb0CACEgBBMTgmKDe+vWk5MSgrhazw0VxG2rnj+koKr2oEoIooehfJUfQrDKTI\/oscg91piKCfUKAISAEGyBLhco6rsQfPe7X82O59cpzrs35LBTSwjimJxErDJskDsuJGHo78OvPP+DB5YcJgEAISAEGyYap64WKOq7EOQq\/ptIUXH65qorFeYKA2O2wqJhg1zPQtQ\/DHkxoqrZA4YGAEJACLZADBV0sUBRn4Wgarjgxz\/eq32uVdchWLYmQTyfRa\/\/\/v6xtYoR+ygDegUAQkAIekRXOx\/2WQja3H+g6blyPRTvv\/\/RlXpy0vDGEPdLqOoVsOQwQAgIwZYp7nzY5gJFfRaCOG+5hyDO26T7vakQ5NYkiF6D3LBBbrhgiJtS5WYP6BUACAEh6AldLVDUdyFo67xNhaBq2CJX1JgbLojbzB4ACAEhIASdLVDUVjc0IVj+OubWJIiegGXDBbEWwVA2MlI4CBACQjAgigsUXb\/+HCHYkBBEo35woaEHZw7k77OjcBAgBISAEHS7QFH0FoxdCJrMDOhCCKrWJCgOG5SHC6LuINZQGOIQgcJBgBAQgp5TXqCojY1ycoV7scxuna7u4gyItmcZ5PYwaDLLYl25yK1JkHoAqmYX9Hkjo9wQQRQS+gAHCAEhGAjFX3Mb49NVV851rm5j056uFiaqeovXrdyPn6fuwkTL5OT27d+Zi8a92QUP7q743ntPGSIAQAgIwWbqCNrY6CiuYmP1vaaL6URDmdt4qC0hyFXu1+2Or+ryrzv8kFuTIHoOir+Te4sXPdrbYkKFgwAhIAQjobgeQVsbHeXmzq\/SqEVDG1sM596CbQlBXIHnhg1CClZdjyBmCeSmDtYVgtyaBFVLK\/dtI6PcEIFeAYAQEIIBU16PoI2Gp2p3vhCFqnHwuD26xXO9A21vf5wbkkgs2lI4hhXiOVZtbFRXCHJrEsT\/y7ML6my8ZIgAIASEgBA0privQRub5lR1+6cGL4QhegviftEARzd+1f27EII4T9UVfvRkRC9FNOxxvyCea5KcquOazlgor0lQPn8Mv7T1c7fB1776riECgBAQgrFSrOpva4GiZY18FM1FI18unqtqdNsUgtRdv+hKP55DPGbVc4yf7c6dx9YWgtx6A33dyOjeEsT\/3SwCgBAQgrESjVLbGx3F0EPVePgioiGO51PstehCCNLUvw8+eLj2cwwZiGNzBYp1hWBRgWKIyKIhjG0NExgiAAgBIRgp5XnvbZ03jblXNXjlrvoo9kuNfmxJ3LUQJBmKx142ZJFEIO6bGuncAkpNelhyaxL0aSOjogx87hPfmn3l+R\/4YAYIASEYKzduPD1rc4Gicvd8bPEb4+HRsEej+rOfPf6rrx+Z9yTEfYoFjWUh+OUvf62zq+VodKNRjiGEkJLiEEF8fe+2nfl9ig10Tgia9LBULZjUh42MzCQACAEhmJgQXLlycrZKpf26MxqiaDEa0lS0VyUfceWe7le8\/yZWb4yfPz1mfF31uHF7+Tk2XS+gfJ5gmysTmlYIEAJCMFEhiIa6zQWKMFxMKwQIASGYsBBEV3j6dcfwgT+8aRIbEZlWCBACQjBhISivR9C3lfFgGWIAhIAQbIjr15+7\/yvv02I4UC8AgBAQgg1SrJpva4EiqBcAQAhGIwR7exfmjP2NFr0C6VcevQX++KYnA4YIgP4S7dDhw8\/OdnZ2CAEh2NwCRW3tfAj1AgDaFYLd3V1CYMhgs4WF\/gDHKwPHP\/tN9QKAIQNCQAiqiZX2FBZOo3hQvQBACAgBIVipsLAvG+tA8SAAQkAINowVCxUPAiAEhIAQPDDToK2tkLE9YmdCxYMAISAEhKARXWyFjO3PJDBEABACQkAIGs80KG73i2EVD5pJABACQkAIzDSYuAwoHgQIASEgBGtz5crJmSWMx1E8GLsXem0AQkAICMHaUw9DDvwRmkkAgBAQggkKgZkGw5MBMwkAQkAICEGnQmBPg2FNK\/zS57\/jdQEIASEgBKYemlbodQEIASEgBB0JgamHZAAAISAEExWCGzeenpl6aFohAEJACCYuBMW1CGJ\/A3+I\/ZSBqCHw2gCEgBAQgs6IjY2sRdAvGfjCp79tJgFACAgBIdjeWgSEwBoDAAgBIZioEFy6dJYQkAEAhIAQTF0IimsREIL+yIDXBSAEhIAQEIKJyYAFhwAQAkJACCZMefVB0woBEAJC0JjTp28RAjIAgBAQgqkLwbqNeFEILl58xR\/iBrD6IABCQAhaJxrxdRry4rRDKxWSAQCEgBAMVAhi\/4Hbtx9vPHRw5crJmb0MNi8DliIGQAgIQSerDV6\/\/lyjY9PSxSEV\/gi7mUVABAAQAkKw0V6CuNqve1z61YdU+CPsXgZOvvCu1wYAISAE3dYS1C0MjF4FwwVkAAAhIAQjW4cgNfCr9BQkgVj1\/lhPBixDDIAQEIKNrklw48bTS4cAijIQ92\/6eC+9tD87f\/58Z\/cfIt\/4+h0yAIAQEIL+1BPEr\/PWrSfn0wpjOmGiuN1xyEDT2Qlnztyc3bx5ZPbmm6dqHfP++4dmly+fGe0f8b\/51\/+XDAAgBEMXgr29C3PGIAWpp6CKdWQgCBEIIah7XMhASEHIwRiHCtImRWQAQFOiHTp8+NnZzs4OISAE7RUapmmFRRFoY0XCplf6qZegTs\/CUGTgC5\/+NhkA0JoQ7O7uEgJDBv3m9dfPzd8u585dbXT8W28db9S7MAQZ+NwnvkUGABgyIATDJQr+4i2Qa6jT99555+j9Bj19XR4OiOOjByDY3z+WlYZ1haKvMmApYgCEgBCMgmjo423w6quXDzT0cXsaIohGPxr78vGpyDBmEsR9QxpCDEIoiveL88f5hj7joCwDMVQQswx8mAEgBIRgFEMBV6+eeOD2aPyLhYBxn1VqAFLDn7vvqucYkgwYKgBACAjBaIiGvzhskIYLovegTmMeMhA9AFXDEEMWAjIAgBAQgtETvQPFYYM0XFDs3q9qzKMmIHoTym+rMQmBVQgBEAJCMAlSN38aNogGvtyg56YNhgzE7VE3EEMPxYa\/SgiGtkARGQBACAjBpIhGPRrxNFxQbvzje+VGPhUklmcO5IQgDSUMqaiQDAAgBIRgcqRhghCBXCMft0dvQFkS4r7FGQVVNQTp\/GQAAAgBIegxqWcgrSVQNaxQnJ6YGvnoKQgRSEsb53oT4py58\/YVMgCAEBCCyZKKA6vG+aORL848SD0HaWGitChR\/L+4iFHcNqT6gbIMnHzhXe8PAISAEGDd1QarVjkkAwBACAjBgIsP6zTuuaEGMgAAhIAQgAygE6KOJRW4poLXVWpnhr6cNggBISAEaImvPP+DB2TAZkXNeeWVN2ZvvPHifeL\/m5olU1xqe1UhSFtzD219DBACQkAIQAZ6yenTt2Zvv\/1M9iPm9u3H53IQ9+nisXON+qpCkJMJgBAQAkxYBmxjvB5VMlDk1q0nZy+\/fK2z3oHcGhl1hGLIG2+BEBACQoCGxLoCZKAdLl06u1QGir0FbUtBFLmWp8PWEYI0Eya33DZACAgByABWHCqIRj7X8F+5cnIuC9euffmB+6wiBYv2wyjenta4KO6lURSCKBpMjX30AsTXxZU1151SCxACQoCB8jd\/83\/mtQJkoB2iNqD8kRLDB+V6gfh\/CEJRChbVFKwqBGmp7PK01iQEqfcgraQZUpCrF0jTY804ACEgBJhIz0BRBr70+e94Xdbg7Nm3D3ycRG\/AomNee+3i\/d6CRfddVQjS3hvl+yUhKNcFpOW2086e5XOrIwAhIAQgA6hJ8Yo\/FQ2uMpMghguSFIRUdCkEueGBtGU3IQAhIASEYIIy8IVPf\/uB6YVel\/Up1w5cvPhK7ULEGHLoUghy5676HiEAISAEIAOoSTT+5SLCuue4cePp2fXrz60lBFXbajcVAgsUgRAQAowU2xh3QzTkxY+Rqiv9ZQWJUYDYRlFhuRiw7pBB1XkAQkAIQAZQY7igySqEMWwQdQhVawuUG\/TUG1AWhdyVfRKC8u3pHFXFhn63IASEACOXAZsVtUcUBdaZWVBF2vegavXBNG0wTRmMRj5RvO\/+\/rE5ZSGIY6M3IGYUFKcdxu3laYe5cwCEgBBg4JT3JyAD3dYPNN3AKI5bdGySgGjEo7GORYNyQpDkobioULpf3BbHxjni\/yEHZRlIixupHwAhIAQYEdH4W4Vws4sRrbOOQVvPKbd88arEcblpiAAhIAQYKJYk3gzFjYyqigI3TdOiwLRCYXmlQ4AQEAIMWAYsSbx5IWhaPwCAEBACWIVw4BRnGDSZbgiAEPRSCPb2LszxZrTwEFZj3fUHABwk2qHDh5+d7ezsEAJCgDamF3pNCAEwZCHY3d0lBIYMYOEhQgAYMjBkQAhg4SFCABACQkAIYOEhQgAQAkJACFCjiNBaA\/2ZdkgIAEJACGCtAUJQuTkRAEJACLCR6YXWGtgexa2P+7JSIUAICAEhmKAMmF64XYp7GRACgBAQApheOFEuXTp7\/+MjVi30mgCEgBCADEyQ2LK4jd0OARACQgDTCwfM6dO3HvgIefnla14XgBAQApheOPW1CKLHwGsCEAJCALMJJoi1CABCQAiw0ZoBr0k\/uXbty\/c\/QuJrr0kzzp59ey5UZfS6EAJCQAjIgAJCUw8nVqD5858\/euBjWa8LISAEhEABoQJCMw0m9jrevn2IEIAQEALkCghDDrwu\/SZmFphpQAhACAgBWpUB+xMMf6bBa69d9JoQAhACQoBmfOPrd8woGDBmGhACEAJCgFb42lffNaNgwBRnGigsJAQgBIQAjfni5940o2DA2NOAEIAQEAKsTcwiMKNgXDMNYk6914UQgBAQAjQqJFREqLCQEBACEAJCMFEZSIWEf\/pH\/81rMqLCwitXTnpNCAEIASHAasRMglRIeOJfWm9g6IQEKCwkBCAEhAC1KC9NHNMOvS7D5uLFV2ZdrVgYRYu5df6b1CrEwkm5c3U1zBHPMRr78v4E5efeRAjK523yurRxDhACQoC1iggVEo57xcI2N+X53vf+4sDHVaz7H6LQxrl+8YtfnwtN24L03ntPze7NvDj04fN9ZPb\/Z2Lca\/jj++lxmwhBcR+J4utS57Vv4xwgBIQAjeoGiksTKyQcFzHlMH2cNGmsF13F3r37mwc+sqJBrXuuu3d3Dpwnbjt9+lZrYhTPK7dRUY643w9\/+Kl5D0UbQhDnWFcI6p4DhIAQoHERIRkYf2Fh21sh\/\/Snhw98ZH3wwW\/U6tqORjcnFtFr0FavwKoiUP457tz5CCEAISAE06sbCDHwmoyPYuNy69aTrZ87Gs5yQ1qnJyI3XBDnaGNDpnvbFz9S+fFabOzjfnfvPlZ6Hg9\/KAW\/RQhACAjBtIoIrUZogaImxXm5j63oOVhnuODmzSNrP7cYbsj1PKSG\/vvf\/+K8dyINS8TPEr0JP\/nJE9nnRAhACAiBIkIMmmjwulyg6Ec\/+mTjK\/x4LuUr8LhKb6PWIXoeyr0XqTZh2WsQx0ZRIyEAIeiREOztXZjjzdjNSoTqBqZBDBV0tUBRXFWXr6ijIV7lceIqPfext24xYVzt54YK4rZVG9WQgqraA0IwPaIdOnz42dnOzg4hIATjLCK0pfE06HLnw2i8cw3nKsMGueNCEtZ9Tt\/97leztQ11ChXvDTnsEAI8IAS7u7uEwJDBOOsGvCbToLjzYdsLFFUVBkaF\/qJhg1zPQoz5tzGkkZv90KR+orjSIyGAIQNCMBq+8vwPFBFOlC4XKKpakyC65xcNG+zvH1urGLHucMGPf7xX+1zWIQAhIASjXnxIEaEFirpYiz93Vf7++x9dqdAxdem38bza3H+grZUKCQEhIASEQBEherlA0fXrz3Wy3kF53D56DXLDBrnhgramRMbzKPcQRGPaZCiCEIAQEIJRUdzBUBGhBYruNS6Pt37+qq76XCFfbrggbmv751y3MSUEIASEQBEhRr9AURsrAa6yJkH0BCwbLoi1CNrayIgQgBAQAqgbwBKKHy1t7ySYhgIOLjT04MyB\/H12OukJIQQgBISADKgbwJI6grY3Olq0JkFx2KA8XBB1B7FuQFvPocnMAEIAQkAILD6Eya5H0PZGR4vWJEg9AFWzC9ocvqjalrnJgkxNpx2WayliOeY6PTLFhaQIASEgBIRA3QA6X49g3SWCV22Qb9\/+nXnjem92wYM7Cr733lOdDo2sM4shei7qLkxU1atQpxckNnciBISAEBCCtShvWmTxIZQp7mvQ9kZHi9YkiJ6D4pDFvcWLHu2kliE3i6Hu0ETV8McyIQjpilUamy66FI1+blMmQkAICIE3YeO6gViZ0OuCRd3RXSxQVLUmQdVywl30UoTo5IYN4jmtKkExYyI3jXKV1y23xsIq8hOvRWy\/nHtMQkAICIE3oboBtD4ToKuNjhatSRD\/L88uqLPZUF1y3e6JRdsrx3OPYYyqjY1WEYKqXRzjnFX1EnF7PG6ud4AQEAJCQAjUDaCTmQBdbnRUtSZBWRCiW73LBi7OXXWFH1frcSUeDXvcLwhRSg151XGrCkFVt386dzxOPF7cL+Qkhjiq7k8ICAEhIATqBtAZN248PetygaKq9Qba3sholaGLRVf60ThHQxuUix3TEMOdO4\/NmkxhXNbIx+NVPW5OSAgBISAE3oTqBtA6xW19F3Wfd7EmQWoMu3rc3DTIDz54eMnH7ENZGYhjcwWKqwhB\/PxVdROLCBkImSoWfxICQkAICIG6AXRCFNZ1uUDRojUJ2tzIqE5vRcjJsm75JAJx3yQsuUWCVi3GTPUIVWJUHsaIQsjU6Md2zYSAEBACQrAS\/+7f\/g91A2hc9Jc+YmL4oMtx\/Fy1f1sbGdX9mUNQYgghnlOxqz6+vnfbzvw+RVnJCUHdYsw4R2wFHXUT0bBH4\/+znz3+q68fmfckxH2KMy7KQvDLX\/7axnpVQAgIgboBTIhil3QXU\/+KjWGZruoW6ohKNK7p+cTXVVffcXv5+TddOyF+7uidSeeJc1e9FvEY5cfVQ0AICAHUDaB1rl9\/7v7HjIYGIASEYICoG0BbV+5dL1AEEAJCQAg6wnoDaLPbPH3MRG+B1wQgBIRgQEMFRRmIOgKvC9pYoKirnQ8BQkAICEHHdQPRU+B1QZuFhV4PgBAQggEQtQLqBtA2xd0HFRYChIAQ9JyYRaBuAF0XFprjDhACQqBuABNlUysWAoSAEBCCNWWgOMVQ3QC6nGnQ1VbIACEgBIRgTYpTDEMM\/EGiCzaxFTJACAgBIWiIpYmxjZkGm9xwCCAEhIAQrDBUYGlimGkAEAJCMGEhMKMAm+bKlZMzSxgDhKD3QrC3d2GOGQVA91MPQw68JsBBoh06fPjZ2c7ODiEgBGYUwEwDYOpCsLu7SwgMGZhRgPELgT0NAEMGhKBHQwVmFMDUQ4AQEIKJCYEZBeibEJh6CBACQrAFbFqEPnDjxtMzUw8BQkAItoQphujjWgSxv4HXBCAEhGALQwWmGGLbxMZG1iIACAEh2AKmGKKvaxEQAoAQEAJDBZgoly6dJQQAISAE25xiaKgAfVuLgBAAIxeC8+fPz86cOTO7efNm7WPjuIAQWI0QhAAgBAMWgqtXr86fdNNG\/fLly2sdTwisRghCABCCHgjBsWPHZkeOHGnUO1A8x6FDh9Y6x5SFIHoHjn\/2m1YjRCecPn2LEACEYDNX95vqJRijEJSHCqxGiC5mCbQlBBcvvuI1BcYoBMePH58\/4Tau7I8ePTrvJSAEzYcKrEaILohGfJ2GvDjt0EqFwEiFIJ5sSEEbid6BOF8UKBKCZrMKDBWgC2L\/gdu3H288dHDlysmZvQyAgQhBXJ3HA586dSp7gugBiKv3YoO9qJs\/vnfixIn75w2izmDRTIRNDBuMSQhsXIRNEqsNXr\/+XKNj09LFIRVeS6DnQnDu3Ln7jXYuue+nK\/poyMtJ8hDFgon0w4UkVElBOoYQGCpAP3sJ4mq\/7nHp4yakwmsJ9FwIooFOD55r4FOtQPHqPXoT4rb9\/f0D949ehHKjH\/9f1hMRwhH3IQSLiQWHrEaIbdQS1C0MjF4FwwXAwGoIoos\/Hjz+LTfk6YkVG\/901V8nqaehqtFvcs6pCcE3vn7ngaECqxFik6QGfpWegiQQq94fIAQ9EYI0hl+u9E+NeLl4cNXGO84b54jehSQdVccRguV87avvGirAVtckuHHj6aVDAEUZiPt77YCBzTKILvtypX8aLihX\/y9qvKNXodj45+iDEJw8+fbg+NLn\/9ZQAXpRTxAfIbduPTmfVhjTCRPF7Y5DBtZd2AggBFsQglQomIYNYoigqtiwqvGOpYxTUWGcJ3oIUj1B6oVYJARdrkWwSFCGwKMPH5798T\/4j4YK0AspSD0FVZABYMBCkAQgLTaUBCE3FbBqlkGuALE8LFH1Q256lsHQ+PjHXjBUgN4VGqZphUURsCIhMIKFiVKDHuP+aVZAbiZBqi0oDyUsmq2Qjsn9kKl4sVzUSAju8fjOH8xlIHoInnnm3\/sDAgBC0K0QpEY7DQlUrUSYdjksTyFMdQjlhj0EIQ0l5H7IEItNL0w0pKGCP\/r7\/2EuBE898QIhAABC0L0QRIoN96KlhKPxL9cXFHsB4nshFqmnYdEsg\/S9XG\/E1IXgyY\/+2f2ZBR\/9yD8mBJgE8dnz0kv7nd0fIAQrCEFadKhq5cLy\/aK3oHy1X1y2OHoZkljk1jRIEtJl\/cBQhSANFQTRSxC3EQKMncuXz8zef\/\/Q7MyZmysf8+abp2Y3bx6pdQxACFra3CgVIa477p96FeJfQpAfKghCDggBxk406CEDIQV1jw0hCDHwOoIQbFgIFvUSrJooJkxDC11nyEMFMcMg3U4IMIXegSbHhgzU7VkACEFLQpAa9EWbFi1Kqh1oKhRjFYLcUAEhwBR4552js7feOt7o2HPnrs4\/2pr0LgCEYEIZ0lDB3u\/99YGhAkKAoRIfN9Gdv+z21KC\/\/vq5A70Gcb+4+k\/HlO\/ThlAAhIAQDGKogBBg7EJwr\/j4odmrr14+UBtw9eqJ+fdDBKLRz4lDsL9\/LPtYACEgBIMSgugdKA4VxP8JAaYiBFEDELetWniYO+eq5wD6wt7ehdnhw8\/OdnZ2CAEhyA8VPPHbz2TvRwgwZSGItQaipyD1EhACjEUIdnd3CQEhODhUEGJQdT9CgKkJQUhA1AWkGoIihACGDAjBqIRglaECQoCxC0EUD5Yb85CBEIHoEYiagTSlMI6rEgI1BCAEhGCQQrDqUAEhwFSKCuPfdFv0DMRtMQOhXGiYE4K4nRCAEBCCQQpBCMAqQwWEAENeWyA+cop7DaTegHLjXV5HIDX8xWNTUWFOCOJ2qxWCEBCCwQlBnaECQoAhrz4YHzkhBnH1n7r1c1fzMW0wKB8bPQVxbFqTIFdUGNMVc9MWAUJACHovBMWhgigqXOUYQoAhkiQgruCjwY8hgJwQJAEoDhGUj01SUe45CGkwXABCQAgGJwTFoYLy8sSEAJYvrrfaYNUqhwAhIAS9FoLiTobxb3l5YkKAKZMrLlxGCIQli0EICMHghCCWJF60PDEhAABCQAhGLgSLdjIkBABACAjBBIRg2U6GhAAACAEhmIAQLNvJkBAAACEgBCMXgiZrDhACACAEhGBkQlBneWJCAACEgBCMUAjqLk9MCACAEBCCkQlBDA0c\/+w3G605QAgAgBAQghEIwbpTDAkBABACQjBwISiuRth0iiEhAABCQAgGLgRtTDEkBABACAjBgIWgPMWwzXMTAgAgBIRgIELQ1hRDQgAAhIAQDFQI2pxiSAgAgBAQggEKwTrbGhMCACAEhGAkQrDOtsaEAAAIASEYgRB0WUhICACAEBCCAQhBG9saEwIAIASEYOBC0HUhISEAAEJACHouBG1ta0wIAIAQEIIBC0GxkDBWJ+y6VoEQAAAhIAQ9E4IuNi8iBABACAjBgIRgk4WEhAAACAEh6KkQFAsJu1pzgBAAwLjZ27swO3z42dnOzg4hGKIQbLqQkBAAwLiFYHd3lxAMUQg2XUhICADAkAEh6JkQbKOQkBAAACEgBD0Sgm0VEhICACAEhKBHQrCtQkJCAACEgBD0RAi2WUhICACAEBCCngjBNgsJCQEAEAJC0AMh2HYhISEAAEJACLYsBH0oJCQEAEAICMGWhaAPhYSEAAAIASHYohD0pZCQEAAAISAEWxSCvhQSEgIAIASEYEtCUO4d6IMMEAIAIASEYMNC0KdCQkIAAISAEGxBCIqFhCEGfZEBQgAAhIAQbEgIYqgghgjSUEGfegcIAQAQAkKwISGI4sE+TTMkBABACAjBhoWgr4WEhAAACAEh2KAQFAsJo46AEAAACMHEhKBP+xUQAgAgBIRgC0LQt\/0KCAEAEAJCsAUh6Nt+BYQAAAgBIdiwEPRxvwJCAACEgBBsWAiK+xX0vXeAEAAAISAEHQjBEKYZEgIAIASEoGMhGMI0Q0IAAISAEHQoBEOZZkgIAIAQEIKOhGBI0wwJAQAQAkLQkRAMaZohIQAAQkAIOhCCoU0zJAQAQAgIQQdC0PfdDMcqBHt7F+Z47p67195z99wJwdaFYIjTDAmB504IvPaeOyEgBC0LwRCnGQIApgkh2IAQDLV3AABACAhBSzUEMcVwSNMMAQCEgBB0NO0QAABCMFEhEBERmXIIgYiIiBACERERIQQiIiJCCERERIQQiIiICCEQERERQiAiIiKEQERERAiBiIiIEAIREREhBCIiIkIIREREhBCIiIgIIRARERFCICIiIoRARERECIGIiIgQAhERESEEIiIiQghERESEEIiIiAghmFrOnz8\/O3PmzOzmzZu1j41j4tg4h4iIEAIZaK5evTp76KGH5o1608SxcY44l4iIEAIZYI4dOzY7cuRIo96BYi\/BoUOH5ucSEZHtJC7O0sXd5cuX5xdqQdNzEIIJJb1h1ukdKPcSxDlFRGTzMlD8DG4qBKu0C4RghDl+\/Pj8F79O70CxlyDOFecUEZHNJfXSFj9\/mwpBJHp743xVbQMhGGHabsDbFAwREanXO1Cs41pHCJb1EhCCnmbZL73q+4t+4fG9EydOzI4ePXr\/2KgzWDYTwbCBiMjmE1fz8Xldp21YljhfnJcQTEAIFjXe8SaI70W3USKdI94kVVLQZk2CiIg0v5pfVwhSG5GbUk4IRiYEp06dmt+2v79\/4Jh4A5Qb\/fh\/6jGIY3OJcy36voiI5JM+p6t6WKu+X3VxV\/7sj8\/1NKybLu7OnTtXWzQIwQiFIF3110m8edIbadGb2vRDEZHNCEHVZ3nxsz9JQ3x2p6nm6XsxPFz385wQTFQI4vgQgXhDxRtnWRcUIRAR2ZwQRCMfDfyiz\/4YBi4fly7wgqqegjhv7gKQEExICGJ4oNj45yAEIiLbF4Kqz9xyD0Eu6XM+JxSL2glCMBEhiGkrqagw3ixxfKonWKVIxVoEIiL9EoKqQvC0dH1VPRkhmIgQVBWipKKTqumIqzyWWQYiIv0RgqaPSwgGlrRCYNXmQqnhL\/9S0\/hReUrJojdHccwplzjXovEoEREZlhDk1iIgBD1Omg4Yv7xi11CxAS+\/KVJXUXmKYKo+LVeexpslDSVUvcHSVEa7HoqIbEYIVpllUJXikEHVY5plMLCkK\/NUHBK\/wCQJVT0EqfEvF5MUJaJ8rmWzDHLnExGR1S\/slg3XloUgfS6X6wSKx1T12qb2IVf3lXqfc9MSCUHPE7\/84oqC8XUaDqhqxKuu6OO44rLF8WYpn6tcgJJMU\/2AiEj9pM\/j6Iktfr4WC70XLUxUHv5dNu2weLGY65VIF5oWJppI0sqCixamWDXJUnOVqiIisvzzODX88W9x2fi4KEtflxvvqs\/xJATF8+QWJqrqPVj0mU4IRm6l64z76x0QEWlHCqLxT2IQDXj6XK0SgkhuI6IkBKlOLM5TFIF4nEUb0SUpyYUQjDQxTpRWo2qybXHa4yDOYdtjEZHNJ9V+tTXDa9n5CIGIiEhP09aFWbpIXLTiLCEQERHpadLQ7bo1Yal2YNEwMiEQERERQiAiIiKEQERERAiBiIiIEAIREREhBCIiIkIIREREZAUh+Ge\/koIp8JklrwUAAKPm\/wEXmCnc3ELyhwAAAABJRU5ErkJggg==","width":516}
%---
%[control:editfield:7022]
%   data: {"defaultValue":"t^2","label":"u(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:2a36]
%   data: {"defaultValue":"1-cos(t)","label":"v(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:5896]
%   data: {"label":"Create Plot","run":"Section"}
%---
%[text:image:642b]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:editfield:4afb]
%   data: {"defaultValue":"t^2","label":"u(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:681d]
%   data: {"defaultValue":"1-cos(t)","label":"v(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:slider:67c7]
%   data: {"defaultValue":-5,"label":"a = ","max":6,"min":-6,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:slider:2b50]
%   data: {"defaultValue":5,"label":"b = ","max":6,"min":-6,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:button:8ade]
%   data: {"label":"Create Plot","run":"Section"}
%---
%[text:image:978a]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:editfield:6cfb]
%   data: {"defaultValue":"t^2","label":"u(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:7fad]
%   data: {"defaultValue":"1-cos(t)","label":"v(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:slider:4a41]
%   data: {"defaultValue":1,"label":"a = ","max":6,"min":-6,"run":"Nothing","runOn":"ValueChanging","step":0.5}
%---
%[control:slider:08af]
%   data: {"defaultValue":3,"label":"b = ","max":6,"min":-6,"run":"Nothing","runOn":"ValueChanging","step":0.5}
%---
%[control:button:4fc8]
%   data: {"label":"Generate Graph","run":"Section"}
%---
%[control:checkbox:7dcd]
%   data: {"defaultValue":true,"label":"Show positive du regions?","run":"Section"}
%---
%[control:checkbox:665f]
%   data: {"defaultValue":true,"label":"Show negative du regions?","run":"Section"}
%---
%[control:checkbox:92e1]
%   data: {"defaultValue":true,"label":"Show positive dv regions?","run":"Section"}
%---
%[control:checkbox:412a]
%   data: {"defaultValue":true,"label":"Show negative dv regions?","run":"Section"}
%---
%[control:checkbox:2f4b]
%   data: {"defaultValue":true,"label":"Show u(b)v(b)-u(a)v(a)?","run":"Section"}
%---
%[control:checkbox:2b56]
%   data: {"defaultValue":false,"label":"Hide du stripes?","run":"Section"}
%---
%[control:checkbox:43a9]
%   data: {"defaultValue":false,"label":"Hide dv stripes? ","run":"Section"}
%---
%[text:image:3d51]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:200d]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:57ce]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:5431]
%   data: {"defaultValue":"r","label":"My answer is: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:68f5]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:2bfa]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:0908]
%   data: {"defaultValue":"r","label":"My answer is: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:1ee8]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:240d]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:9377]
%   data: {"defaultValue":"r","label":"My answer is: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:2391]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[text:image:9e3b]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[control:button:9e96]
%   data: {"label":"Initialize Values","run":"Section"}
%---
%[control:button:7ec6]
%   data: {"label":"Generate Problem","run":"Section"}
%---
%[control:editfield:82d5]
%   data: {"defaultValue":"r","label":"My answer is: ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:3b10]
%   data: {"label":"Check Answer","run":"Section"}
%---
%[control:button:0b8a]
%   data: {"label":"Analyze Results","run":"Section"}
%---
%[text:image:2c40]
%   data: {"align":"baseline","height":326,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzIAAAJ1CAYAAAACH8VNAABKAklEQVR42u3d\/688310X8P0\/jMEfiBaNSkxEjRo+aRGtdPVaRQkIUcFPP1gI8k3qdQsWNDRqit8Q3+5NxC9UqsEC2oh7A4WatkAbpILX3rYIfuy70lbkXSzYFMp4Z3dn95wz55yZ3bt7vz4+ySOf93u\/zM7M7rzOec45M+\/Jb\/icL2wAAADuk4mdAAAACDIAAACCDAAAgCADAAAIMgAAAIIMAADA9YPMZ\/yx55vf9ae+Yi+\/+RVfakcDAAA3H2Q+65Vf3rz5pz\/S\/Juf\/F\/Nd737afNP3\/li8+Rt\/735hz\/0geYNi\/c1r\/8P722+5d9dNK\/9tz\/VfMO\/eU\/zNf\/qJ5qv+Bfvbr70H\/9Q8ztf8eftaAAA4OaDzCuf\/yvNP5y\/seofzL+r+fv\/5Luav\/eP\/0Xzd7\/jnzdv+Ef\/rHnDt39n89IveJUdDQAA3HyQ+bq\/8Yam9t+nPvWp5pOf\/NXm\/33iE80v\/\/IvN7\/0S\/+3+cVnz5r\/\/Qu\/0PzpL\/86OxoAAHYw9r+7tt4\/efG+5qu+9duLz7fPta+5E0GmDTE\/9ANva9799X+wefbzPx+FmI989H+PCDKvab7jxWCBL35f8\/Lq67+9OW8+1HzHq\/bd6Ou+P1xO\/N\/PfPdrrrH8Q63X8T7rq99+tZFv\/3bFBQDgBoLMIV5z09qg8slP\/L9smKk9d+NBpg0xL\/7Cx5vXvOKLmw\/\/p89s\/tuTfxCFmP\/18x+uB5lXfV\/zM1fLOX99\/Nh3vP6+BJncch5okGm\/qxff1Zy\/eFPrCAAgyNy3IFMKLIcOMaODzNd8y9\/JhpiL\/\/kLzR\/+m9\/fzH\/HS5qPvuMzm3d9ycuiEPP06Yeaz3\/ha6sjMeevv+kOvyCzz2e9\/Ls\/tBxx6v6vwAAACDJjwswxQszoIPPVr\/tbvRDz5re+p\/ndX\/r3mukf+PzmBz7r05uP\/vPf3vyXP\/6S5gNvf8cmxLz4Pz\/Y\/Mnnv7oyGvOu5quHpjJ1\/22mNKWd8Hhq2ioYpa8J\/176c\/r33HJ3DzL5bais8+tXo1TbqWq17azvo\/O3f+jqwfU+flW43O\/bYTu716xfvxyZCaf\/1dZ7aJsAAHiIQSYMM8cIMaODzFd90+uXO+rXPvXrzbte\/KXmW99y2bz0G7+3+ezP+8rmqz7t05t3fvZvaT761z6j+dkvfknzjm987SbE\/OzP\/Y\/mT3zZV1WmKg1dDzMURFad8H7n+ABB5vXvGrgepH+NTD5EjV32enndPmlfswl6pe2s7aM0UGxDSjuq0ozezvS7CkJNbr2XgSlej\/xzAAAunBdkjhxkvvK137rcUWc\/\/L7mlf\/0vzWf\/0\/+c\/MFf\/sHmi\/4PZ\/XvOE3fVrz05\/3kuajf+Ulzc9\/xUua85f+\/ubnfu7nliHmZ\/77zzZ\/\/C985d4jMqvOfPdfJnwUl3GAILMewSiHh5FTy3LbkF320LoU9tXQPvqcyijKqO38wt50smUQKo6QrUaJSqFu+xwAAKaWHTnIvPqv\/c3ldLKPfeyXmn+5eFfzJfMfb75o+hebv\/4bf2PzHz7zNzcvfvFLmo+c\/rbmPd\/6Z5ofefnva9793d+9DDHve\/8Hmumfe\/V+18hEnfdwFOCGgkzYad93allxG3LL3iPIjNlHQ0Fm1Hbm\/us+Nz\/VL79N+14XBQAgyLjYf48g8+V\/9Vs2\/07Mxz\/+8ebyve9tfuRfv6n58T\/0W5oPfvlvaz7yNZ\/RvOu7\/vYyuPzoj\/xI8x+\/6ZuWf37v5fuaV3zJXxocccnetax9rjhdaWhqWdJhXn5O+f3515VHJEYHmeI25JY9fL1Obx1G7aOBqWVD2xl+xueUwkqwblG4qj0HAMBDCzJ37vbLr\/qGv977xy4\/8tGPNv\/jTX+6+dgbf2vzn\/\/l6XIqWTed7D3v+alliPmvF+9t\/uiffWH4+osm9+\/IBBehR7f9zXfSexerh1Ou3v6u8ihM6XXRlK0xoz4DNwwItyG77KHRodx2jt1H8WdGF\/sPbGc7FSw37Ww7vSy8sUB6w4DacwAAPKTrelp37h\/E\/Itf\/41RiOlusXzx49\/X\/Ni\/\/zvNBz7wM5sQ043EtCHmp376vzZ\/5Iue92N80Gq3cr7JW0oDAPCYjAoyX\/Z139gLMeEtlksh5iff81PNH\/lCQUaQsZ8AALiFIPN7\/9SXLQPJPj7zFV9kRwsy9hMAADcfZAAAAAQZAAAAQQYAABBkAAAABBkAAABBBgAAEGQAAAAEGQAAgOMGmcnX\/CAAAMD9IcgAAACCDAAAgCADAAAgyAAAAIIMAACAIAMAACDIAAAAggwAAIAgAwAAcLQg8+53vxsAAOCojhJkfviHf7h59uwZGd\/5nd\/Z\/OiP\/iiPiO\/cPgIADkuQEWTQSbePAABBRpARZNBJt48AAEFGkEEn3T4CABBkBBl00u0jAECQEWQEGXTS7SMA4PEFmUUzm0yaycasWYx538W8mW5e2y5j2swv2j9fNvOTSTM7v+9BZt68EO2Xtefnh\/sBfP\/rmucmLzTz9M8HWW5\/3Z\/75rfsuKy3NK972aR54Wxg3R9gJ33+\/NU+e9nrmrdc+7Mr+3CX34cgAwAIMv0QMz273Dx2eTYdF2aKQeahjMisgkzcAb1Gp\/QmO6rL5T7XvO770+1JHxNkivvvZS80L7xs1\/114CBjRAYAEGRqYSQNIKtwsxlRWb4mHa0JR3H+cvOak+7P7bKCEZl12JmdbkcFwpGaVWhavW92evXn08XqufPZ7iNENxJkVmfqlyMb67Dw3MvadVx36M9eiEZAoveGoyTLM\/3hiM\/V+9Ng0Hv9+vHwM0ojBtkgE3So22VcddKfC5eRXe76Pd+8XZfNqE66vju8fznaMQn2W2\/fHT4g7dJJf8s3P7dcz\/b\/0QjceptfeD7\/HS9fv9mGbv9v9\/vmt5N8zmYEKB31i\/bxajn7j64JMgDAgxqRWYWONGCUQs2iDSQn8+Zy7NSydQjqRnz67+\/esw5GyyATj+60YSccMbrdIBM8tg4am+eT8LDs1G469PFoSByGclPLaq+PO8jZqW65IBM+tgwNwfPRtoTL7TrP4Tqu39db99x6rf+chKVVJ3z13OrP8faGHfyb76S369WtS7te\/XAZhY9o27avXT4X7INtgAxDXvB95B4P9nEcqpL1EmQAgEd7sX80AhKEmuXjwYhIGF5GB5lgxKdd3jrILEdjuhGY6O\/Hn6Z2nWtk4hGJytSjsHMadVRHXCNTeH0cjoaW21\/3TehKOt295WyeD8NGOYSV1yt5fzKKsx2h2Gfa25E66ctpZdttadexFFaL+z8KHuHUsiCAhJ8z4vfRGx0ytQwAEGQq082SgLOdPrZLkAmCUBBklqMz2SCTTGfrRnDuyNSy2jUi0fSgYIpVr6M\/EGRKr4+nLlWmYe0SsnKft1mX\/vUdxSCTXa\/k\/cUgU5lKd8Od9Oy2ZKd65UZScu+L90EXjNJRp\/Bza8EvO21RkAEAHl2QaYNFECbC6WbLIBIEj73uWlYJMuURmfhzSo\/fuSBTG+U45IjMmLPyOwaZ8SMywd9HjRbsEGT22c6Dd9JL0wkz0+mS\/ZaGwfyIzPo9z78umL5W2WfFGyocZwRLkAEA7t1dy6LrY5ajMPG1K93z0R3NrhlkitfIJO+5W9fIjA0yybUhSbDYXD9RCjLV1yePFwPSDkFm6BqZ3HYMrW8wtWwwyCSP39o1MmkYrYS3epBZT0vMBZnuuWzoKV8jE4c+18gAAKaWZf4dmeT6lOiuZeFz3fva0NHdNCB\/17JskInuWjZr5sHIy\/bx+zS1LJxadNURPRtzV6\/uOpzMXctKdycbc3evXYPMDncdK4WS\/HqNH5GJpnTd0tSy7QX6uelmhe+o912utz+5Tig7PS\/72ylNLYuv2TK1DAAQZO6EVfg59MjL9YIMD8nd+c6Pf2MDQQYAEGSOKb2RwIGvgxFkuHOd9OT2zfYRACDI3PsRmZulwybIYB8BAIKMIINOun0EAAgygowgg066fQQACDIIMjrpvnP7CAAQZAQZdNLtIwBAkDlKkPme7\/keoaXgzW9+c\/PWt76VR8R3bh8BAId1tCADAABwTIIMAAAgyNipAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwf4LM2GUCAAAPnyADAAAIMoIMAAAgyAgyAACAIAMAAAgyggwAACDICDIAAIAgAwAACDKCDAAAIMgIMgAAwOMOMrssE4C7Te0HUPsfVZB59uwZAPec2g+g9gsyAAgyAAgyggwAggwAgowgA4AgA6D2CzJ+BACCDACCjCDDPXR5Nm0mk0kzOV30nlucTpbPTc8u91j2opm1y53MmsWY11\/Mm2n7+pN5c1l4Tbc+s\/NrbHP3OaHMto\/dd9t9s+P2giBzP2rjJFMHR9Sru23PenU+i+rlQWryTX6P6+8rrt13az0PuV6HXebx2rjud5Q91hBkNGaM69inxemGO+Y3EWTaRjgNMRu7becxGh0QZO6IQq3YHO+PMch0+2TPEz+347KZn8TbeVdr92NtU9IQI8wIMhoz9iz0SUBIGq307GTYgG8K8OlsHYqmzfwi01D2OgfBc0HHYH6aL2a5IBMXwVqj3K1PWiAzjw+sS35f5DoG232bW79twzXfrMNq31U6VPe244Qgc\/86V5ta0x2H3fEXBpngGO11vtIR4E0I6GrD9njvj473O+G1EaNewCh+di7IlOv1cpsKtXu4Jif1bESdD2tydhlD+2FTI9PlTJrPff5zx7023FebdZ41s5NKJ7taqwf275j2ILvv1s+H33Ww7v1wNLBvd92GgTZu8\/s4C3+LmXY\/ep\/ZDYKMxox9zz5uilYSbgbOTo7q2OemdIVFt\/R80EimjWb2TE6po187m5gW04F1GRdk0gLfbzh6y0m3YWifgSBz5OlIhc5UsUZkOp6F47v7jH49S+pQ7ngfO2JUrI\/HCTKls+uboDO430p1s\/A9VPfD2CDTf119X2aC1WCtHh9kitte\/E6nvce7\/R0HmYF9u\/M2DLdxpd9DtQ3r9UcQZDRmjJ5mkJ7dGWg80tGawbM3lalkm88sn6GMG8318jMjQ7mpZ\/Vh++TM54h1KZ\/pWi8jU4xLy+jvgxEdGRBkbmDK7cBZ+kynLe3Ub2tEcoIoOr4XvbPwtXqWdoKHr29MR953DDKFk0HRNufajdJIVia4rNarPgq1+\/S3\/nb1andvXw63B8XfS7FW7xBkSicUe+vRn02Qfu\/5IDPQJo\/dhhFt3CbIdMscCCm9MI8gozFj16kUbcErdvoLUxXyry8FmeTsV9rAZYf0V6\/JN5rj5tbuFWRyUzGSs6mlIJO\/nmdoGWlD0z\/jZd4wgsxNn+Cp1KviiZRC\/Ys6r0E9WC+vm57bPr+qIaXOc3\/dtrVmh88+YJDJ19hCba2cgKpNYx4dPHcIMuWRkOTEXnU9hmr1+CATthnRuvbWozw9MR9khvbtbtswpo3rv6Z\/ArI3CmokRpDRmHG96WXdPOCgAU0bsMKITLVwl0ZgKh2DfYNMdSrGLlPLciNMI4NM\/mzqrkFmIPyBIHPDF\/+XO7fxMV84lpPOaxdWZqfT+NrCq0AzG3OsZzvwYz57OMiURi6KIzLZUaLdg8yoa22ejWubrhdkkrZmVN0t1erx6xHuv0MHmXH7dtw2jGnjdgky9eCOIKMxY+8C3C9Gw9OsykWv1ygecGrZ2O0rXljau17nZqaWDQeZZ8ULhEHtP9YNUMLjLHlsRId8eHpXeo1HfKZ7txHY\/Nny3aeW9ad8HWVq2cgpwUOj6UNt035Ty3a\/o+bwb2h4\/46eWnaAILPbTIV0G3afWjYmyCDIaMw46P32y3eh2W9q2d4Xtu96sX+tkz\/29ssj1iXenva9+1\/sXwwypfXVCCDI3Fgt3G9q2ZgL7vMnUrafXa5lxfUbunlKcYSgVK8yQSZYt70v9h+ckjeurg9fTF4OMv3aPf67Ht22ZELJ6JvmlC7G3zvIDOzbwW3Y\/2L\/4SDjJJ0gI8hw0Atca1Ob2kITd7jHXSMTF722sEVDyQe5\/fKIf2NmzD+IufMtQnNBZpfbL1dGZGq3rAZB5ubCTGXaa3FkoXoL5MLIx9DNVsas3863X05ff\/V48SL4cpDZ5fbL5f1Wu\/6nNpOg3zblrxdKa3fuM\/P\/NMDlqOmHhVo9sH93uf3y\/iMyA\/u2ug3XuP2yICPICDJwC4HOyAeCDACCjCADggwIMgAIMoIMCDKg9gOo\/YIMAIIMAIKMIAOAIAOAIHPoIAPAw6D2A6j9RmQAMCIDgBEZQQYAQQYAQUaQAUCQAVD7BRkABBkABBlBBgBBBgBBRpABQJABQJDRmAEIMgAIMoIMAIIMAIKMIAOAIAOAIKMxA9CYqf0AgowgA4AgA4AgI8gAIMgAIMhozAA0Zmo\/gNovyAAgyAAgyAgyAAgyAAgyggyAxkztB1D7BRkABBkABBlBBgBBBgBBRpABQJABUPsFGQAEGQAEGUEGAEEGAEFGkAFAkAFAkNGY7e1DH\/pQ87a3va1505ve1Mzn86X2z+1j7XP2EX6LCDI4hvH9I8gIMnfKT\/zETywLTVtk3ve+9zUf\/OAHl9o\/t4+1z7Wvsa\/wW0SQwTGM7x9BRpC5M0XnjW9847LIfOxjH2s++clPNr\/+67++1P65fax9rn3N0YrP+ayZnMybS9+H3+Jt\/xYrFqeTZnp26bsSZDjSMTw\/mTST00Xy+GXhcR5eDV80s0n\/u748m\/r+1X5Bhvzwb3t25AMf+MCyyJT+a59rX9O+1rAwj\/W3KMgIMhz7GF51ZGfnSSfWia5H9f1PJtNmfiHIqP2CDAPaYd5WWHS+7du+rXn5y1++1P45LD7d62udu6jgtCMty6K0smmcliMw02baPt42UNGIzPrsW\/qei\/nV62fNIjuKE79HZ\/Nh\/BZrDeHwb3H1mwg7RL0zvNnf2NXvcvlc8Fvrftd+X4IMR21Ptu1Gd\/y1HdugU7s8RrtjNzhGo8fjTjD3p4Z33\/fsNA6vvSAT9i2EXEFGkHm82ovvXnzxxajRee655yJh49O+tn1PeVpY0Hlcdwq7BiU6q7YsQkFjEyyj7YxmX1cJMnGRawth3Anl\/v0Wh\/7L\/haXv7\/17+Xq91EKHPXfWCn8GJERZDh6exK0I+2xFh9z8WjN9jhOTlq0x7Sz9\/e0hnfBNf5OozY+qtOmHar9gsyj1g7tfuITn9gUlvasWdrwtI91\/7Wvbd8TLScMLGnYKAWe6Ixb+Fx6Fn3boI0PMjyE3+LQf9nfYvd7XI72lcLs0G+sfDZXkBFkOHJ70hthSWp+bxSm\/Xtt9JX7VcODEbjg++7N9AhHYdLfBYKMIPO4Cs+v\/dqvjW542tf2C8+2EUkDxfKMWTC1LAoyaSFa\/r0\/P3rTeaxOLYs\/S4N2\/3+LQ\/\/lf4tjAscOvzFBRpDhhtuTyvGWTFWOp5F111ZMdGrvdQ2PpxJ2v4Gwb9G7ZmqgbiPICDIPfCj4Ix\/5yOipAO1rc1MBuiLTFp1oeL8UPIpBZvyITPkC0GRONffytzj0X+m3uJpWMt9OMdt5REaQEWS4zfakGmTGXA\/hLpj3uIbnrolaXzNjREbtF2TIXZz3jne8IyoupYsz2\/\/a12YvzhycBrCexzoYZMZevxAvrz+PWlF7CL\/F2n\/532Lw3S+nmOU7M6OvwxJkBBluvj0pHm\/xaOrqBhzt8Zp0fl0jc89reOaOZeEtmV0jo\/YLMqS3SxxzFqV9TfmWt7liEt4Z6qownQedxEqQKd5RKrpz1NXyzsL3hNMKTC17rL\/FdJ58+dqpkXfGy408umuZIMOR25PKiYPS3cmiaWdOZN3f7z83oyLTv3DXMrVfkKHT\/QNWteLTPndb\/wghfot+ixoztd8xjO8ftV+QoVh82rMj73znO5dF5lOf+tRS++f2sfY5RQe\/RQQZHMP4\/hFkBJk7OSzczldtL75rC02r\/XP72E3\/C+r4LfotovY7hvH9o\/YLMgAIMgAIMoIMAIIMAIKMIAOAIAOg9gsyfgQAggwAgowgA4AgA4AgI8gAIMgAIMhozAAEGQAEmfsdZAB4GNR+ALX\/0QQZAADg4RNkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAAAAEFGkAEAAAQZQQYAAHiYQQYAAGAfggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAAAgyAAAAIKMIAMAAAgyAAAAggwAAMD9CjLPnj0DAADuKUEGAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQEGQAAEGQEGQAAQJARZAAAAEFGkAEAAEFGkAEAAAQZQQYAABBkBBkAABBkBBkAAECQEWQAAABBRpABAABBRpABAAAEGUEGAAAQZAQZAABAkPHlAwCAICPIAAAAgowgAwAACDKCDAAACDKCDAAAIMgIMgAAgCAjyAAAgCAjyAAAAIKMIHP\/LJrZZNJMUqeL1fMX82Y6mTWLe7RNi9NJMz27vMb+mDbzi\/5zl2fTo+6X5fJP5s3lPu8\/yPqsfguz8yN9N+ezwvZdNvOTY31u+fu8l0Z9z5X9eaeP59V673\/s7r6d0TFd\/H0e6Lffrc91PuexfH8H+twb+37HHIsjPn9M29W+pl3edtsG2vBD151D\/gaXy+qv+z6\/ofK+O2b7ErYz7T65ic8SZAQZRnReg4NRkLkfQeZovwVB5v4RZPYKMscUBpkb2C5B5g4GmQO1XWGQWb12oA2\/sRMo+y43rc\/71ey7E2QeW3sjyAgydzLIBEUhKWDt4\/mzJslZoaBzEL4n6jREZ2PKRXLX98cFbVXEuvfH2xmu8\/ZsyurvSTFadkSCdVjvl3nbUGZeX95PuQ7O6v2z0zDIlNc7uz\/C72nZYE9X+6ZbXrj+UWMefM7prBBk1g3B2XZ\/b7Zp3RBNT4LvoPS9rjsS89P0uaSh2eX9F5l1ym1b+\/38q6Qj0753+ffK9lV\/p\/F3NNiBO898\/mZ5heMn3b\/J8Xi5+f2Fv8Gh7yvZp7nfRbTNIxvmcFnh72i53Ve\/rcKxtfk9r1+T3Y+V9ckea73jYbttm85tekwnr6std3Zaqin5dZ6dFkZkCtu1qmHz7W+icAIl+\/33Op1dJyv\/exx1PBXrR+37q9XeZ8Ntx3V\/N4Xvt19\/ajV7fSydzkaNdCx6v4vyiEz43XWfF7Vd6+8i3W+XZ7PVfrha3uq5MW14UqNLx2r6m1yub9JOpr+v3uuHfzP1IJPus3FtWfGYSduXHd5\/mWvfs8fs1Wecrpa1OL1fJ34FGUHmgQaZ4LGgaEUjBlGRTc6IhcUpKt7h2Yr4c5cNQK7Y7fH+sDFYPh42jGln7zw9c7fLiEzyOevPL++nfEcn3IfhNmTXu7Q\/0o5br\/DG290tO9rv6wJfCjJxUAk\/N3zP6nvJ7Zdu+f3vJvwuKr+LaP2SdSqe8Q6\/z\/i73Z7RrGxfZX3is\/mFzmJldGj7\/srxk+7f3vecnGQIllf+vnLbGf4uMg3\/0KhF0iGJjoHc97Ze3qqjEAfgUiDNrU\/u\/b2R5FKQqZyxry+38PvO1NXodb31KW\/X6vWZ3+AO3\/\/g9zf2eMrVqRHfX7n2VkZT0rbjWr+bzPdbW16lbYt\/y7uM2BeCTPSb3NaF0gnE67fhaQ0pHKtJjcquT+8ETOn1+TZnMMj0fgP9EJH7DovHTG+GSaUtTE\/Ghc\/tWxsRZASZ27lGpn9msz98Xx7KDYpbaTg\/7XiWCvce79+uV1rgx0yZ2yXIBK9LOiej9lO6bZu\/V9a7tD8qHZzelLVSR6o4BF\/ZpnQ\/ZM\/WhY1S7jtLtq\/0u8h03IojDYXvs5uWEYfiyvZV1mf3aUnh59SmOwTrPLR\/s7\/Poe8rc2Ki+ru45jTC3O8x6CAMHyvl9cm9Pxwx3TfI1JebO+4HpuJk16e+XeFva7Oeo77\/MKSHv\/l6DS0eT7k61au16TIqNWxs2L\/27yYXZHLLq9Xs9LlS+1CvnWntLq3vdlRgl+lJY9rwyvKKAWvENTKF15dry7hrZOLRk\/6ofOm3mD1mgu+gtl7x++snnVwDI8gIMvdgatmzQmezeEFhMlQ9SYtAWlx7r5\/Uz3Tt8P60Mc0W+FFn8He4RibpnIy58LJcVOsNU3Z\/DHXcestrXzu2s9F\/vHjmsLdfK6G2GGQKv4vM1J9dg8zmDNpmWtnA9g38ThdjphjlfkO1KV61aULR3zO\/tUJjWwwy2d9FbtrluDnq0bIKnaNxHchaZy3e\/vD12f27c5AZudw9T7T0z8YPTY8tfX7p+w+nTVZGCkceT706Nerk1kDnujIlsXS87\/O7qV0jky4vX7PTY6nUPizq03LP67+v+BhaTVkef63R2DZ8+FgtXqdZCDKl19dry9DUsvJvtPxbrBwzaZAprFf8\/lKQ2a82IsgIMncoyJTPII8p9rvdwWXfO8DEjWmhSB5kRKYcZEadsamOyIw5I1cYYap03OoBZeyITPD3akd7YERm8\/eRv4tDBJl1xy7uKFS2b\/TvdOR31q1nNCWhcvxU9m\/aqJc7evnva\/SI0ph9UDtzWvk9jj2zXlqffUZkwjOv+43IjAgyo0Zk6tvVu84w+fzy9x+MOJ5Vpr6MPZ72HpEZU8Mqv\/0D\/G52CTL5mj02yBxyRGaX\/bdHkNnhWL3WiMyY2rJjkNllRCY3Hay2XuODzI61EUFGkLkrQSY3lzY\/jWB11mNVBLKNa+bag2jOc7Egjnt\/8RqZaH5t5v0DIWJckKntp9q+r1wjE6x3cX\/UGpeksShezzN0jUw0h7x2YXH9GpnoepOBa2Si38VBgkw6l3pg+0b+zsZdIxOfRU+vK8odP+ODzPosYXiGeej7Kv4uCqNYo4NM5rqCUoc7cy1G\/1gpr8\/oa2SS7\/N618iMCDJJmMxfI1Peruj1Y65ZTLYrPCterO1jj6fKdQm1769ce8vtT\/Tbv\/bvZmyQqdXssUEmt73t6\/JBJvd57WvC72D81NXrBJla7SsE+KEakpmCWbyWbNcgM3iNTOaYKV4jU762thxk9qiNCDKCzN0JMrU7iMXTnRZB8a\/c2WnUnZF2f3\/trmXDd6PqXp9Zn24KxIgzs8U7rVWmVSzvMlW4a9ng9gydJYumbxTuvLW+o0\/xrGJw557sxedDd\/lK7xpUmtpV+l3sFWQy32dv\/1S2r\/o7jafPVPdJb9pF\/Hzx+KmOeCVTHNJRweCuZcV1K\/0uCo8Pje5t9tH5+BHCRXAXqeKUmuLvd8RdyzKf0ZsSu+NdyxZjzshGdwCbb4Nu7\/qhwtSyq99j\/a5zpe9\/5C1zdzmexty1rDDSOXRXv+Jv\/5C\/m8z3W15e5Y5X1ZGS3F3ayqPNud9Xru0ad13RLlPLKsdq8bvufmuZu5aVfhuVY3bvILPDXceK+7F2zI0ZkRmzXff03+ATZAQZeHz\/Lsk91J\/Wcfjte7i34Lxq4J2BvOP\/FtYN\/xs5AIKMIAOCzM1sR\/8M+qG37wF39jf\/dgV3OcjE02wABBlBBgAAEGQEGQAAQJARZAAAQJARZAAAAEFGkAEAAAQZQQYAAAQZQQYAABBkBBkAAECQEWQAAECQEWQAAABBRpABAAAEGUEGAAAEGUEGAAAQZAQZAABAkBFkAABAkBFkAAAAQUaQAQAABBlBBgAAEGQAAABBRpABAAAEGUEGAAAQZAQZAAAQZAQZAABAkBFkAAAAQUaQAQAAQUaQAQAABBlBBgAAEGQAAAAEGQAAQJARZAAAAEEGAABAkAEAAAQZQQYAABBkAAAABBkAAABBBgAAEGQEGQAAQJABAAAQZAAAAEFGkAEAAAQZAAAAQQYAABBkBBkAAECQAQAAEGQAAABBRpABAAAEGQAAAEEGAAAQZG44yIxdLgAA8HAJMgAAgCAjyAAAAIKMIAMAAAgyAA\/f2Yeb8n+\/8n+arz3YZz1tLtaLvfixyuu+9\/80v7h81a82P\/i9t7FP3t\/84K80A\/\/d1roBIMgAMBxkDhpmBBkABBlBBuDQQebDT+PnfuzjB+6035cgE\/va9\/\/qEUanABBkBBmA4wSZXvAI\/v7hj2\/GJrahpD+SEQeWcHnbP7f\/\/eL73z8cZDaP59a3W177nnDZ3TJyj+0XZAaDX+Z10ahXJhBtPqMU9NJtNyIEIMgACDJjR2Ti8DH8XBpSyq+JXpcLMj\/28YFpb5Vl\/8qvJiGg\/e\/jzdm+IzKb9YuX0e3HbjvGXntUel1\/f5jeBiDIADD+GplNwAnCQjKqsF1G0LmvBaFsR3793l6Q2Y705EZ\/0tGizfqG4af32PgQ0J9alluf7vO327\/drlwgWz+WC0XpY8lIT\/j50UgWAIIMgCCT6yiXrnEpPZ52uAuvS4NL8e+1dcwtu\/bYdYJM8FgakIJRrfxIV7xP0ill2RGXdPtdqwMgyABQu0Zm7MX65XAQT7cqvS55fMcgs1rv3LLHPrbHxf7RqEluhKY\/1Sz3eD3IbJdXel31pgkACDIAgsxdGJGphY8bDjJheHl\/\/ZqZUSMyu4yyhFPmjM4ACDIAgsy+QeZA18j0LqbvXyOTu14nvkbmpoJMf5SkNPIy7hqZYJ9uXrPal9nPT17jdwwgyAAIMnsEmdr0r5u9a9nNBZmhWzpXb6KQu5Zmn\/02+J0BIMgACDID\/6Dlkf8dmTTMRMHiNoJMZjSpsF+jsJLZz2mY6d+NrB9m3LEMQJABgD3Ub4M8PiACIMgIMgAcXTo6kr9ORZABEGQEGQDu5EhMbYqaIAMgyAgyAACAIAMAAAgyggwAACDIHGoFAAAABBkAAECQEWQAAABBBgAAQJABAAAEGUEGAAAQZAAAAAQZAABAkBFkAAAAQQYAAECQAQAAEGQAAABB5qaCzLNnz4AHQPEFtPmgzRdkAEUNEGQAQUaQAQQZQJABBBlFDRBkAG0+aPMFGUBRAwQZQJARZB6xRTObTJpJxuz8+stfnB5uWdv1nTWL9d8vz6bL5U\/PLn2XihogyHBNXbu6W7t92cxPps384nbX\/fB9DgQZRe3eBpm7FxC6dd0GGRQ1QJDhNoNMG2LatlmQQZBR1O5KODifrcNMWJiS0HO62L7+Yt5M28dOZs3sZBuCoqKyXmYUjrrP6Za1+dxOt179wNUuMxqRGbP82jbkPv9k3lz6nQgygCDzSIPMph0\/W7fzUdvchZj+CdBuOf2+RLzc1XPrtnnT5m77JrPTsL3O9wWKQUabLsgIMo80yPQKQn7kZhMaLsICty1a2WUEhSR6vreM4eIVTy0bWP7O21AIOwgygCDzyIJMvm3MB5k4xKTh51n\/+ZPp+mRoGmTCNr\/\/Welyx\/cpfM+CjCDz4INMfbSjKyjr920KRnzWJT07svp795qBqWKbUZ7+GZrSNTLV5Y\/dBkVOkAEEGUEmDjLpzIlN25xOLUva1l77uw0p3Wdsgk0myJSnifWntGWDjDZdkBFkBJn82ZWggPRCR32YtzgVLHcmZocgU1v+4DZUhsgRZABB5lFPLTtP2uhikKlce9uGimx\/oTy1bFG5FiadthavqzZdkBFkTC1LpnAV7242NsgExWp+mozgpMvYY0SmtvzBbRgMUggygCAjyOwdZNr37B1kSiM\/pSCjTRdkBJnHG2Q2U8VK07KGpoGVi0p0JiV4fWl0ZbcgU17+4Dbc4TuxKGqAIMP9CDKZqWWFWRfDU8uCZRRPbg4FGW26ICPIuP1y6XXF0ZNKUQkuwAtDRXHEpHDxXzjlLQonheUPbkPvjmnO3ggygCAjyIwLMtvpY6X2vBdcBi\/2zwSZ4vTwZ9k7pWrTBRlBxj+IWXht7UxJ7exI6axIXAzb9ywq08OKQaZ61qWyDdXbPyPIAIKMIJO7Q2jUdq4vrk\/DSjobYjt7om1nx10jEy2z\/ZxkpsXg7Ze16YKMIAMIMoAgw362Jy17\/\/yB0RJtviADCDKAIMNdVfq3adxVTJsvyACCDCDIcC9GZfxDldp8QQZQ1ABBBhBkBBlAkAEEGUCQAQAAMCIDODsDGJEBjMgIMoAgAwgygCCjqAGCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ0QZABtviADCDKAIAMIMoIMIMgA2nxAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNVDUALT5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw\/afEFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQMEGUCbL8gAggwgyACCjCADCDKANh8QZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDRQ1AG0+aPMFGUCQAQQZQJARZABBBhBkAEFGUQMEGUCbD9p8QQZQ1ABBBhBkBJlb8eTJk704OFDUAEFG2w+CjCBzq8Xs6dOnO1HMUNQAQUbbD4KMIHPrxWzX\/2rFbHE6aSYn8+YyfPxi3kwns2bR\/vl81n8+4\/JsOup1z0qfs4d23adnl6u\/j1xPFDVAkHnsbf+yzZxMm\/lF+PhlMz+ZNLPzSvs8st2O2udj0\/5r8wWZR1rM2oJ0MmtmJ0kxu6kgc003WigRZABB5kEEmTawTJvZ6TRpQ0cEmbvYPgsy2nxB5nEWszZ8tIVmGUJOF7sHmeUZncnyrE5bELevWxXD1XProrhZ7tVnLp+7Wv7mc4LimSmCy\/WbTDaf1Yau8LHl67r1TNc3KsaF9epGprrPCPcFggwgyDy4k5hX7WQvrOw4IrNsb9uToQPtc9RfSGeBLJrZpu29WlY3SpT2F9JlhG142O5Hr9k\/iCHICDJ3vpitzsisRmLaQhIc8GOCzPI1XSFZB4T165ahoAsD4fB19J74c+IwtdgWs+X7t+sWLjs\/tSx4b7Lc4npF2xjuFwQZQJB5mCcxu3Zxe1JvjyCT9gNy7fM6lKza1f7ruj+vAlCtv5C07WF4KbT\/Zm1o8wWZh1rMujMyQUDIBYxikEkfjwpJrTAGIaFXEIdHgdJg0g8yq89bPR6O9FTWy7C0IAMIMo\/uJOa6\/ducRNwnyGxfU2qfe1PPC8EjOomZ9hdqfZDi8tDmCzIPtpjF07WSKVUjgky9ME16y14WtLQwRn\/fFqB4bm08HSxcz9LF\/pti2lt+Yb2eFYbCEWQAQeahncTstYXx9OvdppZt+wHVIJP7zF5YSYNM\/PnRFPBwilq4HuH2OUGpzRdkHmoxS0cnKgVkrxGZwhmRapDpCt8iOluUBqbhEZlgudGZprFnavrX6yDIAILMQwgy0RTr3jWpRwwy2WtPh0Zkgs9PRn\/yIzLlGRxo8wWZh1TM0oIQdOB7IyfFaVdhGKpcIxPOcx0IMpuL9NLCuPn7elRlKMgEozi9C\/oz6xUXO9fICDKAIPNYTmKG7exxgkw6TSz8Zx\/q18iUgkzc59isR\/Ie18ho8wWZB1rMcmdktkUkvJvY2LuWXRW+s\/Cam3g6WFzMKkFmXWTjwhNOCVuPsoRTyNK7lqXbkglr\/SlkpccRZABB5iGfxAxP7B0uyETtc\/VuYts2fnrVjyhPLQvb6avXnOfXI5rGZmqZNl+QeQT\/KBYIMoAgo+2\/baWghTZfkFHMHBwoaoAgo+2\/O9Kb+ZjWjSDzKILMPhwcKGqAIKPtB0FGkAEEGUCQAQQZRQ0QZABtPmjzBRk\/BlDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNUCQAbT5ggwgyACCDCDICDKAIANo8wFBRlEDRQ1Amw\/afEEGEGQAQQYQZAQZQJABBBlAkFHUQFED0OaDNl+QAQQZQJABBBlBBhBkAEEGEGQUNUAnDdDmgzZfkAEUNUCQAQQZQQYQZABBBhBkFDVAkAG0+aDNF2QARQ0QZABBRpABBBlAkAEEGUUNEGQAbT4gyChqoKgBggygzRdkAEEGEGQAQUaQAQQZQJsPCDKKGihqgCADaPMFGUCQAQQZQJARZABBBtDmA4KMogaKGoA2H7T5ggwgyACCDCDICDKAIAMIMoAgo6iBogagzQdtviADKGqAIAMIMoIMIMgAggwgyChqgCADaPNBmy\/IAIoaIMgAgowgAwgygCADCDKKGiDIANp80OYLMooaKGqAIANo8wUZ4MEVNfsWHM+AICPIADo+gOMZEGQUNUDHBxzPjmdQIwQZQFFTI8DxDAgyggyg4wM4ngFBRlEDdHzupot5M51MmknOyby5POZnn8+WnzM9uzz+9h17W3A8A4KMogaKmhpxR4JM63Rxv4MMjmdAkBFkAB2fBxxkeiMWi2a2DDOzZrF+7PJsWhyx6Z6bns3X72tNm\/lFbpnr5WaDzGUzPwnD1Pbzt89dLfdstnnN6v3h+4L3RNuXLrv\/+ngb0\/XH8QwIMooaoONzv4LM+Sw7YtOFkF7I6YWdUogIg0zpNV2gKD8\/PSmMJO0QZPLbEAYpHM+AIKOoATo+92JqWXHaVxds1oFhEwK64LJZbhqEtsFgcZp8RveazEjP6nO2QaR7T7eMzXvSZQwGtXREJwgupr45ngFBRlEDdHzuW5ApTKtKX58Emf7oSjzaEYWCJCh0oWR2ngkc0YjKdt16y02DSzbIBFPcNtcAhdPebvA6Icez4xnUCEEGUNTUiANMLQuCSi50bDr1hRGZ6wSZ7jXHDTLB9LJSuLnpu7c5nh3PoEYIMoCipkYc4BqZzTSwbWBIR0viKV\/DQaY\/taw\/TWz81LL9g8xmKlrv2pfM1DIcz4Ago6gBOj7362L\/9NqTbQDIT7saDDIHvdh\/3yBTGnVZLa90w4J4hAjHMyDIKGqAjs89uGtZFxIWyW2Vh6aO5UY4kmWcXeP2y0cIMrm7r7nQ3\/EMCDKKGqDjA45nxzOoEYKMHwMoamoEOJ4BNUKQAXR8AMczIMgIMoCODzieHc+AIKOogaKmRoDjGVAjBBngoRc14GFQK0GbL8gAzuACjmdAkBFkAB0fwPEMCDKKGihqagQ4nh3PoEYIMvfPkydP9uLgQFHT8QHHs\/YeBBlB5lYL29OnT3eisKGoCTLgeNbegyAjyNx6YRvz3\/n5eXN5ebn8c7+wLZrZZNJMErPzfdbpspmf7PveKxfzZjqZNYv0z7fhfLbeF9NmfjG8vyYn8+by0Otwl\/aHjg\/geL7z7X34Xy7ILE4nzfTscvDzxr7uYO3todpQbbcaIcg8rMLWhpjnnnuueeUrX7kMM6UgE4WP5YF3jUByiIP\/ll2eTQtFPLO\/HsH+0PEBHM+CzF0PMtpuNUKQeUCFrQsxrfl8Xh2RSQ\/uthhEhWVzliM8g7EagZmeTNejONsRmbQILpd3uugva\/PZ4dmSqwKwKQT9UZ5o2dn1Sj+jUlAy71+ua\/dYt86jimG6ru1r12eF1tszOy2Meq3D43Y9SvvjWXW7l\/vmdJYsa\/tcebt0fADH86MKMssAcdUunUyiUYywDRxsa8O26qrtidu8q1BxErTB2bY\/CTKPsu1ef\/7pLLv+D6HtFmQUtZ0LWy7E7BJk+kOj3TDt6oBbHUzhn5NiEJ1hCR6PlpUEpsJwbBSCegUmt17Ba2pnaKKRp3hb4s88VDHcNgrLwrTZP\/H6bhqa0vB0Zb1XBS\/zut73kQ676\/gAjudHF2QqbcnmdcW2dt3mhO1m0uZt2sNa279pnx5r273+cxTm1st9IG23IKOoVQtbG1Re+9rXDoaYfYNMdnRm+ff1iMym0BQCS22YNTxISwf\/8qAO\/hyefcmuV1xcRg9nB58zVAzjebbdtg0Vw2Cd0jNQuWH12v4orHfYqJSDpaImyIDjWZCZRaMeYbsXvm58W1tp82rt76Nvu9O+VPD5D6TtFmQUtWJha697aa9\/aUNLG2ZqIWanIJMWhmwBSA\/+8O\/bP6eFJRomDYdXixfIbQ\/qXnEtFabecG9+Lm30XHEU6HDD04tMIe6tx0AxrK13PKUvXp\/sdAFFTZABx\/Mjnlq2bUuqQSbX1vbCSqXNq7X9vROaj63trnz+A2m7BRlFrVrYwjBTCzH7XiNTLgy1ILN9X1u8ormwhaJQu9PHqqguomHV8npltiX3umuc1RlVDGujUkcckSkFmYPdXU7HB3A8P64gU2wPRwaZWttfaAMfT9tdDzIPoe0WZBS1wcLWjsS89KUvXYaYV7\/61TsUthF3LUvOumzniNaDzPbMSqmYJfNCa7cs7C6Q653NyKxX8t6bnmdbni9cC3DJdrTL2PMamVyQibfHNTKCDDieBZlxQabcBxi6RmZk29+tx6Ntu8tB5qG03YKMojaqsLVhphZirvXvyGTvJDIQZHo3Awge6+6Qcp5OISvc6WP9XK+oFe5wEg2F1+aXFu7Esl8xjIfFp2fzUcPT5fWo7I\/aXcuyIzLhfje1TJABx7MgUw4yXRuavWtZpm0ebPNqbX86XevRtd21EZmH0XYLMoraUQsb6PjYt+B41t5fSzp9DAQZRU2QAR0fcDwLMnevvY9HCyaTxzXtCUFGkDlAYduHgwNFTZABx7P2HgQZQQbQ8QEcz4Ago6gBOj7geHY8gxohyPgxgKKmRoDjGVAjBBlAxwdwPAOCjCAD6PiA49nxDAgyihooane1Rrj7EAgygCCjqIGidi+DzNOnT3ciyOB41uaDGiHIAIrarQeZw\/3Ddut\/kO50ET\/e\/gvbJ\/Pmcv387HxovRbNbDLmdc8Kn7PPvmg\/s\/sH9Mau520r7aeR638xb6Y39S+f3+RnCTKAICPIAILMTkGmDRKns6vOddJhvakgc+1QcN\/+JfBr7idBRpABBBlFDRQ1QeZZszhddarb\/0\/PLncMMuvRnMlkHYaC1y07wevnws7wcrnT1XPt8rvPSUdmok70qvM\/6SxHj4LPXoaZ7Xqm23J5Nt2OOJXWK1pesi\/SgBesy2Z7l+t\/tQ+idRqxn3IjMuttn52mnxPuh\/W6F7dnvd3rdZmdbvfBcv+cTIPtjLd98z1E38HI\/eN4BgQZQQbQ8Tl+kFlsR2LaTmsYJEYEmbZDvOn0rjv4YYe7e0\/\/dUEnf\/M58ejKNnysPn\/TcV52rrvXFaaWRaEoXP\/yekVhJ9wvvRGKZB2z2x9P1yvvp1qQ2W5z9P5MwMvu595+KqxP9\/do2+NAtRi7fxzPgCAjyAA6PjcSZJbTyhZBRzoXMEpBJn08CRJhRzfsfKfPJZ8TjhDkR4HC8FIIMmEnvvbZxY76Htf3JMtOg1h2P1WDTO672H97wr\/HwWV4ZGjv\/eN4BgQZQQbQ8TlGkFkEU5d6U4YGg0x6rUcaZNJlrzvm6RSy4O+bznJ6bUZveQNBJvhz1AGvrVeyP0rXsPT2WRhkgu3afm5lP40IEMNBJr89aVhJg0w0NSyanhZsf7IeY\/aP4xkQZAQZQMfnuEEmPeuf6yRfZ0SmdCeySpDZfH40UpQGgREjMkHHvbsGaLc7pBVuIlAcTaoFmX1HZEYGmcL2DI3IbINMMnWvth538CYL2nxAkFHUQFF7ZEEmur4jN8oy4hqZ8jUicfhYXXRe6HxnrmeZ9IJLuqzhILMdZQg74uX1ijv3hWtAoiCzXtfBIFPbT9cMMrX9PHCNTDHIhOsXfNao\/eN4BgQZQQbQ8Tl2kInPwmcu4N\/1rmVXr52flu5aVrjeoxQAinffatd50ZtClt61LFq39LqO0nold0Yb3N72vefl0ZF4RKSyn3YNMpv1zN21LB4l2e63WTOvTS0Lp6itR7GWz1fuHGdqGSDICDKAjs8t3rWMx+GyGFwdz9p80OYLMoCOjyDD3ZHeCOAO3nHM8QwIMoIM8AiDzD58\/zietfmgRggygKKmRoDjGRBkBBlAxwdwPAOCjKIG6PiA49nxDGqEIOPHAIqaGgGOZ0CNEGQAHR\/A8QwIMoIMoOMDjmfHMyDIKGqgqKkR4HgG1AhBBtDxARzPgCAjyAA6PuB4djwDgoyiBoqaGgGOZ8czqBGCDKDjAzieAUFGkAF0fADHMyDIKGqgqKkR4Hh2PIMaIcgAOj6A4xkQZASZG\/DkyZO9ODhQ1HR8wPGsvQdBRpC51cL29OnTnShsKGqCDDietfcgyAgyt17Ydv2vX9gWzWwyaSap08W93z+XZ9NmcjJvLtPnLubNdDJt5hf99yxOJ8307PL467dch1mzSP+8y7ZlvrfZ+Yj3n8\/y+0XHB3A8P+D2ftXG7d\/eXzbzk\/V7vvI1I9qt1etX7VLb18i3uzVj2+Qba7vveRuqRggyDzbIxB3gsPg8riBzK\/YNMum2tcV1zHIEGUEGHM+PN8hEwWUdTkaFmba\/sFtbFb9XkEGQUdRuJMgkRWHZ0e7O3nRFLC5Kccc6DELBGZzwc9ZhYnoyKXS+k5GirsiuO\/2z08IoxLIz3z4+vXrNNUZkRn\/OJPmMeHs3z6Xbuwkv4XbOmr+bFON2v+aKcz6kBd9JGo7CwpsU4fAMXfhZ0Zm7OzJCp0aAToogc8ggk2kTi23+ZNO+zt8atDHLNuWqvTwJnr8I+wJhuxg\/NzSbIOqLFD4nnKEQvTbbRgfbcTpL2sykTxIuI1zHtD3t7SsEGUXtloNM+Njqz11xWBbB9QHc\/rl73+K0LQBhwVv9OSqaywM+LBql4rUqcHGQit+XW594mesiea0gU\/ucpBivtzFuJIL9mG5vaWpZFDLaZefXc3BEZmSQiZYTruPI9dDxARzP9zzI9KaAhW172I4WTpatO\/NR27v8jPLUsmLfYCjIZD8nd\/J1uI1eBaBCnyTpJ0Rt5aZ97J\/QvbFRITVCkFHY6tfIxAUh6BAHB\/fywO6K1em8WVz9fdMJXj6ehqSgqO00vWvRO2uyeV9lpKE4\/Ds6yOQ\/pxciisPMle0tXiMTDN23jxeGr\/PXyBSWX9xPSWAMt\/+ODp2rEaCTIsgcMcikU5R77VMpyGzfE\/UNskGm0jcYDDK5z4lfV26j0+ltlb5FbTpZcXkIMoranZlaVr7uIjnw24O5\/X9bTK5e2xaS7VmJSkgaui4kGdKdjJgyNTpg7DC1rPg5ve0KQ0nmAvxsIMyPnnQjXbWzO+m29hqnHYJM6cLP7HC9jg\/geH5gQSboB\/Ta3vAkWSXIBO3R2CBTPIFanVqW+5xMkMm10b22vzIdO3djhNxJ07DNd92MIKOo3cEgUxmRWRWpq+fWAWb53Ok8mIZUOVtRDTLpOu137cdRg0z2mpF0hCMdkRkXZFYjWvPqdK7+1LJ4CmC6zPyw+NibOtydmz+oEaCTIsgc8RqZ6mj8IYPMuJGMvYNMto0eGpFJ2uGxfY3M+iDIKGp3JchUrpHZXhsTzFld\/r0wUhDOQd0hyPTnsRaKS\/S+Q1wjU\/ic5P3bfZIEmXA+7y5BpjtbVTm7M+4amcK+KI5ibb\/ruCC7RgZwPD+Ou5bl2t8RU8t2CjKVvsEBgky5jR66RqYUZAptaOaEoWtkBBlF7c4FmdIdTPJnLfq3QIynLxWvvalcAzI9W5RHNnKjMN2UrrPCNSaZ6V9dMRsVZGp3KgkfvyqWxeX15h1PBvbjmLuWxQ3Sdh9ebdvZuLuWxeFlYmoZ4Hh+aEFm6N+RidrIESMYo4JM16bk71pWamPGBpmuvcvetSx3onD52nllallyp7Xz\/PZG09hMLRNkFLXbKWzcNS4g1PEBx7PjWXt\/VGP\/7TUEGUFGYWOk5LbP6PiA49nxrL0\/hPQGN04YCjKCzK0Xtn04OFDUgIdKe6+9R5svyACCDCDIAIKMIAMIMoAgAwgyihooagDafNDmCzKAIAMIMoAgI8gAggwgyACCjKIGippOGqDNB22+IAMoaoAgAwgyggwgyACCDCDIKGqAIANo80GbL8gAihogyACCjCADCDKAIAMIMooaIMgA2nxAkFHUQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyACCDKDNBwQZRQ0UNQBtPmjzBRlAkAEEGUCQEWQAQQYQZABBRlEDRQ1Amw\/afEEGUNQAQQYQZAQZQJABBBlAkFHUAEEG0OaDNl+QARQ1QJABBBlBBhBkAEEGEGQUNUCQAbT5oM0XZPwYQFEDBBlAmy\/IAIIMIMgAgowgAwgygDYfEGQUNVDUAEEG0OYLMoAgAwgygCAjyBzGkydP9uLgQFEDBBntPQgygsytFranT5\/uRGFDUQMEGe09CDKCzK0Xtl3\/Kxa281kzmUw2pmeX8XMn8+Zyl\/W7mDfTyaxZ7PyeSbQeS6eL43weihogyDyy9n5xGrexs\/Njtunr95T+vM\/70eYLMgpbP8RMm\/lF99hlMz8Jwsw+QWYfy0IVrkdr0czGFFpFTlEDEGSq7f0yxITt+foE4lHa2NJ79gkyaPMFGYUtX9iS0JIrIOsgM9+cxQkLyypo9EZPeu+fNbOT7nVpWKkFmVXhXa3fal23Bbf97PXr04IXjjDdRAhDkAEEmXvY3i\/DzbLtHm5j52fTTDu+el88oyPsG1y1zZs2uvR4OgNkxOt6bfx6\/U9nu83oQJARZO5xYSuEh9y0s1VxWxesoOhtimK4rDTIZN+\/64jMyCATLafyeShqgCDziEZkLrsgkm0Th9rY7fuWy1kHiOWfN8tr3zMwnaw2ZSycAVJ9T7lPsnl\/b7YJ2nxB5oEGmYGh22Ux2L4mLlpp6CgFmRHvL1wjsz17NC7IhAX2RqfGIcgAgsxdvya2NJNisI0NQ8H2uXqbfoQgk7bpmz5GOuIUrL\/2U5svyDzyEZmgaERFK7lJwKQUZErvr61LEoB2CjK9QGSeraIGCDKCTHm62Q7Tt5OQEN5AYPP+IwWZ3snKzXOV9dd+avMFmUd2jUw4PFwMIumF+JURmX2CTO\/CxKRIFaaylUeMUNQAQeaxtvdBu55ON8tdI9NrY4P2uXgStDblezjIRCFlzxEZQUabL8i4a1l8XcnIILMaCTlskMldIxPN0R28RiZzlxYUNUCQeax3LYva31UbG47IlNvY7UnPMHBsb8iz7zUySRt\/zWtkBBltviDj35GJC10liITTuKZni20ROViQ6T4jLmCrz5uPu2uZaWWKGiDIaO+z\/45MNCNjoI3d3rWsfPfSOEjk7joWPB71I64+6yzsL5TeP3DXMkFGmy\/IPPY5syDIAIKM9h4EGUFGYQNBBhBktPcgyChq28K2DwcHihogyGjvQZARZABBBhBkAEFGUQMEGUCbD9p8QcaPARQ1QJABtPmCDCDIAIIMIMgIMoAgA2jzAUFGUQNFDRBkAG2+IAMIMoAgAwgyggwgyADafECQUdRAUQPQ5oM2X5ABBBlAkAEEGUEGEGQAQQYQZBQ1UNQAtPmgzRdkAEEGEGQAQUaQAQQZQJABBBlFDdBJA7T5oM0XZABFDRBkAEFGkAEEGUCQAQQZRQ0QZABtPmjzBRlAUQMEGUCQEWQAQQYQZABBRlEDBBlAmw8IMooaKGqAIANo8wUZQJABBBlAkBFkAEEG0OYDgoyiBooaIMgA2nxBBhBkAEEGEGQEGUCQAbT5gCCjqIGiBqDNB22+IAMIMoAgAwgyggwgyACCDCDIKGqgqAFo80GbL8gAihogyACCjCADCDKAIAMIMopazZMnT\/bi4EBRAwQZ7T0IMoLMrRa2p0+f7kRhQ1EDBBntPQgygsytF7Zd\/+sXtkUzm0yaSep0ce31uzybNpOTeXO51\/vb9Zo284vMcxfzZrrvOi\/fO2sWCoSiBggyj6q9f9YsTifN9Oxy8PPGvu4gwnb5oG30ZTM\/mTSz8\/2X0e6HXl9jr\/Wr9GkQZASZ6weZ+EC\/\/sF\/\/CCTPpfbDkFGUQMEGe39vQkyB3WgIJOcJF32bXY+2SvICDKK2g0GmaCIrUPD9CQ4CxGNiCTF53y2fnzazE67IJMWk\/SADkeF2uWtXt8tp3fgZ4NMWHgrn5cWzM36Tq4RuhBkAEHmngWZtv07mTWzpL1ddtTX7WL02mxbGbTfp7OkrU36DuEyNv2OpP0f1Uav2\/jT2cCMjPXrzrZ9lm570qDWbnMuuOWCzGq\/deuSzGrpXhtt\/19uXpP2aaJ94eSqICPIHDjIBI+tQ0scCuJisDmgo9euw8hgkImf257puM6IzMggEy1nvb4HmFKHIAMIMvciyKRt9roNjF5XaSvDjv4qAIVtbdAOJ+12NGOjNLUs16dYflbYv+i2I9df6E6KZtr8KIy0r8v3N3JBZvvYavnZ\/ZTtO3WfEfdvSiEKQUaQucY1MvkClhnRKBaG8O87jJBc4xqZbSEY93m9qW\/p+iPIAILMgw4y2\/Y3nDIVvq7cVuZmV8QjMsWpVGF7WwoyuT5FMGtj2+aX+gvp68Ltat8TfGah7c9eI1PsJ9S2vxxkEGQEmSNMLSvOXU0KX3hAlotdJVj0lrfHNTK9ZewQZA5yER+CDCDI3MepZds2uxpkcm1lrbOeOUnZCwUDQabXp9g8NzRdvXyNTLhd7Z\/b52ojItmpZdnp9MnUsd72J+sYnpB1AlWQEWRuMMgcYkSmN\/x6zSCTTnEb+Xn7XbCHIAMIMo8syGTbyqERmcpJ0AOMyIwNMulsjWj7T+fFaWXDQSbtP9WCXLlPoy8iyAgyNxlkatfIZK5TCYNMdh5t8vnbMzDXv0amPG83d41Mui0IMoAgI8jU2sr6NTKlIJNc47LnNTJjg0z8OZkbDVXa\/V2CTHX7KyHHNTKCjCBzo0Fm7F3L1ncKSW4EsLqWZV4eYk0L3Q53LVsVkf6d1aLPq90RxbQyQQYQZASZzXSy7F3LMic3B9va9G6k5+Hz3TJ2vGvZ2KllwV3Lindo3SvIpHd4W2zXq7j9\/TvDOYEqyAgy1yxsoKgBgoz2\/lqK17zeVS66F2QEGYUNBBlAkHmE7X04ylKYQXFXrWdtmNIlyAgyt1zY9uHgQFEDBBntPQgyggwgyACCDCDIKGqAIANo80GbL8j4MYCiBggygDZfkAEEGUCQAQQZQQYQZABtPiDIKGqgqAGCDKDNF2QAQQYQZABBRpABBBlAmw8IMooaKGoA2nzQ5gsygCADCDKAICPIAIIMIMgAggwAAIAgAwAACDKCDAAAIMgAAAAIMgAAgCAjyAAAAIIMAACAIAMAAAgyggwAACDI2KkAAIAgAwAAIMgAAACCjCADAAAIMgAAAIIMAAAgyAgyAACAIAMAACDIAAAAgowgAwAACDIAAACCDAAAIMgIMgAAgCADAABwh4MMAADAnSDIAAAAggwAAIAgAwAAIMgAAACCDAAAgCADAAAgyAAAAA\/L\/wdCDxQclZwmpwAAAABJRU5ErkJggg==","width":424}
%---
%[control:button:59a5]
%   data: {"label":"Run Calculus Flashcards App","run":"Section"}
%---
%[text:image:6e9f]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
