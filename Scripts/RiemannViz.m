%[text] # Riemann Sums
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] One of the most important and useful concepts of calculus is the idea of computing accumulation. In many situations, there is information about a rate of change (e.g., acceleration, velocity, concentration, flow, power) and calculus presents tools for calculating the accumulation that occurs (e.g., velocity, position, amount, volume, energy, etc). 
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] ## Riemann Sums with Rectangular Approximations
%[text] %[text:anchor:M_47D3451E] Approximation by rectangular Riemann sums is quite common.
% Initialize parameters
syms t
f(t) =  sin(t); %[control:editfield:2b6f]{"position":[8,15]}
a =  -pi; b =  pi;     %[control:editfield:8fc8]{"position":[5,9]} %[control:editfield:36a1]{"position":[15,18]}
% How many intervals do you want?
Intervals = 7; %[control:slider:6449]{"position":[13,14]}
tAllData = linspace(a,b,ceil(2000/Intervals)*Intervals+1);  % domain for plotting
fAllData = f(tAllData);         % range for plotting

dt = (b-a)/Intervals;
tData = a:dt:b;
fData = f(tData);
% Select the Riemann sum method of value approximation
EndPt = "left"; %[control:dropdown:91f8]{"position":[9,15]}
if EndPt == "random"
    RepPts = tData(1:end-1) + dt.*rand([1 Intervals]);
    fData = [fData f(RepPts)];
    tData = [tData RepPts];
elseif EndPt == "midpoint"
    fData = [fData f((tData(2:end)+tData(1:end-1))/2)];
elseif EndPt == "maximum"
    fMaxHelp = reshape(fAllData(1:end-1),[],Intervals);
    fMaxHelp = [fMaxHelp; fData(2:end)];
    fData = [fData max(fMaxHelp)];
elseif EndPt == "minimum"
    fMinHelp = reshape(fAllData(1:end-1),[],Intervals);
    fMinHelp = [fMinHelp; fData(2:end)];
    fData = [fData min(fMinHelp)];
end
  %[control:button:5bdd]{"position":[1,2]}
% Graph the output approximation overlaid on the data
figure
rsp = plot(tAllData,fAllData);
ax1 = rsp.Parent;
ShowRiemRect(ax1,double(fData),tData,EndPt);
%[text] Notice that many of these rectangles are overestimating (or underestimating) the value of the signed area over that slice of interval. 
%%
%[text] ## Visualizing Error in Riemann Sum Approximations
%[text] %[text:anchor:M_CCB4A3F6] Visualizing the error at each step requires tracking how much over-estimation and under-estimation contributes to each estimate. The red area visualizes the overestimation of energy production, while green area visualizes the underestimation of energy production.
if ~exist("ax1","var")
    disp("Setting up default values...")
    syms t
    f(t) = sin(t);
    a = -pi;
    b = pi;
end
% Select the Riemann sum method of value approximation
EndPt = "left"; %[control:dropdown:3f84]{"position":[9,15]}
  %[control:button:7bbf]{"position":[1,2]}
for Intervals = [1:10 12:2:24 25:5:100]
    % Create plots as individual frames showing how increasing the 
    % number of intervals decreases the step size and impacts the estimate 
    % of total area
    tData = linspace(a,b,Intervals+1);
    tAllData = linspace(a,b,ceil(2000/Intervals)*Intervals+1);  % domain for plotting
    fAllData = double(f(tAllData));         % range for plotting
    fData = fAllData(1:ceil(2000/Intervals):end);
    tFine = reshape(tAllData(1:end-1),[],Intervals);
    tFine = [tFine; tData(2:end)]; %#ok<*AGROW> 
    fFine = reshape(fAllData(1:end-1),[],Intervals);
    fFine = [fFine; fData(2:end)];
    rSE = plot(tAllData,fAllData);
    axRSA = rSE.Parent;
    if EndPt == "random"
        RepPts = tData(1:end-1) + diff(tData).*rand([1 Intervals]);
        fData = [fData f(RepPts)];
        tData = [tData RepPts];
    elseif EndPt == "midpoint"
        fData = [fData f((tData(2:end)+tData(1:end-1))/2)];
    elseif EndPt == "maximum"
        fMaxHelp = reshape(fAllData(1:end-1),[],Intervals);
        fMaxHelp = [fMaxHelp; fData(2:end)];
        fData = [fData max(fMaxHelp)];
    elseif EndPt == "minimum"
        fMinHelp = reshape(fAllData(1:end-1),[],Intervals);
        fMinHelp = [fMinHelp; fData(2:end)];
        fData = [fData min(fMinHelp)];
    end
    ShowRiemRect(axRSA,double(fData),tData,EndPt,1,tFine,double(fFine));
    WaitTime = 0.1; %[control:slider:82f2]{"position":[16,19]}
    pause(WaitTime);
    drawnow
