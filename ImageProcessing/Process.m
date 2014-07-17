function z = Process(Width, Height, Name)
    % The function Process is designed to create neat pictures for use in
    % reports. It saves a pdf in a (newly created) folder called figures.
    % Figures are stored in pdf. 
    % Input commands are:
    % Width is image width
    % Height is image height
    % Name is a string containing the inteded image name. 
   
    if exist('figures/fig', 'dir') ~= 7   %checks if apropriate folder exists
    	    cmd = strcat('mkdir figures', filesep, 'fig'); %creates save folder
	    system(cmd);
    end
    saveas(gcf, fullfile('figures/fig', Name), 'fig'); %saving backup fig

    %% Initializing defaults
    page = 24; %defailt a4 width
    FontSize = 10;
    GraphLineWidth = 3;
    MarkerSize = 10; % If a marker was used (x,+,*,o...) This is it's size.
    
    FontName = 'AvantGarde'; % Fonttype, chosen freely. 
    FontWeight = 'Bold';  % [light normal, demi, bold]
    
    %% Changing figure borders and grid, grid might be offensive
    grid on % Turns the grid on
    box on  % Turns box on
    GridLineStyle = '--'; % [-, --, :, -., none]
    LineWidth = 1; % Thickness of the grid and the axis.
        
    %% Gathering input
    if nargin == 0
        Height = 50;
        Width = 60;
        Name = get(get(gca, 'Title'), 'String'); % Title of the graph, figure is saved with this name.
    elseif nargin == 2
        Name = get(get(gca, 'Title'), 'String'); % Title of the graph, figure is saved with this name.
    end
    
    Height = Height * page / 100;
    Width  = Width  * page / 100;
    
    %Settings are applied from here, to adjust the layout of the graph only
    %change the upper part.
    
    hline = findobj(gcf, 'type', 'line');
    set(hline, 'LineWidth', GraphLineWidth, 'MarkerSize', MarkerSize)
    set(gcf, 'PaperUnits', 'centimeters')
    set(gcf, 'PaperPosition', [0 0 Width Height], 'PaperSize', [Width, Height]);
    set(gca, 'LineWidth', LineWidth, 'GridLineStyle', GridLineStyle, 'FontSize', FontSize, 'fontWeight', FontWeight, 'FontName', FontName)
    h_xlabel = get(gca,'XLabel');
    h_ylabel = get(gca,'YLabel');
    h_title = get(gca, 'Title');
    set(h_xlabel,'FontSize', FontSize, 'FontWeight', FontWeight, 'FontName', FontName); 
    set(h_ylabel,'FontSize', FontSize, 'FontWeight', FontWeight, 'FontName', FontName);
    set(h_title,'FontSize', FontSize+3, 'FontWeight', FontWeight, 'FontName', FontName);
    
    saveas(gcf, fullfile('figures', Name), 'pdf') %Saves the image as pdf in the figures folder.
end
