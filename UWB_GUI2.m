function varargout = UWB_GUI2(varargin)
% UWB_GUI2 MATLAB code for UWB_GUI2.fig
%      UWB_GUI2, by itself, creates a new UWB_GUI2 or raises the existing
%      singleton*.
%
%      H = UWB_GUI2 returns the handle to a new UWB_GUI2 or the handle to
%      the existing singleton*.
%
%      UWB_GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UWB_GUI2.M with the given input arguments.
%
%      UWB_GUI2('Property','Value',...) creates a new UWB_GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UWB_GUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UWB_GUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UWB_GUI2

% Last Modified by GUIDE v2.5 19-Dec-2021 11:13:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UWB_GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @UWB_GUI2_OutputFcn, ...
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


% --- Executes just before UWB_GUI2 is made visible.
function UWB_GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UWB_GUI2 (see VARARGIN)

% Choose default command line output for UWB_GUI2
handles.output = hObject;
im_rec = evalin('base', 'im_rec');
im = evalin('base', 'im');
axes(handles.axes1);
 imagesc(im_rec);
 axis off;
 title('Imagine Finala');
 axes(handles.axes4);
 imagesc(im);
 axis off;
 title('Imagine Initiala');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UWB_GUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UWB_GUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin('base','clear all');
closereq(); 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%spectru(nezgomotos)
handles.axes.Visible = 'on';
handles.uipanel2.Visible = 'off';
handles.uipanel1.Visible = 'off';
Pnezgomot=evalin('base', 'Pnezgomot');
faux=evalin('base', 'faux');
axes(handles.axes5);
plot(faux(1:end/2),Pnezgomot(1:end/2));
title('Spectrul semnalului nezgomotos');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%formeledeunda

alegere=evalin('base', 'alegere');
if alegere == 5
handles.axes.Visible = 'off';
handles.uipanel2.Visible = 'off';
handles.uipanel1.Visible = 'on';
fc = 2E9;  fs=100E9;
tc = gmonopuls('cutoff', fc);
t  = -2*tc : 1/fs : 2*tc;
y = gmonopuls(t,fc);
zaux = -y;
aux1 = [zaux zaux zaux zaux];
aux2 = aux1(1:4:end);
z1=zeros(1,64);
z3=zeros(1,64);
z5=zeros(1,64);
z7=zeros(1,64);
z1(1:16) = aux2(1:16);
z3(17:32) = aux2(1:16); %forma de unda asociata valorii 3
z5(33:48) = aux2(1:16); %forma de unda asociata valorii 5
z7(49:64) = aux2(1:16); %forma de unda asociata valorii 7
axes(handles.axes6);
plot(z1);
axes(handles.axes8);
plot(z3);
axes(handles.axes9);
plot(z5);
axes(handles.axes10);
plot(z7);

end
if alegere == 6
    
handles.axes.Visible = 'off';
handles.uipanel2.Visible = 'on';
handles.uipanel1.Visible = 'off';
fc = 2E9;  fs=100E9;
tc = gmonopuls('cutoff', fc);
t  = -2*tc : 1/fs : 2*tc;
y = gmonopuls(t,fc);
zaux = -y;
aux1 = [zaux zaux zaux zaux zaux zaux zaux zaux];
aux2 = aux1(1:8:end);
z1=zeros(1,64);
z3=zeros(1,64);
z5=zeros(1,64);
z7=zeros(1,64);
z9=zeros(1,64);
z11=zeros(1,64);
z13=zeros(1,64);
z15=zeros(1,64);
z1(1:8) = aux2(1:8);
z3(9:16) = aux2(1:8); %forma de unda asociata valorii 3
z5(17:24) = aux2(1:8); %forma de unda asociata valorii 5
z7(25:32) = aux2(1:8); %forma de unda asociata valorii 7
z9(33:40) = aux2(1:8); %forma de unda asociata valorii 9
z11(41:48) = aux2(1:8); %forma de unda asociata valorii 11
z13(49:56) = aux2(1:8); %forma de unda asociata valorii 13
z15(57:64) = aux2(1:8); %forma de unda asociata valorii 15
axes(handles.axes11);
plot(z1);
 title('Forma de unda z1');
axes(handles.axes12);
plot(z3);
title('Forma de unda z3');
axes(handles.axes13);
plot(z5);
title('Forma de unda z5');
axes(handles.axes14);
plot(z7);
title('Forma de unda z7');
axes(handles.axes15);
plot(z9);
title('Forma de unda z9');
axes(handles.axes16);
plot(z11);
title('Forma de unda z11');
axes(handles.axes17);
plot(z13);
title('Forma de unda z13');
axes(handles.axes18);
plot(z15);
title('Forma de unda z15');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%zgomotos
handles.axes.Visible = 'on';
handles.uipanel2.Visible = 'off';
handles.uipanel1.Visible = 'off';

snip_real=evalin('base', 'snip_real');
axes(handles.axes5);
plot(snip_real);
 title('Snip real');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ideal
handles.axes.Visible = 'on';
handles.uipanel2.Visible = 'off';
handles.uipanel1.Visible = 'off';

snip_ideal=evalin('base', 'snip_ideal');
axes(handles.axes5);
plot(snip_ideal);
 title('Snip ideal');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin('base','clear all');
closereq();
UWB_GUI


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.axes.Visible = 'on';
handles.uipanel2.Visible = 'off';
handles.uipanel1.Visible = 'off';
Pzgomot=evalin('base', 'Pzgomot');
faux=evalin('base', 'faux');
axes(handles.axes5);
plot(faux(1:end/2),Pzgomot(1:end/2));
title('Spectrul semnalului zgomotos');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pan off;
zoom on;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom off;
pan on;


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom off;
pan off;