end
%[text] ![](text:image:8e0a) **Try**.
%[text] 1. Change the [method of approximation](internal:M_47D3451E) to right endpoint, midpoint, maximum value, and minimum value.
%[text] 2. Change the [function](internal:M_CCB4A3F6) that you are studying.
%[text] 3. Use the [slider](internal:M_CCB4A3F6) or watch the animation to observe the impact of increasing/decreasing the step size. \
%[text] ![](text:image:4cbe) **Reflect**.
%[text] 1. What do you notice about the error for the different approximation methods?
%[text] 2. What impact does shortening the step size have on the total energy estimate? Does it matter which type of estimate you are using? Why or why not? \
%%
%[text] ## Riemann Sum with Trapezoidal Approximation
%[text] Constant value approximations are frequently clearly bad approximations, even to the naked eye. Continuing the theme of approximating functions by polynomials, after a constant (0th degree polynomial) the 1st degree polynomial approximation is a line. Using the endpoints of each interval this gives us a trapezoidal approximation of the area under the curve.
syms x
f(x) =  (x-5)*(x+2)*(x-7); %[control:editfield:878f]{"position":[8,26]}
StepSize = 170; %[control:slider:9a95]{"position":[12,15]}
xVals = -5:.01:5;
fVals = f(xVals);
p = plot(xVals,fVals);
ax = p.Parent;
% fplot(f(x),[1 10],"k-","LineWidth",2)
hold on
DisplayTrapezoidMethod(ax,xVals,double(fVals),1,length(xVals),StepSize,.01);
title("Trapezoidal Method with step size "+StepSize*(xVals(2)-xVals(1)))
subtitle("")
hold off
  %[control:button:1957]{"position":[1,2]}
%%
%[text] ### Trapezoidal Approximations with Error
%[text] Animate using a trapezoidal approximation with decreasing step sizes and compare the result to the exact area.
% Compute and display the energy with varying step sizes from 1 hour down
% to 5 minutes using the trapezoidal approximation
if ~exist("ax","var")
    xVals = -5:.01:5;
    fVals = (xVals-5).*(xVals+2).*(xVals-7);   % Set up the default values
    p = plot(xVals,fVals);
    ax = p.Parent;
    syms x
    f(x) = (x-5)*(x+2)*(x-7);
end
SumTot = DisplayTrapezoidMethod(ax,xVals,double(fVals),1,length(xVals),[200:-5:5 1],0.01);
% Compute the best available energy estimate given the data
ExactTot = double(int(@(x)f(x),x,xVals(1),xVals(end)));
% Create a new plot of the estimates of energy generation against step size
plot([2:-.05:.05 0.01],SumTot)
hold on
% Add a line for the best estimate
cmap = colororder;
yline(ExactTot,":",Color=cmap(2,:))
title("Area Estimates compared to exact value")
xlabel("Step size")
ylabel("Area")
legend(["Area Estimate","Exact Value"],"Location","best")
hold off
  %[control:button:19df]{"position":[1,2]}
