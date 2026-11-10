%[text] %[text:anchor:T_361B34F4] # Integration by Parts
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%[text] Integration by parts is an extremely powerful method of integration that will only come into full focus once you apply it to solving differential equations. For the moment, however, it will allow you to solve some integrals that substitution is no help with. 
%[text]{"align":"center"} ![An area u(b)\*v(b)-u(a)\*v(a) represented as the difference of two overlapping rectangles is divided into two parts by a curve. The upper area is the integral along the curve u(v)\*dv while the lower area is the integral along the curve v(u)\*du](text:image:1edb)
%[text] Integration by parts allows you to subdivide your integrand into integrated and differentiated components and recombine those pieces in ways that can be easier to compute.
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] 
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:2fe7) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:7637) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8C1C330D] ## Integration by Parts Geometrically
%[text]{"align":"center"} $u(b)v(b)-u(a)v(a) = \\int\_{v(a)}^{v(b)}u(v)\\;dv + \\int\_{u(a)}^{u(b)}v(u)\\; du \\;\\;\\;\\;\\;\\;\\; (3)${"altText":"u(b)v(b)-u(a)v(a) = integral from v(a) to v(b) of u(v) dv + integral from u(a) to u(b) of v(u) du (3)"}
%[text]{"align":"center"} ![An area u(b)\*v(b)-u(a)\*v(a) represented as the difference of two overlapping rectangles is divided into two parts by a curve. The upper area is the integral along the curve u(v)\*dv while the lower area is the integral along the curve v(u)\*du](text:image:4881)
%[text] The left-hand side of equation $(3)${"altText":"(3)"} is the difference of the two rectangles while the right-hand side of equation $(3)${"altText":"(3)"} subdivides the same region into a sum of two pieces divided by the curve $(u,v)${"altText":"(u,v)"}. Practically, expressing $u${"altText":"u"} as a function of $v${"altText":"v"} or vice versa may be complex algebraically, but is straightforward geometrically using the parametrization in terms of $t${"altText":"t"}:
figure
syms t
u(t) = t^2; %[control:editfield:57ca]{"position":[8,11]}
v(t) = 1-cos(t); %[control:editfield:8965]{"position":[8,16]}
a = -5; %[control:slider:633b]{"position":[5,7]}
b = 5; %[control:slider:116b]{"position":[5,6]}
  %[control:button:36c3]{"position":[1,2]}
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
%%
figure
syms t
u(t) = t^2; %[control:editfield:4cc2]{"position":[8,11]}
v(t) = 1-cos(t); %[control:editfield:9779]{"position":[8,16]}
a = 1; %[control:slider:6774]{"position":[5,6]}
b = 4; %[control:slider:995a]{"position":[5,6]}
  %[control:button:4c1e]{"position":[1,2]}
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
showPosdUReg = true; showNegdUReg = false; %[control:checkbox:415d]{"position":[16,20]} %[control:checkbox:656a]{"position":[37,42]}
showPosdVReg = false; showNegdVReg = true; %[control:checkbox:2386]{"position":[16,21]} %[control:checkbox:5277]{"position":[38,42]}
showRectSubs = true; hideVertStripes = false;    hideHorizStripes = false; %[control:checkbox:8282]{"position":[16,20]} %[control:checkbox:9643]{"position":[40,45]} %[control:checkbox:0941]{"position":[69,74]}
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
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_31AB08EA] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:659c) at the top right of the Live Editor pane.
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
%[text:image:1edb]
%   data: {"align":"baseline","height":422,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgQAAAGmCAYAAAADPpzuAAAv2klEQVR42u3dX6hd55nfcTODxz7jzHg0QTgXQz1VOQ6dwPE0aicwhDoJ8gSGNoYwCjOFOmUKSlxodDNUhMC4d9LVyFCI0UVxfeVWEAncCxVEY4ovNCGiuoiJphcnLm0cxWCkm8SKFCe7frbyqkvrvGvvvdZea+\/15\/ODLzraZ6+199lnn\/1+1\/s+7\/s+NJvNHqrgrz7kf6+AiIiIDDwPLeA\/eXlEREQIASEQEREhBIRARESEEBACERERQkAIRERECAEhEBERIQSEQEREhBAQAhEREUJACERERAgBIRARESEEhEBERIQQEAIRERFCQAhEREQIASEQEREhBIRARESEEBACERERQkAIRERECEFnQnDmzJk5kcuXL88eeuihOavm5s2b8+PPnz\/vNyYiIjJEIYiGPBr\/EIGmQlA8z9WrV\/3WREREhiQEcWV\/6NCh2fHjx+\/f1lQI0rmOHTvmtyYiIjIkIchd1TcVglxvg4iIiAxACOKK\/ujRow\/cto4QRC9BHFfscRAREZEeC0Fq+FMxYRtCEAkZiGNDDkRERGRDQhCV\/akBr2qEU1d+sTegqnu\/LARx\/tTIp3OcO3eu8gkbNhAREdlSD8GRI0fmjXBVQ537fhT\/5XoBikJQFIm4fzpPcOLEiVo9DyIiItKxEJw6dWreCOcq\/KNgML4X9QLFHoRo5KOBXyQEcUz5Sj+kIn0\/JyD7+\/vz78VzEhERkQ0KQWqEg\/i6mCQL5Sv6KoEo9xDkEueK7+eEYtG5RUREpEMhiKQhgHIjnrr5ywsGrSIEVTUJqdchJyCEQEREZItCkLryi4WDqeEuTy1cVQgWPrFf3SdXPEgIREREtiQEaaXA4lV76trPjfV3LQRtr0XwxhtvAAAwGLYmBEUBSAV9IQjlYsKUVWYZVKU4ZFB1fNuzDNLjAQCwbR59+PCcx3f+YPbEbz8z58mP\/tmcddbyaU0IUkMddQNpfYKq6YFJHsqyUBSCqmmMaTpirhcgPe6itQoIAQBgKI19NPIf\/9gLs73f++s5\/\/Sp\/7yQXghBJBURph6Aqt0HU6Ne3rJ42bTDdFzVcEGa1dD2rofepACANhv8dGVfp7FfhTh3L4Sg2GDniglT0lTFcg9CEoIQiiQVuYWJFi2CVDUdsU0h+P3f\/8zgeOyxTwzyeQcPP7w7+93f\/aTn7rl77T33wTz3jx3+J7MnDv3xA1f46zT0f\/KP\/uucL3z627M\/+dR\/mfOpvRdnH\/97X549\/Q\/\/dN6jkGSgF0KQNhhapds+GvroBcgJQapDCMEoikAME1QtS5yGLLpYpbAsBC++OBsce3sXBvm803Mf6vP33D1\/z33cz\/3UX\/1kdvKFd2dfef4Hsy99\/jv3GuwPG+6mjX2c4\/kvfm9+vjhvsOjx\/\/AP\/9XsM5\/5zIF2autCUCdpqmJb4\/2pLiG3NgEhAACsQ67hr9vo5xr8OO86z2sUQpB6CaIHYN3dCbvsHSAEADC9xr\/pFX+62o9j\/\/LP\/27pFf66jEYIUkNeNRthlYRMtCUWhAAApt34N7nib+tqf9JCMJQQAgCYZuNfvOLfZsNPCAgBAKCFMf+mV\/19\/zkJASEAAKxx9T\/Exp8QEAIAQAsCMPTGnxAQAgAgADUEIF39x\/S+MTX+hIAQAMBkawBWFYAxXv0TAkIAAJMWgX\/xz\/8nASAEhAAApjoUcPyz3yQAhIAQAMCUJCDG96uGAj73iW9NpgaAEBACAJhkPcCiZYBTT0CfFv4hBISAEABAS0MBy2YDGAogBIQAAEYoAYtmBRTrAbxmhIAQAMDEJEA9ACEgBAAw0m7\/Ype\/14sQEAIAGBmpAJAEEAJCQAgATLA3ILr1q2YBpG5\/rxUhIASEAMDExv+N\/RMCQjBhIXjllTdmb7zx4n3i\/\/7ogPGJwKIhgfgeCSAEhGCiQnD69K3Z228\/k\/113779+FwO4j7+AIHxDQmYCkgICAEhuE+VDBS5devJ2csvX+vk8V96aX92\/vz5+\/+Px7t588jS4+KYONYHA9CsQFBdACEgBITgPpcunV0qA8Xegral4MyZm\/PG\/803T9UWgjgm7hfn8OEArN4bYEiAEBACQnBgqCAa+VzDf+XKybksXLv25Qfu07YUpEa9eNuqQhCUZQKYKt\/4+h29AYSAEBCCZkRtQPnXG8MH5XqB+H8IQlEK2qopeP\/9Q7PLl880FoKQgTiHXgJMfbZAuUdAbwAhIASEYCXOnn37wK82egMWHfPaaxfv9xYsu+8qvP76ufm5zp272lgI4ti4f1kqgKkMDegNIASEYEtCsLd3Yc7Q30jFK\/5UNLjKVX8MFyQpCKnIFQhWNejpe++8c3T+\/7feOn7\/65wQRGO\/v39s\/nX0AsT9cz0BcY74ng8ITHnaYKwnoDdgOkQ7dPjws7OdnR1CQAjWo1w7cPHiK7ULEWPIIff9aJzj+6++evmB2+Mqvng1Hw19NPhVQpDqA2I2Qfwbt+eGB5I0+JDAFBcRSj0CUUPgtZqeEOzu7hICQwbNica\/XERY9xw3bjw9u379uYVDAVevnjjQcBcb9LhPriAwPa84T04oyudNsuBDAlObMWDtAEMGhgwIwVpEQ178lVZd6S8rSIwCxEXFgsWr9jRcUOzaXyQEVVf8cd7yMAMhwJTqAxQKghAQgs6GC5rMGIhhg6hDqPp+XMUXhw3S1X15AaK6QhC3lxt\/QoCxicDxz34zOywQ3\/c6gRAQglaIosA6MwuqSPseVH0\/RKDYvZ8b54+r\/baEQA0BxlgoaMYACAEh2Fj9QNMNjOK4ZcdG13401Gm4oNz4p8LBnBDkZh9UDRlUnQcYgggsKhT0GoEQEIKNLUa0zjoGy+6ThglSl355vYG0qFBVUWFxeCE3S2FZTwPQVxbNGFAoCEJACDZCcSOjRUWBbZB6BqLBzk0vTMMK5emJacggNfQhBqkmodw7UHUOYGgioFAQhIAQbE0I2lhtcBkhAotWEoyGv7yoUOpVCBFINQNpTYLyGgRxrOECDFUEzBgAISAEvZhh0GS6YdtULV+8CmnZ4vJ6BQARACEgBIRgCeuuP9AFMQxQVUS4iOgdsGQxiAAIASEgBCMRAmDsswaIAAgBISAEABHwGoEQEAJCAExxQSEiAEJACAgBMBERqNprgAiAEBCCwU07JAQAEQAhIASEYOHmRABWEwErC4IQEIJBUtz6uOuVCoGxTCGMht9eAyAEhGC0exkQAqDezAEiAEJACEYjBJcunb3\/q4xVC\/1RAcuHB5IIxPe8RiAEhGAUQhBbFrex2yEwlTqBmEJIBEAICMHohOD06VsP\/DpffvmaP6w1ia2gYyimTMiX12cYhAjk6gTMHAAhIASjFYLyWgQarXZ6XX7+80cP\/KmY1jkM\/vLP\/5c6ARACQjBNIbAWQftCcPv2IUIw8CECIgBCQAgmJwTXrn35\/q8zvvaHRQimXisQswnUCYAQEILJCYGph4RgyjJQrhX40uf\/1msDQkAIpikEZhoQAr0ChghACAgBIZjPLDDTgBCYSmiIAISAEExcCMozDV577aI\/LkIwmZUGTSUEISAEhOBFMw0IgeEBgBAQAkLwYn6mgcJCQjAW4uq\/XDRoBgEIASEgBAuwpwEh0CsAEAJCQAgOzDSI5Xf9gRGCIZIrGiQCIASEoHMh2Nu7MEdh4WoNZW6N\/zry0cY5mhKPUX78+H\/5sVcVguiVaetniZkhuXNNqUBU0SCmTLRDhw8\/O9vZ2SEEhKDdwsIrV052ugBSItb8r7N\/QhvnqMvFi6\/M3nvvqV8Npxz68PEeKQyv3Gv44\/txvzpC8L3v\/UX2ZwlRqPscc+f6xS9+\/f5zMjwATEMIdnd3CYEhg\/UJCeiysDDXmEfDua4Q1D1HnavuaOhzGxXliPv98Iefml+VryIE8Zzv3v3NA\/eLx6z7XO\/e3TlwnrgtdrOcYq+AokEYMiAEhGDNK+EuVywckhDEa7GqCBT54IPfmN2585GVawh++tPD2XPUGTYIAcmJRfQa6BUACAEhIARrr1jYdiM7FCG4t33xI5Vv+WJjH\/e7e\/exUoP+8IdS8FsrCUHcFgJQFoI6wwa54YI4x1hXnNQrABACQrABYsph+tU2GcseuhBEF3vuajs19N\/\/\/hfnV+SpKz6u5KM34Sc\/eSLbbb9MCOL43H2j52Cd4YKbN49MYgaBXgGAEBCCDRQWtr0V8hCEIK62y1fsaTx+WcV+HBuFfHWEIPjRjz7Z+Ao\/nlO5NyJ6LNqWOb0CACEgBBMTgmKDe+vWk5MSgrhazw0VxG2rnj+koKr2oEoIooehfJUfQrDKTI\/oscg91piKCfUKAISAEGyBLhco6rsQfPe7X82O59cpzrs35LBTSwjimJxErDJskDsuJGHo78OvPP+DB5YcJgEAISAEGyYap64WKOq7EOQq\/ptIUXH65qorFeYKA2O2wqJhg1zPQtQ\/DHkxoqrZA4YGAEJACLZADBV0sUBRn4Wgarjgxz\/eq32uVdchWLYmQTyfRa\/\/\/v6xtYoR+ygDegUAQkAIekRXOx\/2WQja3H+g6blyPRTvv\/\/RlXpy0vDGEPdLqOoVsOQwQAgIwZYp7nzY5gJFfRaCOG+5hyDO26T7vakQ5NYkiF6D3LBBbrhgiJtS5WYP6BUACAEh6AldLVDUdyFo67xNhaBq2CJX1JgbLojbzB4ACAEhIASdLVDUVjc0IVj+OubWJIiegGXDBbEWwVA2MlI4CBACQjAgigsUXb\/+HCHYkBBEo35woaEHZw7k77OjcBAgBISAEHS7QFH0FoxdCJrMDOhCCKrWJCgOG5SHC6LuINZQGOIQgcJBgBAQgp5TXqCojY1ycoV7scxuna7u4gyItmcZ5PYwaDLLYl25yK1JkHoAqmYX9Hkjo9wQQRQS+gAHCAEhGAjFX3Mb49NVV851rm5j056uFiaqeovXrdyPn6fuwkTL5OT27d+Zi8a92QUP7q743ntPGSIAQAgIwWbqCNrY6CiuYmP1vaaL6URDmdt4qC0hyFXu1+2Or+ryrzv8kFuTIHoOir+Te4sXPdrbYkKFgwAhIAQjobgeQVsbHeXmzq\/SqEVDG1sM596CbQlBXIHnhg1CClZdjyBmCeSmDtYVgtyaBFVLK\/dtI6PcEIFeAYAQEIIBU16PoI2Gp2p3vhCFqnHwuD26xXO9A21vf5wbkkgs2lI4hhXiOVZtbFRXCHJrEsT\/y7ML6my8ZIgAIASEgBA0privQRub5lR1+6cGL4QhegviftEARzd+1f27EII4T9UVfvRkRC9FNOxxvyCea5KcquOazlgor0lQPn8Mv7T1c7fB1776riECgBAQgrFSrOpva4GiZY18FM1FI18unqtqdNsUgtRdv+hKP55DPGbVc4yf7c6dx9YWgtx6A33dyOjeEsT\/3SwCgBAQgrESjVLbGx3F0EPVePgioiGO51PstehCCNLUvw8+eLj2cwwZiGNzBYp1hWBRgWKIyKIhjG0NExgiAAgBIRgp5XnvbZ03jblXNXjlrvoo9kuNfmxJ3LUQJBmKx142ZJFEIO6bGuncAkpNelhyaxL0aSOjogx87hPfmn3l+R\/4YAYIASEYKzduPD1rc4Gicvd8bPEb4+HRsEej+rOfPf6rrx+Z9yTEfYoFjWUh+OUvf62zq+VodKNRjiGEkJLiEEF8fe+2nfl9ig10Tgia9LBULZjUh42MzCQACAEhmJgQXLlycrZKpf26MxqiaDEa0lS0VyUfceWe7le8\/yZWb4yfPz1mfF31uHF7+Tk2XS+gfJ5gmysTmlYIEAJCMFEhiIa6zQWKMFxMKwQIASGYsBBEV3j6dcfwgT+8aRIbEZlWCBACQjBhISivR9C3lfFgGWIAhIAQbIjr15+7\/yvv02I4UC8AgBAQgg1SrJpva4EiqBcAQAhGIwR7exfmjP2NFr0C6VcevQX++KYnA4YIgP4S7dDhw8\/OdnZ2CAEh2NwCRW3tfAj1AgDaFYLd3V1CYMhgs4WF\/gDHKwPHP\/tN9QKAIQNCQAiqiZX2FBZOo3hQvQBACAgBIVipsLAvG+tA8SAAQkAINowVCxUPAiAEhIAQPDDToK2tkLE9YmdCxYMAISAEhKARXWyFjO3PJDBEABACQkAIGs80KG73i2EVD5pJABACQkAIzDSYuAwoHgQIASEgBGtz5crJmSWMx1E8GLsXem0AQkAICMHaUw9DDvwRmkkAgBAQggkKgZkGw5MBMwkAQkAICEGnQmBPg2FNK\/zS57\/jdQEIASEgBKYemlbodQEIASEgBB0JgamHZAAAISAEExWCGzeenpl6aFohAEJACCYuBMW1CGJ\/A3+I\/ZSBqCHw2gCEgBAQgs6IjY2sRdAvGfjCp79tJgFACAgBIdjeWgSEwBoDAAgBIZioEFy6dJYQkAEAhIAQTF0IimsREIL+yIDXBSAEhIAQEIKJyYAFhwAQAkJACCZMefVB0woBEAJC0JjTp28RAjIAgBAQgqkLwbqNeFEILl58xR\/iBrD6IABCQAhaJxrxdRry4rRDKxWSAQCEgBAMVAhi\/4Hbtx9vPHRw5crJmb0MNi8DliIGQAgIQSerDV6\/\/lyjY9PSxSEV\/gi7mUVABAAQAkKw0V6CuNqve1z61YdU+CPsXgZOvvCu1wYAISAE3dYS1C0MjF4FwwVkAAAhIAQjW4cgNfCr9BQkgVj1\/lhPBixDDIAQEIKNrklw48bTS4cAijIQ92\/6eC+9tD87f\/58Z\/cfIt\/4+h0yAIAQEIL+1BPEr\/PWrSfn0wpjOmGiuN1xyEDT2Qlnztyc3bx5ZPbmm6dqHfP++4dmly+fGe0f8b\/51\/+XDAAgBEMXgr29C3PGIAWpp6CKdWQgCBEIIah7XMhASEHIwRiHCtImRWQAQFOiHTp8+NnZzs4OISAE7RUapmmFRRFoY0XCplf6qZegTs\/CUGTgC5\/+NhkA0JoQ7O7uEgJDBv3m9dfPzd8u585dbXT8W28db9S7MAQZ+NwnvkUGABgyIATDJQr+4i2Qa6jT99555+j9Bj19XR4OiOOjByDY3z+WlYZ1haKvMmApYgCEgBCMgmjo423w6quXDzT0cXsaIohGPxr78vGpyDBmEsR9QxpCDEIoiveL88f5hj7joCwDMVQQswx8mAEgBIRgFEMBV6+eeOD2aPyLhYBxn1VqAFLDn7vvqucYkgwYKgBACAjBaIiGvzhskIYLovegTmMeMhA9AFXDEEMWAjIAgBAQgtETvQPFYYM0XFDs3q9qzKMmIHoTym+rMQmBVQgBEAJCMAlSN38aNogGvtyg56YNhgzE7VE3EEMPxYa\/SgiGtkARGQBACAjBpIhGPRrxNFxQbvzje+VGPhUklmcO5IQgDSUMqaiQDAAgBIRgcqRhghCBXCMft0dvQFkS4r7FGQVVNQTp\/GQAAAgBIegxqWcgrSVQNaxQnJ6YGvnoKQgRSEsb53oT4py58\/YVMgCAEBCCyZKKA6vG+aORL848SD0HaWGitChR\/L+4iFHcNqT6gbIMnHzhXe8PAISAEGDd1QarVjkkAwBACAjBgIsP6zTuuaEGMgAAhIAQgAygE6KOJRW4poLXVWpnhr6cNggBISAEaImvPP+DB2TAZkXNeeWVN2ZvvPHifeL\/m5olU1xqe1UhSFtzD219DBACQkAIQAZ6yenTt2Zvv\/1M9iPm9u3H53IQ9+nisXON+qpCkJMJgBAQAkxYBmxjvB5VMlDk1q0nZy+\/fK2z3oHcGhl1hGLIG2+BEBACQoCGxLoCZKAdLl06u1QGir0FbUtBFLmWp8PWEYI0Eya33DZACAgByABWHCqIRj7X8F+5cnIuC9euffmB+6wiBYv2wyjenta4KO6lURSCKBpMjX30AsTXxZU1151SCxACQoCB8jd\/83\/mtQJkoB2iNqD8kRLDB+V6gfh\/CEJRChbVFKwqBGmp7PK01iQEqfcgraQZUpCrF0jTY804ACEgBJhIz0BRBr70+e94Xdbg7Nm3D3ycRG\/AomNee+3i\/d6CRfddVQjS3hvl+yUhKNcFpOW2086e5XOrIwAhIAQgA6hJ8Yo\/FQ2uMpMghguSFIRUdCkEueGBtGU3IQAhIASEYIIy8IVPf\/uB6YVel\/Up1w5cvPhK7ULEGHLoUghy5676HiEAISAEIAOoSTT+5SLCuue4cePp2fXrz60lBFXbajcVAgsUgRAQAowU2xh3QzTkxY+Rqiv9ZQWJUYDYRlFhuRiw7pBB1XkAQkAIQAZQY7igySqEMWwQdQhVawuUG\/TUG1AWhdyVfRKC8u3pHFXFhn63IASEACOXAZsVtUcUBdaZWVBF2vegavXBNG0wTRmMRj5RvO\/+\/rE5ZSGIY6M3IGYUFKcdxu3laYe5cwCEgBBg4JT3JyAD3dYPNN3AKI5bdGySgGjEo7GORYNyQpDkobioULpf3BbHxjni\/yEHZRlIixupHwAhIAQYEdH4W4Vws4sRrbOOQVvPKbd88arEcblpiAAhIAQYKJYk3gzFjYyqigI3TdOiwLRCYXmlQ4AQEAIMWAYsSbx5IWhaPwCAEBACWIVw4BRnGDSZbgiAEPRSCPb2LszxZrTwEFZj3fUHABwk2qHDh5+d7ezsEAJCgDamF3pNCAEwZCHY3d0lBIYMYOEhQgAYMjBkQAhg4SFCABACQkAIYOEhQgAQAkJACFCjiNBaA\/2ZdkgIAEJACGCtAUJQuTkRAEJACLCR6YXWGtgexa2P+7JSIUAICAEhmKAMmF64XYp7GRACgBAQApheOFEuXTp7\/+MjVi30mgCEgBCADEyQ2LK4jd0OARACQgDTCwfM6dO3HvgIefnla14XgBAQApheOPW1CKLHwGsCEAJCALMJJoi1CABCQAiw0ZoBr0k\/uXbty\/c\/QuJrr0kzzp59ey5UZfS6EAJCQAjIgAJCUw8nVqD5858\/euBjWa8LISAEhEABoQJCMw0m9jrevn2IEIAQEALkCghDDrwu\/SZmFphpQAhACAgBWpUB+xMMf6bBa69d9JoQAhACQoBmfOPrd8woGDBmGhACEAJCgFb42lffNaNgwBRnGigsJAQgBIQAjfni5940o2DA2NOAEIAQEAKsTcwiMKNgXDMNYk6914UQgBAQAjQqJFREqLCQEBACEAJCMFEZSIWEf\/pH\/81rMqLCwitXTnpNCAEIASHAasRMglRIeOJfWm9g6IQEKCwkBCAEhAC1KC9NHNMOvS7D5uLFV2ZdrVgYRYu5df6b1CrEwkm5c3U1zBHPMRr78v4E5efeRAjK523yurRxDhACQoC1iggVEo57xcI2N+X53vf+4sDHVaz7H6LQxrl+8YtfnwtN24L03ntPze7NvDj04fN9ZPb\/Z2Lca\/jj++lxmwhBcR+J4utS57Vv4xwgBIQAjeoGiksTKyQcFzHlMH2cNGmsF13F3r37mwc+sqJBrXuuu3d3Dpwnbjt9+lZrYhTPK7dRUY643w9\/+Kl5D0UbQhDnWFcI6p4DhIAQoHERIRkYf2Fh21sh\/\/Snhw98ZH3wwW\/U6tqORjcnFtFr0FavwKoiUP457tz5CCEAISAE06sbCDHwmoyPYuNy69aTrZ87Gs5yQ1qnJyI3XBDnaGNDpnvbFz9S+fFabOzjfnfvPlZ6Hg9\/KAW\/RQhACAjBtIoIrUZogaImxXm5j63oOVhnuODmzSNrP7cYbsj1PKSG\/vvf\/+K8dyINS8TPEr0JP\/nJE9nnRAhACAiBIkIMmmjwulyg6Ec\/+mTjK\/x4LuUr8LhKb6PWIXoeyr0XqTZh2WsQx0ZRIyEAIeiREOztXZjjzdjNSoTqBqZBDBV0tUBRXFWXr6ijIV7lceIqPfext24xYVzt54YK4rZVG9WQgqraA0IwPaIdOnz42dnOzg4hIATjLCK0pfE06HLnw2i8cw3nKsMGueNCEtZ9Tt\/97leztQ11ChXvDTnsEAI8IAS7u7uEwJDBOOsGvCbToLjzYdsLFFUVBkaF\/qJhg1zPQoz5tzGkkZv90KR+orjSIyGAIQNCMBq+8vwPFBFOlC4XKKpakyC65xcNG+zvH1urGLHucMGPf7xX+1zWIQAhIASjXnxIEaEFirpYiz93Vf7++x9dqdAxdem38bza3H+grZUKCQEhIASEQBEherlA0fXrz3Wy3kF53D56DXLDBrnhgramRMbzKPcQRGPaZCiCEIAQEIJRUdzBUBGhBYruNS6Pt37+qq76XCFfbrggbmv751y3MSUEIASEQBEhRr9AURsrAa6yJkH0BCwbLoi1CNrayIgQgBAQAqgbwBKKHy1t7ySYhgIOLjT04MyB\/H12OukJIQQgBISADKgbwJI6grY3Olq0JkFx2KA8XBB1B7FuQFvPocnMAEIAQkAILD6Eya5H0PZGR4vWJEg9AFWzC9ocvqjalrnJgkxNpx2WayliOeY6PTLFhaQIASEgBIRA3QA6X49g3SWCV22Qb9\/+nXnjem92wYM7Cr733lOdDo2sM4shei7qLkxU1atQpxckNnciBISAEBCCtShvWmTxIZQp7mvQ9kZHi9YkiJ6D4pDFvcWLHu2kliE3i6Hu0ETV8McyIQjpilUamy66FI1+blMmQkAICIE3YeO6gViZ0OuCRd3RXSxQVLUmQdVywl30UoTo5IYN4jmtKkExYyI3jXKV1y23xsIq8hOvRWy\/nHtMQkAICIE3oboBtD4ToKuNjhatSRD\/L88uqLPZUF1y3e6JRdsrx3OPYYyqjY1WEYKqXRzjnFX1EnF7PG6ud4AQEAJCQAjUDaCTmQBdbnRUtSZBWRCiW73LBi7OXXWFH1frcSUeDXvcLwhRSg151XGrCkFVt386dzxOPF7cL+Qkhjiq7k8ICAEhIATqBtAZN248PetygaKq9Qba3sholaGLRVf60ThHQxuUix3TEMOdO4\/NmkxhXNbIx+NVPW5OSAgBISAE3oTqBtA6xW19F3Wfd7EmQWoMu3rc3DTIDz54eMnH7ENZGYhjcwWKqwhB\/PxVdROLCBkImSoWfxICQkAICIG6AXRCFNZ1uUDRojUJ2tzIqE5vRcjJsm75JAJx3yQsuUWCVi3GTPUIVWJUHsaIQsjU6Md2zYSAEBACQrAS\/+7f\/g91A2hc9Jc+YmL4oMtx\/Fy1f1sbGdX9mUNQYgghnlOxqz6+vnfbzvw+RVnJCUHdYsw4R2wFHXUT0bBH4\/+znz3+q68fmfckxH2KMy7KQvDLX\/7axnpVQAgIgboBTIhil3QXU\/+KjWGZruoW6ohKNK7p+cTXVVffcXv5+TddOyF+7uidSeeJc1e9FvEY5cfVQ0AICAHUDaB1rl9\/7v7HjIYGIASEYICoG0BbV+5dL1AEEAJCQAg6wnoDaLPbPH3MRG+B1wQgBIRgQEMFRRmIOgKvC9pYoKirnQ8BQkAICEHHdQPRU+B1QZuFhV4PgBAQggEQtQLqBtA2xd0HFRYChIAQ9JyYRaBuAF0XFprjDhACQqBuABNlUysWAoSAEBCCNWWgOMVQ3QC6nGnQ1VbIACEgBIRgTYpTDEMM\/EGiCzaxFTJACAgBIWiIpYmxjZkGm9xwCCAEhIAQrDBUYGlimGkAEAJCMGEhMKMAm+bKlZMzSxgDhKD3QrC3d2GOGQVA91MPQw68JsBBoh06fPjZ2c7ODiEgBGYUwEwDYOpCsLu7SwgMGZhRgPELgT0NAEMGhKBHQwVmFMDUQ4AQEIKJCYEZBeibEJh6CBACQrAFbFqEPnDjxtMzUw8BQkAItoQphujjWgSxv4HXBCAEhGALQwWmGGLbxMZG1iIACAEh2AKmGKKvaxEQAoAQEAJDBZgoly6dJQQAISAE25xiaKgAfVuLgBAAIxeC8+fPz86cOTO7efNm7WPjuIAQWI0QhAAgBAMWgqtXr86fdNNG\/fLly2sdTwisRghCABCCHgjBsWPHZkeOHGnUO1A8x6FDh9Y6x5SFIHoHjn\/2m1YjRCecPn2LEACEYDNX95vqJRijEJSHCqxGiC5mCbQlBBcvvuI1BcYoBMePH58\/4Tau7I8ePTrvJSAEzYcKrEaILohGfJ2GvDjt0EqFwEiFIJ5sSEEbid6BOF8UKBKCZrMKDBWgC2L\/gdu3H288dHDlysmZvQyAgQhBXJ3HA586dSp7gugBiKv3YoO9qJs\/vnfixIn75w2izmDRTIRNDBuMSQhsXIRNEqsNXr\/+XKNj09LFIRVeS6DnQnDu3Ln7jXYuue+nK\/poyMtJ8hDFgon0w4UkVElBOoYQGCpAP3sJ4mq\/7nHp4yakwmsJ9FwIooFOD55r4FOtQPHqPXoT4rb9\/f0D949ehHKjH\/9f1hMRwhH3IQSLiQWHrEaIbdQS1C0MjF4FwwXAwGoIoos\/Hjz+LTfk6YkVG\/901V8nqaehqtFvcs6pCcE3vn7ngaECqxFik6QGfpWegiQQq94fIAQ9EYI0hl+u9E+NeLl4cNXGO84b54jehSQdVccRguV87avvGirAVtckuHHj6aVDAEUZiPt77YCBzTKILvtypX8aLihX\/y9qvKNXodj45+iDEJw8+fbg+NLn\/9ZQAXpRTxAfIbduPTmfVhjTCRPF7Y5DBtZd2AggBFsQglQomIYNYoigqtiwqvGOpYxTUWGcJ3oIUj1B6oVYJARdrkWwSFCGwKMPH5798T\/4j4YK0AspSD0FVZABYMBCkAQgLTaUBCE3FbBqlkGuALE8LFH1Q256lsHQ+PjHXjBUgN4VGqZphUURsCIhMIKFiVKDHuP+aVZAbiZBqi0oDyUsmq2Qjsn9kKl4sVzUSAju8fjOH8xlIHoInnnm3\/sDAgBC0K0QpEY7DQlUrUSYdjksTyFMdQjlhj0EIQ0l5H7IEItNL0w0pKGCP\/r7\/2EuBE898QIhAABC0L0QRIoN96KlhKPxL9cXFHsB4nshFqmnYdEsg\/S9XG\/E1IXgyY\/+2f2ZBR\/9yD8mBJgE8dnz0kv7nd0fIAQrCEFadKhq5cLy\/aK3oHy1X1y2OHoZkljk1jRIEtJl\/cBQhSANFQTRSxC3EQKMncuXz8zef\/\/Q7MyZmysf8+abp2Y3bx6pdQxACFra3CgVIa477p96FeJfQpAfKghCDggBxk406CEDIQV1jw0hCDHwOoIQbFgIFvUSrJooJkxDC11nyEMFMcMg3U4IMIXegSbHhgzU7VkACEFLQpAa9EWbFi1Kqh1oKhRjFYLcUAEhwBR4552js7feOt7o2HPnrs4\/2pr0LgCEYEIZ0lDB3u\/99YGhAkKAoRIfN9Gdv+z21KC\/\/vq5A70Gcb+4+k\/HlO\/ThlAAhIAQDGKogBBg7EJwr\/j4odmrr14+UBtw9eqJ+fdDBKLRz4lDsL9\/LPtYACEgBIMSgugdKA4VxP8JAaYiBFEDELetWniYO+eq5wD6wt7ehdnhw8\/OdnZ2CAEhyA8VPPHbz2TvRwgwZSGItQaipyD1EhACjEUIdnd3CQEhODhUEGJQdT9CgKkJQUhA1AWkGoIihACGDAjBqIRglaECQoCxC0EUD5Yb85CBEIHoEYiagTSlMI6rEgI1BCAEhGCQQrDqUAEhwFSKCuPfdFv0DMRtMQOhXGiYE4K4nRCAEBCCQQpBCMAqQwWEAENeWyA+cop7DaTegHLjXV5HIDX8xWNTUWFOCOJ2qxWCEBCCwQlBnaECQoAhrz4YHzkhBnH1n7r1c1fzMW0wKB8bPQVxbFqTIFdUGNMVc9MWAUJACHovBMWhgigqXOUYQoAhkiQgruCjwY8hgJwQJAEoDhGUj01SUe45CGkwXABCQAgGJwTFoYLy8sSEAJYvrrfaYNUqhwAhIAS9FoLiTobxb3l5YkKAKZMrLlxGCIQli0EICMHghCCWJF60PDEhAABCQAhGLgSLdjIkBABACAjBBIRg2U6GhAAACAEhmIAQLNvJkBAAACEgBCMXgiZrDhACACAEhGBkQlBneWJCAACEgBCMUAjqLk9MCACAEBCCkQlBDA0c\/+w3G605QAgAgBAQghEIwbpTDAkBABACQjBwISiuRth0iiEhAABCQAgGLgRtTDEkBABACAjBgIWgPMWwzXMTAgAgBIRgIELQ1hRDQgAAhIAQDFQI2pxiSAgAgBAQggEKwTrbGhMCACAEhGAkQrDOtsaEAAAIASEYgRB0WUhICACAEBCCAQhBG9saEwIAIASEYOBC0HUhISEAAEJACHouBG1ta0wIAIAQEIIBC0GxkDBWJ+y6VoEQAAAhIAQ9E4IuNi8iBABACAjBgIRgk4WEhAAACAEh6KkQFAsJu1pzgBAAwLjZ27swO3z42dnOzg4hGKIQbLqQkBAAwLiFYHd3lxAMUQg2XUhICADAkAEh6JkQbKOQkBAAACEgBD0Sgm0VEhICACAEhKBHQrCtQkJCAACEgBD0RAi2WUhICACAEBCCngjBNgsJCQEAEAJC0AMh2HYhISEAAEJACLYsBH0oJCQEAEAICMGWhaAPhYSEAAAIASHYohD0pZCQEAAAISAEWxSCvhQSEgIAIASEYEtCUO4d6IMMEAIAIASEYMNC0KdCQkIAAISAEGxBCIqFhCEGfZEBQgAAhIAQbEgIYqgghgjSUEGfegcIAQAQAkKwISGI4sE+TTMkBABACAjBhoWgr4WEhAAACAEh2KAQFAsJo46AEAAACMHEhKBP+xUQAgAgBIRgC0LQt\/0KCAEAEAJCsAUh6Nt+BYQAAAgBIdiwEPRxvwJCAACEgBBsWAiK+xX0vXeAEAAAISAEHQjBEKYZEgIAIASEoGMhGMI0Q0IAAISAEHQoBEOZZkgIAIAQEIKOhGBI0wwJAQAQAkLQkRAMaZohIQAAQkAIOhCCoU0zJAQAQAgIQQdC0PfdDMcqBHt7F+Z47p67195z99wJwdaFYIjTDAmB504IvPaeOyEgBC0LwRCnGQIApgkh2IAQDLV3AABACAhBSzUEMcVwSNMMAQCEgBB0NO0QAABCMFEhEBERmXIIgYiIiBACERERIQQiIiJCCERERIQQiIiICCEQERERQiAiIiKEQERERAiBiIiIEAIREREhBCIiIkIIREREhBCIiIgIIRARERFCICIiIoRARERECIGIiIgQAhERESEEIiIiQghERESEEIiIiAghmFrOnz8\/O3PmzOzmzZu1j41j4tg4h4iIEAIZaK5evTp76KGH5o1608SxcY44l4iIEAIZYI4dOzY7cuRIo96BYi\/BoUOH5ucSEZHtJC7O0sXd5cuX5xdqQdNzEIIJJb1h1ukdKPcSxDlFRGTzMlD8DG4qBKu0C4RghDl+\/Pj8F79O70CxlyDOFecUEZHNJfXSFj9\/mwpBJHp743xVbQMhGGHabsDbFAwREanXO1Cs41pHCJb1EhCCnmbZL73q+4t+4fG9EydOzI4ePXr\/2KgzWDYTwbCBiMjmE1fz8Xldp21YljhfnJcQTEAIFjXe8SaI70W3USKdI94kVVLQZk2CiIg0v5pfVwhSG5GbUk4IRiYEp06dmt+2v79\/4Jh4A5Qb\/fh\/6jGIY3OJcy36voiI5JM+p6t6WKu+X3VxV\/7sj8\/1NKybLu7OnTtXWzQIwQiFIF3110m8edIbadGb2vRDEZHNCEHVZ3nxsz9JQ3x2p6nm6XsxPFz385wQTFQI4vgQgXhDxRtnWRcUIRAR2ZwQRCMfDfyiz\/4YBi4fly7wgqqegjhv7gKQEExICGJ4oNj45yAEIiLbF4Kqz9xyD0Eu6XM+JxSL2glCMBEhiGkrqagw3ixxfKonWKVIxVoEIiL9EoKqQvC0dH1VPRkhmIgQVBWipKKTqumIqzyWWQYiIv0RgqaPSwgGlrRCYNXmQqnhL\/9S0\/hReUrJojdHccwplzjXovEoEREZlhDk1iIgBD1Omg4Yv7xi11CxAS+\/KVJXUXmKYKo+LVeexpslDSVUvcHSVEa7HoqIbEYIVpllUJXikEHVY5plMLCkK\/NUHBK\/wCQJVT0EqfEvF5MUJaJ8rmWzDHLnExGR1S\/slg3XloUgfS6X6wSKx1T12qb2IVf3lXqfc9MSCUHPE7\/84oqC8XUaDqhqxKuu6OO44rLF8WYpn6tcgJJMU\/2AiEj9pM\/j6Iktfr4WC70XLUxUHv5dNu2weLGY65VIF5oWJppI0sqCixamWDXJUnOVqiIisvzzODX88W9x2fi4KEtflxvvqs\/xJATF8+QWJqrqPVj0mU4IRm6l64z76x0QEWlHCqLxT2IQDXj6XK0SgkhuI6IkBKlOLM5TFIF4nEUb0SUpyYUQjDQxTpRWo2qybXHa4yDOYdtjEZHNJ9V+tTXDa9n5CIGIiEhP09aFWbpIXLTiLCEQERHpadLQ7bo1Yal2YNEwMiEQERERQiAiIiKEQERERAiBiIiIEAIREREhBCIiIkIIREREZAUh+Ge\/koIp8JklrwUAAKPm\/wEXmCnc3ELyhwAAAABJRU5ErkJggg==","width":516}
%---
%[text:image:2fe7]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:7637]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:4881]
%   data: {"align":"baseline","height":422,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgQAAAGmCAYAAAADPpzuAAAv2klEQVR42u3dX6hd55nfcTODxz7jzHg0QTgXQz1VOQ6dwPE0aicwhDoJ8gSGNoYwCjOFOmUKSlxodDNUhMC4d9LVyFCI0UVxfeVWEAncCxVEY4ovNCGiuoiJphcnLm0cxWCkm8SKFCe7frbyqkvrvGvvvdZea+\/15\/ODLzraZ6+199lnn\/1+1\/s+7\/s+NJvNHqrgrz7kf6+AiIiIDDwPLeA\/eXlEREQIASEQEREhBIRARESEEBACERERQkAIRERECAEhEBERIQSEQEREhBAQAhEREUJACERERAgBIRARESEEhEBERIQQEAIRERFCQAhEREQIASEQEREhBIRARESEEBACERERQkAIRERECEFnQnDmzJk5kcuXL88eeuihOavm5s2b8+PPnz\/vNyYiIjJEIYiGPBr\/EIGmQlA8z9WrV\/3WREREhiQEcWV\/6NCh2fHjx+\/f1lQI0rmOHTvmtyYiIjIkIchd1TcVglxvg4iIiAxACOKK\/ujRow\/cto4QRC9BHFfscRAREZEeC0Fq+FMxYRtCEAkZiGNDDkRERGRDQhCV\/akBr2qEU1d+sTegqnu\/LARx\/tTIp3OcO3eu8gkbNhAREdlSD8GRI0fmjXBVQ537fhT\/5XoBikJQFIm4fzpPcOLEiVo9DyIiItKxEJw6dWreCOcq\/KNgML4X9QLFHoRo5KOBXyQEcUz5Sj+kIn0\/JyD7+\/vz78VzEhERkQ0KQWqEg\/i6mCQL5Sv6KoEo9xDkEueK7+eEYtG5RUREpEMhiKQhgHIjnrr5ywsGrSIEVTUJqdchJyCEQEREZItCkLryi4WDqeEuTy1cVQgWPrFf3SdXPEgIREREtiQEaaXA4lV76trPjfV3LQRtr0XwxhtvAAAwGLYmBEUBSAV9IQjlYsKUVWYZVKU4ZFB1fNuzDNLjAQCwbR59+PCcx3f+YPbEbz8z58mP\/tmcddbyaU0IUkMddQNpfYKq6YFJHsqyUBSCqmmMaTpirhcgPe6itQoIAQBgKI19NPIf\/9gLs73f++s5\/\/Sp\/7yQXghBJBURph6Aqt0HU6Ne3rJ42bTDdFzVcEGa1dD2rofepACANhv8dGVfp7FfhTh3L4Sg2GDniglT0lTFcg9CEoIQiiQVuYWJFi2CVDUdsU0h+P3f\/8zgeOyxTwzyeQcPP7w7+93f\/aTn7rl77T33wTz3jx3+J7MnDv3xA1f46zT0f\/KP\/uucL3z627M\/+dR\/mfOpvRdnH\/97X549\/Q\/\/dN6jkGSgF0KQNhhapds+GvroBcgJQapDCMEoikAME1QtS5yGLLpYpbAsBC++OBsce3sXBvm803Mf6vP33D1\/z33cz\/3UX\/1kdvKFd2dfef4Hsy99\/jv3GuwPG+6mjX2c4\/kvfm9+vjhvsOjx\/\/AP\/9XsM5\/5zIF2autCUCdpqmJb4\/2pLiG3NgEhAACsQ67hr9vo5xr8OO86z2sUQpB6CaIHYN3dCbvsHSAEADC9xr\/pFX+62o9j\/\/LP\/27pFf66jEYIUkNeNRthlYRMtCUWhAAApt34N7nib+tqf9JCMJQQAgCYZuNfvOLfZsNPCAgBAKCFMf+mV\/19\/zkJASEAAKxx9T\/Exp8QEAIAQAsCMPTGnxAQAgAgADUEIF39x\/S+MTX+hIAQAMBkawBWFYAxXv0TAkIAAJMWgX\/xz\/8nASAEhAAApjoUcPyz3yQAhIAQAMCUJCDG96uGAj73iW9NpgaAEBACAJhkPcCiZYBTT0CfFv4hBISAEABAS0MBy2YDGAogBIQAAEYoAYtmBRTrAbxmhIAQAMDEJEA9ACEgBAAw0m7\/Ype\/14sQEAIAGBmpAJAEEAJCQAgATLA3ILr1q2YBpG5\/rxUhIASEAMDExv+N\/RMCQjBhIXjllTdmb7zx4n3i\/\/7ogPGJwKIhgfgeCSAEhGCiQnD69K3Z228\/k\/113779+FwO4j7+AIHxDQmYCkgICAEhuE+VDBS5devJ2csvX+vk8V96aX92\/vz5+\/+Px7t588jS4+KYONYHA9CsQFBdACEgBITgPpcunV0qA8Xegral4MyZm\/PG\/803T9UWgjgm7hfn8OEArN4bYEiAEBACQnBgqCAa+VzDf+XKybksXLv25Qfu07YUpEa9eNuqQhCUZQKYKt\/4+h29AYSAEBCCZkRtQPnXG8MH5XqB+H8IQlEK2qopeP\/9Q7PLl880FoKQgTiHXgJMfbZAuUdAbwAhIASEYCXOnn37wK82egMWHfPaaxfv9xYsu+8qvP76ufm5zp272lgI4ti4f1kqgKkMDegNIASEYEtCsLd3Yc7Q30jFK\/5UNLjKVX8MFyQpCKnIFQhWNejpe++8c3T+\/7feOn7\/65wQRGO\/v39s\/nX0AsT9cz0BcY74ng8ITHnaYKwnoDdgOkQ7dPjws7OdnR1CQAjWo1w7cPHiK7ULEWPIIff9aJzj+6++evmB2+Mqvng1Hw19NPhVQpDqA2I2Qfwbt+eGB5I0+JDAFBcRSj0CUUPgtZqeEOzu7hICQwbNica\/XERY9xw3bjw9u379uYVDAVevnjjQcBcb9LhPriAwPa84T04oyudNsuBDAlObMWDtAEMGhgwIwVpEQ178lVZd6S8rSIwCxEXFgsWr9jRcUOzaXyQEVVf8cd7yMAMhwJTqAxQKghAQgs6GC5rMGIhhg6hDqPp+XMUXhw3S1X15AaK6QhC3lxt\/QoCxicDxz34zOywQ3\/c6gRAQglaIosA6MwuqSPseVH0\/RKDYvZ8b54+r\/baEQA0BxlgoaMYACAEh2Fj9QNMNjOK4ZcdG13401Gm4oNz4p8LBnBDkZh9UDRlUnQcYgggsKhT0GoEQEIKNLUa0zjoGy+6ThglSl355vYG0qFBVUWFxeCE3S2FZTwPQVxbNGFAoCEJACDZCcSOjRUWBbZB6BqLBzk0vTMMK5emJacggNfQhBqkmodw7UHUOYGgioFAQhIAQbE0I2lhtcBkhAotWEoyGv7yoUOpVCBFINQNpTYLyGgRxrOECDFUEzBgAISAEvZhh0GS6YdtULV+8CmnZ4vJ6BQARACEgBIRgCeuuP9AFMQxQVUS4iOgdsGQxiAAIASEgBCMRAmDsswaIAAgBISAEABHwGoEQEAJCAExxQSEiAEJACAgBMBERqNprgAiAEBCCwU07JAQAEQAhIASEYOHmRABWEwErC4IQEIJBUtz6uOuVCoGxTCGMht9eAyAEhGC0exkQAqDezAEiAEJACEYjBJcunb3\/q4xVC\/1RAcuHB5IIxPe8RiAEhGAUQhBbFrex2yEwlTqBmEJIBEAICMHohOD06VsP\/DpffvmaP6w1ia2gYyimTMiX12cYhAjk6gTMHAAhIASjFYLyWgQarXZ6XX7+80cP\/KmY1jkM\/vLP\/5c6ARACQjBNIbAWQftCcPv2IUIw8CECIgBCQAgmJwTXrn35\/q8zvvaHRQimXisQswnUCYAQEILJCYGph4RgyjJQrhX40uf\/1msDQkAIpikEZhoQAr0ChghACAgBIZjPLDDTgBCYSmiIAISAEExcCMozDV577aI\/LkIwmZUGTSUEISAEhOBFMw0IgeEBgBAQAkLwYn6mgcJCQjAW4uq\/XDRoBgEIASEgBAuwpwEh0CsAEAJCQAgOzDSI5Xf9gRGCIZIrGiQCIASEoHMh2Nu7MEdh4WoNZW6N\/zry0cY5mhKPUX78+H\/5sVcVguiVaetniZkhuXNNqUBU0SCmTLRDhw8\/O9vZ2SEEhKDdwsIrV052ugBSItb8r7N\/QhvnqMvFi6\/M3nvvqV8Npxz68PEeKQyv3Gv44\/txvzpC8L3v\/UX2ZwlRqPscc+f6xS9+\/f5zMjwATEMIdnd3CYEhg\/UJCeiysDDXmEfDua4Q1D1HnavuaOhzGxXliPv98Iefml+VryIE8Zzv3v3NA\/eLx6z7XO\/e3TlwnrgtdrOcYq+AokEYMiAEhGDNK+EuVywckhDEa7GqCBT54IPfmN2585GVawh++tPD2XPUGTYIAcmJRfQa6BUACAEhIARrr1jYdiM7FCG4t33xI5Vv+WJjH\/e7e\/exUoP+8IdS8FsrCUHcFgJQFoI6wwa54YI4x1hXnNQrABACQrABYsph+tU2GcseuhBEF3vuajs19N\/\/\/hfnV+SpKz6u5KM34Sc\/eSLbbb9MCOL43H2j52Cd4YKbN49MYgaBXgGAEBCCDRQWtr0V8hCEIK62y1fsaTx+WcV+HBuFfHWEIPjRjz7Z+Ao\/nlO5NyJ6LNqWOb0CACEgBBMTgmKDe+vWk5MSgrhazw0VxG2rnj+koKr2oEoIooehfJUfQrDKTI\/oscg91piKCfUKAISAEGyBLhco6rsQfPe7X82O59cpzrs35LBTSwjimJxErDJskDsuJGHo78OvPP+DB5YcJgEAISAEGyYap64WKOq7EOQq\/ptIUXH65qorFeYKA2O2wqJhg1zPQtQ\/DHkxoqrZA4YGAEJACLZADBV0sUBRn4Wgarjgxz\/eq32uVdchWLYmQTyfRa\/\/\/v6xtYoR+ygDegUAQkAIekRXOx\/2WQja3H+g6blyPRTvv\/\/RlXpy0vDGEPdLqOoVsOQwQAgIwZYp7nzY5gJFfRaCOG+5hyDO26T7vakQ5NYkiF6D3LBBbrhgiJtS5WYP6BUACAEh6AldLVDUdyFo67xNhaBq2CJX1JgbLojbzB4ACAEhIASdLVDUVjc0IVj+OubWJIiegGXDBbEWwVA2MlI4CBACQjAgigsUXb\/+HCHYkBBEo35woaEHZw7k77OjcBAgBISAEHS7QFH0FoxdCJrMDOhCCKrWJCgOG5SHC6LuINZQGOIQgcJBgBAQgp5TXqCojY1ycoV7scxuna7u4gyItmcZ5PYwaDLLYl25yK1JkHoAqmYX9Hkjo9wQQRQS+gAHCAEhGAjFX3Mb49NVV851rm5j056uFiaqeovXrdyPn6fuwkTL5OT27d+Zi8a92QUP7q743ntPGSIAQAgIwWbqCNrY6CiuYmP1vaaL6URDmdt4qC0hyFXu1+2Or+ryrzv8kFuTIHoOir+Te4sXPdrbYkKFgwAhIAQjobgeQVsbHeXmzq\/SqEVDG1sM596CbQlBXIHnhg1CClZdjyBmCeSmDtYVgtyaBFVLK\/dtI6PcEIFeAYAQEIIBU16PoI2Gp2p3vhCFqnHwuD26xXO9A21vf5wbkkgs2lI4hhXiOVZtbFRXCHJrEsT\/y7ML6my8ZIgAIASEgBA0privQRub5lR1+6cGL4QhegviftEARzd+1f27EII4T9UVfvRkRC9FNOxxvyCea5KcquOazlgor0lQPn8Mv7T1c7fB1776riECgBAQgrFSrOpva4GiZY18FM1FI18unqtqdNsUgtRdv+hKP55DPGbVc4yf7c6dx9YWgtx6A33dyOjeEsT\/3SwCgBAQgrESjVLbGx3F0EPVePgioiGO51PstehCCNLUvw8+eLj2cwwZiGNzBYp1hWBRgWKIyKIhjG0NExgiAAgBIRgp5XnvbZ03jblXNXjlrvoo9kuNfmxJ3LUQJBmKx142ZJFEIO6bGuncAkpNelhyaxL0aSOjogx87hPfmn3l+R\/4YAYIASEYKzduPD1rc4Gicvd8bPEb4+HRsEej+rOfPf6rrx+Z9yTEfYoFjWUh+OUvf62zq+VodKNRjiGEkJLiEEF8fe+2nfl9ig10Tgia9LBULZjUh42MzCQACAEhmJgQXLlycrZKpf26MxqiaDEa0lS0VyUfceWe7le8\/yZWb4yfPz1mfF31uHF7+Tk2XS+gfJ5gmysTmlYIEAJCMFEhiIa6zQWKMFxMKwQIASGYsBBEV3j6dcfwgT+8aRIbEZlWCBACQjBhISivR9C3lfFgGWIAhIAQbIjr15+7\/yvv02I4UC8AgBAQgg1SrJpva4EiqBcAQAhGIwR7exfmjP2NFr0C6VcevQX++KYnA4YIgP4S7dDhw8\/OdnZ2CAEh2NwCRW3tfAj1AgDaFYLd3V1CYMhgs4WF\/gDHKwPHP\/tN9QKAIQNCQAiqiZX2FBZOo3hQvQBACAgBIVipsLAvG+tA8SAAQkAINowVCxUPAiAEhIAQPDDToK2tkLE9YmdCxYMAISAEhKARXWyFjO3PJDBEABACQkAIGs80KG73i2EVD5pJABACQkAIzDSYuAwoHgQIASEgBGtz5crJmSWMx1E8GLsXem0AQkAICMHaUw9DDvwRmkkAgBAQggkKgZkGw5MBMwkAQkAICEGnQmBPg2FNK\/zS57\/jdQEIASEgBKYemlbodQEIASEgBB0JgamHZAAAISAEExWCGzeenpl6aFohAEJACCYuBMW1CGJ\/A3+I\/ZSBqCHw2gCEgBAQgs6IjY2sRdAvGfjCp79tJgFACAgBIdjeWgSEwBoDAAgBIZioEFy6dJYQkAEAhIAQTF0IimsREIL+yIDXBSAEhIAQEIKJyYAFhwAQAkJACCZMefVB0woBEAJC0JjTp28RAjIAgBAQgqkLwbqNeFEILl58xR\/iBrD6IABCQAhaJxrxdRry4rRDKxWSAQCEgBAMVAhi\/4Hbtx9vPHRw5crJmb0MNi8DliIGQAgIQSerDV6\/\/lyjY9PSxSEV\/gi7mUVABAAQAkKw0V6CuNqve1z61YdU+CPsXgZOvvCu1wYAISAE3dYS1C0MjF4FwwVkAAAhIAQjW4cgNfCr9BQkgVj1\/lhPBixDDIAQEIKNrklw48bTS4cAijIQ92\/6eC+9tD87f\/58Z\/cfIt\/4+h0yAIAQEIL+1BPEr\/PWrSfn0wpjOmGiuN1xyEDT2Qlnztyc3bx5ZPbmm6dqHfP++4dmly+fGe0f8b\/51\/+XDAAgBEMXgr29C3PGIAWpp6CKdWQgCBEIIah7XMhASEHIwRiHCtImRWQAQFOiHTp8+NnZzs4OISAE7RUapmmFRRFoY0XCplf6qZegTs\/CUGTgC5\/+NhkA0JoQ7O7uEgJDBv3m9dfPzd8u585dbXT8W28db9S7MAQZ+NwnvkUGABgyIATDJQr+4i2Qa6jT99555+j9Bj19XR4OiOOjByDY3z+WlYZ1haKvMmApYgCEgBCMgmjo423w6quXDzT0cXsaIohGPxr78vGpyDBmEsR9QxpCDEIoiveL88f5hj7joCwDMVQQswx8mAEgBIRgFEMBV6+eeOD2aPyLhYBxn1VqAFLDn7vvqucYkgwYKgBACAjBaIiGvzhskIYLovegTmMeMhA9AFXDEEMWAjIAgBAQgtETvQPFYYM0XFDs3q9qzKMmIHoTym+rMQmBVQgBEAJCMAlSN38aNogGvtyg56YNhgzE7VE3EEMPxYa\/SgiGtkARGQBACAjBpIhGPRrxNFxQbvzje+VGPhUklmcO5IQgDSUMqaiQDAAgBIRgcqRhghCBXCMft0dvQFkS4r7FGQVVNQTp\/GQAAAgBIegxqWcgrSVQNaxQnJ6YGvnoKQgRSEsb53oT4py58\/YVMgCAEBCCyZKKA6vG+aORL848SD0HaWGitChR\/L+4iFHcNqT6gbIMnHzhXe8PAISAEGDd1QarVjkkAwBACAjBgIsP6zTuuaEGMgAAhIAQgAygE6KOJRW4poLXVWpnhr6cNggBISAEaImvPP+DB2TAZkXNeeWVN2ZvvPHifeL\/m5olU1xqe1UhSFtzD219DBACQkAIQAZ6yenTt2Zvv\/1M9iPm9u3H53IQ9+nisXON+qpCkJMJgBAQAkxYBmxjvB5VMlDk1q0nZy+\/fK2z3oHcGhl1hGLIG2+BEBACQoCGxLoCZKAdLl06u1QGir0FbUtBFLmWp8PWEYI0Eya33DZACAgByABWHCqIRj7X8F+5cnIuC9euffmB+6wiBYv2wyjenta4KO6lURSCKBpMjX30AsTXxZU1151SCxACQoCB8jd\/83\/mtQJkoB2iNqD8kRLDB+V6gfh\/CEJRChbVFKwqBGmp7PK01iQEqfcgraQZUpCrF0jTY804ACEgBJhIz0BRBr70+e94Xdbg7Nm3D3ycRG\/AomNee+3i\/d6CRfddVQjS3hvl+yUhKNcFpOW2086e5XOrIwAhIAQgA6hJ8Yo\/FQ2uMpMghguSFIRUdCkEueGBtGU3IQAhIASEYIIy8IVPf\/uB6YVel\/Up1w5cvPhK7ULEGHLoUghy5676HiEAISAEIAOoSTT+5SLCuue4cePp2fXrz60lBFXbajcVAgsUgRAQAowU2xh3QzTkxY+Rqiv9ZQWJUYDYRlFhuRiw7pBB1XkAQkAIQAZQY7igySqEMWwQdQhVawuUG\/TUG1AWhdyVfRKC8u3pHFXFhn63IASEACOXAZsVtUcUBdaZWVBF2vegavXBNG0wTRmMRj5RvO\/+\/rE5ZSGIY6M3IGYUFKcdxu3laYe5cwCEgBBg4JT3JyAD3dYPNN3AKI5bdGySgGjEo7GORYNyQpDkobioULpf3BbHxjni\/yEHZRlIixupHwAhIAQYEdH4W4Vws4sRrbOOQVvPKbd88arEcblpiAAhIAQYKJYk3gzFjYyqigI3TdOiwLRCYXmlQ4AQEAIMWAYsSbx5IWhaPwCAEBACWIVw4BRnGDSZbgiAEPRSCPb2LszxZrTwEFZj3fUHABwk2qHDh5+d7ezsEAJCgDamF3pNCAEwZCHY3d0lBIYMYOEhQgAYMjBkQAhg4SFCABACQkAIYOEhQgAQAkJACFCjiNBaA\/2ZdkgIAEJACGCtAUJQuTkRAEJACLCR6YXWGtgexa2P+7JSIUAICAEhmKAMmF64XYp7GRACgBAQApheOFEuXTp7\/+MjVi30mgCEgBCADEyQ2LK4jd0OARACQgDTCwfM6dO3HvgIefnla14XgBAQApheOPW1CKLHwGsCEAJCALMJJoi1CABCQAiw0ZoBr0k\/uXbty\/c\/QuJrr0kzzp59ey5UZfS6EAJCQAjIgAJCUw8nVqD5858\/euBjWa8LISAEhEABoQJCMw0m9jrevn2IEIAQEALkCghDDrwu\/SZmFphpQAhACAgBWpUB+xMMf6bBa69d9JoQAhACQoBmfOPrd8woGDBmGhACEAJCgFb42lffNaNgwBRnGigsJAQgBIQAjfni5940o2DA2NOAEIAQEAKsTcwiMKNgXDMNYk6914UQgBAQAjQqJFREqLCQEBACEAJCMFEZSIWEf\/pH\/81rMqLCwitXTnpNCAEIASHAasRMglRIeOJfWm9g6IQEKCwkBCAEhAC1KC9NHNMOvS7D5uLFV2ZdrVgYRYu5df6b1CrEwkm5c3U1zBHPMRr78v4E5efeRAjK523yurRxDhACQoC1iggVEo57xcI2N+X53vf+4sDHVaz7H6LQxrl+8YtfnwtN24L03ntPze7NvDj04fN9ZPb\/Z2Lca\/jj++lxmwhBcR+J4utS57Vv4xwgBIQAjeoGiksTKyQcFzHlMH2cNGmsF13F3r37mwc+sqJBrXuuu3d3Dpwnbjt9+lZrYhTPK7dRUY643w9\/+Kl5D0UbQhDnWFcI6p4DhIAQoHERIRkYf2Fh21sh\/\/Snhw98ZH3wwW\/U6tqORjcnFtFr0FavwKoiUP457tz5CCEAISAE06sbCDHwmoyPYuNy69aTrZ87Gs5yQ1qnJyI3XBDnaGNDpnvbFz9S+fFabOzjfnfvPlZ6Hg9\/KAW\/RQhACAjBtIoIrUZogaImxXm5j63oOVhnuODmzSNrP7cYbsj1PKSG\/vvf\/+K8dyINS8TPEr0JP\/nJE9nnRAhACAiBIkIMmmjwulyg6Ec\/+mTjK\/x4LuUr8LhKb6PWIXoeyr0XqTZh2WsQx0ZRIyEAIeiREOztXZjjzdjNSoTqBqZBDBV0tUBRXFWXr6ijIV7lceIqPfext24xYVzt54YK4rZVG9WQgqraA0IwPaIdOnz42dnOzg4hIATjLCK0pfE06HLnw2i8cw3nKsMGueNCEtZ9Tt\/97leztQ11ChXvDTnsEAI8IAS7u7uEwJDBOOsGvCbToLjzYdsLFFUVBkaF\/qJhg1zPQoz5tzGkkZv90KR+orjSIyGAIQNCMBq+8vwPFBFOlC4XKKpakyC65xcNG+zvH1urGLHucMGPf7xX+1zWIQAhIASjXnxIEaEFirpYiz93Vf7++x9dqdAxdem38bza3H+grZUKCQEhIASEQBEherlA0fXrz3Wy3kF53D56DXLDBrnhgramRMbzKPcQRGPaZCiCEIAQEIJRUdzBUBGhBYruNS6Pt37+qq76XCFfbrggbmv751y3MSUEIASEQBEhRr9AURsrAa6yJkH0BCwbLoi1CNrayIgQgBAQAqgbwBKKHy1t7ySYhgIOLjT04MyB\/H12OukJIQQgBISADKgbwJI6grY3Olq0JkFx2KA8XBB1B7FuQFvPocnMAEIAQkAILD6Eya5H0PZGR4vWJEg9AFWzC9ocvqjalrnJgkxNpx2WayliOeY6PTLFhaQIASEgBIRA3QA6X49g3SWCV22Qb9\/+nXnjem92wYM7Cr733lOdDo2sM4shei7qLkxU1atQpxckNnciBISAEBCCtShvWmTxIZQp7mvQ9kZHi9YkiJ6D4pDFvcWLHu2kliE3i6Hu0ETV8McyIQjpilUamy66FI1+blMmQkAICIE3YeO6gViZ0OuCRd3RXSxQVLUmQdVywl30UoTo5IYN4jmtKkExYyI3jXKV1y23xsIq8hOvRWy\/nHtMQkAICIE3oboBtD4ToKuNjhatSRD\/L88uqLPZUF1y3e6JRdsrx3OPYYyqjY1WEYKqXRzjnFX1EnF7PG6ud4AQEAJCQAjUDaCTmQBdbnRUtSZBWRCiW73LBi7OXXWFH1frcSUeDXvcLwhRSg151XGrCkFVt386dzxOPF7cL+Qkhjiq7k8ICAEhIATqBtAZN248PetygaKq9Qba3sholaGLRVf60ThHQxuUix3TEMOdO4\/NmkxhXNbIx+NVPW5OSAgBISAE3oTqBtA6xW19F3Wfd7EmQWoMu3rc3DTIDz54eMnH7ENZGYhjcwWKqwhB\/PxVdROLCBkImSoWfxICQkAICIG6AXRCFNZ1uUDRojUJ2tzIqE5vRcjJsm75JAJx3yQsuUWCVi3GTPUIVWJUHsaIQsjU6Md2zYSAEBACQrAS\/+7f\/g91A2hc9Jc+YmL4oMtx\/Fy1f1sbGdX9mUNQYgghnlOxqz6+vnfbzvw+RVnJCUHdYsw4R2wFHXUT0bBH4\/+znz3+q68fmfckxH2KMy7KQvDLX\/7axnpVQAgIgboBTIhil3QXU\/+KjWGZruoW6ohKNK7p+cTXVVffcXv5+TddOyF+7uidSeeJc1e9FvEY5cfVQ0AICAHUDaB1rl9\/7v7HjIYGIASEYICoG0BbV+5dL1AEEAJCQAg6wnoDaLPbPH3MRG+B1wQgBIRgQEMFRRmIOgKvC9pYoKirnQ8BQkAICEHHdQPRU+B1QZuFhV4PgBAQggEQtQLqBtA2xd0HFRYChIAQ9JyYRaBuAF0XFprjDhACQqBuABNlUysWAoSAEBCCNWWgOMVQ3QC6nGnQ1VbIACEgBIRgTYpTDEMM\/EGiCzaxFTJACAgBIWiIpYmxjZkGm9xwCCAEhIAQrDBUYGlimGkAEAJCMGEhMKMAm+bKlZMzSxgDhKD3QrC3d2GOGQVA91MPQw68JsBBoh06fPjZ2c7ODiEgBGYUwEwDYOpCsLu7SwgMGZhRgPELgT0NAEMGhKBHQwVmFMDUQ4AQEIKJCYEZBeibEJh6CBACQrAFbFqEPnDjxtMzUw8BQkAItoQphujjWgSxv4HXBCAEhGALQwWmGGLbxMZG1iIACAEh2AKmGKKvaxEQAoAQEAJDBZgoly6dJQQAISAE25xiaKgAfVuLgBAAIxeC8+fPz86cOTO7efNm7WPjuIAQWI0QhAAgBAMWgqtXr86fdNNG\/fLly2sdTwisRghCABCCHgjBsWPHZkeOHGnUO1A8x6FDh9Y6x5SFIHoHjn\/2m1YjRCecPn2LEACEYDNX95vqJRijEJSHCqxGiC5mCbQlBBcvvuI1BcYoBMePH58\/4Tau7I8ePTrvJSAEzYcKrEaILohGfJ2GvDjt0EqFwEiFIJ5sSEEbid6BOF8UKBKCZrMKDBWgC2L\/gdu3H288dHDlysmZvQyAgQhBXJ3HA586dSp7gugBiKv3YoO9qJs\/vnfixIn75w2izmDRTIRNDBuMSQhsXIRNEqsNXr\/+XKNj09LFIRVeS6DnQnDu3Ln7jXYuue+nK\/poyMtJ8hDFgon0w4UkVElBOoYQGCpAP3sJ4mq\/7nHp4yakwmsJ9FwIooFOD55r4FOtQPHqPXoT4rb9\/f0D949ehHKjH\/9f1hMRwhH3IQSLiQWHrEaIbdQS1C0MjF4FwwXAwGoIoos\/Hjz+LTfk6YkVG\/901V8nqaehqtFvcs6pCcE3vn7ngaECqxFik6QGfpWegiQQq94fIAQ9EYI0hl+u9E+NeLl4cNXGO84b54jehSQdVccRguV87avvGirAVtckuHHj6aVDAEUZiPt77YCBzTKILvtypX8aLihX\/y9qvKNXodj45+iDEJw8+fbg+NLn\/9ZQAXpRTxAfIbduPTmfVhjTCRPF7Y5DBtZd2AggBFsQglQomIYNYoigqtiwqvGOpYxTUWGcJ3oIUj1B6oVYJARdrkWwSFCGwKMPH5798T\/4j4YK0AspSD0FVZABYMBCkAQgLTaUBCE3FbBqlkGuALE8LFH1Q256lsHQ+PjHXjBUgN4VGqZphUURsCIhMIKFiVKDHuP+aVZAbiZBqi0oDyUsmq2Qjsn9kKl4sVzUSAju8fjOH8xlIHoInnnm3\/sDAgBC0K0QpEY7DQlUrUSYdjksTyFMdQjlhj0EIQ0l5H7IEItNL0w0pKGCP\/r7\/2EuBE898QIhAABC0L0QRIoN96KlhKPxL9cXFHsB4nshFqmnYdEsg\/S9XG\/E1IXgyY\/+2f2ZBR\/9yD8mBJgE8dnz0kv7nd0fIAQrCEFadKhq5cLy\/aK3oHy1X1y2OHoZkljk1jRIEtJl\/cBQhSANFQTRSxC3EQKMncuXz8zef\/\/Q7MyZmysf8+abp2Y3bx6pdQxACFra3CgVIa477p96FeJfQpAfKghCDggBxk406CEDIQV1jw0hCDHwOoIQbFgIFvUSrJooJkxDC11nyEMFMcMg3U4IMIXegSbHhgzU7VkACEFLQpAa9EWbFi1Kqh1oKhRjFYLcUAEhwBR4552js7feOt7o2HPnrs4\/2pr0LgCEYEIZ0lDB3u\/99YGhAkKAoRIfN9Gdv+z21KC\/\/vq5A70Gcb+4+k\/HlO\/ThlAAhIAQDGKogBBg7EJwr\/j4odmrr14+UBtw9eqJ+fdDBKLRz4lDsL9\/LPtYACEgBIMSgugdKA4VxP8JAaYiBFEDELetWniYO+eq5wD6wt7ehdnhw8\/OdnZ2CAEhyA8VPPHbz2TvRwgwZSGItQaipyD1EhACjEUIdnd3CQEhODhUEGJQdT9CgKkJQUhA1AWkGoIihACGDAjBqIRglaECQoCxC0EUD5Yb85CBEIHoEYiagTSlMI6rEgI1BCAEhGCQQrDqUAEhwFSKCuPfdFv0DMRtMQOhXGiYE4K4nRCAEBCCQQpBCMAqQwWEAENeWyA+cop7DaTegHLjXV5HIDX8xWNTUWFOCOJ2qxWCEBCCwQlBnaECQoAhrz4YHzkhBnH1n7r1c1fzMW0wKB8bPQVxbFqTIFdUGNMVc9MWAUJACHovBMWhgigqXOUYQoAhkiQgruCjwY8hgJwQJAEoDhGUj01SUe45CGkwXABCQAgGJwTFoYLy8sSEAJYvrrfaYNUqhwAhIAS9FoLiTobxb3l5YkKAKZMrLlxGCIQli0EICMHghCCWJF60PDEhAABCQAhGLgSLdjIkBABACAjBBIRg2U6GhAAACAEhmIAQLNvJkBAAACEgBCMXgiZrDhACACAEhGBkQlBneWJCAACEgBCMUAjqLk9MCACAEBCCkQlBDA0c\/+w3G605QAgAgBAQghEIwbpTDAkBABACQjBwISiuRth0iiEhAABCQAgGLgRtTDEkBABACAjBgIWgPMWwzXMTAgAgBIRgIELQ1hRDQgAAhIAQDFQI2pxiSAgAgBAQggEKwTrbGhMCACAEhGAkQrDOtsaEAAAIASEYgRB0WUhICACAEBCCAQhBG9saEwIAIASEYOBC0HUhISEAAEJACHouBG1ta0wIAIAQEIIBC0GxkDBWJ+y6VoEQAAAhIAQ9E4IuNi8iBABACAjBgIRgk4WEhAAACAEh6KkQFAsJu1pzgBAAwLjZ27swO3z42dnOzg4hGKIQbLqQkBAAwLiFYHd3lxAMUQg2XUhICADAkAEh6JkQbKOQkBAAACEgBD0Sgm0VEhICACAEhKBHQrCtQkJCAACEgBD0RAi2WUhICACAEBCCngjBNgsJCQEAEAJC0AMh2HYhISEAAEJACLYsBH0oJCQEAEAICMGWhaAPhYSEAAAIASHYohD0pZCQEAAAISAEWxSCvhQSEgIAIASEYEtCUO4d6IMMEAIAIASEYMNC0KdCQkIAAISAEGxBCIqFhCEGfZEBQgAAhIAQbEgIYqgghgjSUEGfegcIAQAQAkKwISGI4sE+TTMkBABACAjBhoWgr4WEhAAACAEh2KAQFAsJo46AEAAACMHEhKBP+xUQAgAgBIRgC0LQt\/0KCAEAEAJCsAUh6Nt+BYQAAAgBIdiwEPRxvwJCAACEgBBsWAiK+xX0vXeAEAAAISAEHQjBEKYZEgIAIASEoGMhGMI0Q0IAAISAEHQoBEOZZkgIAIAQEIKOhGBI0wwJAQAQAkLQkRAMaZohIQAAQkAIOhCCoU0zJAQAQAgIQQdC0PfdDMcqBHt7F+Z47p67195z99wJwdaFYIjTDAmB504IvPaeOyEgBC0LwRCnGQIApgkh2IAQDLV3AABACAhBSzUEMcVwSNMMAQCEgBB0NO0QAABCMFEhEBERmXIIgYiIiBACERERIQQiIiJCCERERIQQiIiICCEQERERQiAiIiKEQERERAiBiIiIEAIREREhBCIiIkIIREREhBCIiIgIIRARERFCICIiIoRARERECIGIiIgQAhERESEEIiIiQghERESEEIiIiAghmFrOnz8\/O3PmzOzmzZu1j41j4tg4h4iIEAIZaK5evTp76KGH5o1608SxcY44l4iIEAIZYI4dOzY7cuRIo96BYi\/BoUOH5ucSEZHtJC7O0sXd5cuX5xdqQdNzEIIJJb1h1ukdKPcSxDlFRGTzMlD8DG4qBKu0C4RghDl+\/Pj8F79O70CxlyDOFecUEZHNJfXSFj9\/mwpBJHp743xVbQMhGGHabsDbFAwREanXO1Cs41pHCJb1EhCCnmbZL73q+4t+4fG9EydOzI4ePXr\/2KgzWDYTwbCBiMjmE1fz8Xldp21YljhfnJcQTEAIFjXe8SaI70W3USKdI94kVVLQZk2CiIg0v5pfVwhSG5GbUk4IRiYEp06dmt+2v79\/4Jh4A5Qb\/fh\/6jGIY3OJcy36voiI5JM+p6t6WKu+X3VxV\/7sj8\/1NKybLu7OnTtXWzQIwQiFIF3110m8edIbadGb2vRDEZHNCEHVZ3nxsz9JQ3x2p6nm6XsxPFz385wQTFQI4vgQgXhDxRtnWRcUIRAR2ZwQRCMfDfyiz\/4YBi4fly7wgqqegjhv7gKQEExICGJ4oNj45yAEIiLbF4Kqz9xyD0Eu6XM+JxSL2glCMBEhiGkrqagw3ixxfKonWKVIxVoEIiL9EoKqQvC0dH1VPRkhmIgQVBWipKKTqumIqzyWWQYiIv0RgqaPSwgGlrRCYNXmQqnhL\/9S0\/hReUrJojdHccwplzjXovEoEREZlhDk1iIgBD1Omg4Yv7xi11CxAS+\/KVJXUXmKYKo+LVeexpslDSVUvcHSVEa7HoqIbEYIVpllUJXikEHVY5plMLCkK\/NUHBK\/wCQJVT0EqfEvF5MUJaJ8rmWzDHLnExGR1S\/slg3XloUgfS6X6wSKx1T12qb2IVf3lXqfc9MSCUHPE7\/84oqC8XUaDqhqxKuu6OO44rLF8WYpn6tcgJJMU\/2AiEj9pM\/j6Iktfr4WC70XLUxUHv5dNu2weLGY65VIF5oWJppI0sqCixamWDXJUnOVqiIisvzzODX88W9x2fi4KEtflxvvqs\/xJATF8+QWJqrqPVj0mU4IRm6l64z76x0QEWlHCqLxT2IQDXj6XK0SgkhuI6IkBKlOLM5TFIF4nEUb0SUpyYUQjDQxTpRWo2qybXHa4yDOYdtjEZHNJ9V+tTXDa9n5CIGIiEhP09aFWbpIXLTiLCEQERHpadLQ7bo1Yal2YNEwMiEQERERQiAiIiKEQERERAiBiIiIEAIREREhBCIiIkIIREREZAUh+Ge\/koIp8JklrwUAAKPm\/wEXmCnc3ELyhwAAAABJRU5ErkJggg==","width":516}
%---
%[control:editfield:57ca]
%   data: {"defaultValue":"t^2","label":"u(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:8965]
%   data: {"defaultValue":"1-cos(t)","label":"v(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:slider:633b]
%   data: {"defaultValue":-5,"label":"a = ","max":6,"min":-6,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:slider:116b]
%   data: {"defaultValue":5,"label":"b = ","max":6,"min":-6,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:button:36c3]
%   data: {"label":"Create Plot","run":"Section"}
%---
%[control:editfield:4cc2]
%   data: {"defaultValue":"t^2","label":"u(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:editfield:9779]
%   data: {"defaultValue":"1-cos(t)","label":"v(t) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:slider:6774]
%   data: {"defaultValue":1,"label":"a = ","max":6,"min":-6,"run":"Nothing","runOn":"ValueChanging","step":0.5}
%---
%[control:slider:995a]
%   data: {"defaultValue":3,"label":"b = ","max":6,"min":-6,"run":"Nothing","runOn":"ValueChanging","step":0.5}
%---
%[control:button:4c1e]
%   data: {"label":"Generate Graph","run":"Section"}
%---
%[control:checkbox:415d]
%   data: {"defaultValue":true,"label":"Show positive du regions?","run":"Section"}
%---
%[control:checkbox:656a]
%   data: {"defaultValue":true,"label":"Show negative du regions?","run":"Section"}
%---
%[control:checkbox:2386]
%   data: {"defaultValue":false,"label":"Show positive dv regions?","run":"Section"}
%---
%[control:checkbox:5277]
%   data: {"defaultValue":false,"label":"Show negative dv regions?","run":"Section"}
%---
%[control:checkbox:8282]
%   data: {"defaultValue":true,"label":"Show u(b)v(b)-u(a)v(a)?","run":"Section"}
%---
%[control:checkbox:9643]
%   data: {"defaultValue":false,"label":"Hide du stripes?","run":"Section"}
%---
%[control:checkbox:0941]
%   data: {"defaultValue":true,"label":"Hide dv stripes? ","run":"Section"}
%---
%[text:image:659c]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
