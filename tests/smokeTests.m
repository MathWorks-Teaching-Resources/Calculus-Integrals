% Run these tests with runMyTests
% All tests so far are on code expected to run without errors
% If/when we end up with a version that _should_ error, 
% please add it to this set of examples
classdef smokeTests < matlab.unittest.TestCase

    properties
        fc
        origProj
        % openFilesIdx
    end

    methods (TestClassSetup)
        function setUpPath(testCase)
            % testCase.openFilesIdx = length(matlab.desktop.editor.getAll);

            testCase.fc = fullfile(pwd);
            if contains(testCase.fc,"tests")
                rootDirName = extractBefore(testCase.fc,"tests");
            else
                rootDirName = testCase.fc;
            end
            openProject(rootDirName);
            testCase.origProj = matlab.project.rootProject;
        end % function setUpPath
    end % methods (TestClassSetup)

    methods(Test)

        function testMLX(testCase)
            % this functions opens and closes all the the .mlx files located under the
            % project rootFolder and its subfolder, it is intended to
            % detect corrupted files
            files = dir(testCase.origProj.RootFolder+filesep+"**"+filesep+"*.mlx");
            for i = 1:size(files)
                f = string(files(i).folder)+filesep+string(files(i).name);
                f = matlab.desktop.editor.openDocument(f);
                f.closeNoPrompt;
            end
        end
        
        function testMAT(testCase)
            % this functions opens and closes all the the .mat files located under the
            % project rootFolder and its subfolder, it is intended to
            % detect corrupted data 
            files = dir(testCase.origProj.RootFolder+filesep+"**"+filesep+"*.mat");
            for i = 1:size(files)
                f = string(files(i).folder)+filesep+string(files(i).name);
                f = open(f); %#ok<NASGU>
                clear f
            end
        end

        function testSLX(testCase)
            % this functions opens and closes all the the .slx files located under the
            % project rootFolder and its subfolder, it is intended to
            % detect corrupted simulink model
            files = dir(testCase.origProj.RootFolder+filesep+"**"+filesep+"*.slx");
            for i = 1:size(files)
                f = string(files(i).folder)+filesep+string(files(i).name);
                open_system(f)
                close_system(f)
            end
        end

        function runintegralAntiderivatives(testCase) %#ok<*MANU>
            disp("Running FullScripts/integralAntiderivatives")
            integralAntiderivatives
        end

        function runintegralByParts(testCase)
            disp("Running FullScripts/integralByParts")
            integralByParts
        end

        function runintegralFundamentalTheorem(testCase)
            disp("Running FullScripts/integralFundamentalTheorem")
            integralFundamentalTheorem
        end

        function runintegralRiemann(testCase)
            disp("Running FullScripts/integralRiemann")
            integralRiemann
        end

        function runintegralSubstitution(testCase)
            disp("Running FullScripts/integralSubstitution")
            integralSubstitution
        end

        function runpracticeAntiderivatives(testCase)
            disp("Running Practice/practiceAntiderivatives")
            practiceAntiderivatives
        end

        function runpracticeByParts(testCase)
            disp("Running Practice/practiceByParts")
            practiceByParts
        end

        function runpracticeFundamentalTheorem(testCase)
            disp("Running Practice/practiceFundamentalTheorem")
            practiceFundamentalTheorem
        end

        function runpracticeSubstitution(testCase)
            disp("Running Practice/practiceSubstitution")
            practiceSubstitution
        end

        function runvizAntiderivatives(testCase)
            disp("Running FullScripts/vizAntiderivatives")
            vizAntiderivatives
        end

        function runvizByParts(testCase)
            disp("Running FullScripts/vizByParts")
            vizByParts
        end

        function runvizFundamentalTheorem(testCase)
            disp("Running FullScripts/vizFundamentalTheorem")
            vizFundamentalTheorem
        end

        function runvizRiemann(testCase)
            disp("Running FullScripts/vizRiemann")
            vizRiemann
        end

        function runvizSubstitution(testCase)
            disp("Running FullScripts/vizSubstitution")
            vizSubstitution
        end

    end

    methods (TestClassTeardown)
        function resetPath(testCase)

            if isempty(testCase.origProj)
                close(currentProject)
            else
                openProject(testCase.origProj.RootFolder)
            end
            % myLastList = matlab.desktop.editor.getAll;
            % if length(myLastList)>testCase.openFilesIdx
            %     closeNoPrompt(myLastList(testCase.openFilesIdx+1:end))
            % end
            cd(testCase.fc)
            close all force
        end

    end % methods (TestClassTeardown)

end
