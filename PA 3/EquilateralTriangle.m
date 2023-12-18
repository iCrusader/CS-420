classdef EquilateralTriangle < Triangle & ColorMixin
    properties
        SideLength
    end
    
    methods
        %constructor 
        function obj = EquilateralTriangle(l,c)                  
            obj@Triangle(l, 1/2*(sqrt(3)*l), c);
            obj@ColorMixin (c)
            obj.Name = 'Equilateral Triangle';           
            obj.SideLength = l;           
        end

        %override display method
        function Display(obj)
            disp(['The area of a ',obj.Name,' with side length of ', num2str(obj.Base),' units is approximately ',num2str(round(obj.Area,2)),' square units.It is a ', obj.Color, ' color.']);               
        end

    end   
    
end