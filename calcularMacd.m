function [macdR,macdL] = calcularMacd(cierre) 
    ema26(1)=cierre(1);
    ema12(1)=cierre(1);
    macdR(1)=0;
    macdL(1)=0;
    for i=2:300
        try
                ema26(i) = (cierre(i) + ema26(i-1)*25) /26;
                ema12(i) = (cierre(i) + ema12(i-1)*11) /12;
                macdR(i) = ema12(i) - ema26(i);
                macdL(i) = (macdR(i) + macdL(i-1)*8) /9;
        catch
        end
    end
end

