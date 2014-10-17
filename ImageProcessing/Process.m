function z = Process(filename, varargin)
% Process() is a function designed to make consistent image processing
% easy and nice. It should be used by calling it after plotting an image.
% Required additions as labels, legenda etc should be added before calling
% this function. When ready Process can be called. The function creates
% two images. A .fig file as backup when the layout of images is not
% fullfilling and a .pdf file which can be used in reports. A folder
% "figures" is created in which the pdf-files are stored. It contains a
% subfolder fig which contains the fig-files.
%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%                             Usage                                %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Process needs no input arguments although it is probably neccesary to add
% some. There are various chaging parameters which can be changed using the
% flags:
% title     -   The filename under which the images are stored
% height    -   The image height
% widht     -   The image widht
% fontsize  -   The fontsize of labels, legenda entries etc.
% Example:
% Process('title', 'Excellent plot', 'height', 100, 'width', 161)


p = inputParser;
p.CaseSensitive = false;        % Fuck capitals
defaultHeight = 100;            % Default image height
defaultWidth = 161;             % Default image width (based on phi)
defaultFontSize = 24;           % Used fontsize (labels, legenda, etc)
defaultAutoCut = false;
defaultTitle = 'Awesome plot by Jaap';
addOptional(p, 'width',  defaultWidth, @isnumeric);
addOptional(p, 'height', defaultHeight, @isnumeric);
addOptional(p, 'fontsize', defaultFontSize, @isnumeric);
addOptional(p, 'filename', defaultTitle);
addOptional(p, 'autoCut', defaultAutoCut); %add boolean check

parse(p, filename, varargin{:})

if exist('figures/fig', 'dir') ~= 7   %checks if apropriate folder exists
    mkdir(strcat('figures', filesep, 'fig'));
end
saveas(gcf, fullfile('figures', filesep,...
    'fig',filesep, filename), 'fig'); %saving backup fig


%% Initializing defaults
GraphLineWidth = 3;      % The linewidth of the graph lines
MarkerSize = 10;         % The size of the markers

FontName = 'Helvetica';   % Fonttype, chosen semi freely (only a couple are supported)
FontWeight = 'Bold';       % [light normal, demi, bold]
fontColor = 0.4*ones(1,3);
axisColor = 0.5*ones(1,3);

%% Changing figure borders and grid
grid off                % Turns the grid off (prefered by most editors)
box on                  % Turns box on
GridLineStyle = '--';   % [-, --, :, -., none] not in use when grid is off
LineWidth = 1;          % Thickness of the axis and grid.

%Settings are applied from here, to adjust the layout of the graph only
%change the upper part.

h_line = findobj(gcf, 'type', 'line');

if p.Results.autoCut
    xmin = min([h_line.XData]);
    ymin = min([h_line.YData]);
    xmax = max([h_line.XData]);
    ymax = max([h_line.YData]);
    cutoffX = [xmin-0.1*(xmax-xmin), xmax + 0.1*(xmax-xmin)];
    cutoffY = [ymin-0.1*(ymax-ymin), ymax + 0.1*(ymax-ymin)];
    
    axis([cutoffX, cutoffY])
end

set(h_line, 'LineWidth', GraphLineWidth, 'MarkerSize', MarkerSize)
set(gcf, 'PaperUnits', 'centimeters')
set(gcf, 'PaperPosition', [0, 0, p.Results.width, p.Results.height]',...
    'PaperSize', [p.Results.width, p.Results.height]);
set(gca, 'LineWidth', LineWidth, 'GridLineStyle', GridLineStyle,...
    'FontSize', p.Results.fontsize, 'fontWeight', FontWeight,...
    'FontName', FontName,...
    'XColor', axisColor, 'YColor', axisColor)

h_xlabel = get(gca,'XLabel');
h_ylabel = get(gca,'YLabel');
h_title = get(gca, 'Title');

set([h_xlabel, h_ylabel, h_title],'FontSize', p.Results.fontsize,...
    'FontWeight', FontWeight, 'FontName', FontName,...
    'Color', fontColor);
set(h_title,'FontSize', p.Results.fontsize+3)

saveas(gcf, fullfile('figures', filename), 'pdf') %Saves the image as pdf in the figures folder.
end
