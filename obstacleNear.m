%Alunos: Eduardo Luiz Bogo e Gustavo Ferreira Nicoluzzi


function [distanciaMin, obstaculoMaisProximo, pontoMaisProximo] = obstacleNear(posicao, listaObstaculos)
    posicoesObstaculos = listaObstaculos(:, 1:2);
    raiosObstaculos = listaObstaculos(:, 3);
    
    % Calcula distâncias ajustadas entre a posição e o centro dos obstáculos
    distanciasAjustadas = sqrt(sum((posicoesObstaculos - posicao).^2, 2)) - raiosObstaculos;
    [distanciaMin, indice] = min(distanciasAjustadas);
    obstaculoMaisProximo = listaObstaculos(indice, :);

    % Determina o ponto mais próximo com base na distância mínima encontrada
    if distanciaMin <= 0
        pontoMaisProximo = posicao;
    else
        centroObstaculo = obstaculoMaisProximo(1:2);
        raioObstaculo = obstaculoMaisProximo(3);
        vetorDirecao = (posicao - centroObstaculo) / norm(posicao - centroObstaculo);
        pontoMaisProximo = centroObstaculo + raioObstaculo * vetorDirecao;
    end
end
