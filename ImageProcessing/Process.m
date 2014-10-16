function z = Process(filename, varargin)
% The function Process is designed to create neat pictures for use in
% reports. It saves a pdf in a (newly created) folder called figures.
% Figures are stored in pdf.
% Input commands are:
% Width is image width relative to page width in percentage
% Height is image height relative to page with in percentage
% Name is a string containing the inteded image name.

p = inputParser;
p.CaseSensitive = false;
defaultHeight = 100;
defaultWidth = 161;
defaultTitle = 'Awesome plot by Jaap';
addOptional(p, 'width',  defaultWidth, @isnumeric);
addOptional(p, 'height', defaultHeight, @isnumeric);
addOptional(p, 'title', defaultTitle);
%  addParameter(p,'shape',defaultShape,...
%                 @(x) any(validatestring(x,expectedShapes)));
parse(p, filename, varargin{:})

if exist('figures/fig', 'dir') ~= 7   %checks if apropriate folder exists
    mkdir(strcat('figures', filesep, 'fig'));
end
saveas(gcf, fullfile('figures', filesep, 'fig',filesep, filename), 'fig'); %saving backup fig


%% Initializing defaults
FontSize = 24;           % Used fontsize (labels, legenda, etc)
GraphLineWidth = 3;      % The linewidth of the graph lines
MarkerSize = 10;         % The size of the markers

FontName = 'Helvetica';   % Fonttype, chosen semi freely (only a couple are supported)
FontWeight = 'Bold';       % [light normal, demi, bold]

%% Changing figure borders and grid
grid off                % Turns the grid off (prefered by most editors)
box on                  % Turns box on
GridLineStyle = '--';   % [-, --, :, -., none] not in use when grid is off
LineWidth = 1;          % Thickness of the axis and grid.

%Settings are applied from here, to adjust the layout of the graph only
%change the upper part.

hline = findobj(gcf, 'type', 'line');
set(hline, 'LineWidth', GraphLineWidth, 'MarkerSize', MarkerSize)
set(gcf, 'PaperUnits', 'centimeters')
set(gcf, 'PaperPosition', [0, 0, p.Results.width, p.Results.height]',...
         'PaperSize', [p.Results.width, p.Results.height]);
set(gca, 'LineWidth', LineWidth, 'GridLineStyle', GridLineStyle,...
         'FontSize', FontSize, 'fontWeight', FontWeight, 'FontName', FontName)
h_xlabel = get(gca,'XLabel');
h_ylabel = get(gca,'YLabel');
h_title = get(gca, 'Title');
set(h_xlabel,'FontSize', FontSize, 'FontWeight', FontWeight, 'FontName', FontName);
set(h_ylabel,'FontSize', FontSize, 'FontWeight', FontWeight, 'FontName', FontName);
set(h_title,'FontSize', FontSize+3, 'FontWeight', FontWeight, 'FontName', FontName);

saveas(gcf, fullfile('figures', filename), 'pdf') %Saves the image as pdf in the figures folder.
end
