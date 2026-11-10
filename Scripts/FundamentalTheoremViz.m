%[text] %[text:anchor:T_361B34F4] # Fundamental Theorem of Calculus
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] One profound connection between differential and integral calculus is the relationship between [accumulation functions](file:./Riemann.m) and [derivative functions](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives). 
%[text]{"align":"center"} ![The area between a velocity as a function of time curve and the time axis tracks the positive and negative distances travelled by a skier from their starting location](text:image:1c4f)
%[text] The geometric area under a curve corresponds to the total accumulation of the product of the values tracked along each axis. In this image velocity times time is distance. 
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] 
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![live script code hidden icon](text:image:4f46) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:0a3c) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2 hour online tutorial that teaches the essentials of MATLAB.
%%
%[text] %[text:anchor:H_05F9C18D] ## Fundamental Theorem of Calculus, Derivative Form
%[text]{"align":"center"}  $\\frac{d}{dx}\\left\[\\int\_a^x f(t)\\; dt \\right\]${"altText":"d\/dx \[integral from a to x of f(t) dt \]"}$=\\lim\_{\\epsilon \\to 0}\\frac{\\int\_x^{x+\\epsilon}f(t)\\; dt}{\\epsilon} = \\lim\_{\\epsilon \\to 0} \\frac{f(x)\\cdot (x+\\epsilon-x)}{\\epsilon} = f(x)${"altText":"=limit as epsilon -\> 0 of (integral from x to x+epsilon of f(t) dt)\/(epsilon) = limit as epsilon -\> 0 of (f(x) \* (x+epsilon-x))\/(epsilon) = f(x)"}
figure
clear f
syms t
f(t) =  t^2; %[control:editfield:0d81]{"position":[8,12]}
a = -2; %[control:slider:60a5]{"position":[5,7]}
x = 3; %[control:slider:2b90]{"position":[5,6]}
%[text] To consider a limit as $\\epsilon \\to 0${"altText":"epsilon -\> 0"}, it is important to consider both positive and negative values of `epsilon`. To facilitate a close approach to zero, the slider allows you to set the exponent $n${"altText":"n"} in the expression $\\epsilon = 10^n${"altText":"epsilon = 10^n"} so the slider presents values from about 1.26 to 1e-8. 
EpsNeg = false;    EpsExp = -1; %[control:checkbox:9802]{"position":[10,15]} %[control:slider:6208]{"position":[29,31]}
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
xleft = -5; %[control:slider:17ba]{"position":[9,11]}
xright = 5; %[control:slider:718f]{"position":[10,11]}
  %[control:button:7cd5]{"position":[1,2]}
% Fix the ExtraArea color to be golden
if EpsNeg
    ColeChoice = cmap(4,:);
else
    ColeChoice = cmap(3,:);
end
% ColeChoice = "#EDB120";
yVals = f(tVals);
tpeVals = linspace(x,x+epsilon,50);
ypeVals = f(tpeVals);
BaseArea = area(tVals,yVals,"FaceColor",ColChoice);
ExtraArea = area(tpeVals,ypeVals,"FaceColor",ColeChoice);
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
%%
%[text] %[text:anchor:H_5EB3367A] ## Fundamental Theorem of Calculus, Antiderivative Form
%[text] $\\displaystyle F(x) = C+ \\int\_{c}^x f(t)\\; dt${"altText":"F(x) = C+ integral from c to x of f(t) dt"} is the total amount accumulated from any point $c${"altText":"c"} up to the point $x${"altText":"x"} plus an arbitrary constant $C${"altText":"C"}. Then the total amount accumulated between $t=a${"altText":"t=a"} and $t=b${"altText":"t=b"} is 
%[text]{"align":"center"} $\\int\_a^b f(t)\\; dt = \\int\_{c}^b f(t)\\; dt - \\int\_{c}^a f(t)\\; dt = \\left(C+ \\int\_{c}^b f(t)\\; dt\\right) - \\left(C+ \\int\_{c}^a f(t)\\; dt\\right) = F(b)-F(a).${"altText":"integral from a to b of f(t) dt = integral from c to b of f(t) dt - integral from c to a of f(t) dt = (C+ integral from c to b of f(t) dt) - (C+ integral from c to a of f(t) dt) = F(b)-F(a)."}
%[text] That is, the amount accumulated between $a${"altText":"a"} and $b${"altText":"b"} is the total amount that accumulated from the beginning of time up until time $b${"altText":"b"} minus everything that had accumulated from the beginning of time up until $a${"altText":"a"}. 
figure
syms t
f(t) = sin(t); %[control:editfield:09cf]{"position":[8,14]}
a = -2;         b = 1; %[control:slider:2042]{"position":[5,7]} %[control:slider:80ca]{"position":[21,22]}
c = -200;          C = 0; %[control:editfield:4c2c]{"position":[5,9]} %[control:editfield:208a]{"position":[24,25]}
AreaFlag = false;             %[control:checkbox:47aa]{"position":[12,17]} %[control:button:051f]{"position":[29,30]}
if ~exist("tAll","var")
    tAll = -5:.01:5;
