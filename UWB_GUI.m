function varargout = UWB_GUI(varargin)
% UWB_GUI MATLAB code for UWB_GUI.fig
%      UWB_GUI, by itself, creates a new UWB_GUI or raises the existing
%      singleton*.
%
%      H = UWB_GUI returns the handle to a new UWB_GUI or the handle to
%      the existing singleton*.
%
%      UWB_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UWB_GUI.M with the given input arguments.
%
%      UWB_GUI('Property','Value',...) creates a new UWB_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UWB_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UWB_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UWB_GUI

% Last Modified by GUIDE v2.5 18-Dec-2021 09:48:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UWB_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @UWB_GUI_OutputFcn, ...
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

% --- Executes just before UWB_GUI is made visible.
function UWB_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UWB_GUI (see VARARGIN)

% Choose default command line output for UWB_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UWB_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UWB_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
 [rawname, rawpath] = uigetfile({'*.jpg*;*.png*;*.jpeg*'},'Select Image Data');
 fullname = [rawpath rawname];
 
 im = imread(fullname);
 assignin('base','im',im);
 axes(handles.axes1);
 imagesc(im);
 axis off;
 title('Imagine Initiala');
 axes(handles.axes2);
 imagesc(im/16*16);
 axis off;
 title('Imagine cu ultimii 3 biti comprimati');
 axes(handles.axes3);
 imagesc(im/32*32);
 axis off;
 title('Imagine cu ultimii 4 biti comprimati');
handles.pushbutton4.Visible = 'on';
handles.pushbutton5.Visible = 'on';


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alegere=6;
assignin('base','alegere',alegere);
medie=0;
assignin('base','medie',medie);
varianta=0;
assignin('base','varianta',varianta);
pause(1)
UWB_GUI3
closereq();

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alegere=5;
assignin('base','alegere',alegere);
medie=0;
assignin('base','medie',medie);
varianta=0;
assignin('base','varianta',varianta);
pause(1)
UWB_GUI3
closereq();

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin('base','clear all');
closereq(); 
