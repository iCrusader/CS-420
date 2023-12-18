classdef ColorMixin
    %properties for color
    properties
        Color
    end
    
    methods
        %Constructor for Colomixin
        function obj = ColorMixin(color)
            if nargin > 0
                obj.Color = color;
            end
        end
        %Set Method
        function obj = SetColor(obj, color)
            obj.Color = color;
        end
        %Get Method
        function color = GetColor(obj)
            color = obj.Color;
        end
    end
end