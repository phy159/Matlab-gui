function [] = aomControl()
% Controls the AOM by generating pulse trains using NI multi-function
% device.

% set Fontsize to 10
set(0,'defaultUicontrolFontSize',10);

% create primary figure
S.fh = figure('units','pixels',...
              'position',[200 200 320 220],...
              'menubar','none',...
              'numbertitle','off',...
              'name','Instrument Controls',...
              'resize','off');
          
% create interface panels
aomPanel      % AOM control panel
laserPanel    % laser control panel

% initialize instrument communication
S.s=serial('COM7');             % laser communication
set(S.s,'BaudRate',19200);
set(S.s,'Terminator','CR');

S.g=daq.createSession('ni');      % Dev1 communication for AOM
ch=S.g.addCounterOutputChannel('Dev1',0,'PulseGeneration');
S.g.IsContinuous = true;

% create callbacks
set(S.pbstart,'callback',{@pbstart_call,S});
set(S.pbstop,'callback',{@pbstop_call,S});
set(S.pbsetPower,'callback',{@pbsetPower_call,S});


function [] = pbstart_call(varargin)
% Callback for pushbutton 'Start Pulse Train'
h = varargin{1}; % Get the caller's handle.
S = varargin{3}; % Get the structure

S.g.stop()
freq=1e3 * str2double(get(S.et_freq,'string'));
duty=0.01 * str2double(get(S.et_duty,'string'));
S.g.Channels.Frequency=freq; % sets the frequency
S.g.Channels.DutyCycle=duty; % sets duty cycle
S.g.startBackground;

set(h,'str','RUNNING...','backg',[1 .6 .6]) % Change color of button. 
fprintf('Pulse generation started.\n')
fprintf('\t\tFrequency =%4.0f kHz \t\tDuty Cycle = %2.0f%%\n',freq/1000,duty*100)


function [] = pbstop_call(varargin)
% Callback for pushbutton 'Stop Pulse Train'
h = varargin{1};
S = varargin{3}; % Get the structure
col = get(h,'backg');  % Get the background color of the figure.
set(S.pbstart,'str','Start Pulse Generation','backg',col)  % Now reset the button features.
S.g.stop()
fprintf('Pulse generation STOPPED.\n')


function [] = pbsetPower_call(varargin)
S = varargin{3};
% Callback for pushbutton 'Set Laser Power'
power=str2double(get(S.et_lasPower,'String'));
sendPower=['POWER=' num2str(power)];
% fprintf(S.s,sendPower);
% fclose(S.s)
fprintf('Laser power is set to %4.2f W.\n',power)



