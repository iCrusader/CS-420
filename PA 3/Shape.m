classdef Shape < matlab.mixin.Heterogeneous
    %Properties of the class
    properties
        Name
        Area ='[]'
    end
    
    methods
        %Constructor method
        function obj = Shape(name)
            if nargin > 0
                obj.Name = name;                
            end
        end
        %Display method
        function Display(obj)
            disp(['Name: ' obj.Name]);
            disp(['Area: ' obj.Area]);
        end       
        
    end

     methods (Static)
         %method Calculate Statistic
        function CalculateStatistics(obj) 
            %Create the array of Area
            array = [obj.Area];
            %method to calculate
            meanArea = mean(array);
            medianArea = median(array);
            stdDevArea = std(array);
            %display the objects in the array
            disp(['Array of object has ', num2str(numel(obj)), ' Object(s):'])
            for i=1:numel(obj)
                disp(['Object ', num2str(i), ' is ' obj(i).Name, '. Its area is: ', num2str(round(obj(i).Area,2))]);
            end
            
            disp(['Mean Area: ', num2str(round(meanArea,2))]);
            disp(['Median Area: ', num2str(round(medianArea,2))]);
            disp(['Standard Deviation of Areas: ', num2str(round(stdDevArea,2))]);
        end
    end
end