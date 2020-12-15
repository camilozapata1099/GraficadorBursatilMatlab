# graficador-bursatil-matlab
Graficador de cotizaciones bursátiles que calcula los indicadores técnicos SMA, MACD y estocástico

Para usar el programa se deben descargar todos los archivos y ejecutar el script “GraficadorDeCotizaciones.m” desde Matlab.

Este programa carga los datos históricos de 10 empresas que cotizan en la bolsa de valores de México y permite visualizar las graficas de los precios, así como indicadores MACD, estocástico y medias móviles simples (SMA) de 5, 10 y 20 periodos.

Para agregar más empresas únicamente basta con agregar el archivo de Excel con sus datos históricos y modificar el script “definirEmpresas.m” creando un nuevo elemento en el arreglo “empresas” usando el constructor de la clase “empresas” y enviando como parámetros el nombre de la empresa y el nombre del archivo de Excel.

Nota: en caso de agregar nuevos archivos de Excel deberán tener como máximo 300 cotizaciones que es el tamaño máximo usado para los arreglos de los datos. 
