function sma5 = calcularSma5(cierre) 
    for i=5:300
        try
        sumatoria=0;
        for j=1:5
            sumatoria = sumatoria + cierre(i+1-j);
        end
        sma5(i) = sumatoria /5;   
        catch
            
        end
    end
end