%%
%[text] %[text:anchor:H_0F583892] [⇦ Main Menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] ## Local Helper Functions
%[text] If you wish to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:21eb) at the top right of the Live Editor pane.
%[text] The function `ShowRiemRect` sets up the rectangular approximation graphs
function area = ShowRiemRect(ax,fData,tData,method,varargin)
% ax is an axis, fData is a vector of function values
% tData is the vector of endpoints of the intervals
% method is a string indicating the method of selecting the representative
% point
% showError is a flag; tFine and fFine are (intervals)xn matrices
showError = 0;
if ~isempty(varargin)
    showError = varargin{1};
    if length(varargin)>1
        tFine = varargin{2};
        fFine = varargin{3};
    end
end
delete(ax.Children(1:end-1));
area = 0;
if method == "random"
    intervals = (length(tData)-1)/2;
else
    intervals = length(tData)-1;
end
dt = diff(tData);
if method == "random"
    repPts = tData(intervals+2:end);
    tData = tData(1:intervals+1);
    repFPts = fData(intervals+2:end);
    fData = fData(1:intervals+1);
elseif method == "midpoint"
    repFPts = fData(intervals+2:end);
    fData = fData(1:intervals+1);
elseif method == "maximum" || method == "minimum"
    fExt = fData(intervals+2:end);
    fData = fData(1:intervals+1);
end
hold on
if intervals <= 10
    if method == "midpoint"
        plot(ax,(tData(2:end)+tData(1:end-1))/2,repFPts,"k*");
    elseif method == "random"
        plot(ax,repPts,repFPts,"k*");
    else
        plot(ax,tData,fData,"o")
    end
end
for k = 1:length(tData)-1
    if method == "midpoint" || method == "Midpoint"
        % Select the midpoint of the interval
        height = repFPts(k);
    elseif method == "left" || method == "Left"
        % Select the left endpoint of the interval 
        height = fData(k);
    elseif method == "right" || method == "Right"
        % Select the right endpoint of the interval
        height = fData(k+1);
    elseif method == "random" || method == "Random point"
        height = repFPts(k);
    elseif method == "maximum" || method == "Maximum"
        height = fExt(k);
    elseif method == "minimum" || method == "Minimum"
        height = fExt(k);
    end
    % Draw the rectangle on the plot
    if height > 0
        rectangle(ax,"Position",[tData(k) 0 dt(k) height],"EdgeColor","k","FaceColor","b");
    else
        rectangle(ax,"Position",[tData(k) height dt(k) -height],"EdgeColor","k","FaceColor","b");
    end
    % Add the approximated energy generated in this interval to the total
    area = area+dt(k)*height;
    if showError
        DrawColoredPolys(ax,tFine(:,k),fFine(:,k),height)
    end
end
title(intervals + " interval Riemann approximation " + ...
    "between "+tData(1)+" and "+tData(end),"Interpreter","latex")
subtitle("Estimated area = "+area+", using a "+method+" approximation")
xlabel("t")
ylabel("f(t)")
hold off
end
%[text] The function `ViewTrapBetween` sets up the trapezoidal approximation graphs.
function ViewTrapBetween(ax,xdata,fdata,skip)
arguments
    ax 
    xdata (1,:) {mustBeNumeric} 
    fdata (1,:) {mustBeNumeric}
    skip (1,1) {mustBePositive,mustBeNumeric,mustBeInteger}
end
% ViewTrapBetween computes and draws a trapezoidal approximation to fdata
%     with a constant interval length of skip between xdata values
% Inputs: xdata is a vector of independent variable values
%         fdata is a vector of dependent variable values wrt xdata
%         skip is an integer 

% make a vector of the slope from the beginning to end of each interval
slopes = (fdata(1+skip:skip:end)-fdata(1:skip:end-skip))./(xdata(1+skip:skip:end)-xdata(1:skip:end-skip)); 

% expand the slope data to match the size of xdata with each point in the
% interval being matched to the slope for the entire interval
slopedata = reshape(slopes.*ones(skip,1),1,[]); % define vector of slopes at each value
if length(slopedata) < length(fdata)
    k = length(fdata)-length(slopedata);
    m = (fdata(end)-fdata(end-k))/(xdata(end)-xdata(end-k));
    restSlope = m.*ones(1,k);
    slopedata = [slopedata restSlope];
end

