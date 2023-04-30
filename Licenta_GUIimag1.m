function varargout = Licenta_GUIimag1(varargin)
% LICENTA_GUIIMAG1 MATLAB code for Licenta_GUIimag1.fig
%      LICENTA_GUIIMAG1, by itself, creates a new LICENTA_GUIIMAG1 or raises the existing
%      singleton*.
%
%      H = LICENTA_GUIIMAG1 returns the handle to a new LICENTA_GUIIMAG1 or the handle to
%      the existing singleton*.
%
%      LICENTA_GUIIMAG1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LICENTA_GUIIMAG1.M with the given input arguments.
%
%      LICENTA_GUIIMAG1('Property','Value',...) creates a new LICENTA_GUIIMAG1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Licenta_GUIimag1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Licenta_GUIimag1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Licenta_GUIimag1

% Last Modified by GUIDE v2.5 02-Jul-2022 23:01:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Licenta_GUIimag1_OpeningFcn, ...
                   'gui_OutputFcn',  @Licenta_GUIimag1_OutputFcn, ...
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


% --- Executes just before Licenta_GUIimag1 is made visible.
function Licenta_GUIimag1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Licenta_GUIimag1 (see VARARGIN)

% Choose default command line output for Licenta_GUIimag1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Licenta_GUIimag1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Licenta_GUIimag1_OutputFcn(hObject, eventdata, handles) 
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
evalin('base','clear all');
Licenta_GUI
closereq();


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [rawname, rawpath] = uigetfile({'*.jpg*;*.png*;*.jpeg*'},'Select Image Data');
 fullname = [rawpath rawname];
 
 im = imread(fullname);
 assignin('base','im',im);
 axes(handles.axes1);
 imagesc(im);
 axis off;
 handles.pushbutton4.Visible = 'on';

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im=evalin('base', 'im');
cypher=evalin('base', 'cypher');
im_canal=RC4_imag_function_crypt(im,cypher);
assignin('base','im_canal',im_canal);
 axes(handles.axes2);
 imagesc(im_canal);
 axis off;
 assignin('base','im_canal',im_canal);
 imwrite(im_canal,'C:\Users\Maftei Silviu\Desktop\OUTPUTMATLAB.png','PNG')
 
