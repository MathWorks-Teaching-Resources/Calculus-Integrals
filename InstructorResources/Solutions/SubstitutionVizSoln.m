%[text] %[text:anchor:T_BBF203C6] # Substitution
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%[text] A thorough understanding of the integral as an antiderivative can only take you so far. Just as with derivatives, there are integration rules that can be built through the combination of functions as well. The method of substitution that will be discussed in this live script applies to nearly every integral you will ever calculate. In fact, you will likely forget that you are even applying it in some cases because it will become so natural to use!
%[text]{"align":"center"} ![f of flower](text:image:89e7)
%[text] The method of substitution allows you to replace a complicated integral with a simpler one.
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:6cb9) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:8f9b) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
clear g fa fb fc fu f dxGrp dgGrp ax ax1 ax2 ax3 AreaGrpdx
  %[control:button:3049]{"position":[1,2]}
%%
%[text] %[text:anchor:H_396A5897] ## Visualizing changing variables
clear x
syms x %#ok<NASGU>
%[text] It can be counterintuitive to visualize how a change of variables affects your function or the resulting integral. Use this to investigate different combinations of functions. 
%[text] %[text:anchor:H_BDCABFDA] ### Set up the functions to use
f = @(x)sin(x); %[control:editfield:19e8]{"position":[9,15]}
g = @(x)log(x+5.001); %[control:editfield:5dbd]{"position":[9,21]}
%[text] Choose a left endpoint $a${"altText":"a"} and a right endpoint $b${"altText":"b"} such that $a \\leq x \\leq b${"altText":"a \<= x \<= b"}:
a =-3.4; b = 2.1; %[control:slider:28e0]{"position":[4,8]} %[control:slider:694e]{"position":[14,17]}
if a > b
    warning("This code assumes a<b. Please set your values accordingly.")
end
tVals = linspace(min(a,b),max(a,b),10000);
gVals = double(g(tVals));
fVals = double(f(gVals));
%[text] Visualize the graph as $f(g(x))${"altText":"f(g(x))"} vs $x${"altText":"x"} or $f(g(x))${"altText":"f(g(x))"} vs $g(x)${"altText":"g(x)"}:
xOrg = "indX"; %[control:dropdown:62b6]{"position":[8,14]}
if xOrg == "indX"
    displayXvsF = 1;
else
    displayXvsF = 0;
end
clear p2
figure

[ax,p1,yM,ym] = CreateBasePlot(tVals,gVals,fVals,displayXvsF);
  %[control:button:77f2]{"position":[1,2]}
%%
%[text] Choose a step size and an initial point:
Step = 0.75; x0 = 1.1; %[control:slider:46be]{"position":[8,12]} %[control:slider:428c]{"position":[19,22]}
  %[control:button:97f9]{"position":[1,2]}
Flag = "xdx"; %[control:dropdown:2004]{"position":[8,13]}

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
%%
%[text] %[text:anchor:H_12AE0847] ### Covering the entire region by intervals
%[text] Set up the functions and the bounds to use. 
clear f g p3
syms x
f(x) = sin(x); % sin(x)  %[control:editfield:5989]{"position":[8,14]}
g(x) = 1/(1+x^2); % 1/(1+x^2) work well, used to use x^4 %[control:editfield:3ca7]{"position":[8,17]}
  %[control:button:40e7]{"position":[1,2]}
a =-1.2; b = 6.9; %[control:slider:949a]{"position":[4,8]} %[control:slider:5505]{"position":[14,17]}
%[text] How many intervals?
NumIntervals =73; %[control:slider:4509]{"position":[15,17]}
Step = (b-a)/NumIntervals;
if Step < 0
    tVals = linspace(max(a,b),min(a,b),ceil(1000/NumIntervals)*NumIntervals);
    StepSize = ceil(1000/NumIntervals);
else
    tVals = linspace(min(a,b),max(a,b),ceil(1000/NumIntervals)*NumIntervals);
    StepSize = ceil(1000/NumIntervals);
