empresas = definirEmpresas;

empresas(1).cargarDatos;
empresas(1).nombreEmpresa
empresas(1).cierre(200)
empresas(1).fecha(200)

empresas(1).cargarDatos;
empresas(1).calcularIndicadores;

empresas(1).sma5(200)


plot(empresas(1).fecha,empresas(1).cierre,empresas(1).fecha,empresas(1).sma5,empresas(1).fecha,empresas(1).sma10,empresas(1).fecha,empresas(1).sma20)

figure(2)
plot(empresas(1).fecha,empresas(1).macdR,empresas(1).fecha,empresas(1).macdL)
figure(3)
plot(empresas(1).fecha,empresas(1).estocasticoR,empresas(1).fecha,empresas(1).estocasticoL)

