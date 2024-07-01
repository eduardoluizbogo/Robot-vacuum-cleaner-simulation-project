%Alunos: Eduardo Luiz Bogo e Gustavo Ferreira Nicoluzzi


function pontos = CreateReference(startPos, goalPos, stepSize2)

    stepSize = stepSize2*0.05;
    d = (goalPos - startPos)/(norm(goalPos - startPos)); %Normaliza o vetor
    tamanhoLinha = norm(goalPos - startPos);

    numPontos = floor(tamanhoLinha / stepSize);
    
    pontos = zeros(numPontos + 1, 2);
    
    for i = 1:numPontos + 1
        pontos(i, :) = startPos + (i - 1) * d * stepSize;
    end
end
