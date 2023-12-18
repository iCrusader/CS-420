classdef Triangle < Shape & ColorMixin
    %Display Properties of the obj
    properties
        Base
        Height
    end
    %method inside the class
    methods
        %Constructor
        function obj = Triangle(b,h,c)
            obj@Shape('Triangle'); 
            obj@ColorMixin(c);
            if nargin > 0
            obj.Base = b;
            obj.Height = h;                 
            end
        end
        %Calculate the area
        function CalculateArea(obj)
            obj.Area = 1/2 * obj.Base * obj.Height;
        end
        %Override Display
        function Display(obj)            
               str = ['The area of a ',obj.Name,' with a base of ', num2str(obj.Base), ' and a height of ',num2str(obj.Height),' units is approximately ',num2str(round(obj.Area,2)),' square units. It is a ', obj.Color, ' color.'];
               disp(str);            
        end

        function Draw(obj)
            % Define the vertices of the triangle with the height start at
            % the middle of the base
           x = [0,obj.Base, obj.Base/2];
           y = [0,0,obj.Height];
         
            % Create the plot for the triangle
            figure;
            hold on;
            %fill color
            fill(x, y, obj.Color);          
            %change the title and view axis depend on the type of triangle   
            if strcmp(obj.Name, 'Equilateral Triangle')
                axis equal;
                title([obj.Name]);
                xlabel(['Side Length: ', num2str(obj.Base),newline ,'Area: ', num2str(round(obj.Area,2)), newline, 'Color: ', obj.Color])
            else
                axis([-2 obj.Base+1 -2 obj.Height+1]) 
                title([obj.Name]);
                xlabel(['Base: ', num2str(obj.Base), newline,'Height: ', num2str(obj.Height), newline,'Area: ', num2str(round(obj.Area,2)), newline, 'Color: ', obj.Color]);
            end            
            hold off;
        end
    end    
end