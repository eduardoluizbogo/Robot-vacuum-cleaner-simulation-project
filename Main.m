close all, clc, clear all;

%Variables
startPos = [5, 5];
goalPosx = 0;
goalPosy = 10;
goalPos = [1, 10];
quadx = [0 10 10 0 0];
quady = [0 0 10 10 0];
currentPos = startPos;
path = [currentPos];
stepSize = 0.3;
Ang3 = 180;
followObstacle = 0;

%Selection mode menu
%obstacles = [3 4 1; 2 6 0.5; 8 7 1; 5 2 0.8; 7 3 1.2; 1 8 0.6];
obstacles = [3 4 1;2 6 0.5;8 7 1];

%Operating Mode
% 1 - Quadratic
% 2 - Random
operationMode = 1;

% Main --------------------------------------------------------------------

figure;
plot(startPos(1), startPos(2), 'go', 'MarkerFaceColor', 'g');
axis equal;
grid on;
xlabel('Axis X');
ylabel('Axis Y');
title('Bug - Trajectory Planning');

% Obstacles plot
for i = 1:size(obstacles, 1)
    viscircles(obstacles(i, 1:2), obstacles(i, 3), 'Color', 'k');
end

% Operation mode 1
if(operationMode == 1)
for i = 0 : Ang3/720 : Ang3 
    goalPos = [goalPosx, goalPosy];

    % Walks in a straight line
    d = (goalPos - currentPos)/(norm(goalPos - currentPos)); % Normalizes the vector
    nextPos = currentPos+d*stepSize; % Obtains the next position
    
    if followObstacle == 1
        nextPos = followObstacle_est(currentPos, obstacles, stepSize);
            if norm(initialGoalPosition - nextPos) < stepSize
            followObstacle = 0;
            end
    end

    if isInObstacle(nextPos, obstacles) && followObstacle == 0% If an obstacle is found
        initialGoalPosition = newPosReferenceLine(currentPos, obstacles, ReferenceLine);
        followObstacle = 1;
        nextPos = currentPos;
    end
   
    currentPos = nextPos;
    path = [path; currentPos];
    
    if currentPos(2) >= 10
        currentPos(1) = currentPos(1) + 0.5;
        startPos(1) = currentPos(1);
        startPos(2) = currentPos(2);
       goalPosy = 0;
       goalPosx = goalPosx + 0.5;
    end
    if currentPos(2) <= 0
        currentPos(1) = currentPos(1) + 0.5;
        startPos(1) = currentPos(1);
        startPos(2) = currentPos(2);
       goalPosy = 10;
       goalPosx = goalPosx + 0.5;
    end
    goalPos = [goalPosx, goalPosy];
    
    ReferenceLine = CreateReference(startPos, goalPos, stepSize);
    
    hold on
    plot(path(:,1), path(:,2), 'b.-');
    plot(quadx, quady, 'g-', 'LineWidth', 2);
    plot(ReferenceLine(:, 1), ReferenceLine(:, 2), "--r")
    axis equal;  
    xlabel('Axis X');
    ylabel('Axis Y');
    title('Quadratic operation mode');

pause(0.0000001)  
end
end

% Operation mode 2
theta_graus = 45;
if(operationMode == 2)
for i = 0 : Ang3/720 : Ang3 

    nextPos(1) = currentPos(1) + stepSize * cosd(theta_graus);
    nextPos(2) = currentPos(2) + stepSize * sind(theta_graus);
    
    if(nextPos(1) > 10 || nextPos(1) < 0 || nextPos(2) > 10 || nextPos(2) < 0)
      theta_graus = randi([0,360]); 
      nextPos(1) = currentPos(1);
      nextPos(2) = currentPos(2);
    end

    if isInObstacle(nextPos, obstacles)
      theta_graus = theta_graus + 8; 
      nextPos(1) = currentPos(1);
      nextPos(2) = currentPos(2);
    end
    
    currentPos = nextPos;
    path = [path; currentPos];

    hold on
    plot(path(:,1), path(:,2), 'b.-');
    plot(quadx, quady, 'g-', 'LineWidth', 2);
    axis equal;  
    xlabel('Axis X');
    ylabel('Axis Y');
    title('Random operation mode');

pause(0.0000001)
end
end

hold off;