classdef Circle < Shape & ColorMixin
    %Properties of Circle
    properties
        Radius
    end

    methods
        %Constructor initialize properties
        function obj = Circle(r,color)
            obj@Shape('Circle');
            obj@ColorMixin(color)
            if nargin > 0
                obj.Radius = r;
                obj.Area = obj.CalculateArea();                   
            end
        end

        %Calculate the area
        function area = CalculateArea(obj)       
           area = obj.Radius ^ 2 * pi;            
        end

         % Override display
        function Display(obj)
            str = ['The area of a ',obj.Name,' with a radius of ', num2str(obj.Radius),' units is approximately ',num2str(round(obj.Area,2)),' square units. It is a ', obj.Color, ' color.'];
            disp(str);
        end

        %Draw method
        function Draw(obj)
            figure;
            hold on;            
            pos = [-obj.Radius, -obj.Radius, 2*obj.Radius, 2*obj.Radius];
            % Create a circle with the specified radius and color
            rectangle('Position',pos, 'Curvature', [1, 1], 'FaceColor', obj.Color);     
            axis equal;
            title([obj.Name]);
            xlabel(['Radius: ', num2str(obj.Radius),newline, 'Area: ', num2str(round(obj.Area,2)), newline, 'Color: ', obj.Color]);            
            hold off;
        end
    end
end