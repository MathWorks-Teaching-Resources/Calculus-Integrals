
# <span style="color:rgb(213,80,0)">Calculus \- Integrals</span>

Learn how to compute Riemann sums, definite and indefinite integrals, and apply the methods of substitution and integration by parts.

[![View on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/105740-calculus-integrals) or [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=README.m)

[![MATLAB Versions Tested](https://img.shields.io/endpoint?url=https://mathworks-teaching-resources.github.io/Calculus-Integrals/TestedWith.json)](https://MathWorks-Teaching-Resources.github.io/Calculus-Integrals)

**Curriculum Module**

_Created with R2024a. The current plain-text live scripts require MATLAB R2025a or newer._

For MATLAB R2024b or older, use the [legacy MLX release](https://github.com/MathWorks-Teaching-Resources/Calculus-Integrals/releases/tag/mlx).

# Information

This curriculum module contains interactive [MATLAB® live scripts](https://www.mathworks.com/products/matlab/live-editor.html) that teach fundamental concepts and basic terminology related to integral calculus. There is a focus on numerical approximation and graphical representation as tools for understanding the concepts of integral calculus.

## Background

You can use these live scripts as demonstrations in lectures, class activities, or interactive assignments outside of class. Calculus \- Integrals covers Riemann sum approximations to definite integrals, indefinite integrals as antiderivatives, and the fundamental theorem of calculus. It also covers the indefinite integrals of powers, exponentials, natural logarithms, sines, and cosines as well as substitution and integration by parts. Applications include area and power. In addition to the full scripts, visualizations, and practice scripts there is a Calculus Flashcards app included as well.


The instructions inside the live scripts will guide you through the exercises and activities. Get started with each live script by running it one section at a time. To stop running the script or a section midway (for example, when an animation is in progress), use the <img src="Images/EndIcon.png" width="19" alt="EndIcon.png"> Stop button in the **RUN** section of the **Live Editor** tab in the MATLAB Toolstrip.


Looking for more? Find an issue? Have a suggestion? Please contact the [MathWorks Educator Content Development team](https://www.mathworks.com/matlabcentral/profile/authors/37969341).

## Contact Us

Contact the [MathWorks Educator Content Development Team](mailto:onlineteaching@mathworks.com) if you would like to request assistance, provide feedback, or if you have a question.


## Prerequisites

This module assumes a knowledge of functions that is standard in precalculus course materials regarding powers, exponentials, absolute values, logarithms, sines, cosines, rational functions, and asymptotes. It also assumes knowledge of basic area formulas, including the area of a trapezoid. With the exception of <samp>Riemann.m</samp> and <samp>RiemannViz.m</samp>, the scripts are written to follow [Calculus\-Derivatives](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives) and expect basic understanding of derivatives and derivative rules. There is little expectation of familiarity with MATLAB, but you could use [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted) as another resource to acquire familiarity with MATLAB.


## Getting Started
### Accessing the Module
### **On MATLAB Online:**

Use the [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj) link to download the module. You will be prompted to log in or create a MathWorks account. The project will be loaded, and you will see an app with several navigation options to get you started.

### **On Desktop:**

Download or clone this repository. Open MATLAB, navigate to the folder containing these scripts and double\-click on [Integrals.prj](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=README.m). It will add the appropriate files to your MATLAB path and open an app that asks you where you would like to start.


Ensure you have all the required products (listed below) installed. If you need to include a product, add it using the Add\-On Explorer. To install an add\-on, go to the **Home** tab and select  <img src="Images/AddOnsIcon.png" width="16" alt="AddOnsIcon.png"> **Add-Ons** > **Get Add-Ons**.


## Products

MATLAB® is used throughout. Tools from the Symbolic Math Toolbox™ are used frequently as well.

# Scripts
|      |      |      |      |      |
| :-- | :-- | :-- | :-- | :-- |
| **Topic** <br>  | **Full Script** <br>  | **Visualizations** <br>  | **Learning Goals** <br> In this script, students will... <br>  | **Practice** <br>   |
| [Antiderivatives](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Antiderivatives.m) <br>  | [Antiderivatives.m](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Antiderivatives.m) <br> <img src="Images/adf.png" width="135" alt="adf.png"> <br>  | [Visualizing Antiderivatives](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/AntiderivativesViz.m) <br> [<img src="Images/family.gif" width="135" alt="family.gif">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/AntiderivativesViz.m) <br>  | $\bullet$ see a graphical presentation of the concept of general antiderivatives. <br> $\bullet$ develop computational fluency with the antiderivatives of powers, sines, cosines, and exponentials. <br>  | [Calculate Antiderivatives](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/AntiderivativesPractice.m) <br> $\displaystyle {\int \sin (3z)\;dz=-\frac{\cos (3z)}{3}+C}$ <br>   |
| [Fundamental Theorem of Calculus](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheorem.m) <br>  | [FundamentalTheorem.m](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheorem.m) <br> [<img src="Images/Ski-Area.png" width="135" alt="Ski-Area.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheorem.m) <br>  | [Visualizing the FTC](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheoremViz.m) <br> [<img src="Images/FTC-generated.png" width="135" alt="FTC-generated.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheoremViz.m) <br>  | $\bullet$ explain the fundamental theorem of calculus. <br> $\bullet$ see why the Fundamental Theorem of Calculus makes sense graphically. <br> $\bullet$ develop computational fluency for definite integrals involving linear and rational combinations of powers, sines, cosines, exponentials and natural logarithms. <br>  | [Apply the Fundamental Theorem of Calculus](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/FundamentalTheoremPractice.m) <br> $\displaystyle {\int_1^3 \frac{1}{w^2 }\;dw=-\frac{1}{3}+1=\frac{2}{3}}$ <br>   |
| [Riemann Sums](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Riemann.m) <br>  | [Riemann.m](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Riemann.m) <br> [<img src="Images/animSolar.gif" width="135" alt="animSolar.gif">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Riemann.m) <br>  | [Visualizing Riemann Sums](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/RiemannViz.m) <br> [<img src="Images/AreaUnderCurve.png" width="135" alt="AreaUnderCurve.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/RiemannViz.m) <br>  | $\bullet$ explain and apply the different approximations computed by a left\-endpoint, right\-endpoint, midpoint, maximum, or minimum method of selecting a height value in a Riemann sum. <br>  | $\bullet$ explain and apply the trapezoidal approximation. <br> $\bullet$ explain why increasing the number of intervals in an approximation will decrease the error. <br> $\bullet$ discuss the implications for applying calculus in applications with values that are discrete or continuous. <br>   |
| [Substitution](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Substitution.m) <br>  | [Substitution.m](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/Substitution.m) <br> <img src="Images/SubstIm.png" width="135" alt="SubstIm.png"> <br>  | [Visualizing Substitution](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/SubstitutionViz.m) <br> [<img src="Images/animSubst.gif" width="135" alt="animSubst.gif">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/SubstitutionViz.m) <br>  | $\bullet$ explain what the method of substitution is and how it works. <br> $\bullet$ develop fluency with computing integrals of combinations of powers, sines, cosines, exponentials and logarithms that are solvable by substitution by hand. <br> $\bullet$ see a graphical understanding of the method of substitution. <br>  | [Apply the method of substitution](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/SubstitutionPractice.m) <br> $\displaystyle {\int \frac{\cos \left(\ln (t)+1\right)}{t}\;dt=\sin \left(\ln (t)+1\right)+C}$ <br>   |
| [Integration by Parts](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByParts.m) <br>  | [ByParts.m](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByParts.m) <br> [<img src="Images/IBP.png" width="135" alt="IBP.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByParts.m) <br>  | [Visualizing Integration by Parts](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByPartsViz.m) <br> [<img src="Images/ibp-generated.png" width="135" alt="ibp-generated.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByPartsViz.m) <br>  | $\bullet$ explain what the method of integration by parts is and how it works. <br> $\bullet$ develop fluency with computing integrals involving powers, sines, cosines, exponentials and logarithms that are solvable by integration by parts by hand. <br> $\bullet$ see a graphical understanding of the integration by parts formula. <br>  | [Apply the method of integration by parts](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Scripts/ByPartsPractice.m) <br> $\int y^2 e^y \;dy=y^2 e^y -2ye^y +2e^y +C$ <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $=(y^2 -2y+2)e^y +C$ <br>   |
|      |      |      |      |       |

# [Calculus Flashcards App](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Apps/CalculusFlashcardsApp.m&focus=true)
|      |      |      |
| :-- | :-- | :-- |
| 1. Choose the type of practice. <br>  | 2. Solve problems. <br>  | 3. Analyze your progress. <br>   |
| [<img src="Images/CalcFlashcardsSettings.png" width="276" alt="CalcFlashcardsSettings.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Apps/CalculusFlashcardsApp.m&focus=true) <br>  | [<img src="Images/CalcFlashcardsPractice.png" width="276" alt="CalcFlashcardsPractice.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Apps/CalculusFlashcardsApp.m&focus=true) <br>  | [<img src="Images/CalcFlashcardsAnalysis.png" width="276" alt="CalcFlashcardsAnalysis.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Apps/CalculusFlashcardsApp.m&focus=true) <br>   |
|      |      |       |

# Setup To Use the Calculus Flashcards App

MATLAB Desktop

1.  Ensure that you have MATLAB R2021a or newer installed.
2. Download <samp>CalculusFlashcardsApp.m</samp> or download and unzip the entire repository.
3. Right\-click the app in MATLAB and select run or type <samp>CalculusFlashcardsApp</samp> in the Command Window.

MATLAB Online

1.  [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Integrals&project=Integrals.prj&file=Apps/CalculusFlashcardsApp.m)

# License

The license for this module is available in the [LICENSE.md](https://github.com/MathWorks-Teaching-Resources/Calculus-Integrals/blob/release/LICENSE.md).

# Related Courseware Modules
|      |      |      |
| :-- | :-- | :-- |
| **Courseware Module** <br>  | **Sample Content** <br>  | **Available on:** <br>   |
| [**Calculus: Derivatives**](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives)  <br>  | <img src="Images/CalcDer.png" width="171" alt="CalcDer.png"> <br>  | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives) <br> [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj) <br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives)  <br>   |
| [**Numerical Methods with Applications**](https://www.mathworks.com/matlabcentral/fileexchange/111490-numerical-methods-with-applications) <br>  | <img src="Images/AreaLake.png" width="171" alt="AreaLake.png"> <br>  | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/111490-numerical-methods-with-applications) <br> [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Numerical-Methods-with-Applications&project=NumericalMethods.prj)   <br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives)  <br>   |
|      |      |       |


Or feel free to explore our other [modular courseware content](https://www.mathworks.com/matlabcentral/fileexchange/?q=author%3A%22MathWorks+Educator+Content+Development+Team%22&sort=relevancy).

# Educator Resources
-  [Educator Page](https://www.mathworks.com/academia/educators.html)

# Contribute

Looking for more? Find an issue? Have a suggestion? Please contact the [MathWorks Educator Content Development team](mailto:%20onlineteaching@mathworks.com). If you want to contribute directly to this project, you can find information about how to do so in the [CONTRIBUTING.md](https://github.com/MathWorks-Teaching-Resources/Calculus-Integrals/blob/release/CONTRIBUTING.md) page on GitHub.


 *©* Copyright 2025-2026 The MathWorks, Inc