end
gVals = double(g(tVals));
fVals = double(f(gVals));
dgFunc = diff(g,x);
dg = dgFunc(x)*Step;
p3 = plot(gVals,fVals);
ax3 = p3.Parent;
title(ax3,"Show the signed area between $f(g(x))$ and the $g(x)$-axis","Interpreter","latex")
hold on
xlabel(ax3,"g(x)")
ylabel(ax3,"f(g(x))")
AreaGrp = ShowPosNegArea(fVals,gVals,0,2,0);
%[text] %[text:anchor:H_F867DE38] #### Animate Visualization by Original or Substitution-size Steps
%[text] First, show the positions of intervals defined by a constant step size $dg${"altText":"dg"}, then subdivide the same region by intervals defined by a constant step size $dx${"altText":"dx"} under the map $g(x\_k+dx) = g(a+kdx)${"altText":"g(x\_k+dx) = g(a+kdx)"} where $x\_k${"altText":"x\_k"} is the initial point of the $k^{\\text{th}}${"altText":"k-th"} interval. Equivalently, $x = a${"altText":"x = a"} is the lower bound of the corresponding interval.  
idx = 1:StepSize:length(tVals);
ConstdgDomain = linspace(gVals(1),gVals(end),length(idx));
ConstfVals = double(f(ConstdgDomain));
RunAnimateStripes = true; %[control:checkbox:48dd]{"position":[21,25]}
if RunAnimateStripes
    delete(ax3.Children(1:end-2))
    dxGrp = hggroup;
    dgGrp = hggroup;
    subtitle("With constant $dg$","Interpreter","latex")
    dgGrp = AnimateStripes(ax3,ConstdgDomain,ConstfVals,1:length(idx),dgGrp,1);
    dgGrp = AddStartEnd(ax3,ConstdgDomain,dgGrp);
    dgGrp.Visible = "off";
    subtitle("With constant $dx$","Interpreter","latex")
    dxGrp = AnimateStripes(ax3,gVals,fVals,idx,dxGrp,1);
    dxGrp = AddStartEnd(ax3,gVals,dxGrp);
    hold off
else
    dxGrp = hggroup;
    dgGrp = hggroup;
    dgGrp = AnimateStripes(ax3,ConstdgDomain,ConstfVals,1:length(idx),dgGrp,0);
    dgGrp.Visible = "off";
    subtitle("Showing constant $dx$","Interpreter","latex")
    dxGrp = AnimateStripes(ax3,gVals,fVals,idx,dxGrp,0);
    hold off
end
SetXTicks(ax3,[gVals(1) gVals(end)],["g(a)" "g(b)"])
%%
%[text] %[text:anchor:H_6B672816] #### Show Only One Set of Steps
%[text] If the checkbox is selected, then the plot shows the region subdivided into constant-size intervals $dg${"altText":"dg"}. If the checkbox is not selected, then the plot shows the region subdivided into constant-size intervals $dx${"altText":"dx"}. In the latter case, the plotted interval ends occur after lengths $dg = g'(x)dx${"altText":"dg = g'(x)dx"}. Because this depends on the value of $g'(x)${"altText":"g'(x)"} it can be a linear transformation, but it can also be highly nonlinear. 
Flag = true; %[control:checkbox:4637]{"position":[8,12]}
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
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_0AAABA39] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:763d) at the top right of the Live Editor pane.
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

function varargout = ShowPosNegArea(fVals,dVals,f0,overlapsFlag,pnFlag)
%plot(ax,dVals,fVals,"k")
hold on
[posRegs,negRegs,allRegs] = FindSignSwitchIndexes(fVals,dVals,f0);
cols = ["b" "r"];

[numPosRegs,~] = size(posRegs);
[numNegRegs,~] = size(negRegs);
[numRegs,~] = size(allRegs);

if overlapsFlag == 1
    alphaVal = 1/ceil(numRegs/2);
elseif overlapsFlag == 2
    alphaVal = .5;
else
    alphaVal = 1;
