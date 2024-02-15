
# <span style="color:rgb(213,80,0)">Calculus \- Integrals</span>


[![View on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/105740-calculus-integrals) or [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj)

![MATLAB Versions Tested](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FMathWorks-Teaching-Resources%2FCalculus-Integrals%2Frelease%2FImages%2FTestedWith.json)

**Curriculum Module**

_Created with R2021b. Compatible with R2021b and later releases._

# Information

This curriculum module contains interactive [MATLAB® live scripts](https://www.mathworks.com/products/matlab/live-editor.html) that teach fundamental concepts and basic terminology related to integral calculus. There is a focus on numerical approximation and graphical representation as tools for understanding the concepts of integral calculus.

## Background

You can use these live scripts as [demonstrations](#H_9AAE657C) in lectures, class [activities](#H_EB6194F8), or interactive [assignments](#H_175C7D50) outside of class. Calculus \- Integrals covers [Riemann sum](#H_1F9663E8) approximations to definite integrals, indefinite integrals as [antiderivatives](#H_BA1C166C), and the [fundamental theorem of calculus](#H_A543F16F). It also covers the indefinite integrals of powers, exponentials, natural logarithms, sines, and cosines as well as [substitution](#H_A0468BE8) and [integration by parts](#H_D389B1B1). Applications include area and power. In addition to the[full scripts](#H_EB6194F8), [visualizations](#H_9AAE657C), and [practice scripts](#H_175C7D50) there is a [Calculus Flashcards app](#H_1F9459BC) included as well.


The instructions inside the live scripts will guide you through the exercises and activities. Get started with each live script by running it one section at a time. To stop running the script or a section midway (for example, when an animation is in progress), use the <img src="Images/EndIcon.png" width="19" alt="image_0.png"> Stop button in the **RUN** section of the **Live Editor** tab in the MATLAB Toolstrip.


Looking for more? Find an issue? Have a suggestion? Please contact the [MathWorks online teaching team](mailto:%20onlineteaching@mathworks.com).

## Contact Us

Solutions are available upon instructor request. Contact the [MathWorks teaching resources team](mailto:onlineteaching@mathworks.com) if you would like to request solutions, provide feedback, or if you have a question.

<a name="H_30BC7141"></a>

## Prerequisites

This module assumes a knowledge of functions that is standard in precalculus course materials regarding powers, exponentials, absolute values, logarithms, sines, cosines, rational functions, and asymptotes. It also assumes knowledge of basic area formulas, including the area of a trapezoid. With the exception of <samp>Riemann.mlx</samp> and <samp>RiemannViz.mlx</samp>, the scripts are written to follow [Calculus\-Derivatives](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives) and expect basic understanding of derivatives and derivative rules. There is little expectation of familiarity with MATLAB, but you could use [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted) as another resource to acquire familiarity with MATLAB.

<a name="H_330E72C3"></a>

## Getting Started
### Accessing the Module
### **On MATLAB Online:**

Use the [<img src="Images/OpenInMO.png" width="136" alt="image_1.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj) link to download the module. You will be prompted to log in or create a MathWorks account. The project will be loaded, and you will see an app with several navigation options to get you started.

### **On Desktop:**

Download or clone this repository. Open MATLAB, navigate to the folder containing these scripts and double\-click on [Integrals.prj](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj). It will add the appropriate files to your MATLAB path and open an app that asks you where you would like to start. 


Ensure you have all the required products ([listed below](#H_E850B4FF)) installed. If you need to include a product, add it using the Add\-On Explorer. To install an add\-on, go to the **Home** tab and select  <img src="Images/AddOnsIcon.png" width="16" alt="image_2.png"> **Add-Ons** > **Get Add-Ons**. 

<a name="H_E850B4FF"></a>

## Products

MATLAB® is used throughout. Tools from the Symbolic Math Toolbox™ are used frequently as well.

# Scripts
| **Topic** <br>  | **Full Script** <br>  | **Visualizations** <br>  | **Learning Goals** <br> In this script, students will... <br>  | **Practice** <br>   |
| :-- | :-- | :-- | :-- | :-- |
| [Antiderivatives](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Antiderivatives.mlx) <br>  | [Antiderivatives.mlx](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Antiderivatives.mlx) <br> <img src="Images/adf.png" width="135" alt="image_3.png"> <br>  | [Visualizing Antiderivatives](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/AntiderivativesViz.mlx) <br> <img src="Images/family.gif" width="135" alt="image_4.gif"> <br>  |   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   see a graphical presentation of the concept of general antiderivatives. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   develop computational fluency with the antiderivatives of powers, sines, cosines, and exponentials. <br>  | [Calculate Antiderivatives](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/AntiderivativesPractice.mlx) <br> [  <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;{\int | space;\sin | space;(3z)\;dz=-\frac{\cos | space;(3z)}{3}+C} | space;">  ](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/AntiderivativesPractice.mlx) <br>   |
| [Fundamental Theorem of Calculus](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheorem.mlx) <br>  | [FundamentalTheorem.mlx](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheorem.mlx) <br> <img src="Images/Ski-Area.png" width="135" alt="image_5.png"> <br>  | [Visualizing the FTC](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheoremViz.mlx) <br> <img src="Images/FTC-generated.png" width="135" alt="image_6.png"> <br>  |   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   explain the fundamental theorem of calculus. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   see why the Fundamental Theorem of Calculus makes sense graphically. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   develop computational fluency for definite integrals involving linear and rational combinations of powers, sines, cosines, exponentials and natural logarithms. <br>  | [Apply the Fundamental Theorem of Calculus](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheoremPractice.mlx) <br> [  <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;{\int_1^3 | space;\frac{1}{w^2 | space;}\;dw=-\frac{1}{3}+1=\frac{2}{3}} | space;">  ](./FundamentalTheoremPractice.mlx) <br>   |
| [Riemann Sums](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Riemann.mlx) <br>  | [Riemann.mlx](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Riemann.mlx) <br> <img src="Images/animSolar.gif" width="135" alt="image_7.gif"> <br>  | [Visualizing Riemann Sums](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/RiemannViz.mlx) <br> <img src="Images/AreaUnderCurve.png" width="135" alt="image_8.png"> <br>  |   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   explain and apply the different approximations computed by a left\-endpoint, right\-endpoint, midpoint, maximum, or minimum method of selecting a height value in a Riemann sum. <br>  |   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   explain and apply the trapezoidal approximation. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   explain why increasing the number of intervals in an approximation will decrease the error. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   discuss the implications for applying calculus in applications with values that are discrete or continuous. <br>   |
| [Substitution](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Substitution.mlx) <br>  | [Substitution.mlx](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Substitution.mlx) <br> <img src="Images/SubstIm.png" width="135" alt="image_9.png"> <br>  | [Visualizing Substitution](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/SubstitutionViz.mlx) <br> <img src="Images/animSubst.gif" width="135" alt="image_10.gif"> <br>  |   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   explain what the method of substitution is and how it works. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   develop fluency with computing integrals of combinations of powers, sines, cosines, exponentials and logarithms that are solvable by substitution by hand. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   see a graphical understanding of the method of substitution. <br>  | [Apply the method of substitution](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/SubstitutionPractice.mlx) <br> [  <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;{\int | space;\frac{\cos | space;\left(\ln | space;(t)+1\right)}{t}\;dt=\sin | space;\left(\ln | space;(t)+1\right)+C} | space;">  ](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/SubstitutionPractice.mlx) <br>   |
| [Integration by Parts](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByParts.mlx) <br>  | [ByParts.mlx](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByParts.mlx) <br> <img src="Images/IBP.png" width="135" alt="image_11.png"> <br>  | [Visualizing Integration by Parts](.Scripts/ByPartsViz.mlx) <br> <img src="Images/ibp-generated.png" width="135" alt="image_12.png"> <br>  |   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   explain what the method of integration by parts is and how it works. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   develop fluency with computing integrals involving powers, sines, cosines, exponentials and logarithms that are solvable by integration by parts by hand. <br>   <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;\bullet | space;">   see a graphical understanding of the integration by parts formula. <br>  | [Apply the method of integration by parts](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByPartsPractice.mlx) <br> [  <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;{\int | space;y^2 | space;e^y | space;\;dy=y^2 | space;e^y | space;-2ye^y | space;+2e^y | space;+C} | space;">  ](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByPartsPractice.mlx) <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [  <img src="https://latex.codecogs.com/svg.latex?\inline | space; | space;=(y^2 | space;-2y+2)e^y | space;+C | space;">  ](matlab: edit practiceByParts.mlx) <br>   |

<a name="H_1F9459BC"></a>

# [Calculus Flashcards App](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Apps/CalculusFlashcards.mlapp")
| 1. Choose the type of practice. <br>  | 2. Solve problems. <br>  | 3. Analyze your progress. <br>   |
| :-- | :-- | :-- |
| <img src="Images/CalcFlashcardsSettings.png" width="276" alt="image_13.png">  | <img src="Images/CalcFlashcardsPractice.png" width="276" alt="image_14.png"> | <img src="Images/CalcFlashcardsAnalysis.png" width="276" alt="image_15.png">  |

# Setup To Use the Calculus Flashcards App

MATLAB Desktop

1.  Ensure that you have MATLAB R2021a or newer installed.
2. Download <samp>CalculusFlashcards.mlapp</samp> or download and unzip the entire repository.
3. Right\-click the app in MATLAB and select run or type <samp>run("CalculusFlashcards.mlapp")</samp> in the Command Window.

MATLAB Online

1.  [<img src="Images/OpenInMO.png" width="136" alt="image_16.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Apps/CalculusFlashcards.mlapp)
<a name="H_F61733D7"></a>

# License

The license for this module is available in the [LICENSE.md](https://github.com/MathWorks-Teaching-Resources/Calculus-Integrals/blob/release/LICENSE.md).

# Related Courseware Modules
| **Courseware Module** <br>  | **Sample Content** <br>  | **Available on:** <br>   |
| :-- | :-- | :-- |
| [**Calculus: Derivatives**](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives)  <br>  | <img src="Images/CalcDer.png" width="171" alt="image_17.png"> <br>  | [<img src="Images/image_18.png" width="91" alt="image_18.png">](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives) <br> [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives/project=Derivatives.prj) <br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives)  <br>   |
| <br>[**Numerical Methods with Applications**](https://www.mathworks.com/matlabcentral/fileexchange/111490-numerical-methods-with-applications) <br>  | <img src="Images/AreaLake.png" width="171" alt="image_20.png"> <br>  |[<img src="Images/OpenInFX.png" width="91" alt="image_21.png">](https://www.mathworks.com/matlabcentral/fileexchange/111490-numerical-methods-with-applications) <br> [<img src="Images/OpenInMO.png" width="136" alt="image_22.png">](https://matlab.mathworks.com/open/v1?repo=MathWorks-Teaching-Resources/Numerical-Methods-with-Applications/project=NumericalMethods.prj)   <br>[GitHub](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives)  <br>   |


Or feel free to explore our other [modular courseware content](https://www.mathworks.com/matlabcentral/fileexchange/?q=tag%3A%22courseware+module%22&sort=downloads_desc_30d).

# Educator Resources
-  [Educator Page](https://www.mathworks.com/academia/educators.html) 
<a name="H_0FA5DA18"></a>

# Contribute 

Looking for more? Find an issue? Have a suggestion? Please contact the [MathWorks teaching resources team](mailto:%20onlineteaching@mathworks.com). If you want to contribute directly to this project, you can find information about how to do so in the [CONTRIBUTING.md](https://github.com/MathWorks-Teaching-Resources/Calculus-Integrals/blob/release/CONTRIBUTING.md) page on GitHub.


 *©* Copyright 2023 The MathWorks™, Inc



