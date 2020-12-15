function [estocasticoR,estocasticoL] = calcularEstocastico(cierre,maximo,minimo) 
    estocasticoR = zeros(13,1);
    estocasticoL = zeros(13,1);
    for i=14:300
        try
            formula(i) = 100*((cierre(i)-min(minimo(i-13:i)))/(max(maximo(i-13:i))-min(minimo(i-13:i))));
            estocasticoR(i) = (2*estocasticoR(i-1) + formula(i)) / 3;
            estocasticoL(i) = (2*estocasticoL(i-1) + estocasticoR(i)) / 3;
        catch
        end
    end
end