end

if pnFlag
    posGrp = DrawColoredPolys(fVals,dVals,posRegs,numPosRegs,cols(1),f0,alphaVal);
    negGrp = DrawColoredPolys(fVals,dVals,negRegs,numNegRegs,cols(2),f0,alphaVal);
    varargout{1} = posGrp;
    varargout{2} = negGrp;
else
    allGrp = DrawColoredPolys(fVals,dVals,allRegs,numRegs,cols(1),f0,alphaVal);
    varargout{1} = allGrp;
end

hold off
end

function polyGrp = DrawColoredPolys(fVals,dVals,Regs,numRegs,col,f0,alphaVal)
polyGrp = hggroup;
for k = 1:numRegs
    if ~isnan(Regs(k,2)) && ~isnan(Regs(k,3))
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
        patch(x,y,col,"FaceAlpha",alphaVal,"Parent",polyGrp);
        pause(.1)
    end
end
end

function lineGroup = AddStartEnd(ax,x,lineGroup)
plot(ax,[x(end) x(end)],ax.YLim,"r-","LineWidth",2,"Parent",lineGroup);
plot(ax,[x(1) x(1)],ax.YLim,"c-","LineWidth",2,"Parent",lineGroup);
end

function lineGroup = AnimateStripes(ax,x,y,idx,lineGroup,flag)
% x and y are the same length, so this is just creating and adding to
% the relevant lineGroup collection of plotted lines at the index values
% given by idx
% if the flag is set, display as animation
if length(idx)>1
    p = plot(ax,[x(idx(1)) x(idx(1))],[0 y(idx(1))],"k","Parent",lineGroup);
    for k = 2:length(idx)
        copyobj(p,lineGroup)
        if x(idx(k))>= x(idx(k-1))
            lineGroup.Children(k).Color = "k";
        else
            lineGroup.Children(k).Color = "y";
        end
        lineGroup.Children(k).XData = [x(idx(k)) x(idx(k))];
        lineGroup.Children(k).YData = [0 y(idx(k))];
        if flag
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
%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[text:image:89e7]
%   data: {"align":"baseline","height":109,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK0AAABtCAYAAADTR+H3AAAXZklEQVR42u2d+5NVxZ3A7zl3gGFePIaXA3ecgMKMjKjhJV5gfYCCyYgY0PEBaBTBiMNmMaC7wmAslN0lIYpavgJbFdeksCKJlf1lrcTUbu1Wpcotdrcqla3aVUzt4zfhT+g9nz70cObOOfd0n8e9d6C7qovh3vPo7vO53\/Ptb3+\/3y4IW2wZZ6Vgh8AWC+0VUM6dOyf27t1rB8JCO37KqVOnRKFQENsHBxq2jRcuXJDVQmuLLEO7HhK77nBEf3exIcE9e\/as6O6aLj799FMLrS1+WbOiV\/zkO4744lVXgnvPxltTSTXgygqwHx57Wb4F+ksFMTw8bKG1xS8dbc3it4dc8dW77gi4S\/p6EoGLVOxomyQrf6dRB5D6pRlNsm37Bxxx6Pm9FlpbLg6aJ8kAVlUJrifZlvSWjMDl2CXX9Yj9g1Nl5e8k4MvrePfmx0NbaBPQHtz3qIXWFv9V3v+1tlHQqjp4i2ME7tDubaJ8fav46pc9svI3n5lKau7JvYNtQX1Zu+oGC60tPrTlhYVQaE3A5TodbRPE2XfnjUDL33ymq99K1aJ14hhgqR8\/60G7crGF1hYhjh8\/HgpJsAJ1nI67pK8kjjw+fQRYVfmM73SBff2x8LYA7ZqlPRZaW4QYfuGA1BerQasmZ1HmsB8ee0X0z28eA6yqfMcxSYFV0HZfNdVCa4uQk5s4aKuBi\/TtaG8WHx+ZEwkt33FMmKTWAVZVJowWWlvEM09s0YJWgVua4UrpPCKpDz43avIVVTmGY8PMYzrAWmhtGSnMyJmZ60BDxWba0VIUJ999Q54fJ2UrpW2lWStOn7bQ2hIKLfqiLjhKv+SV\/v3Df15Vlw3TbU++92YiYC20tqSClnrkAUfMnu692odmaEPLsSw4cM+NN5rf00JrSypo\/2HYFa3NrjawqrZNdsXCrksrXRZaC23NoN21vigGb28zhpZzvn1b0fh+FtrLtPzff38htm1eJmfp+MjqrEQlhRbz10+en2UMLedwbl7Q0mf6zhjsfGCFHBMLbYOXvu4J4tCOmaLc3yz6F7TLB82KFD4AZ86cyQTas0d9gEyBVZVzuUYW0NIn+kYfpQuj12f6\/rNDc8eNZL7iocWs9PtTJXH+V72jzE27Bjq82XurfJADG1aNAJwEWkxkgJEUWs41MbNVQkvb6YOE1OsTfQua3ei79HsImNgstA1c1qxcNPIAg+AGnVjwB8D8hB\/tddfMEu\/tNANo\/6Ym6XqYFFrpuuhdw1S6T2l1ZZtpO30IOucEgVU\/VMbCQjsOyrbBu0cBFQZuUAIzMUJibVnVpP3KLve6ifTZoF7LNXRhHVzdJNtIW6stZAT7yhgwFlcEtOfPnxenT58WBw4cEOvWrRPTpk2TAzZ\/\/nz5\/yeffFK8\/fbb4vPPP2\/IAcBra+PKlsiHGVaRWAre\/ZuK4o8nYqDta9JaBav2Y+Ea1e5BG2iLgjVMqlbrI2PAWFzW0ALr0aNHRyCNq0uXLm3IAWA9vzR7cuxDjYL3lsWTpH\/Br\/+iftByb9pQ9toSB2tU3zpam1KF+zQ8tJ999pmUpDqwqorE1S1IZaR0sJqcbzwZI+brR12JwFU+sB0tjvjbPcWaQ8s9uXeYb64usPSdMcijINyyfpaFJMDqStdgRSrrFjpWef4nn3ySq14b9dB1wZUPvsUV+waKNYOWe3HPsB+cSV\/oe576LM8+DQ+poEUCJgHWBLqwDqIv51kwCVVzZDEBt79n4hhw84CWe3CvtMAqx5wwm3SWBfWw8rkiAHOHNkwCqgrMABeEE8iZpPE64DWR5EeBGlITe21bdX1QF9wvPuiWMB3eWgxYD4rpoe29dD2uzT24V1pg\/bi0SbmPL4BmNc\/RhhYYq02ydKBM8qMA+iSTK5UAI1irxWxtf3CTNLonffhhqoLScTFBpbXTco1LOqybiYSl0mf6XouC8MpCTdCGduvWrZESNgtgw34UQFyt7NixI7RNpVnNYnX\/1DGVGXLlsQT\/kTHmzltXiPaWYmoIRjlxexOk373kiv33uLE\/iDiwuAbX4pq6UlunrXiRLVm8QK70UYnMIKSISoYaqvrRp7UuwEnlm5T\/m5pDC7o3i5Ky2GDz0nni9GAZb+W92pIscapwGJZkqYTQTG1ztfxddcFFQvZ3+\/fo75mQGFrOldfwrqUrsXXaSF\/nzbg0BmocgpWcZUQXl\/uapTDguWBpWLPsGrHt\/g0ylCjuLRY3ZzG1JmhByys6CtospCzgm0pZVT768H35ukzib1pZn9vkiK7OYmZQ+MBNFHs3+n4AujpopY7MuVyDa2XZNvqqG29WueoG4Di2E03Rf\/VE39Fo0VyZnK+at1yYtKWaSNtC0l+HCVh5SNlR+ujgQCLP\/rA6d7qrHV2gA4ev3zqid56b2DVxYZevFujosbrASinb6WYyZsHoDJ4dro55SlstaKOsBmlsbdV0WdNZJa8mUlsyaGkHHlWjNLOYycw86Mi9ui+5E\/iKa\/XONbFw8HZKqlZFxsEFAjjjrERp3tqpoM1Cnw2bUSa5rp8PYEIiB+0wBxeTiZOOr4LUBT1paaIicGxLsy+9TH0J4iZ2ug44OhUVgzbqAFttYq8rBLWgTbtgYDrBS6onM2j82lUazqT1939tNkvXgQZJ2VsqGgc29syOl7ImwCqrBn2sF7BR8yRdm3xdoc1iJllZhp56bFTKy6TV1B6q49Y4tdURc2cUta83d+YE0dnharsXmtqPswCW0PikCaHDJmQ6q2R1hTZsApaFysHELAtw39rpg2vySq8GUVdnk7SL6khbjpna0VwVchNglR5Ln7IENo3tNkw11Fmyrxu0WasGlYWshabJLcKqWuPPAlx0yQ3r\/0RcXyqI0882i\/94dZI4d+KSTwF\/8xnfccza8k2RurUpsGE+EUkr45oW2DQqQkEX0CS1mkkszDabpc9t0qwsUeBmoSq8sqNN\/OsPpoo\/vt4k3vAk1d03OeLOJY7o7iyIm68piD\/d6Ijtax35HcecPTZFHNnWkolKkCWwjGsWvrdRgitORagbtFmtQ9cK3Lee8ME1mUiNwPWLbvGfr08W515zxYNeW6a0FGR9fpMjXh50xIF7HPHwakfs3ehDrMaDYzmHc7mGKbC0lUkXbU\/b\/5G9JQxT9CexTMVxUDdow5zI8\/CZzRJcIgSAgNAUbTvuma+JLz2p+fPvOuKui0ACLKB++1Yf1JcHC2JogyPef9oHmmN2r3PEtjWOKHlSmM+5BtfSVQdoI22tFlFhkkSPyAjmClnvTRY2Gccc1nDQ5q3PJgUXacISZVRVsVgbv+5L3dhogY\/mif95syiOPeKIF7c44nvf9FUBOeHwoN33DUdsXuGIx2\/zVYVV1\/rfKXXh6IOOhJfvUBn+17sW14yPovDaeJM7ErtWrU9xk1U54Wopyq2e8ihJ9NpCmLiurNVcEsOOVzVqJhi2Cpa332wYuEiQIw8Wpa+qMv4TZ0WegVHV+wynFelBNsOH9onb\/KVZVs+iVIbPT0yQsH33bl8FAFwmWFxHgYh68KwHL2ADKN\/x+X3LvfM8KXx00JfIh+5zxLs7HXnNKFWAtrDk++Qdfhtpq8x14LU9ql\/0mWMYgyMPuKO2mpITrrZJuW6il2R1rC7Wg7BXQlZ+DHHg9i64StzQ44qZU1xpfsJwzwPXCQhUExukmXr9zu10Rc8sV0o3Zvpqsvabl1pk0jngpA5\/yxE7b3fEnjv9\/9NndFpgfahcEI+UfaBRB1iOBuB7lxXE+usL4vtbfZ33xKOO+KcXXXlt1Rbu2e71Y9Hcopg\/pziivtBG3YkjfWcMGAvGhOuRM2HF1\/tqslWpKVt1gbYWk7DKgrQgDkqFWKfJQ1Dp0AIkXHeeJ+lmd7bI1zvSCgiRpLzm99zlS1WARYryHROtnbcXpIpw10UrQnmRD+uPd\/mqw461jthysy+VmaRxHtfm2Dkz2sTVc3x3QdqQZZ9UiDxjlvd2paaTsbpAm2TGmAbWtbfcJLc6whdVV6Ka1mAuhH98Z0BCBlj8i4Tl76c9KfvCvT6EgCuhWOP\/n+8Wz\/MAXu7DyeeHvuUDz+fBseKa3EM3x0GaPjFmjB1jmBe8pn4IdYG2FpYDtrdHSihYk\/iyJo3n+re\/9NUCQMUagIRVk7EfeP8yyWJSBrioAfu8v9\/Z6U\/E0H2Bcl1\/QU7Q1PgoMxnSmWtzjzRxZ6Y+vQpexrTeFoS6QJvHknCwsJ0REwikUK1gDVoMvjzhjukfr3UlVTcvL0i1gIkV32FFQGflmGMPO95Eyp+48R1SlnM+\/p4rnlrv67XAKyeTH82rad8YS8aUyIVqW0blPcdpGGizSJuEBOA1Vpo1oWZSaEz9cI74uwOulJZISiUhlf1VSpGVPpRSAj\/sg\/iaVzEvASgSFyktLQh3O+Ktx33pjFRmUoak5R7cqx59ZGwZY8Y6C6lrGrlSc2ijTBxpi\/SnbW+uj3QN1g+mSQmKKgB0QMjyLOoApitg5RUPlFgGntngqwOv7vAXGpDCfM6CAv\/+zW4fbD4HcsDleOpXP+2sWz9HpK435mmXdMNMoHiANQy0UaHoacqpH78jbl82U3zw4kJx4e\/Lda3nT3dLMNFdmf1vvzj7R2ICK694TF0v3e+ID\/Y4Mi4NgKn8zWd8h2mMYzmHc7kG1+KaXJt7nP+wW1z4pFzX+v7wQrF8cac4efJkptBWY+KygLahJK0n\/ZQkRCoiHZGSSg0ISlG+R7oiZTmepVw+B2BgVUu9WBGQ1srqgBRHml\/OkvaKgHaUTjt7Ut11WvRO9E\/ARB\/90XZfYgIdUKK3AiT2WCwLhz0QT+12Rxxo0HsrLQdUrgHgdddpvTEe2Lg2E532ioZ2tPWgOVcbZjXrATN7AEOy8opn5o+UVPZWoMRCgPTFYoDlAAsC3yFB5YLDct9qwPlq6TdY62E9ULborK0HFtqA1CXdT63ttKwmKTstr\/jKfmJRwAaLtAReJC42Wmy1SGUkMZM2pDNqwAubfUmMBOaHgJSup52WMc3aTmuhDdF1a70i9otXbpFQBvuHlGV1C\/0U6cmq1+aLqgJqAoBjx+VYwGXSxeoZK2Ucw6pacJWtHitieSVdbnhoa+2WGIRX+R5kvU4\/4nswoyimtfuqAc7bvNaB842L9tcdF2f\/6LH4F+BnoPRbPh\/a4E\/A1EIEEhUJi9+CAp7vvnzNv8f09iYZrZtnnxizvDOEN7ydthYrYnHLu+hjpa7pMuFcWi8vPKuunuV7RlV6eeGRhV6LzsqkDMsAsKIG4MmFRxcQot\/i6YUagKlLuS7yNxIWDzHlLYbnWKWXFx5meJrhcZbWy4t+zJnmen0qivsG7qjJMxm3K2K1glaBi2\/tjT1FcecNrlji\/ds22fEgjvanxVc16E+Lz+pV0+L9aZlYqYWFg5t9H1le\/0p9QK8FVnxqAVzFjqmlX87lGHRhvovzpyWtE76+QX9aPq\/mTyv9iEP8aQmvIVrBQivyCx3Xtue2TZLZAE0iF\/5wbGzkQmy8mDe7J9pAgYiEZWLFJEtFMKAa8B1QoiJgRVB+BxwDtMouqxO54MeF+W1UkQu0PUnkQq3AHRdeXrV0TQwWsqBwrySZApPEiMkgxJ93yfguFhRQB9BVVYQCeimfs6hAnNiudb5EVpYCjsHPlvgyrsG1dAIbs4wRqwW448KfNkkwWxbAEuuUNNeXaTTuKLgqonFVn5mcoc+i8yoHGgWsckOsjMY1zYwoE3SkjMbNG9ywTDMNF7mQd86DykLi3zQ5vrLaRebQQ+3in4\/OHMl7wESL5VmlLmBpAFSV94BjOSevXXcaAdwoa1I1r7+6QBu2aURetloGOS2wWW3KwUz\/4QfuETcvmjiSYeYPxyeM3Iu\/VYYZjrlj7dKq2RtNNy\/JAlx+AAiBPG201Ty86gZtrSwIEtjJTmJgj20zy+UVBxG5vGZ1tmrn8mqd5IqumIR1pjlp6VPaHAi6eWjzUhXrBm3ek7G0wGa9iwxLrtPbXZkJUdfIT3r52dPil2uT7rqTBlyeVxYxY5lkmKkVtHlOxvbu2Z1KJTDNT6ubDZzVK9P8tL3zss0CnlV+WpU1EZt3mpJJLq9aQRul16Zdzs0isbJJJnDdjZ\/pG1m9TTOBs+ihkwncBNysMoFj606T2yssu0ycPltXaKNMHUk2u8sSWJM9F3QhMdk3Ie25unZc+pjFngvl3qbEFgUyECVJql1XaJM2Oi9gqSx9ZrmXmHod96XY3YZzs1ZXstrdxrcoFOXWWKYlLJWAjtCqK7RhKkKSHSDTrnQF9bTSzKbMgK3XPmK6bWSi91cPZbMjEEvjJmpCElNXQ0Ab9Wsz9UPAbjiwfqXovmrqxYRrk+W+Yuw4iDeV2o0wTgqzI2KclDUBtp47Nuq0lb5i0WCc+MGqcVIZIk2TLQ\/cVdZ+ZklT1zcEtFkno+PXjimGDdgOPb9XboW5duViuQeugjqqknwt611k6rk3rk6bcc9EJwU49ghmnAinMU3rKrce9c7X8b1Nu2tjfiEDBst4pmvPeRScnatJsTS7yLCDeGwu25x2IddZpavVLuRZmTvrDm1UJ9JuzWQqndHJosxKSTblOLy1GJhhF1PFc3Eu11DX49pZbV5Cn+l7LUvaXG4NAW0Wm\/ymKagS\/fObM5GwYWv85b6m9ND2NYX6RGQhcen7mTNnajLWaTbvbiho6+WuGFQNwl7fSVSCw\/c3jbVl5gCtlLjevbJQFeg7Y1AvKWsqnBoGWqRtrTYPqSxMIiofvAmw\/j4HTuSafl7QXtJxHSOdubJv8gfnjUE9BJOuxaAhoY1a1svTz5bCbLc0e3JiBxQZPzbDrRohkCe0KqKCNtCWpA4+jEGeUbdhKmASm3zDQUtJszt1knL8+HEZmmLqS6ByHOzfdCkWq17Qqtg12mKSCyHYV8aAsajlc026ZN9w0Eb9IvOalAX1WR33QgXrYNnVNsLjnJImJwHn6jq40CbapuDVdWvErJaXXhv2Bk0zX2k4aKOW+PLa\/WbNykXywVYzCQE1CdfaWyeJmVOKMveAyWrR\/k1NRitZYXZarmFyT+BlhxqyGtJ2+lDNpMcYMBa1EELMXdJ48zUktLUsPNR\/P7VglJ0VyYbRvX9+q7Rhbrt\/vTQJSVXiRifR2jx5BpJCi66axCNLhTDRdvpAX+gTfaOPQTvvf\/30WjkW46Fc8dC2tzaJY091SqhKc1rlg17SVxJDu7eNsV0ODw\/LdXpTeJB6MtNhQmilP20Cf4CwuDv6RN\/oo0zk4fWZviPN713dbqFt9PIvv\/uN+LOdGyWMPMy42fOh\/bsSQUslfVJS18SFXcnCY3SCRekzfWcMvvPoBjkmFtrLqBzc92hiaB9Zk9wJfPMKNzdox2Ox0NYI2p8NuaK12TWGtnWyK17c6lhoLbS1hVaFXS\/o7jQObOQcGcb+qoXWQlsjaIN5Ak6+92akY06UIwvOPPi7kt3FQmuhzR1aGT812ZEh7UETm87qmHQiD5igiHolOsDkx4LTu4XWQqsNbVTuq+GDz4ny9a3xtlnvGI5VBZ9fwA1LURpWCZshCsFCa6HVgrZasjbpcB4jbZWUrQwUlLl1WydqBXBKaJddY6G10MZDq5NdkPT51XRb9p1F\/w0ruuAC7dpVN1hor\/QSt7hgkg6TFakwH1g+47tqRQdc2vnME1sstFd6qbaMy8THJH8rEcNsdRR0YvHjtSZoJXaLA5d2Eo1sobXQhkKrzFpDTz1mdL2hpx8fNSnjbz7TLdXAxbEHc5mF9govrNGXFxbGZg9MmK9VWgSuu+h66FX+Nk3mFgVuua85k1ScFtpxXoAgCC1SF2DSRLKq3XZkCHvCcJcwcFlYyHo7UAvteIV2cZuccAHvkkVzM4mr4hpprxMEFzfGWgQqWmjHCbSlWc3SF4AJV6NJMgVuf6kgU0FZaG2RkE5pb8lsv4G8wO3u6rxsLQcW2gQlbbr2Wv248t6E2UJriy0WWlsstLbYYqG1xZbk5f8BQ+p9qz1qETkAAAAASUVORK5CYII=","width":173}
%---
%[text:image:6cb9]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:8f9b]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:3049]
%   data: {"label":"Clear Variables","run":"Section"}
%---
%[control:editfield:19e8]
%   data: {"defaultValue":"sin(x)","label":"f(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:5dbd]
%   data: {"defaultValue":"log(x+5.001)","label":"g(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:28e0]
%   data: {"defaultValue":-3.4,"label":"a = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:694e]
%   data: {"defaultValue":2.1,"label":"b = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:dropdown:62b6]
%   data: {"defaultValue":"\"indX\"","itemLabels":["x","g"],"items":["\"indX\"","\"indG\""],"label":"Choose independent variable: ","run":"Section"}
%---
%[control:button:77f2]
%   data: {"label":"Create Graph","run":"Section"}
%---
%[control:slider:46be]
%   data: {"defaultValue":0.75,"label":"Step size","max":1.05,"min":-1.05,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:428c]
%   data: {"defaultValue":1.1,"label":"Initial point x_0 = ","max":2.1,"min":-1.2,"minLinkedVariable":"a","run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:button:97f9]
%   data: {"label":"Update Graph","run":"Section"}
%---
%[control:dropdown:2004]
%   data: {"defaultValue":"\"xdx\"","itemLabels":["x0 and x0+step","g(x0) and g(x0)+step","g(x0) and g(x0+step)"],"items":["\"xdx\"","\"gdx\"","\"gdg\""],"label":"Choose a graph:","run":"Section"}
%---
%[control:editfield:5989]
%   data: {"defaultValue":"sin(x)","label":"f(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:3ca7]
%   data: {"defaultValue":"1\/(1+x^2)","label":"g(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:button:40e7]
%   data: {"label":"Create Graph","run":"Section"}
%---
%[control:slider:949a]
%   data: {"defaultValue":-1.2,"label":"a = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:5505]
%   data: {"defaultValue":6.9,"label":"b = ","max":15,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:4509]
%   data: {"defaultValue":73,"label":"Slider","max":100,"min":1,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:checkbox:48dd]
%   data: {"defaultValue":true,"label":"Animate adding intervals? ","run":"Section"}
%---
%[control:checkbox:4637]
%   data: {"defaultValue":true,"label":"Toggle between plots of x and g","run":"Section"}
%---
%[text:image:763d]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
