function sma10 = calcularSma10(cierre) 
    for i=10:300
        try
        sumatoria=0;
        for j=1:10
            sumatoria = sumatoria + cierre(i+1-j);
        end
        sma10(i) = sumatoria /10;  
        catch
        end
    end
end

