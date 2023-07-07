function OpenOverview
% Open the overview file
locDir = pwd;
if isMATLABReleaseOlderThan("R2023b")
    if contains(locDir,filesep+"MATLAB Drive")
        open("Navigation2.mlx")
    else
        open("Overview.html")
    end
else
    open("Navigation.mlx")
end

% % Close the current script
% open("OpenOverview.m")
close(matlab.desktop.editor.getActive)
end