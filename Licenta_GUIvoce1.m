function varargout = Licenta_GUIvoce1(varargin)
% LICENTA_GUIVOCE1 MATLAB code for Licenta_GUIvoce1.fig
%      LICENTA_GUIVOCE1, by itself, creates a new LICENTA_GUIVOCE1 or raises the existing
%      singleton*.
%
%      H = LICENTA_GUIVOCE1 returns the handle to a new LICENTA_GUIVOCE1 or the handle to
%      the existing singleton*.
%
%      LICENTA_GUIVOCE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LICENTA_GUIVOCE1.M with the given input arguments.
%
%      LICENTA_GUIVOCE1('Property','Value',...) creates a new LICENTA_GUIVOCE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Licenta_GUIvoce1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Licenta_GUIvoce1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Licenta_GUIvoce1

% Last Modified by GUIDE v2.5 03-Jul-2022 09:02:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Licenta_GUIvoce1_OpeningFcn, ...
                   'gui_OutputFcn',  @Licenta_GUIvoce1_OutputFcn, ...
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


% --- Executes just before Licenta_GUIvoce1 is made visible.
function Licenta_GUIvoce1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Licenta_GUIvoce1 (see VARARGIN)

% Choose default command line output for Licenta_GUIvoce1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Licenta_GUIvoce1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Licenta_GUIvoce1_OutputFcn(hObject, eventdata, handles) 
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
 [rawname, rawpath] = uigetfile({'*.mat*;'},'Select Voice Data');
 fullname = [rawpath rawname];
 steag=0;
 load(fullname, 'voce','voce_criptata');
 if exist('voce')
     assignin('base','voce',voce);
     steag=1;
 else if exist('voce_criptata')
     assignin('base','voce_criptata',voce_criptata); 
     steag=2;
     end
 end
 assignin('base','steag',steag); 
axes(handles.axes1);
if steag==1 plot(voce);
else if steag==2 plot(voce_criptata);
    end
end
 handles.text4.Visible = 'on';
 handles.pushbutton4.Visible = 'on';
 handles.pushbutton5.Visible = 'on';


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
voce=evalin('base','voce');
cypher=evalin('base','cypher');
voce_criptata=RC4_voice_function_crypt(voce,cypher);
assignin('base','voce_criptata',voce_criptata);
steag=evalin('base','steag');
 axes(handles.axes2);
 if steag==1 plot(voce_criptata);
 elseif steag==2 plot(voce);
 end
handles.text5.Visible = 'on';
handles.pushbutton6.Visible = 'on';


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
steag=evalin('base','steag');
if steag==1
voce=evalin('base','voce');
sound(voce,44100);
elseif steag==2
voce_criptata=evalin('base','voce_criptata');
sound(voce_criptata,44100);
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
steag=evalin('base','steag');
if steag==2
voce=evalin('base','voce');
sound(voce,44100);
elseif steag==1
voce_criptata=evalin('base','voce_criptata');
sound(voce_criptata,44100);
end