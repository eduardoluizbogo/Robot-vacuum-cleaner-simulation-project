%Alunos: Eduardo Luiz Bogo e Gustavo Ferreira Nicoluzzi


function pontosExternos = outsidePoints(linhaX, linhaY, obstaculos)
    % Extrai informações do primeiro obstáculo
    centroObstaculoX = obstaculos(1, 1);
    centroObstaculoY = obstaculos(1, 2);
    raioObstaculo = obstaculos(1, 3);
    
    % Calcula distâncias de cada ponto da linha até o centro do obstáculo
    distancias = sqrt((linhaX - centroObstaculoX).^2 + (linhaY - centroObstaculoY).^2);
    
    % Identifica os pontos que estão fora do raio do obstáculo
    foraDoRaio = distancias > raioObstaculo;
    pontosXFora = linhaX(foraDoRaio);
    pontosYFora = linhaY(foraDoRaio);

    % Calcula distâncias dos pontos fora do obstáculo até o centro
    distanciasExternas = sqrt((pontosXFora - centroObstaculoX).^2 + (pontosYFora - centroObstaculoY).^2);

    % Ordena os pontos externos pela proximidade ao obstáculo e seleciona os dois mais próximos
    [~, indicesOrdenados] = sort(distanciasExternas);
    indicesProximos = indicesOrdenados(1:2);
    
    % Prepara a saída com os pontos mais próximos externos ao obstáculo
    pontosExternos = [pontosXFora(indicesProximos); pontosYFora(indicesProximos)];
end
