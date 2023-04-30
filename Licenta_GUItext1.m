function varargout = Licenta_GUItext1(varargin)
% LICENTA_GUITEXT1 MATLAB code for Licenta_GUItext1.fig
%      LICENTA_GUITEXT1, by itself, creates a new LICENTA_GUITEXT1 or raises the existing
%      singleton*.
%
%      H = LICENTA_GUITEXT1 returns the handle to a new LICENTA_GUITEXT1 or the handle to
%      the existing singleton*.
%
%      LICENTA_GUITEXT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LICENTA_GUITEXT1.M with the given input arguments.
%
%      LICENTA_GUITEXT1('Property','Value',...) creates a new LICENTA_GUITEXT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Licenta_GUItext1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Licenta_GUItext1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Licenta_GUItext1

% Last Modified by GUIDE v2.5 02-Jul-2022 23:28:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Licenta_GUItext1_OpeningFcn, ...
                   'gui_OutputFcn',  @Licenta_GUItext1_OutputFcn, ...
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


% --- Executes just before Licenta_GUItext1 is made visible.
function Licenta_GUItext1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Licenta_GUItext1 (see VARARGIN)

% Choose default command line output for Licenta_GUItext1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Licenta_GUItext1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Licenta_GUItext1_OutputFcn(hObject, eventdata, handles) 
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
 [rawname, rawpath] = uigetfile({'*.txt*;'},'Select Text Data');
 fullname = [rawpath rawname];
 
 fid2=fopen(fullname);
 sentence=fscanf(fid2, '%c');
 assignin('base','sentence',sentence);
 
lorem=sentence;
letters=unique(lorem);
letter_counts=histcounts(double(lorem),max(letters)-min(letters)+1);
letter_counts(letter_counts==0)=[];
axes(handles.axes2);
ylabel('Numãrul de aparitii');
title('Histograma textului clar');
bar(1:numel(letters),letter_counts)
set(gca,'XTick',0:numel(letters)-1)
set(gca,'XTickLabels',num2cell(letters))
title('Histograma textului clar');
 handles.text4.Visible = 'on';
 handles.pushbutton4.Visible = 'on';
 

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sentence=evalin('base', 'sentence');
cypher=evalin('base', 'cypher');
crypted_sentence=RC4_sentence_function_crypt(sentence,cypher);
assignin('base','crypted_sentence',crypted_sentence);
 
 lorem=crypted_sentence;
letters=unique(lorem);
letter_counts=histcounts(double(lorem),max(letters)-min(letters)+1);
letter_counts(letter_counts==0)=[];
axes(handles.axes3);
bar(1:numel(letters),letter_counts)
set(gca,'XTick',0:numel(letters)-1)
set(gca,'XTickLabels',num2cell(letters))
title('Histograma textului criptat, de 50000 de caractere');
ylabel('Numãrul de aparitii');
fid = fopen('C:\Users\Maftei Silviu\Desktop\MATLABsource.txt','w+');
fprintf(fid,'%c', sentence);
fclose(fid);
fid2 = fopen('C:\Users\Maftei Silviu\Desktop\MATLABchannel.txt','w+');
fprintf(fid2,'%c', crypted_sentence);
fclose(fid2);
handles.text5.Visible = 'on';
