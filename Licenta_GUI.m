function varargout = Licenta_GUI(varargin)
% LICENTA_GUI MATLAB code for Licenta_GUI.fig
%      LICENTA_GUI, by itself, creates a new LICENTA_GUI or raises the existing
%      singleton*.
%
%      H = LICENTA_GUI returns the handle to a new LICENTA_GUI or the handle to
%      the existing singleton*.
%
%      LICENTA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LICENTA_GUI.M with the given input arguments.
%
%      LICENTA_GUI('Property','Value',...) creates a new LICENTA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Licenta_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Licenta_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Licenta_GUI

% Last Modified by GUIDE v2.5 01-Jul-2022 12:21:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Licenta_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Licenta_GUI_OutputFcn, ...
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


% --- Executes just before Licenta_GUI is made visible.
function Licenta_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Licenta_GUI (see VARARGIN)

% Choose default command line output for Licenta_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Licenta_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Licenta_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alegere=2;
assignin('base','alegere',alegere);
fid2=fopen('C:\Users\Maftei Silviu\Desktop\fisier_licenta_out.txt');
cypher=fscanf(fid2, '%c');
fclose(fid2);
cypher=vpi(cypher);
cypher=dec2binVeryLong(cypher);
assignin('base','cypher',cypher);
Licenta_GUIvoce1
closereq();


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin('base','clear all');
closereq();


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alegere=6;
assignin('base','alegere',alegere);
fid2=fopen('C:\Users\Maftei Silviu\Desktop\fisier_licenta_out.txt');
cypher=fscanf(fid2, '%c');
fclose(fid2);
cypher=vpi(cypher);
cypher=dec2binVeryLong(cypher);
assignin('base','cypher',cypher);
Licenta_GUItext1
closereq();

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alegere=7;
assignin('base','alegere',alegere);
fid2=fopen('C:\Users\Maftei Silviu\Desktop\fisier_licenta_out.txt');
cypher=fscanf(fid2, '%c');
fclose(fid2);
cypher=vpi(cypher);
cypher=dec2binVeryLong(cypher);
assignin('base','cypher',cypher);
Licenta_GUIimag1
closereq();
