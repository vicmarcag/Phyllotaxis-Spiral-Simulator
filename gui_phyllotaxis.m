function varargout = gui_phyllotaxis(varargin)
% GUI_PHYLLOTAXIS MATLAB code for gui_phyllotaxis.fig
%      GUI_PHYLLOTAXIS, by itself, creates a new GUI_PHYLLOTAXIS or raises the existing
%      singleton*.
%
%      H = GUI_PHYLLOTAXIS returns the handle to a new GUI_PHYLLOTAXIS or the handle to
%      the existing singleton*.
%
%      GUI_PHYLLOTAXIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PHYLLOTAXIS.M with the given input arguments.
%
%      GUI_PHYLLOTAXIS('Property','Value',...) creates a new GUI_PHYLLOTAXIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_phyllotaxis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_phyllotaxis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_phyllotaxis

% Last Modified by GUIDE v2.5 09-Oct-2019 22:28:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_phyllotaxis_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_phyllotaxis_OutputFcn, ...
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


% --- Executes just before gui_phyllotaxis is made visible.
function gui_phyllotaxis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_phyllotaxis (see VARARGIN)

% Choose default command line output for gui_phyllotaxis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_phyllotaxis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_phyllotaxis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_plot.
function button_plot_Callback(hObject, eventdata, handles)
% hObject    handle to button_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get parameters values
angle = str2double(get(handles.edit_angle, 'String'));
c = str2double(get(handles.edit_c, 'String'));
s1 = str2double(get(handles.edit_s1, 'String'));
s2 = str2double(get(handles.edit_s2, 'String'));

% Error detection
if isnan(angle)
    warning('Incorrect angle');
    golden_ratio = (1 + sqrt(5))/ 2; 
    angle = (360/golden_ratio^2);
    set(handles.edit_angle, 'String', num2str(angle));
end
if isnan(c)
    warning('Incorrect scaling factor');
    c = 2;
    set(handles.edit_angle, 'String', num2str(c));
end
if isnan(s1)
    warning('Incorrect initial size');
    s1 = 10;
    set(handles.edit_angle, 'String', num2str(s1));
end
if isnan(s2)
    warning('Incorrect initial size');
    s2 = 50;
    set(handles.edit_angle, 'String', num2str(s2));
end

% Is the animation required?
if handles.button_animation.Value == 1
    % Animation
    phyllotaxis_loop(angle, c, [s1 s2], handles.plot_fig);
else
    % No animation
    phyllotaxis(angle, c, [s1 s2], handles.plot_fig);
end


function edit_angle_Callback(hObject, eventdata, handles)
% hObject    handle to edit_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_angle as text
%        str2double(get(hObject,'String')) returns contents of edit_angle as a double


% --- Executes during object creation, after setting all properties.
function edit_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_c_Callback(hObject, eventdata, handles)
% hObject    handle to edit_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_c as text
%        str2double(get(hObject,'String')) returns contents of edit_c as a double


% --- Executes during object creation, after setting all properties.
function edit_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_s1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_s1 as text
%        str2double(get(hObject,'String')) returns contents of edit_s1 as a double


% --- Executes during object creation, after setting all properties.
function edit_s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_s2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_s2 as text
%        str2double(get(hObject,'String')) returns contents of edit_s2 as a double


% --- Executes during object creation, after setting all properties.
function edit_s2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_animation.
function button_animation_Callback(hObject, eventdata, handles)
% hObject    handle to button_animation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of button_animation
