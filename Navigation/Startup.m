function Startup
curFile = matlab.desktop.editor.getActive;
if isMATLABReleaseOlderThan("R2023b")
    if contains(locDir,filesep+"MATLAB Drive")
        open("SplashPage2.mlx")
    else
        open("Overview.html")
    end
else
    open("SplashPage.mlx")
end
navFile = matlab.desktop.editor.getActive;
if string(curFile.Filename) ~= string(navFile.Filename)
    close(curFile)
end
end