end
syms x
F(x) = int(f,t,c,x);
FAVal = double(subs(F,a)+C);
FBVal = double(subs(F,b)+C);
try
    plot(tAll,f(tAll),SeriesIndex="none")
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
%%
%[text] [⇦ Main Menu](file:../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode"}
%---
%[text:image:1c4f]
%   data: {"align":"baseline","height":250,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAAD6CAYAAACPpxFEAAAidUlEQVR42u2db4gc533H121in3SnO1mx0MnSScZO5No6ScZ2q0hX6Qq1kesSXVPbchGBAykWqDj4T0TVF8HKq8QpMipBfWGVJn0RiOs3elEIBb8QBL0MuA19G9SXhUJc6Ju+KdP7zup3+unRM7MzuzOzszufB76cbnd2dm61+3z297\/3X\/\/7f\/+KEEIIlVXvj279Z4IQQgiV0T\/e+Z+k1\/un\/0gQQgihMvr+v\/83AEEIIQRAEEIIARCEEEIABCGEEADppK7fTnqvv9v\/yeuBEEIApLCufLLxIvX6P3k9EEIIgAAQhBACIAAEIYQACABBCCEAAkAQQgiAABAAghBCAASAIIQQAAEgCCEEQNotAIIQQgAEgCCEEAABIAghBEAACEIIARAAghBCAAQBEIQQAiAABCGEAAgAQQghAAJAEEIIgAAQhBACIAiAIIQQAAEgCCEEQAAIQggBEACCEEIABIAghBAAQQAEIYQACABBCCEAAkAQQgiAABCEEAIgnQLI+ge8DgghBECGAMjr7\/I6IIQQAAEgCCEEQAAIQggBEACCEEIABIAghBAAQQAEIYQACABBCCEAAkAQqkw\/+XW\/WPbi1WT72feTva+9lWw\/cizV3hdWUm3+vnHfzJvvJb1LN5Lej37BawdAEABBndL12yksFk+dSbY\/vpS+x585dDhZW1tLrly5kurWrVtR2f2rq6vJrr370scuPn882XLuSv+8vL4ABAEQNH3Q2PHW95OdB5aTrdvmU1hcu3YthcIo686dO8lPf\/rTZH19PZmbX0h2fO1gHyayanjdAUjntXUbAEETq61vf5Ru6rMbm7s2+Zs3byZ1LsFk5eRqsmUDUnKHARIA0m09exSAoImLaWjznpmbT5YPH0k39S+++CJpcsmykZtrZgMkqUXC\/wsAASAItR8c+vavzXtU91RVIBHEFr56kKA7AAEgCLXVVSWLoy3gCJcC74q96Dr5\/wIgAAShNmjjW\/1jzx1P9uzb30pwhNbINgXaXz7D\/xsAASAIjVNpbKHXS7\/dT8pSLGbTpUWAHYAAEISaj3XI6tBG\/PnnnyeTtgQRZYQpOwyIABAAglBTuvJJmtmkDbjpzKqq19ggooJHVd4T1AcgAAR1KVCueg6l5U7LikLE\/1ubvdqmVAUOjafW5\/nVc\/0i4YtXeW8BEACCplsKPCsAPYkuq9IQ2f9M0tu5J+n92V8mvadfrMZCkbWhz3L42Q5vQwAEgKBpincIHop3TLrLqhREvnEh6T08k\/S2zFVjJbz48oOWjEDFZxuAABA0tfDY2FSnHR621J9LHX\/Tv10uJnM5qZ2QNnvFLbJeq9XX+scJNjGLRZ9jQcTuk0WicxLEByAABE0rPKYhWF42xXezTkTAEEC0yeszqJiFPo8xkNj9goJ+Cha67ZX1pPflh5PehR\/2b7NzEPsAIAAETTs8urYEkaV9+\/szR\/S52zJ7z0qQRSJLQxDQT98+XhaFbtexuv07f5v0Ht3Vv+33fh9LA4AAEAQ8urCUKKDW8DN\/8d0+AI6sPphNZSCRVWEWiX7Xv6UvP5L0HvqdpPfn3+E9BUAACOqGFANQP6uuL0EkBcLBY\/2fsZoNDxJ9TpcOJL2Vtf7vX\/py0vubf+E9BUAACOpOqm5XAuZFZ4uos3DvyUP9tN4sN5TFSGRxCB47FnFZAZAWAUQZIbwWqEbNnz4PPDK6+G7btaefzit3VdZr+Ff\/0IfHE8\/2A+lKAV45zZhdANICgFBshGquMJ+b0iLBqmpEFvY9lT1eWvUdswt9cPiguo4FIAAEgKCp1d3sIeCRv2SdzR78gz5EwoJAS889+9e8nwAIAEHdybhSY8Rp6m1Vd3rv78pFpYJBH1SXlWEZWLyvAAgAQV2QZmJ0OV132PTehxa+0g+YK8ZhwXIAAkAACOpa0JxVbt28eTOZmduwQLZtT3ozW\/vBdVWrCyC8rwAIAEFTr0s30m\/Sd+7cgQhDrGvXriWzjy324fHUkb5LC4AAEACCpl7Xb6dxD32TZo2WmbXtwOE+OF74Y3pbARAAgqZfGkX7zjvvQICKGi9u\/fqpPkTkxuL9BUAACJpWqUEgxYLVB9V7axeZLghAAAii3oNVvt2JXIJABIC0U2rWBkDQiNp5YDlty8GqJx6SDqKyxopABIC0RmqHAEDQCNp+9v3KUnYvX76cbpL6ybq\/yHDLuStABIAAEDRdrqvZnJRdA0Io3f6b3\/zmgeM\/\/PDD9H79LLMeffTR5I033phaiNy6dSvZKleWb\/EORAAIAEHT7LoygHz66aebt+nfL7300gO3j7KmHSBaep2V5bbpegYiAASAoGl2XcUAYuuFF15IN\/6YJVJm\/fa3v02fY9oBcp8ry0NEKb505QUgAARNW9ZVHkA+++yz9L4LFy484MIKj9cx3gWm3wWeLBeZPV7nM2vHFLrHfvWrX6W3f\/zxx6mefPLJzGP9dfrj9Bz+mgU1f80CZVm3XJYrK83Ksh5Zgoe69apaXUOpwk6+CIAAENTGgsEiWVd5ADHXkzbiPIDIsvCWijZ83aafHgChBaLjdW6\/cdv1+Nvs8XoOgSCEVhbM\/Dl0m+Bj8JB1pXPZNescVUFEWVma7sj7EIAAEDRxkgtFrpQyWVVZANFGq\/u16WYBZFB8IwsgefESD4o8AIUWkq5rUJaY7tNz2N8U3j7qUsKCEheic9QRAAEgqLW6O+NDrpSmACIrQhtv1jnKAsRiL+HjQyjEYivmDsuL2+jcHjq2ZKHosWY5VRZQRwAEgKCJcF2tvFJqxkcVANFmbccJJuFGPwggOpceY+cwd9UwADGYZS2zWvJUBUAUUN8mK4QZIQAEgKCJ0MZmpd5MZXpdVRED8d\/gzQLQY3xMJAYQAcCOl0Vg8YdRLJCiAGkiI0xt3xefxwoBIAAETYDmdy+lm9YwleUxIMTiCXkACR9ncYwsgFiwW9leTbuwPBTrXHv27U+2vv0R708AAkBQe2WddodtTZJXB+KDzUUAEgbCs+pAdH\/MWgitiDIAsTjGoCB6lUWSeUtzV7Y\/vnQvrRcBEACC2hY431IicD5oM9UmbPAIN9kQIPqmH6a\/xtqd6HwCg8HI14hYeq1uM6gMCxBvhYRpvPa7pfHqevzfp\/vtWqpcKydX06JO3qsABICg1kk1B2UC50V7YYVprjGAaHPXbT4AHtZ2hIF2v7lr8w+L\/cJ02rIAsevUOfy5w2sK\/\/bYMVUsFXNu9sni\/QpAAAhqjTY2pVnmm7d+aQqkMuR4zwIQAILa0+\/qyDHmfExIn6w50noByFgAoh46vBYokrY7WzJtlzW+RVovABkPQOSj5bVAWB8Tv5TWixUCQAAIGnu3XayPyVuaoY4VAkAACBqrFk+dwfqY0FhI2miRjCwAAkDQuDKv9J4g82oyl1Ku50+f530MQAAIGkPs4+z7ydraGjvxhC4VfKrtDO9lAAJA0Fh6XqlFBmty1xzzQgAIAEHjCJ7vXtrHDjzhSxbk5ux0BEAACGrE+jh9Pq1q7tqKtTPJanEyyrL2KGq7UndNCJXpAASAoMbdV8M0TRy0MdfRAwqAZC\/1x0q79PKeBiAABDXZ96qOjRmANAsQrfRzTZt3AFKrLt0AIKivi1crz76y4U8ApHmAqM07VekApPZ+RwAEWfFg2YmDecu3V\/eyNu5qh67NWRu1HSvQ6H7drrbtvoW7n61hbdpjkwFt5kc4qMq3X9f8jlEAYjNNfKv22LVYe3r7G\/Q4XUcTAFEsS4PAeG8DEACC6gfI08uVxj\/8BhqzQGwjDTdfm33uhy\/ZECdt6nmWjaCh83pACDYeQDY7xCYalgVI7G\/SufxAK3\/N9nf4Ge1NACRtrrjxpYD3NgABIKh+bbwPql6DABJaCllLc83D82jDDjdiGzlrsDDQhJMP7Xabl14UIAao2PApPzkxNu+9aReWvgzsfWGF9zUAASCo\/vfBM4cONw6QohtpbDqgrIzQjWWWQNbvtvQYf11FAWJ\/T8xdpeex6zNLIzyuSYCoLxafbQACQFD9Wv+glvYlowBEj7HxsxZH8ACJWSWh+8rHUWIqCxCDVpbs+mzm+ziD6FqzVKQDEACCao9\/fOu7tXTfHQYg2ri18ZurSO6grPnkOs5iGea+MreU3R\/byIfNwjKAWCwma2U9b9MAWV1d7Wda8h4HIAAE1aXHnjteS\/+rYQCizTcMSGcBRJu7uYq0uYfuqixX0rAAsb\/HB\/hjqw0uLC19KVBzTN7jAASAoInKwBpUB5IFEN0egsJiFuHttslbemwYtM4KZg8LEAuWDwJAFjibBogGTNHSBIAAEDRxGVh+wzU3k7cqsjZi3SZLwqfsmksoBIh3F4Xuq7BmxG\/mAo7\/3QDl4yex2zwc\/LXoWsPjLA5iGWA6xmpUmgKIvhTQ0gSAABA0kQAxAPhAuG3yWRupNm5zAdlGbbUbMYDYhh7LtvLHhIWJoVVioPG3x26zv8lfox3jXVaCpT3eig0NIk0BZLOlCe9xAAJAUF3vgacOHk5Y07kOLB+mpQkAASCovveA+iaxpnMpPVtp2rzXAQgAQRPRRJHVnqVMrL2vvcX7HIAAEFS91HCvjhoQVjsWLU0ACABBtemJ9UsAZIoXLU0ACABB9RURrryS1guwpndpzj0tTQBIfQDhzdXdIsLnj9dSRMgikA5AugIQ0vy668J6cQWATPnSbJDdJ6hIByAABNVQRCg\/OasDcRBmpAMQAIImpQq9qqXK7yart4suVZ6rqn1Qs8a2uLG2vv0R73cAAkBQRdI30gkAiOAxqCHiuJbalcRarLRtKVFi38k\/4T0PQAAIqu7\/\/8jxE623PoqOvh3HssFWg2aE4MYCIAAETd3\/v4YOtXmp+WDbv+HHmjO2cS0fPsKAKQACQFBFev3d5J133mnthmft4AcNcBr3ig2zauNSwejOb36b9z0AASCoghqQmkbZVum+ik32k0ViwetYy\/RYsNu3X1dMJQal8LjYkKrYsnG6bQ+mK11754Fl3vsABICg6a9C1xyP2GxxQUO3CyIGApsZotv9Ri6g2FAri6NkTQzU+Xy2l84t62JQ\/MWmF9rwqDYv4iAApDqpAh2AdFZqstfmIsIs15BZHeE3fgtoe6vBJhxmncMsFntsbPxuEVfbsI9teh09cZLPe+0AWbvY10\/+rRN1ALyhOtqJd24++fzzz1u72WmTj9V\/2OYfswzMMvFQCMfNxoBhI2z1fGVdUZMEEMW81IGZ939dAHnrB\/dGVQoiAARRRDhRADG3l8UmYhu7AcNnePnxu3J5FQXCJAFEbU0WT53hvT8SQJ48dNcXGLEwfvzLpLdrX\/\/+7\/0MgKCpdV\/Ozi9MZHZTXQDxsReBy0AyTQBhPkgVAJldyAZIB7+FApBuJlC0fZRtXhA9BhCDgm36ZVxYsaVYShEwTFIQ\/c6dO4xwACAABI2o9Q+S9fX1Vm92eWm8MYDEsquKBtHzwGDnM4smTAGelDReMrGqAIigYTEOAAJAqAGZuEJC2\/x93YfFL0KXU14ar8\/W0nOE9SEhZLLcWpNSSGjrwPJhPvNDAcQsj5je+7sHAfPDf34QPIqP6Pezl+\/FSqRDf9iPn1gcRb\/bfYq52PmzoKaAvb8ePT7vMQAEjaDtR45NxCTCWCsT29i12fvCv5irqmghoVxaAooF0Q0U3i1l4AkfOymtTGypfU3v4lU+B2MBiM7h4eAloJy9nP0c\/nyxoH1MygoDIKhqC+Tp5YkYJBVrppgXRG96TUozRb9keW4\/+z6fg6FcWNrE81xYgwBi+vqf3nt8CA0BwYCkcxggXjr74PPZfWHKsMAhWEkABNXw\/z4pg6TCdu5tAsiktHP3S5anuhDwORgXQASMLBDIXRWe1wCj+2K3x87n76\/TCgEg3dP1261P4Q2tEB9jaAtAZHVMykCpMJVXFiifhXEBJOaKkkWSVXwoa8TcX\/72LFdYqCzAABA0ZAqvWlpM6mqTBTKpi1TeaQBIXuwDgKAOp\/CyyMQCIIMAYkH9JrKtAAi6qyfWL7U+hZdV79IXiC3nrvB5mAoX1jh7bgGQ7rVxf+54cvPmTXbRDi8F0nefIJA+2QCxILlutxoSAILqrgF5fKnVXXhZ9S+1NJnZNs\/nYaRWJn6ztw28SYD4OIh++mwrXY\/Sfuu2TgAIXXhZnVx79u3nsz8UQGyzjwWqmwaIrxPJKk4EIKjCDCwFUFkszQaZP32ez8RQ80D07d42aW3s9u2\/aYCY9DhfKa+akTqzrzxA1j\/gjdMVXbyatrJgseTGnN+9xGdiKICgewB5\/V1eh67EP86+TwYWa3PtXtrXH23NZ6MgQF49l\/SePYpMGwD50sJX0uZ6aPr1yLaF5Omnn06tEIT27NmTPLxrb\/f2vZxmkgCkJEAeeuih5OjRo3ygOqCHH3kk6e1\/lvc96raGBgh6wIW1dXFpIlp7s0ZftLBAiBhIpQCZOXQszchgTfdSEz3VgPC+RwiAVBdEX309eeYQqZ1dqD6mjTdCAKT6LKwWz4ew2diaC8EafjFICCEAUgtAFp9vrj+SASGU2nT7EaK2bOpbOIt60NL5NM2O1V\/pKNNLN3jPI9RJgKi9iYoLYz28RgSIvpk21eLbAOKnzGkoj815qGq+NAC5f+3aS84\/Qt0FiK9oV+V7FW3gzYV15ZO0qGhcALF14cKF9L6PP\/545OeRywuA9Jfck2RgIdR1C0Tg8C1P1CtLbVli7VWKSDnRdyvR1Z1TXTrHCRAtbfp+hKlGh8aO\/\/DDD9Nj7bWQi0vnznKR2eMFJ7N2vPssZsHoOjT5zh8vMMXGmOp5dQ12nB6ra8y7ZgGzqQysnQcYY4oQMRBJvbvCppDWP6tMa3gHEM0HuHbt2tgBYpu1bdIxgGgj9paKbfI+hqKNOmaBCAA6l41EtesJIWIuMMnOq2vS72FAX9cRnkPX6K\/ZgOTPpfOUje0Ms\/T\/unjqDBsEQgAkEhcJ56sLLr49fAGAqDpzbW1t7ADR7brfNtoYQLTpDnJPZQEktmLnM5Dp+WNuNgOcQBSDSuxvDpME7HYlCtS5VOcz8+Z7bBAIAZAcmAgaHiZyd6nTb1bg3QPk+u1GZkVUARDbxEMX0bAAsef0sDCAmKWSdWxoDWUByrvlfPLAoL+jirVycpW2\/QgBkBKWiI+V6N+x9vAeIBva8bWDtafzVgEQ25R9fCOMS+QBRMfqMf4cwwLEYBZaKn4JHpkzXxoASPo8+oLABoEQANmcURJzX+l3g4WBxWASurUCgDSRzjsIILap58VAfIDdNvDQRZQFEDtez2PnHMUCKQqQcWWEpeNL5xhfihAA8QH0MBtLoMjKxvrez+4F2nMAojqBufmFsQEkFk\/IA4i3KMJNOgYQC3aH3\/ibcGF5KDa5lIGlQlE2B4S6DBBBIHRLCSS6vcjjBQ89zsdDQoBsSFPKNK1snHUg3pIoApBY4WCsDsQ2+6zA+DAAsThGkSB6VUWSZVuY7H3tLTYHhDoNkLOX73dRla1ILwqQ0+dr7c4b20y1Gdu39NA6iAFEm7U2fdvcdYxg4dNobaO3DCdt9Pbcvv7CwDMsQDyYwjRe\/7udz\/99slrqjn8os46xxQhhgSS9D35eLkYS\/h66uCIAkRtrz779Y+mFFYsjhAARCLTxhgHw2Ld7f4zVW9hm74v97JqGBYjBQGDzBYe+3sSe2wfU9e+6rZIDy4fJwEKo8wBROq42niItTGRtyFIpUwfitGNPvW4sVnOLFiYIAZDyAFFgfUiA7PzmtxkyNQWLIVIIAZD7ATKo75VcVYKHguxDAqRuNxarmcUQKYS6DBBZEiZBwVJxzUUlqHipsaIdN4ILq4lsLFb9S1YkQ6QQ6iJAZEnkVC\/nStZHkQ69eQCpORuLVf+ihQlCXbZABBFVkyvuYd13Q6sjVJkU3xyANFFUyGoggE4LE4SIgWzGQKqcSJgHkLturKZG3bKqXXI\/0sIEIQByr69VFVMIQ4C8ei7z\/iZH3bJqCKA\/RwsThABIXRJApKz7r99OZucX0pGoLALoCAGQSZAsDZswGFogRVR0KuEggNxt8a5vs6zJWkdPnCSAjlAnAWJ9q3wth8VAikrHVwCQrW9\/lGbzdHHFJg1mtTgZZYUzUCoLoP\/k12wKCHUOINY4UXUd\/jZfFxLK6j8qBog2oS3b5tO5ElVuzOEMcgBSHUBUgb7zwDIbAkKdrgMZ5jGmilxYqRvr5TOVBtMBSL0AUQv3xVNn2BAQIog+xiB6DcF0bbxh63MAUi1AVldXk97Fq7y\/EQIgLQDIhjTV7tq1a5VslKFs49TmrA1bm7O1Yvdt2MMW7n6WRt5kQLvPb9Bh+3WdOzZXvShA\/EwTa+ceA0J4nM4Xuz4KCBECINUXEw5yTylW4rO3KgJI79KNShos2nyPmAViw520wfrN1EbWemAYjOw2G4drwPFLm7keHwLFn0+P0zEeDEUBEhtoZc9hA6209G+DlT1eILOBVlUARPEPFYCyGSAEQB7MwsoLjvtOvEXiIGUAsqG5xaWRU3oHAaTMRhoCwwDkN3cbOWuDmww04SAnu91DpShAdExspK1u89dnY3azhlRVARDVf6gdP5sBQgDkngSFIjM+3vpBHzRFrJCSAFFK79KIVkgRgBSNL4Rzz\/VtPnRjhXPQ7ffQXaUlC8RfVxGAmFURc51pdK5dnx3nx+nWAZBnDh1OrUU2A4QAyP2dedVQscpjSwIkbW\/y+GhWyCgA0QarzdbHLjxAYlaJuab8pp5XP1MWIAatLNn12djc2Az0qgCiVGsmECIEQOJQUL1HkZ5ZReeBqJFiSYCMaoUMAxAfVBcAbBMOLZDwW7+5r\/ymbQCJzV8fJgvLABIDg195x1UFECU57D7BACmEAEioorENK0IsUkg4BEBGtUKGAYht+j4gnQUQ+6avDds2bQ+LvGytYQCS55ryqwkX1qvfOE36LkIAJCeILiska1iU+mAJMkVG344AEG1Sw2Zk5dWBZAFE1kcICotZZN2ujVqPCwFgwfJY0HvYOpCs4Hjsurw7rUqAqEaH9iUIAZBsN5b1yLIYhx8kJZeV3edboNQBkLt1Iap4HmZZWq1tuBbQzgKIbbBmNeh4g0oMIObGCrOqQivEQ0xWSmgdxDZ8s4Z8EN7SeH0tif4GHeutH7OIfIxG11JFGi\/uK4QAyGCI2GTCLBWFx4gAUafXYavTtcn6QLht8nlBdLvPNmALqMcAYu6irGwrc3WFhYk6nz\/eQOOtEINFLF3YX6MBKoSCICIo+b\/drncUgCwfPoL7CiEAUkDf+1kfFL6ZomIfRdxWVQFEVsipMwycasFKpw9uY\/ogQgCkSY0IEOvUq+pn1viWID5\/+jzvZ4QASAHJ0pDFYfGPYayPKgCyoS3nroxcXMgafsmFKFciva8QAiCjxUB0X5k28BUARFr46sGhA+qs0ZZed2afIwRAymVhhQOl7PaifbAqBEjvR79In1u+eFazS+nUjK5FCIDkyywP\/Yy5q3SbHVOkCr1KgGxo5s330kygKmaGsIotFXMqnZoPPkIAJD\/mURQMVg9SZyFhhuRKUTdYVjOxD6wPhADIYKnCvGiHXWtlUuTYigGiQK7SSW\/evMkO30DsA+sDIQBSLUDKtHOvGiAbmr3898nc\/ELaGZZVc+YV1gdCAKRQ4WDRFu0WBxF0xgAQSQON6o6HWE+rrErzcS5VlBfptTVK3YeKOPnAIwRAiskyrfIsC3NfFRk8VSNALLW3zip1mwvS1hWO4K1qqWgzrTqnaSJCAKRUIN067QoQamUiYMhlpWJCn8pbxPqoGSDa4NT2XU3+6rI+qpjgV9cSPGKdd6sInKt4kw87QgCkPEQEj6xCQgFGQGm4kDCvPkStTkado97E5lz1smFWVUJOFt32I8f4oCMEQEaQLA\/FOqyIUKm7uq1MFboBZP8z9V7rpRtpUL3KIkO5rgYNcGqLG6uq6xSEcV0hBEDa1UyxgRnaGoNbFURsIFU4UdBar+ubv\/3bZpLHrACb1+GPi8UswvbrYfv3vKXzV2Ep6XUj6wohANJJgFQJEZudEY63NWiEIIhNC9S\/dbsfACXIhI8N55hrFoiAUDR4b9c0aFLhoLjHto3XjbgHQgCkfv34l\/0gun62CCBVQcQ29TB91zbr0Iqw473FYoOoYpMP\/YCqGCzseUKAZaXzhjPZy8JD6dA7XiZlFyEAUrTmQwAYVjY7vWgdSIMAqQIiWd\/q7fbQXWWbuAeLIBGLTRhstOFnzW638xUJjo8CEOCBEAAZvt5jVAlELQTIqBAZFSCWHZUn2\/BjM9F9rKUugBg8tjz5LB9qhABICYWjagcp3ACV5isrpGUxkBhE9NxlU3wHubCKAiS0LPJg5WMgWdZLVQAxeMwdPkbGFUIApGYpdderpUH0qK58ktaJlBlGNSiIXtSFVSQ7yoLmOt4AXaa6vGwQXf3DcFshBEDIwipRbLjzwHKytrZWqHfWoDTeIgBRsLxIHMMytQYtWSSxvlxl0njlzpNbD3ggBEDqrUb389CLZFu1GSB32548tvJKOlu9SFwkVkhYBiCWxqvN3R+vYzyY7LF5NSAGtJh1UrSQUO1e9PjUrceHGCEAUourKjYP3WdbCS6qSi8yTKpNALmrtNZh43oG9c+KtTIpA5DQEjHJ2ghrSGLFgmFsRPGU0AIp0spEFpcsL\/UMS8cC8wFGCIDUmp1lbUus864HiKyRom3fWwgQ79JaObmaOVOkiWaKPqU3y42WF4gf1K9LQ7dUILhw7BTBcoQASI2yIVHK0LLbbMhUWO8hwKip4qQC5K5La\/70+bR9R1aAve527gaQWMFgnlUzqJ27oCirY2ZuPh2+xYcWIQBSr6w40Mc7sgBixxbJyLp0o50AcdaIxraqhXk4JteskGGrvIsE660S3T+HoKDnzQuuCz4h3OSuEgxnLVCO1YEQAGlEsipCKGQBRFZKUYCoOV+bAeJqRhQnkFtLA5WabMkuN5WPkwgMZQdFqdZF7qrHnjtOrAMhADImC8TDIgsgKiQs6sKaEICYW2vmzfdS10\/TIBm2j5UsDoFDVhSddBECIONL3dVGr0C6WRYxgJj1UTSIPkkAcSBRtpYsErm29O2+ztnrw7Re1+CnWbM4AAdCAKQ1VoisCxtnazPSJZtUqPuLVqRPIkC8Ll7tf7vf+Bu0aYdxkiahIWtDQNPQJyUA9K7f5gOJEABpkQQKm4sekyyUojUg0wAQ08ZmLatkx9cOpn+PspxUS1LlFMTQPSVYCVoGjTQwrqQEPoQIAZDWSplYAolvqCiXVZlZ6NMGkAAmskx2n3ilnyo7v5Csrq6mFoLcXYqdFHV56TgdL1jo8QLT7qW+pSfLZ\/vZ9wmKIwRAOqppBEgMKBuWgTb77UeOJU+8uHKf1bZr777kyPETm9Lv\/n4dr8ctfuu7KZgABkIAZPKC6GVcUwCkVK1J+jqYAARCAGSqZBlXclfJfTVKA0UAghBCHQKIpgvuut+1stkTC4AghBAAKQQSpfB6mCgrS0H0IjPQAQhCCBFEj8JE\/9ZtReahAxCEECIL6wGYKFYCQBBCCIAUrg2xposABCGEAEhuaq+Hhq9GLxpcByAIIdQRgBg0bDqhj33o9rK1IgAEIYQ6UAcSg0aZgDkAQQihDgLEd+IdNmUXgCCEUAcBokaJwzRLBCAIIUQMpBYBEIQQAiAABCGEAAgAQQghAAJAEEIIgAAQhBACIAiAIIQQABlFmr737FFeB4QQAiAIIYQACEIIIQCCEEIIgCCEEAIgCCGE0P0A+X+a9sDQdCqBOwAAAABJRU5ErkJggg==","width":400}
%---
%[text:image:4f46]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:0a3c]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:0d81]
%   data: {"defaultValue":" t^2","label":"f(t) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:60a5]
%   data: {"defaultValue":-2,"label":"a = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:slider:2b90]
%   data: {"defaultValue":3,"label":"x = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:checkbox:9802]
%   data: {"defaultValue":false,"label":"Select to make epsilon negative.","run":"Section"}
%---
%[control:slider:6208]
%   data: {"defaultValue":-1,"label":"Set the exponent of epsilon:","max":0,"min":-8,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:17ba]
%   data: {"defaultValue":-5,"label":"Minimum x value?","max":-2,"maxLinkedVariable":"leftmax","min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:718f]
%   data: {"defaultValue":5,"label":"Maximum x value?","max":5,"min":3.1,"minLinkedVariable":"rightmin","run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:button:7cd5]
%   data: {"label":"Show Plot","run":"Section"}
%---
%[control:editfield:09cf]
%   data: {"defaultValue":"sin(t)","label":"f(t) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:2042]
%   data: {"defaultValue":-2,"label":"a = ","max":1,"maxLinkedVariable":"b","min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:80ca]
%   data: {"defaultValue":1,"label":"b = ","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:editfield:4c2c]
%   data: {"defaultValue":-200,"label":"c  = ","run":"Section","valueType":"Double"}
%---
%[control:editfield:208a]
%   data: {"defaultValue":0,"label":"C = ","run":"Section","valueType":"Double"}
%---
%[control:checkbox:47aa]
%   data: {"defaultValue":false,"label":"Show only resulting area? ","run":"Section"}
%---
%[control:button:051f]
%   data: {"label":"Show Plot","run":"Section"}
%---
