%Alunos: Eduardo Luiz Bogo e Gustavo Ferreira Nicoluzzi


function newPos = followObstacle_est(posAtual, obstaculos, tamanhoPasso)
    incrementoAngulo = 0;
    posTesteAntiga = posAtual;

    [receive, objProximo, posObjProximo] = obstacleNear(posAtual, obstaculos);
    vector = posObjProximo - posAtual;
    angulo = atan2(vector(2), vector(1));
    
    % Ajusta o ângulo para começar a busca em direção perpendicular ao obstáculo
    anguloPerpendicular = angulo - pi / 2;
    
    % Loop até completar uma volta completa (2*pi)
    while abs(incrementoAngulo) < 2 * pi
        anguloAjustado = anguloPerpendicular - incrementoAngulo;
        posTeste = posAtual + tamanhoPasso * [cos(anguloAjustado), sin(anguloAjustado)];
        
        % Se a posição testada estiver dentro do obstáculo, retorna a última posição segura
        if isInObstacle(posTeste, objProximo)
            newPos = posTesteAntiga;
            return;
        end
        
        % Atualiza para a nova posição testada e ajusta o ângulo
        posTesteAntiga = posTeste;
        incrementoAngulo = incrementoAngulo + 0.1; % Ajuste do ângulo para a próxima iteração
    end
    
    % Se completa a volta sem encontrar uma posição segura, retorna a posição original
    newPos = posAtual;
end
