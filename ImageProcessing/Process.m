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
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%                            Usage                                %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
p.CaseSensitive = false;
defaultHeight = 100;
defaultWidth = 161;
defaultFontSize = 24;           % Used fontsize (labels, legenda, etc)
defaultTitle = 'Awesome plot by Jaap';
addOptional(p, 'width',  defaultWidth, @isnumeric);
addOptional(p, 'height', defaultHeight, @isnumeric);
addOptional(p, 'fontsize', defaultFontSize, @isnumeric);
addOptional(p, 'filename', defaultTitle);

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
         'FontSize', p.Results.defaultFontSize, 'fontWeight', FontWeight,...
         'FontName', FontName)
h_xlabel = get(gca,'XLabel');
h_ylabel = get(gca,'YLabel');
h_title = get(gca, 'Title');
set(h_xlabel,'FontSize', p.Results.defaultFontSize,...
             'FontWeight', FontWeight, 'FontName', FontName);
set(h_ylabel,'FontSize', p.Results.defaultFontSize,...
             'FontWeight', FontWeight, 'FontName', FontName);
set(h_title,'FontSize', p.Results.defaultFontSize+3,...
            'FontWeight', FontWeight, 'FontName', FontName);

saveas(gcf, fullfile('figures', filename), 'pdf') %Saves the image as pdf in the figures folder.
end
