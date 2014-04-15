function z = Process(Width, Height, Name)
    % The function Process is designed to create neat pictures for use in
    % reports. It saves a pdf in a (newly created) folder called figures.
    % Figures are stored in pdf. 
    % Input commands are:
    % Width is image width
    % Height is image height
    % Name is a string containint the inteded image name. 
    FontSize = 50;
    GraphLineWidth = 3;
    MarkerSize = 10; % If a marker was used (x,+,*,o...) This is it's size.
    
    FontName = 'AvantGarde'; % Fonttype, chosen freely. 
    FontWeight = 'Bold';  % [light normal, demi, bold]
    
    grid on % Turns the grid on
    GridLineStyle = '--'; % [-, --, :, -., none]
    LineWidth = 1; % Thickness of the grid and the axis.
        
    
    if nargin == 0
        Height = 20;
        Width = 30;
        Name = get(get(gca, 'Title'), 'String'); % Title of the graph, figure is saved with this name.
    elseif nargin == 2
        Name = get(get(gca, 'Title'), 'String'); % Title of the graph, figure is saved with this name.
    end
    
    %Settings are applied from here, to adjust the layout of the graph only
    %change the upper part.
    
    hline = findobj(gcf, 'type', 'line');
    set(hline, 'LineWidth', GraphLineWidth, 'MarkerSize', MarkerSize)
    set(gcf, 'PaperPosition', [0 0 Width Height], 'PaperSize', [Width, Height]);
    set(gca, 'LineWidth', LineWidth, 'GridLineStyle', GridLineStyle, 'FontSize', FontSize, 'fontWeight', FontWeight, 'FontName', FontName)
    h_xlabel = get(gca,'XLabel');
    h_ylabel = get(gca,'YLabel');
    h_title = get(gca, 'Title');
    set(h_xlabel,'FontSize', FontSize, 'FontWeight', FontWeight, 'FontName', FontName); 
    set(h_ylabel,'FontSize', FontSize, 'FontWeight', FontWeight, 'FontName', FontName);
    set(h_title,'FontSize', FontSize+3, 'FontWeight', FontWeight, 'FontName', FontName);
    
    
    if exist('figures', 'dir') ~= 7   %checks if folder figures doesn't excist 
        mkdir figures %creates folder figures
    end
    
    saveas(gcf, fullfile('figures', Name), 'pdf') %Saves the image as pdf in the figures folder.
    saveas(gcf, fullfile('figures', Name), 'fig') %Saves the image as pdf in the figures folder.
end