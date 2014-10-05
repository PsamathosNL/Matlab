classdef data < handle
    %DATA Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % integers
        var1 = 10;
        var2 = 1;
        
        % array's
        arr1 = [2,3]
    end
    
    methods
        function obj = merge(obj, c1)
            % integers
            obj.var1 =  obj.var1 + c1.var1;
            obj.var2 =  obj.var2 + c1.var2;
            
            %arra's
            obj.arr1 = [obj.arr1,  c1.arr1];
        end
        
        function obj = scrape(obj)
            path = pwd;
            
            
            % Listing subfolders which might need to be processed
            listings = dir(path);
            isub = [listings(:).isdir];
            nameFolds = {listings(isub).name}';
            nameFolds(ismember(nameFolds,{'.','..'})) = [];
            if isempty(nameFolds)
                save('dataHolder', 'dataHolder')
                return
            end
            
            % Recursively processing the subfolders.
            for i = 1:length(nameFolds)
                sub = nameFolds(i);
                folder = strcat(path, '/', sub{1});
                
                % If subfolder contains data, merge. 
                if exist(strcat(folder, '/dataHolder.mat'))
                    cd(folder)
                    load('dataHolder.mat')
                    dataHolder.refresh()
                    cd('..')
                    subs = load(sprintf(folder, '/dataHolder.mat'))
                    %merging todo
                    obj.merge(obj, subs.dataHolder)
                end
            end
        end
    end
end

end

