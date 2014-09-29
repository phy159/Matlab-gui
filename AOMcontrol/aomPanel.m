% create AOM panel
S.aom = uipanel('Parent',S.fh,'Title','AOM Controls',...
             'FontSize',10,'FontWeight','bold',...
             'units','pixels','Position',[10 10 300 100]);

% pushbuttons
pbx=170; pby=40;
S.pbstart = uicontrol('style','push',...
                 'Parent',S.aom,...
                 'position',[pbx pby 120 30],...
                 'string','Start Pulse Train');

S.pbstop = uicontrol('style','push',...
                 'Parent',S.aom,...
                 'position',[pbx pby-30 120 30],...
                 'string','Stop Pulse Train');

% text holders
S.et_freq = uicontrol('style','edit',...
                 'Parent',S.aom,...
                 'position',[pbx-50 pby 50 30],...
                 'string','1.0');
             
S.et_duty = uicontrol('style','edit',...
                 'Parent',S.aom,...
                 'position',[pbx-50 pby-30 50 30],...
                 'string','10');
             
% labels
S.t_freq = uicontrol('style','text',...
                 'Parent',S.aom,...
                 'position',[pbx-170 pby 120 30],...
                 'string','Frequency (kHz)');

S.t_duty = uicontrol('style','text',...
                 'Parent',S.aom,...
                 'position',[pbx-170 pby-30 120 30],...
                 'string','Duty Cycle (%)');