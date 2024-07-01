%Alunos: Eduardo Luiz Bogo e Gustavo Ferreira Nicoluzzi


function newGoal = newPosReferenceLine(currentPos, obstacles, startGoalLine)

    [receive, obstaculoProximo] = obstacleNear(currentPos, obstacles);
    maisPerto = outsidePoints(startGoalLine(:, 1), startGoalLine(:, 2), obstaculoProximo);
    distancia1 = pdist2(currentPos, [maisPerto(2) maisPerto(4)]);
    distancia2 = pdist2(currentPos, [maisPerto(1) maisPerto(3)]);

    if distancia2 > distancia1
        newGoal = [maisPerto(1) maisPerto(3)];
    elseif distancia1 > distancia2
        newGoal = [maisPerto(2) maisPerto(4)];
    end

end