x0 = xdata(1:skip:end);                  % define center time value for tangent line
x0data = reshape(x0.*ones(skip,1),1,[]); % define associated center value for each point
y0 = fdata(1:skip:end);                  % define center height value for tangent line
y0data = reshape(y0.*ones(skip,1),1,[]); % define associated center value for each point

% Compute the heightdata corresponding to the piecewise linear
% approximation of fdata over intervals of length skip
heightdata = y0data(1:length(fdata)) + slopedata.*(xdata-x0data(1:length(fdata)));

% Plot the trapezoidal approximation for each interval and shade the extra
% (or missing, respectively) area red (or green). 
DrawColoredPolys(ax,xdata,fdata,heightdata)
end
%[text] The function `DisplayTrapezoidMethod` computes the approximate area and displays a plot of the trapezoidal approximation
function accumulation = DisplayTrapezoidMethod(ax,xData,yData,startIdx,stopIdx,skipVals,dt)
% DisplayTrapezoidMethod shows the approximation of the integral of yData
%     dxData from xData(startIdx) to xData(stopIdx) by size skip for each
%     value in skipVals
% Inputs: ax is an axis; xData is a vector of independent variable values
%         yData is a vector of dependent variable values
%         startIdx is the index of the lower bound of the integral
%         stopIdx is the index of the upper bound of the integral
%         skipVals is a vector of desired skip values
%         dt gives the size (with units) of a minimal step dx
% Outputs: accumulation is a vector of approximate integral values
%              corresponding to each entry in skipVals

accumulation = zeros(length(skipVals),1);
count = 1;
for skip=skipVals
    plot(ax,xData(startIdx:stopIdx),yData(startIdx:stopIdx),"-",SeriesIndex=1)
    plot(ax,[xData(startIdx) xData(stopIdx)], [0 0],"-",SeriesIndex=2)
    numMissing = mod(length(yData(startIdx:stopIdx)),skip);
    if numMissing > 0
        if ~isrow(xData)
            % xData is a column matrix; extend it
            xAll = [xData(startIdx:skip:stopIdx);xData(stopIdx)];
            yAll = [yData(startIdx:skip:stopIdx);yData(stopIdx)];
        else
            % xData is a row matrix, extend it
            xAll = [xData(startIdx:skip:stopIdx),xData(stopIdx)];
            yAll = [yData(startIdx:skip:stopIdx),yData(stopIdx)];
        end
    else
        xAll = xData(startIdx:skip:stopIdx);
        yAll = yData(startIdx:skip:stopIdx);
    end
    hold on
    %%\ Careful index manipulation to build trapezoid approximation plot
    tvals = reshape(xAll,1,[]).*ones(3,1);
    tAllVals = reshape(tvals,1,[]);
    pvals = reshape(yAll,1,[]).*[0;0;1];
    pParVals = reshape(pvals,1,[]);
    pAllVals = pParVals(2:end-1) + [pParVals(4:end) 0];
    tAllVals = tAllVals(2:end-1);
    plot(ax,tAllVals,pAllVals,"-",SeriesIndex=2)
    %%\ Calculate the effective height of each trapezoid
    height = (yData(startIdx+skip:skip:stopIdx)+yData(startIdx:skip:stopIdx-skip))/2;
    accumulation(count) = sum(height*skip*dt);
    %%\ Account for the extra trapezoid of smaller width at the end
    if numMissing > 0
        lastTrapHeight = (yData(stopIdx-numMissing)+yData(stopIdx))/2;
        accumulation(count) = accumulation(count)+lastTrapHeight*numMissing*dt;
    end
    ViewTrapBetween(ax,xData(startIdx:stopIdx),yData(startIdx:stopIdx),skip)
    drawnow
    title("Trapezoidal Method with step size "+skip)
    subtitle("Approximate Area "+accumulation(count))
    xlabel("Width")
    ylabel("Height")
    %pause(.5)
    count = count+1;
    hold off
