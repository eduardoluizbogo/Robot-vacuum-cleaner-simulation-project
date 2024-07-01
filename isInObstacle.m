%Alunos: Eduardo Luiz Bogo e Gustavo Ferreira Nicoluzzi


% Funcao para checar se ponto pertence ao obstaculo circular
function isInside = isInObstacle(point, obstacles)
    isInside = false;
    %checar todos os obstaculos
    for i = 1:size(obstacles, 1)
        % Distancia do ponto ao obstaculo da forma [x_center, y_center, radius]
        distToCenter = norm(point - obstacles(i,[1,2]));
        %Se distancia menor que o raio
        if distToCenter < obstacles(i, 3)
            isInside = true;
            break;
        end
    end
end

