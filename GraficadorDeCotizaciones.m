% ******************************Inicializador del GUIDE (no modificar)
function varargout = GraficadorDeCotizaciones(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GraficadorDeCotizaciones_OpeningFcn, ...
                   'gui_OutputFcn',  @GraficadorDeCotizaciones_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% ********************Inicio del programa (Justo antes de crear el GUIDE)
function GraficadorDeCotizaciones_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
%-----------


% ******************************Inicio del programa
function varargout = GraficadorDeCotizaciones_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
%-----------
global empresas;
global sma5;
global sma10;
global sma20;
global macd;
global estocastico;
global indiceEmpresa;
clc;
set(handles.pushbutton1,'Enable','off');
set(handles.axes2,'Visible','off');
set(handles.axes3,'Visible','off');
sma5 = get(handles.radiobutton2,'Value');
sma10 = get(handles.radiobutton3,'Value');
sma20 = get(handles.radiobutton4,'Value');
macd = get(handles.radiobutton6,'Value');
estocastico = get(handles.radiobutton7,'Value');
indiceEmpresa= get(handles.popupmenu1,'Value');

empresas = definirEmpresas;
totalEmpresas = length(empresas);
for i=1:totalEmpresas
    empresas(i).cargarDatos;
    empresas(i).calcularIndicadores;
    if i==1
        nombres = empresas(i).nombreEmpresa;
    else
        nombres = [nombres,empresas(i).nombreEmpresa];
    end  
end
set(handles.popupmenu1,'String',nombres);
set(handles.pushbutton1,'Enable','on');


% ******************************Callback popupmenu1 = Selector de empresa
function popupmenu1_Callback(hObject, eventdata, handles)

global indiceEmpresa;
indiceEmpresa = get(handles.popupmenu1,'Value');

% ******************************CreateFcn popupmenu1 = Selector de empresa
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%-----------



% ******************************Callback radiobutton2 = SMA 5
function radiobutton2_Callback(hObject, eventdata, handles)
global sma5;
sma5 = get(handles.radiobutton2,'Value');


% ******************************Callback radiobutton3 = SMA 10
function radiobutton3_Callback(hObject, eventdata, handles)
global sma10;
sma10 = get(handles.radiobutton3,'Value');


% ******************************Callback radiobutton4 = SMA 20
function radiobutton4_Callback(hObject, eventdata, handles)
global sma20;
sma20 = get(handles.radiobutton4,'Value');



% ******************************Callback radiobutton6 = MACD
function radiobutton6_Callback(hObject, eventdata, handles)
global macd;
macd = get(handles.radiobutton6,'Value');


% ******************************Callback radiobutton7 = Estocastico
function radiobutton7_Callback(hObject, eventdata, handles)
global estocastico;
estocastico = get(handles.radiobutton7,'Value');


% ******************************Callback pushbutton1 = Graficar
function pushbutton1_Callback(hObject, eventdata, handles)
global empresas;
global indiceEmpresa;
global sma5;
global sma10;
global sma20;
global macd;
global estocastico;

totalGraficas = 1 + macd + estocastico;


axes(handles.axes1);
plot(empresas(indiceEmpresa).fecha,empresas(indiceEmpresa).cierre,'k')
title(empresas(indiceEmpresa).nombreEmpresa)
hold on
etiquetas = "Precio";
if sma5==1
    plot(empresas(indiceEmpresa).fecha(5:end),empresas(indiceEmpresa).sma5(5:end),'g')
    etiquetas = [etiquetas,"SMA 5"];
end
if sma10==1
    plot(empresas(indiceEmpresa).fecha(10:end),empresas(indiceEmpresa).sma10(10:end),'m')
    etiquetas = [etiquetas,"SMA 10"];
end
if sma20==1
    plot(empresas(indiceEmpresa).fecha(20:end),empresas(indiceEmpresa).sma20(20:end),'r')
    etiquetas = [etiquetas,"SMA 20"];
end
legend (etiquetas);
hold off

if macd==1
    axes(handles.axes2);
    plot(empresas(indiceEmpresa).fecha,empresas(indiceEmpresa).macdR,empresas(indiceEmpresa).fecha,empresas(indiceEmpresa).macdL)
    title("MACD (26,12,9)")
    legend ("MACD","Signal");
end
if estocastico==1
    if totalGraficas==3
        axes(handles.axes3);
    else
        axes(handles.axes2);
    end
    plot(empresas(indiceEmpresa).fecha,empresas(indiceEmpresa).estocasticoR,empresas(indiceEmpresa).fecha,empresas(indiceEmpresa).estocasticoL)
    title("Estocastico (14)")
    legend ("%K","%D");
end

if totalGraficas == 1
    set(handles.axes2,'Visible','off');
    set(handles.axes3,'Visible','off');
    cla(handles.axes2);
    cla(handles.axes3);
    legend(handles.axes2,'off');
    legend(handles.axes3,'off');
end
if totalGraficas == 2
    set(handles.axes3,'Visible','off');
    cla(handles.axes3);
    legend(handles.axes3,'off');
end
