function sma20 = calcularSma20(cierre) 
    for i=20:300
        try
        sumatoria=0;
        for j=1:20
            sumatoria = sumatoria + cierre(i+1-j);
        end
        sma20(i) = sumatoria /20;   
        catch
        end
    end
end