end
end
%[text] The function `DrawColoredPolys` determines the regions where the approximation is too large or too small and colors them accordingly.
%[text] **Note:** By default the colors used are red and green. If you want to use other colors in some places, say a yellow and a purple, you can add the optional Name-Value pairs `OverColor` and `UnderColor` to the function calls:
%[text] ```matlabCodeExample
%[text] DrawColoredPolys(ax,xdata,fdata,heightdata,OverColor=[0.9290 0.6940 0.1250],UnderColor=[0.4940 0.1840 0.5560])
%[text] ```
%[text] or with yellow and magenta:
%[text] ```matlabCodeExample
%[text] DrawColoredPolys(ax,xdata,fdata,heightdata,OverColor="y",UnderColor="m")
%[text] ```
%[text] You can change the default used everywhere in this script by editing the values in `opts.OverColor` and `opts.UnderColor`.
function DrawColoredPolys(ax,xd,fd,hgtd,opts)
arguments
    ax 
    xd (1,:) {mustBeNumeric}
    fd (1,:) {mustBeNumeric}
    hgtd (1,:) {mustBeNumeric}
    opts.OverColor = "r";
    opts.UnderColor = "g";
end
%%\ Determine the regions where the data given by fdata is equal to,
%%\ below, or above the approximation given by heightdata

if isscalar(hgtd)
    hgtd = hgtd*ones(size(xd));
end
sameHeight = fd == hgtd;
isRed = fd<hgtd;
isGreen = fd>hgtd;
%%\ Identify the start/end of each colored region by finding the indices
%%\ where the colored regions start/end as the offset sum will be 1 there
sameHeightp = [0 sameHeight 0];
isRedp = [0 isRed 0];
isGreenp = [0 isGreen 0];
redSum = isRedp(1:end-1)+isRedp(2:end);
greenSum = isGreenp(1:end-1)+isGreenp(2:end);
equalSum = sameHeightp(1:end-1)+sameHeightp(2:end);
idxSwitch = find(redSum == 1 | greenSum == 1);
%%\ Check for points that were double-counted because they transitioned through a point of equality
idxCheck = find((idxSwitch(2:end)-idxSwitch(1:end-1))==1);
if nnz(idxCheck)>0
    for k = 1:length(idxCheck)
        if equalSum(idxCheck(k))==1 && equalSum(idxCheck(k)+1)==1
            idxSwitch = [idxSwitch(1:k) idxSwitch(k+2:end)];  % dropping extra switch
        end
    end
end
%%\ Identify indices where a color change happens between datapoints
colorChange = find(greenSum == 1 & redSum == 1);

