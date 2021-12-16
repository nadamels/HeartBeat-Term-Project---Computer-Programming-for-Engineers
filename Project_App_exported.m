classdef Project_App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        SelectyouragegroupButtonGroup  matlab.ui.container.ButtonGroup
        a59_79                         matlab.ui.control.RadioButton
        a39_59                         matlab.ui.control.RadioButton
        a20_39                         matlab.ui.control.RadioButton
        DoyouidentifyasanatheleteButtonGroup  matlab.ui.container.ButtonGroup
        NoButton                       matlab.ui.control.RadioButton
        YesButton                      matlab.ui.control.RadioButton
        TabGroup                       matlab.ui.container.TabGroup
        WelcomeTab                     matlab.ui.container.Tab
        TextArea                       matlab.ui.control.TextArea
        PrerecordedTab                 matlab.ui.container.Tab
        TextArea_2                     matlab.ui.control.TextArea
        LiveTab                        matlab.ui.container.Tab
        Image2                         matlab.ui.control.Image
        TextArea_3                     matlab.ui.control.TextArea
        ClickheretorecordaliveECGandrunadiagnosisButton  matlab.ui.control.Button
        Image                          matlab.ui.control.Image
        ResultsTextArea                matlab.ui.control.TextArea
        ResultsTextAreaLabel           matlab.ui.control.Label
        SelectyourgenderButtonGroup    matlab.ui.container.ButtonGroup
        MaleButton                     matlab.ui.control.RadioButton
        FemaleButton                   matlab.ui.control.RadioButton
        ClickheretorunadiagnosisonprerecordedECGreadingButton  matlab.ui.control.Button
        SaveDiagnosisLabel             matlab.ui.control.Label
        Button_2                       matlab.ui.control.Button
        ImportECGreadingLabel          matlab.ui.control.Label
        Button                         matlab.ui.control.Button
    end

    
    properties (Access = public)
        Property % Description
        sampling_rate = 100;
        BPM;
        beat_num = 0; 
        average_rr_in_seconds;
        saveCounter=0;
        skipcounter=0;
        RMSSD=0;
        counterHRV=0;
    end

    
    methods (Access = public)
        
        function [] = Diagnose(app)
        app.ResultsTextArea.Value{1} ='The Average Heart Rate is: ';
        HRdisplay = num2str(app.BPM);
        app.ResultsTextArea.Value{2}= HRdisplay;
        app.ResultsTextArea.Value{3}='Tachycardia presense:';
        if app.BPM >= 100
        app.ResultsTextArea.Value{4} ='Tachycardia alert!';
        [y,Fs] = audioread('beep-02.wav');
        sound(y,Fs);
        else
          app.ResultsTextArea.Value{4}= 'None detected'; 
        end
        app.ResultsTextArea.Value{5}='Bradycardia or Healthy Heart rate detection: ';
        if(app.YesButton.Value ==1)
            if(app.MaleButton.Value ==1)
                if(app.a20_39.Value ==1)
                    if (app.BPM < 55)
                    app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                    [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                    elseif (app.BPM <= 75 || app.BPM >= 55)
                    app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                end
                 if (app.a39_59.Value==1)
                    if (app.BPM < 55)
                    app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                    [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                    elseif (app.BPM <= 76 || app.BPM >= 55)
                    app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                 end
                 if (app.a59_79.Value==1)
                   if (app.BPM < 54)
                    app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                    [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                   elseif (app.BPM  <= 74 || app.BPM >=54)
                     app.ResultsTextArea.Value{6}='Normal Heart Rate';
                   end
                 end
            end
            if(app.FemaleButton.Value==1)
                if(app.a20_39.Value==1)
                    if (app.BPM < 60)
                     app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                     [y,Fs] = audioread('beep-02.wav');
                     sound(y,Fs);
                    elseif (app.BPM <= 81 || app.BPM>= 60)
                     app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                end
                if(app.a39_59.Value==1)
                    if (app.BPM < 59)
                     app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                     [y,Fs] = audioread('beep-02.wav');
                     sound(y,Fs);
                    elseif (app.BPM <= 78  || app.BPM>= 59 )
                     app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                end
                if(app.a59_79.Value==1)
                    if (app.BPM < 59)
                     app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                     [y,Fs] = audioread('beep-02.wav');
                     sound(y,Fs);
                    elseif (app.BPM <= 77  || app.BPM>= 59 )
                     app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                end

            end

        end
        if(app.NoButton.Value==1)
            if(app.MaleButton.Value==1)
               if(app.a20_39.Value==1)
                    if (app.BPM < 47)
                    app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                    [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                    elseif (app.BPM <= 75 || app.BPM >= 47)
                    app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                end
                 if (app.a39_59.Value==1)
                    if (app.BPM < 46)
                    app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                    [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                    elseif (app.BPM <= 76 || app.BPM >= 46)
                    app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                 end
                 if (app.a59_79.Value==1)
                   if (app.BPM < 45)
                     app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                     [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                   elseif (app.BPM  <= 74 || app.BPM >=45)
                     app.ResultsTextArea.Value{6}='Normal Heart Rate';
                   end
                 end 
            end
             if(app.FemaleButton.Value==1)
                if(app.a20_39.Value==1)
                    if (app.BPM < 52)
                     app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                     [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                    elseif (app.BPM <= 81 || app.BPM>= 52)
                     app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                end
                if(app.a39_59.Value==1)
                    if (app.BPM < 51)
                     app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                     [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                    elseif (app.BPM <= 78  || app.BPM>= 51 )
                     app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                end
                if(app.a59_79.Value==1)
                    if (app.BPM < 52)
                     app.ResultsTextArea.Value{6}='Bradycardia Alert!';
                     [y,Fs] = audioread('beep-02.wav');
                     sound(y,Fs);
                    elseif (app.BPM <= 77  || app.BPM>= 52 )
                     app.ResultsTextArea.Value{6}='Normal Heart Rate';
                    end
                end
             end
        end
        app.ResultsTextArea.Value{7}='Palpation Presence: ';
            if(app.skipcounter>0)
              app.ResultsTextArea.Value{8}='Heart palpation alert';
            else
               app.ResultsTextArea.Value{8}='No heart palpation detected'; 
            end
            %%%%
            app.ResultsTextArea.Value{9}='Heart Rate Variability: ';
              if(app.a20_39.Value==1)
                if app.RMSSD < 24 || app.RMSSD >62
                    app.ResultsTextArea.Value{10}='Abnormal HRV alert!';
                    [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                elseif app.RMSSD <= 62 && app.RMSSD >= 24
                   app.ResultsTextArea.Value{10}='Normal HRV';
                end
              end
             if(app.a39_59.Value==1)
                if app.RMSSD < 16 && app.RMSSD>42
                    app.ResultsTextArea.Value{10}='Abnormal HRV alert!';
                    [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                elseif app.RMSSD <= 42 && app.RMSSD >= 16
                   app.ResultsTextArea.Value{10}='Normal HRV';
                end
              end
                if(app.a39_59.Value==1)
                if app.RMSSD < 16 && app.RMSSD >31
                    app.ResultsTextArea.Value{10}='Abnormal HRV alert!';
                    [y,Fs] = audioread('beep-02.wav');
                    sound(y,Fs);
                elseif app.RMSSD <= 31 && app.RMSSD >= 16
                   app.ResultsTextArea.Value{10}='Normal HRV';
                end
                end
            %%%%
        if(app.BPM<20)
        app.ResultsTextArea.Value{11}='Seek medical Attention Immediately!';
        [y,Fs] = audioread('beep-02.wav');
        sound(y,Fs);
        end  
        end
       
    end
        

    % Callbacks that handle component events
    methods (Access = private)

        % Callback function: Button, UIFigure
        function ButtonPushed(app, event)
            [file,path,index]= uigetfile;
            if isequal(file,0)
               close(app.UIFigure);
            else 
                filename = [path file];
                data = load(filename); 
                y=data(:,2);

samples = numel(y);

%Detction of QRS amplitude (peak) 
%An R peak shall be defined as a sample that is greater than the sample to its left
%and the sample to its right AND is greater than 1.0 millivolt
app.beat_num = 0;
%app.sampling_rate = 100;
for k=2 : samples-1
    if (y(k) > y(k-1) && y(k) > y(k+1) && y(k)>= 1.0)
        app.beat_num = app.beat_num + 1;
    end
end

%Saving the positions of the individual peaks
r_r_pos= cell(app.beat_num, 1); 
count = 0;

for k=2 : samples-1
    if (y(k) > y(k-1) && y(k) > y(k+1) && y(k)>= 1.0)
        count = count+1;
        r_r_pos{count}(end+1,:) = k;  
    end
end

%Calculating Heart Rate from Number of beats divided by the duration

duration_in_seconds = samples / app.sampling_rate;

duration_in_minutes = duration_in_seconds / 60;

app.BPM = app.beat_num / duration_in_minutes;

sum = 0;

%Calculating indivdual r-r intervals and average r-r interval
r_r_intervals = cell(app.beat_num - 1, 1);

for k=1 : app.beat_num
   if (k ~= app.beat_num) 
     temp =  r_r_pos{k+1} - r_r_pos{k};
     r_r_intervals{k}(end+1,:) = temp;
     sum = sum + temp;
   end
end

app.average_rr_in_seconds = (sum / (app.beat_num-1)) / (app.sampling_rate);
%%%%
app.skipcounter=0;
 for i=1: app.beat_num-1
        if r_r_intervals{i} > (2*app.average_rr_in_seconds)-(app.average_rr_in_seconds/10)&& r_r_intervals{i}<(2*app.average_rr_in_seconds)+(app.average_rr_in_seconds/10)
            app.skipcounter = app.skipcounter + 1;
        end
 end
 %%%
sumHRVsq=0;
tempo=0;
for j = 1:app.beat_num-1
   tempo = r_r_intervals{j};
   disp(tempo);
   sumHRVsq = sumHRVsq + tempo^2;
   disp(sumHRVsq);
   app.counterHRV=app.counterHRV+1;
end
app.RMSSD = sqrt(sumHRVsq/app.counterHRV);
disp(app.RMSSD);
%%%%
            end

        end

        % Button pushed function: Button_2
        function Button_2Pushed(app, event)
          value = app.ResultsTextArea.Value;  % Value entered in textArea
          name = num2str(app.saveCounter);
          extension='diagnosis.txt';
          filename=[name extension];
          writecell(value,filename, 'QuoteStrings',false);
          app.saveCounter = app.saveCounter +1;
        end

        % Button pushed function: 
        % ClickheretorunadiagnosisonprerecordedECGreadingButton
        function ClickheretorunadiagnosisonprerecordedECGreadingButtonPushed(app, event)
          app.Diagnose();        
        end

        % Button pushed function: 
        % ClickheretorecordaliveECGandrunadiagnosisButton
        function ClickheretorecordaliveECGandrunadiagnosisButtonPushed(app, event)
b = Bitalino;
% Start background acquisition
b.startBackground;
%Acquire data for 20 seconds 
pause(20);
% Read the data from the BITalino Board
allData = b.read;
% Stop background acquisition of data
b.stopBackground;
delete(b);

% The following shows which columns correlate to each channel
% 1             2   3   4   5   6   7   8   9   10  11
% packetNumber  I0  I1  I2  I3  A0  A1  A2  A3  A4  A5
%We want the A2 channel which is the ECG channel, so column 8
data = allData(:,8);
%Converting BITalino’s Output Values into their Real Units
ECG_V = ((((ECG_raw./((2.^10)-1))-0.5) .* 3.3)./ 1100);
ECG_mV= ECG_V.*1000;

% Filter the data using a Savitzky-Golay filter
%Signal Processing tool box must be installed
ECG_data = sgolayfilt(ECG_mV, 7, 41);

app.beat_num = 0;
samples = numel(ECG_data);
app.sampling_rate = 1000;
for k=2 : samples-1
    if (ECG_data(k) > ECG_data(k-1) && ECG_data(k) > ECG_data(k+1) && ECG_data(k)>= 1.0)
       app.beat_num = app.beat_num + 1;
    end
end

r_r_pos= cell(app.beat_num, 1); 
count = 0;

for k=2 : samples-1
    if (ECG_data(k) > ECG_data(k-1) && ECG_data(k) > ECG_data(k+1) && ECG_data(k)>= 1.0)
        count = count+1;
        r_r_pos{count}(end+1,:) = k;  
    end
end
%Calculating indivdual r-r intervals and average r-r interval
sum = 0;
r_r_intervals = cell(app.beat_num - 1, 1);
for k=1 : app.beat_num
   if (k ~= app.beat_num) 
     temp =  r_r_pos{k+1} - r_r_pos{k};
     r_r_intervals{k}(end+1,:) = temp;
     sum = sum + temp;
   end
end
%%%
 %%%
sumHRVsq=0;
tempo=0;
for j = 1:app.beat_num-1
   tempo = r_r_intervals{j};
   disp(tempo);
   sumHRVsq = sumHRVsq + tempo^2;
   disp(sumHRVsq);
   app.counterHRV=app.counterHRV+1;
end
app.RMSSD = sqrt(sumHRVsq/app.counterHRV);
disp(app.RMSSD);
%%%%
% Calculate the heart rate
duration_in_seconds = samples / app.sampling_rate;

duration_in_minutes = duration_in_seconds / 60;

app.BPM = app.beat_num / duration_in_minutes;
app.average_rr_in_seconds = (sum / (app.beat_num-1)) / (app.sampling_rate);
app.Diagnose();
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.6196 0.5686 0.5686];
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @ButtonPushed, true);

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Icon = 'OIP.jpg';
            app.Button.Position = [40 42 49 37];
            app.Button.Text = '';

            % Create ImportECGreadingLabel
            app.ImportECGreadingLabel = uilabel(app.UIFigure);
            app.ImportECGreadingLabel.FontName = 'Arabic Typesetting';
            app.ImportECGreadingLabel.FontSize = 20;
            app.ImportECGreadingLabel.FontWeight = 'bold';
            app.ImportECGreadingLabel.Position = [12 18 130 25];
            app.ImportECGreadingLabel.Text = 'Import ECG reading';

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.Icon = 'repository-12-834420.png';
            app.Button_2.Position = [556 291 52 37];
            app.Button_2.Text = '';

            % Create SaveDiagnosisLabel
            app.SaveDiagnosisLabel = uilabel(app.UIFigure);
            app.SaveDiagnosisLabel.FontName = 'Arabic Typesetting';
            app.SaveDiagnosisLabel.FontSize = 20;
            app.SaveDiagnosisLabel.FontWeight = 'bold';
            app.SaveDiagnosisLabel.Position = [530 264 103 28];
            app.SaveDiagnosisLabel.Text = 'Save Diagnosis';

            % Create ClickheretorunadiagnosisonprerecordedECGreadingButton
            app.ClickheretorunadiagnosisonprerecordedECGreadingButton = uibutton(app.UIFigure, 'push');
            app.ClickheretorunadiagnosisonprerecordedECGreadingButton.ButtonPushedFcn = createCallbackFcn(app, @ClickheretorunadiagnosisonprerecordedECGreadingButtonPushed, true);
            app.ClickheretorunadiagnosisonprerecordedECGreadingButton.BackgroundColor = [0.9686 0.8902 0.8902];
            app.ClickheretorunadiagnosisonprerecordedECGreadingButton.FontName = 'Arabic Typesetting';
            app.ClickheretorunadiagnosisonprerecordedECGreadingButton.FontSize = 20;
            app.ClickheretorunadiagnosisonprerecordedECGreadingButton.FontWeight = 'bold';
            app.ClickheretorunadiagnosisonprerecordedECGreadingButton.Position = [250 57 380 33];
            app.ClickheretorunadiagnosisonprerecordedECGreadingButton.Text = 'Click here to run a diagnosis on  pre-recorded ECG reading';

            % Create SelectyourgenderButtonGroup
            app.SelectyourgenderButtonGroup = uibuttongroup(app.UIFigure);
            app.SelectyourgenderButtonGroup.Title = 'Select your gender ';
            app.SelectyourgenderButtonGroup.Position = [299 102 116 91];

            % Create FemaleButton
            app.FemaleButton = uiradiobutton(app.SelectyourgenderButtonGroup);
            app.FemaleButton.Text = 'Female';
            app.FemaleButton.Position = [11 45 62 22];
            app.FemaleButton.Value = true;

            % Create MaleButton
            app.MaleButton = uiradiobutton(app.SelectyourgenderButtonGroup);
            app.MaleButton.Text = 'Male';
            app.MaleButton.Position = [11 23 65 22];

            % Create ResultsTextAreaLabel
            app.ResultsTextAreaLabel = uilabel(app.UIFigure);
            app.ResultsTextAreaLabel.FontName = 'Arabic Typesetting';
            app.ResultsTextAreaLabel.FontSize = 32;
            app.ResultsTextAreaLabel.FontWeight = 'bold';
            app.ResultsTextAreaLabel.FontColor = [0.0706 0.0667 0.0667];
            app.ResultsTextAreaLabel.Position = [336 389 74 41];
            app.ResultsTextAreaLabel.Text = 'Results';

            % Create ResultsTextArea
            app.ResultsTextArea = uitextarea(app.UIFigure);
            app.ResultsTextArea.FontColor = [0.0706 0.0667 0.0667];
            app.ResultsTextArea.Position = [409 341 217 129];

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.BackgroundColor = [0.6353 0.0784 0.1843];
            app.Image.Position = [12 397 106 73];
            app.Image.ImageSource = 'icon.jpg';

            % Create ClickheretorecordaliveECGandrunadiagnosisButton
            app.ClickheretorecordaliveECGandrunadiagnosisButton = uibutton(app.UIFigure, 'push');
            app.ClickheretorecordaliveECGandrunadiagnosisButton.ButtonPushedFcn = createCallbackFcn(app, @ClickheretorecordaliveECGandrunadiagnosisButtonPushed, true);
            app.ClickheretorecordaliveECGandrunadiagnosisButton.BackgroundColor = [0.9686 0.8902 0.8902];
            app.ClickheretorecordaliveECGandrunadiagnosisButton.FontName = 'Arabic Typesetting';
            app.ClickheretorecordaliveECGandrunadiagnosisButton.FontSize = 20;
            app.ClickheretorecordaliveECGandrunadiagnosisButton.FontWeight = 'bold';
            app.ClickheretorecordaliveECGandrunadiagnosisButton.Position = [248 11 378 32];
            app.ClickheretorecordaliveECGandrunadiagnosisButton.Text = 'Click here to record a live ECG and run a diagnosis ';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [12 120 266 264];

            % Create WelcomeTab
            app.WelcomeTab = uitab(app.TabGroup);
            app.WelcomeTab.Title = 'Welcome';

            % Create TextArea
            app.TextArea = uitextarea(app.WelcomeTab);
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.FontName = 'Corbel Light';
            app.TextArea.FontWeight = 'bold';
            app.TextArea.Position = [9 43 238 188];
            app.TextArea.Value = {'Welcome to HeartBeat'; ''; 'This program is designed to analyse heart rate and detect arrhythmias '; ''; 'If you want to run a diagnosis on pre-recorded data please click on the "Pre-recorded" tab for instructions'; ''; 'If you want to preform a live ECG on the spot, and then run a diagnosis, click on the "Live" tab for instructions'};

            % Create PrerecordedTab
            app.PrerecordedTab = uitab(app.TabGroup);
            app.PrerecordedTab.Title = 'Pre-recorded';

            % Create TextArea_2
            app.TextArea_2 = uitextarea(app.PrerecordedTab);
            app.TextArea_2.HorizontalAlignment = 'center';
            app.TextArea_2.FontName = 'Corbel Light';
            app.TextArea_2.FontWeight = 'bold';
            app.TextArea_2.Position = [9 54 238 177];
            app.TextArea_2.Value = {'To run a diagnosis on pre-recorded data, please make sure you have an appropriate file containing the ECG readings.'; ''; 'Click on the "Import ECG reading" button to upload the desired file.'; ''; 'Then press on the "Click here to run a diagnosis on  pre-recorded ECG reading" button to display your diagnosis in the Results area'};

            % Create LiveTab
            app.LiveTab = uitab(app.TabGroup);
            app.LiveTab.Title = 'Live';

            % Create TextArea_3
            app.TextArea_3 = uitextarea(app.LiveTab);
            app.TextArea_3.Position = [9 67 238 164];
            app.TextArea_3.Value = {'To run a live ECG, please make sure you have the following hardware:'; '- BITalino (r)evolution Board Kit BT'; ''; '1) Turn on your BITalino and connect the electrodes to the A2 channel'; ''; '2)Turn on your device Bluetooth and make sure the BITalino is paired. If a connection is not established, the reading won''t be successful'; ''; '3) Attach the electrodes exactly like the figure below. On your wrists, place the black electrode on the left arm, the white electrode on the right arm and the red electrode near the elbow.'; ''; '-The reading will last for 20 seconds, so don''t remove the electrodes during that period.'; ''; '4)Press on the "Click here to record a live ECG and run a diagnosis" button'; ''; '5)It is crucial that you minimally move and have slow, relaxed breathing. It is preferrable to preform the ECG in a very quiet place'};

            % Create Image2
            app.Image2 = uiimage(app.LiveTab);
            app.Image2.Position = [76 9 100 58];
            app.Image2.ImageSource = 'What-Is-ECG-and-How-Does-It-Work-1024x536.jpg';

            % Create DoyouidentifyasanatheleteButtonGroup
            app.DoyouidentifyasanatheleteButtonGroup = uibuttongroup(app.UIFigure);
            app.DoyouidentifyasanatheleteButtonGroup.TitlePosition = 'centertop';
            app.DoyouidentifyasanatheleteButtonGroup.Title = 'Do you identify as an athelete?';
            app.DoyouidentifyasanatheleteButtonGroup.Position = [299 209 176 96];

            % Create YesButton
            app.YesButton = uiradiobutton(app.DoyouidentifyasanatheleteButtonGroup);
            app.YesButton.Text = 'Yes';
            app.YesButton.Position = [11 50 58 22];
            app.YesButton.Value = true;

            % Create NoButton
            app.NoButton = uiradiobutton(app.DoyouidentifyasanatheleteButtonGroup);
            app.NoButton.Text = 'No';
            app.NoButton.Position = [11 28 65 22];

            % Create SelectyouragegroupButtonGroup
            app.SelectyouragegroupButtonGroup = uibuttongroup(app.UIFigure);
            app.SelectyouragegroupButtonGroup.Title = 'Select your age group';
            app.SelectyouragegroupButtonGroup.Position = [444 102 130 91];

            % Create a20_39
            app.a20_39 = uiradiobutton(app.SelectyouragegroupButtonGroup);
            app.a20_39.Text = '20-39';
            app.a20_39.Position = [11 45 58 22];
            app.a20_39.Value = true;

            % Create a39_59
            app.a39_59 = uiradiobutton(app.SelectyouragegroupButtonGroup);
            app.a39_59.Text = '40-59';
            app.a39_59.Position = [11 23 65 22];

            % Create a59_79
            app.a59_79 = uiradiobutton(app.SelectyouragegroupButtonGroup);
            app.a59_79.Text = '60-79';
            app.a59_79.Position = [11 1 65 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Project_App_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end