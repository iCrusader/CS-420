classdef Square < Shape & ColorMixin
    %Properties of the Rectangle objects
    properties
       Side
    end

    methods
        %Constructor
        function obj = Square(s,c)
            obj@Shape('Square');
            obj@ColorMixin(c)
            if nargin > 0
            obj.Side = s;
            %setting Area equal to formula
            obj.Area = obj.CalculateArea();
            end
        end
        % function to calculate Area
        function area = CalculateArea(obj)           
            area = obj.Side * obj.Side;
        end

        % display function override the one from Shape
        function Display(obj)
            str = ['The area of a ',obj.Name,' with a side of ', num2str(obj.Side), ' units is approximately ',num2str(round(obj.Area,2)),' square units.It is a ', obj.Color, ' color.'];
            disp(str);        
        end

        %Draw Function
        function Draw(obj)
            figure;
            hold on;          
            rectangle('Position', [0, 0, obj.Side, obj.Side], 'EdgeColor', obj.Color, 'LineWidth', 2, 'FaceColor', obj.Color);  
            %setting the axis to display obj further from the scale
            axis equal
            title([obj.Name,':']);
            xlabel(['Side: ', num2str(obj.Side),newline,'Area: ', num2str(round(obj.Area,2)),newline,'Color: ', obj.Color]);            
            hold off;
        end

    end
end