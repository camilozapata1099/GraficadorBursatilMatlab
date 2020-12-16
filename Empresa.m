classdef Empresa <handle
    properties 
        nombreEmpresa="Nombre de la empresa";
        nombreArchivo="Nombre del archivo";
        cierre=zeros(300,1);
        minimo=zeros(300,1);
        maximo=zeros(300,1);
        apertura=zeros(300,1);
        fecha=zeros(300,1);
        macdR=zeros(300,1);
        macdL=zeros(300,1);
        estocasticoR=zeros(300,1);
        estocasticoL=zeros(300,1);
        sma5=zeros(300,1);
        sma10=zeros(300,1);
        sma20=zeros(300,1);  
    end
    
    methods
        
        function obj = Empresa(nombreEmpresa,nombreArchivo)
            if nargin ~= 0
                obj.nombreEmpresa = nombreEmpresa;
                obj.nombreArchivo = nombreArchivo;
            end
        end
        function cargarDatos(obj)
            obj.cierre= xlsread(obj.nombreArchivo,'E2:E301');
            obj.minimo= xlsread(obj.nombreArchivo,'D2:D301');
            obj.maximo= xlsread(obj.nombreArchivo,'C2:C301');
            obj.apertura= xlsread(obj.nombreArchivo,'B2:B301');
            [~,obj.fecha,~]= xlsread(obj.nombreArchivo,'A2:A301');
            obj.fecha = datetime(obj.fecha);
            
        end
        function calcularIndicadores(obj)
            obj.sma5=calcularSma5(obj.cierre);
            obj.sma10=calcularSma10(obj.cierre);
            obj.sma20=calcularSma20(obj.cierre);
            [obj.macdR, obj.macdL] =calcularMacd(obj.cierre);
            [obj.estocasticoR, obj.estocasticoL] =calcularEstocastico(obj.cierre, obj.maximo, obj.minimo);
        end
    end
    
end