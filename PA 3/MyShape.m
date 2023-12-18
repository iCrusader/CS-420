%research online
while true
    % Prompt user to choose a shape
    disp('Choose a shape to create:');
    disp('1. Rectangle');
    disp('2. Circle');
    disp('3. Triangle');
    disp('4. Square');
    disp('5. Quit');    
    userChoice = input('Enter the number of your choice: ');
    %exit when user choose 5
    if userChoice == 5    
        break;
    end

    % Input properties based on the selected shape
    switch userChoice
        case 1 % Rectangle
            lengthInput = input('Please enter the length of the rectangle: ');
            widthInput = input('Please enter the width of the rectangle: ');
            colorInput = input('Please enter the color of the rectangle: ', 's');
            shape = Rectangle(lengthInput, widthInput, colorInput);
        case 2 % Circle
            radiusInput = input('Please enter the radius of the circle: ');
            colorInput = input('Please enter the color of the circle: ', 's');
            shape = Circle(radiusInput, colorInput);        
        case 3 % Triangle with a twist that can ask for equilateral triangle
            choice = input(['Do you want to create an equilateral Triangle?',newline,'Press 1 for yes otherwise any number: ']);
            switch choice
                case 1
                    sideLengthInput = input('Please enter the side length of the equilateral triangle: ');
                    color = input('Please enter the color of the equilateral triangle: ', 's');
                    shape = EquilateralTriangle(sideLengthInput, color);
                otherwise
                     base = input('Please enter the base of the triangle: ');
                     height = input('Please enter the height of the triangle: ');
                     color = input('Please enter the color of the triangle: ', 's');
                     shape = Triangle(base, height, color);
                     shape.Draw();
                    continue;
            end 
        case 4 % Square
            sideLength = input('Please enter the side of the square: ');
            color = input('Please enter the color of the Square: ','s');
            shape = Square(sideLength,color);  

        otherwise
            disp('It is an invalid choice. Please enter a different number from 1 to 5:');
            continue;
    end 

    % Draw the shape
    shape.Draw();
end