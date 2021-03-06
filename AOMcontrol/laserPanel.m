% create AOM panel
S.las = uipanel('Parent',S.fh,'Title','Laser Controls',...
             'FontSize',10,'FontWeight','bold',...
             'units','pixels','Position',[10 110 300 100]);

% pushbuttons
pbx=170; pby=40;
S.pbsetPower = uicontrol('style','push',...
                 'Parent',S.las,...
                 'position',[pbx pby 120 30],...
                 'string','Set Laser Power');

% text holders
S.et_lasPower = uicontrol('style','edit',...
                 'Parent',S.las,...
                 'position',[pbx-50 pby 50 30],...
                 'string','3.0');
% labels
S.t_lasPower = uicontrol('style','text',...
                 'Parent',S.las,...
                 'position',[pbx-170 pby 120 30],...
                 'string','Laser Power (W)');