for k = 1:length(idxSwitch)-1    %% number of polygons to create
    if k == 1 && idxSwitch(k) ~= 1
        firstIdx = idxSwitch(k)-1;  % Fixes the initial index if the first value is sameHeight
    else
        firstIdx = idxSwitch(k);
    end
    %%\ Set up the x values for the polygonal bounds above/below the height line
    lastIdx = min([idxSwitch(k+1) length(xd)]); %% adjusting for the indexing of the last polygon
    %%\ Set up the x values for the polygonal bounds, left to right and then right to left
    xvals = [xd(firstIdx:lastIdx) fliplr(xd(firstIdx:lastIdx))];
    %%\ Set up the y values for the polygonal bounds above/below the height line
    %%\ To trace a continuous curve, the index ordering flips halfway through
    colorBetween = [fd(firstIdx:lastIdx) hgtd(lastIdx:-1:firstIdx)];
    if nnz(colorChange == idxSwitch(k))  %% Check whether the initial point switches colors between points
        %%\ If so, determine how to add a triangle of the appropriate shape to approximate the
        %%\ missing area.
        %%\ Calculate the slope of the height line in this region
        mh = (hgtd(idxSwitch(k))-hgtd(idxSwitch(k)-1))/(xd(idxSwitch(k))-xd(idxSwitch(k)-1));
        %%\ Calculate the slope of the data line in this region
        mf = (fd(idxSwitch(k))-fd(idxSwitch(k)-1))/(xd(idxSwitch(k))-xd(idxSwitch(k)-1));
        %%\ Calculate the value of x where the data line and height line intersect in this region
        xinterp = (hgtd(idxSwitch(k))-fd(idxSwitch(k)))/(mf-mh)+xd(idxSwitch(k));
        %%\ Append the interpolated values properly to include the additional triangle
        %%\ at the beginning/end of the polygon
        xvals = [xinterp xvals xinterp]; 
        height = mh*(xinterp-xd(idxSwitch(k)))+hgtd(idxSwitch(k));
        colorBetween = [height colorBetween height];
    end
    if nnz(colorChange == idxSwitch(k+1)) %% Check whether the final point switches colors between points
        %%\ If so, determine how to add a triangle of the appropriate shape to approximate the
        %%\ missing area.
        %%\ Calculate the slope of the height line in this region
        mh = (hgtd(lastIdx)-hgtd(lastIdx-1))/(xd(lastIdx)-xd(lastIdx-1));
        %%\ Calculate the slope of the data line in this region
        mf = (fd(lastIdx)-fd(lastIdx-1))/(xd(lastIdx)-xd(lastIdx-1));
        %%\ Calculate the value of x where the data line and height line intersect in this region
        xinterp = (hgtd(lastIdx-1)-fd(lastIdx-1))/(mf-mh)+xd(lastIdx-1);
        %%\ Append the interpolated values properly to include the additional triangle
        %%\ midway through the polygon
        xvals = [xvals(1:end/2) xinterp xinterp xvals(end/2+1:end)];
        height = mh*(xinterp-xd(lastIdx-1))+hgtd(lastIdx-1);
        colorBetween = [colorBetween(1:end/2) height height colorBetween(end/2+1:end)];
    end

    %%\ Plot the polygons and choose desired fill color
    if isRed(idxSwitch(k))||(sameHeight(idxSwitch(k)) && isRed(idxSwitch(k)+1))
        fill(ax,xvals,colorBetween,opts.OverColor) %% Plot extra positive regions red
    elseif isGreen(idxSwitch(k))||(sameHeight(idxSwitch(k)) && isGreen(idxSwitch(k)+1))
        fill(ax,xvals,colorBetween,opts.UnderColor) %% Plot missing positive regions green
    end
end
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode"}
%---
%[control:editfield:2b6f]
%   data: {"defaultValue":" sin(t)","label":"f(t) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:8fc8]
%   data: {"defaultValue":" -pi","label":"Left endpoint: ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:36a1]
%   data: {"defaultValue":" pi","label":"Right endpoint: ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:6449]
%   data: {"defaultValue":7,"label":"Number of intervals:","max":100,"min":1,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:dropdown:91f8]
%   data: {"defaultValue":"\"left\"","itemLabels":["left","right","midpoint","random","maximum","minimum"],"items":["\"left\"","\"right\"","\"midpoint\"","\"random\"","\"maximum\"","\"minimum\""],"label":"Method chosen?","run":"Section"}
%---
%[control:button:5bdd]
%   data: {"label":"Show plot","run":"Section"}
%---
%[control:dropdown:3f84]
%   data: {"defaultValue":"\"left\"","itemLabels":["left","right","midpoint","random","maximum","minimum"],"items":["\"left\"","\"right\"","\"midpoint\"","\"random\"","\"maximum\"","\"minimum\""],"label":"Method chosen?","run":"Section"}
%---
%[control:button:7bbf]
%   data: {"label":"Show plot","run":"Section"}
%---
%[control:slider:82f2]
%   data: {"defaultValue":0.2,"label":"Pause in seconds before the next frame: ","max":2,"min":0,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[text:image:8e0a]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:4cbe]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:878f]
%   data: {"defaultValue":" (x-5)*(x+2)*(x-7)","label":"f(x) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:9a95]
%   data: {"defaultValue":7,"label":"Step count (1 = 0.01)?","max":200,"min":2,"run":"Section","runOn":"ValueChanging","step":2}
%---
%[control:button:1957]
%   data: {"label":"Show plot","run":"Section"}
%---
%[control:button:19df]
%   data: {"label":"Show plot","run":"Section"}
%---
%[text:image:21eb]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
