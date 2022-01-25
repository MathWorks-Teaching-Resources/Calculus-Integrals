%% Calculus &mdash; Integrals
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:12pt">
% <h2> Information </h2>
% This curriculum module contains interactive 
% <a href="https://www.mathworks.com/products/matlab/live-editor.html">live scripts</a> 
% and a <a href="https://www.mathworks.com/products/matlab/app-designer.html">MATLAB&reg;</a>
% app that teach basic concepts of integral calculus. There is a focus on numerical approximation 
% and graphical representation as tools for understanding the concepts of
% integral calculus. 
% <br>
% <br>
% <a href=#module>Calculus &mdash; Integrals</a> covers <a href=#riem>Riemann sum approximations</a> to definite integrals, 
% indefinite integrals as <a href=#antider>antiderivatives</a>, and the <a href=#ftc>fundamental theorem of calculus</a>. It 
% also covers the <a href=#antider>indefinite integrals of powers, exponentials, natural logarithms, 
% sines and cosines</a> as well as <a href=#sub>substitution</a> and <a href=#ibp>integration by parts</a>. Applications 
% include area and <a href=#riem>power</a>. 
% <br>
% <br>
% These live scripts can be used as part of a lecture, as activities in an instructional setting, 
% or as interactive assignments to be completed outside of class. The module is divided into 
% three folders with the same content offered for different use: <a href=#fullscripts>Full
% Scripts</a>, <a href=#viz>Visualizations</a>, and <a href=#practice>Practice</a>.
% <br>
% <br>
% The instructions inside the live scripts will guide you through the exercises and activities. 
% Get started with each live script by running it one section at a time. To stop running the script 
% or a section midway (for example, when an animation is in progress), use the Stop button in the 
% RUN section of the Live Editor tab in the MATLAB Toolstrip.
% <br>
% <br>
% If you find an issue,
% or have a suggestion, email the MathWorks online teaching team at 
% onlineteaching@mathworks.com
% <br>
% <br>
% <h2> Getting Started </h2>
% <ol>
% <li>
% Make sure that you have all the required products (listed below)
% installed. If you are missing a product, add it using the 
% <a href="https://www.mathworks.com/products/matlab/add-on-explorer.html">
% Add-On Explorer.</a> To install an add-on, go to the <b>Home</b>
% tab and select <img src="../Images/add-ons.png" style="margin:0px;" height=12> <b> Add-Ons > Get Add-Ons</b>.
% </li>
% <li>
% Get started with each topic by clicking the link in the first column of the table below to access the
% full script example. The instructions inside each live script will walk
% you through the live scripts and apps.
% </li>
% <li> 
% Scripts containing focused exercises and randomized practice are located in the last column of the table to 
% allow students to apply the concepts.
% </li>
% </ol>
% <h2> Products </h2>
% MATLAB, Symbolic Math Toolbox
% <br>
% <br>
% <h2> <a name="module">Modules</a> </h2>
% <table border=1 style="margin-left:20px; cellpadding:15px;">
% <caption>Organization of the Calculus &mdash; Integrals Module</caption>
% <tr>
%   <th scope="col">Topic</th>
%   <th scope="col"><a name="fullscripts"> Full Scripts</th>
%   <th scope="col"><a name="viz"> Visualizations</th>
%   <th scope="col">Learning Goals</th>
%   <th scope="col"><a name="practice">Practice</th>
% </tr>
% <tr>
%   <th scope="row">
%       <a name="antider"><b>Antiderivatives</b></a>
%   </th>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit integralAntiderivatives.mlx;"><code>integralAntiderivatives.mlx</code><br>
%       <img src = "../Images/adf.png" width=150 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit vizAntiderivatives.mlx;"><code>vizAntiderivatives.mlx</code><br>
%           <img src = "../Images/family.gif" width=150 style="margin-top:5px; margin-bottom:0px"></a>   
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Explain the existence of a general family of antiderivatives.</li>
%           <li>Compute integrals of linear combinations of powers, sines, cosines, and exponentials by hand.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:edit practiceAntiderivatives.mlx;">practiceAntiderivatives.mlx</a>
%   </td>
% </tr>
% <tr>
%   <th scope="row">
%       <a name="ftc"><b>Fundamental Theorem of Calculus</b></a>
%   </th>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit integralFundamentalTheorem.mlx;"><code>integralFundamentalTheorem.mlx</code><br>
%       <img src = "../Images/Ski-Area.png" width=125 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit vizFundamentalTheorem.mlx;"><code>vizFundamentalTheorem.mlx</code><br>
%           <img src = "../Images/FTC-generated.png" width=125 style="margin-top:5px; margin-bottom:0px"></a>   
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Explain the fundamental theorem of calculus.</li>
%           <li>Fluently recognize and apply the rules for computing definite integrals. </li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:edit practiceFundamentalTheorem.mlx;">practiceFundamentalTheorem.mlx</a>
%   </td>
% </tr>
% <tr>
%   <th scope="row">
%       <a name="riem"><b>Riemann Sums</b></a>
%   </th>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit integralRiemann.mlx;"><code>integralRiemann.mlx</code><br>
%       <img src = "../Images/animSolar.gif" width=125 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit vizRiemann.mlx;"><code>vizRiemann.mlx</code><br>
%           <img src = "../Images/AreaUnderCurve.png" width=125 style="margin-top:5px; margin-bottom:0px"></a>   
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Discuss the implications for applying calculus in applications 
%               with values that are discrete or continuous.</li>
%           <li>Explain and apply the different approximations computed by a left-endpoint, 
%               right-endpoint, midpoint, maximum, or minimum method of selecting a height 
%               value in a Riemann sum.</li>
%           <li>Explain and apply the trapezoidal approximation.</li>
%       </ul>
%   </td>
%   <td>
%       None currently. If requested, it can be developed.
%   </td>
% </tr>
% <tr>
%   <th scope="row">
%       <a name="sub"><b>Substitution</b> </a>
%   </th>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit integralSubstitution.mlx;"><code>integralSubstitution.mlx</code><br>
%       <img src = "../Images/SubstIm.png" width=125 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit vizSubstitution.mlx;"><code>vizSubstitution.mlx</code><br>
%           <img src = "../Images/animSubst.gif" width=125 style="margin-top:5px; margin-bottom:0px"></a>   
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Explain what the method of substitution is and how it works. </li>
%           <li>Compute integrals of combinations of powers, sines, cosines, 
%               exponentials and logarithms that are solvable by substitution by hand.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:edit practiceSubstitution.mlx;">practiceSubstitution.mlx</a>
%   </td>
% </tr>
% <tr>
%   <th> <a name="ibp">
%       <b>Integration by Parts</b></a>
%   </th>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit integralByParts.mlx;"><code>integralByParts.mlx</code><br>
%       <img src = "../Images/IBP.png" width=125 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%           &nbsp;&nbsp;<a href="matlab:edit vizSubstitution.mlx;"><code>vizSubstitution.mlx</code><br>
%           <img src = "../Images/ibp-generated.png" width=125 style="margin-top:5px; margin-bottom:0px"></a>   
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Explain what the method of integration by parts is and how it works. </li>
%           <li>Compute integrals involving powers, sines, cosines, 
%               exponentials and logarithms that are solvable by integration by parts by hand.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:edit practiceByParts.mlx;">practiceByParts.mlx</a>
%   </td>
% </tr> 
% </table>
% <br>
% <h2> Calculus Flashcards App </h2>
% <table border=1 style="margin-left:20px; cellpadding:15px;" align="center">
%   <tr>
%       <td>
%           <a href="matlab: CalculusFlashcards"> Choose the type of practice. <br> 
%           <img
%           src="../Images/CalcFlashcardsSettings.png" 
%           height=200 style="margin-top:5px; margin-bottom:0px">
%       </td>
%       <td>
%           <a href="matlab: CalculusFlashcards"> Solve problems. <br> 
%       <img
%           src="../Images/CalcFlashcardsPractice.png" 
%           height=200 style="margin-top:5px; margin-bottom:0px">
%       </td>
%       <td>
%           <a href="matlab: CalculusFlashcards"> Analyze your progress. <br> 
%       <img
%           src="../Images/CalcFlashcardsAnalysis.png" 
%           height=200 style="margin-top:5px; margin-bottom:0px">
%       </td>
%   </tr>
% </table>
% </span>
% </span>
% </html>
% 
% Copyright 2022 The MathWorks(TM), Inc.
