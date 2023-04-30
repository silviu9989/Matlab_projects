function varargout = UWB_GUI3(varargin)
% UWB_GUI3 MATLAB code for UWB_GUI3.fig
%      UWB_GUI3, by itself, creates a new UWB_GUI3 or raises the existing
%      singleton*.
%
%      H = UWB_GUI3 returns the handle to a new UWB_GUI3 or the handle to
%      the existing singleton*.
%
%      UWB_GUI3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UWB_GUI3.M with the given input arguments.
%
%      UWB_GUI3('Property','Value',...) creates a new UWB_GUI3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UWB_GUI3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UWB_GUI3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UWB_GUI3

% Last Modified by GUIDE v2.5 18-Dec-2021 17:52:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UWB_GUI3_OpeningFcn, ...
                   'gui_OutputFcn',  @UWB_GUI3_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before UWB_GUI3 is made visible.
function UWB_GUI3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UWB_GUI3 (see VARARGIN)

% Choose default command line output for UWB_GUI3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
alegere=evalin('base', 'alegere');
if alegere == 5
 set(handles.text6,'String','Ati ales varianta cu compresia ultimilor 4 biti');
elseif alegere == 6
set(handles.text6,'String','Ati ales varianta cu compresia ultimilor 3 biti');
end

% UIWAIT makes UWB_GUI3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UWB_GUI3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
valoare2=get(hObject,'Value');
 set(handles.text4,'String',num2str(valoare2));
 assignin('base','medie',valoare2);
  medie = evalin('base', 'medie');
varianta=evalin('base', 'varianta');
axes(handles.axes1);
plot(medie+varianta*randn(1,1000));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
valoare3=get(hObject,'Value');
 set(handles.text5,'String',num2str(valoare3));
 assignin('base','varianta',valoare3);
 medie = evalin('base', 'medie');
varianta=evalin('base', 'varianta');
axes(handles.axes1);
plot(medie+varianta*randn(1,1000));


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.text8.Visible = 'on';
pause(2);
alegere=evalin('base', 'alegere');
medie=evalin('base', 'medie');
varianta=evalin('base', 'varianta');
im=evalin('base', 'im');

if alegere == 5
    J=proiect_functie_UWBv5(im,medie,varianta);
    assignin('base','im_rec',J);
elseif alegere == 6
    J=proiect_functie_UWBv6(im,medie,varianta);
    assignin('base','im_rec',J);
end
UWB_GUI2
closereq();

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin('base','clear all');
closereq();
UWB_GUI

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin('base','clear all');
closereq(); 


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
medie = evalin('base', 'medie');
varianta=evalin('base', 'varianta');
axes(handles.axes1);
plot(medie+varianta*randn(1,1000));
