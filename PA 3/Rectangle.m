classdef Rectangle < Shape & ColorMixin
    %Properties of the Rectangle objects
    properties
        Length
        Width
    end

    methods
        %Constructor
        function obj = Rectangle(l,w,c)
            obj@Shape('Rectangle');
            obj@ColorMixin(c)
            if nargin > 0
            obj.Length = l;
            obj.Width = w;
            %setting Area equal to formula
            obj.Area = obj.CalculateArea();
            end
        end
        % function to calculate Area
        function area = CalculateArea(obj)           
            area = obj.Length * obj.Width;
        end

        % display function override the one from Shape
        function Display(obj)
            str = ['The area of a ',obj.Name,' with a length of ', num2str(obj.Length), ' units and a width of ',num2str(obj.Width),' units is approximately ',num2str(round(obj.Area,2)),' square units.It is a ', obj.Color, ' color.'];
            disp(str);        
        end

        %Draw Function
        function Draw(obj)
            figure;
            hold on;          
            rectangle('Position', [0, 0, obj.Length, obj.Width], 'EdgeColor', obj.Color, 'LineWidth', 2, 'FaceColor', obj.Color);  
            %setting the axis to display obj further from the scale
            axis ([-1 obj.Length + 3 -1 obj.Width+ 3])
            title([obj.Name,':']);
            xlabel(['Length ', num2str(obj.Length), newline,'Width: ', num2str(obj.Width),newline,'Area: ', num2str(round(obj.Area,2)),newline,'Color: ', obj.Color]);            
            hold off;
        end

    end
end