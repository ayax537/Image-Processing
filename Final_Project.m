function varargout = Final_Project(varargin)
% FINAL_PROJECT MATLAB code for Final_Project.fig
%      FINAL_PROJECT, by itself, creates a new FINAL_PROJECT or raises the existing
%      singleton*.
%
%      H = FINAL_PROJECT returns the handle to a new FINAL_PROJECT or the handle to
%      the existing singleton*.
%
%      FINAL_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_PROJECT.M with the given input arguments.
%
%      FINAL_PROJECT('Property','Value',...) creates a new FINAL_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Final_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Final_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Final_Project

% Last Modified by GUIDE v2.5 27-Dec-2023 21:27:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Final_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Final_Project_OutputFcn, ...
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


% --- Executes just before Final_Project is made visible.
function Final_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Final_Project (see VARARGIN)

% Choose default command line output for Final_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Final_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);
function[mask,mask_size]=Guassian_function_2D(sigma) 
% the smallest value = 0.5 any value less than 0.5 represent pixel opreation 1x1 
%sigma=0.5;
N = floor(3.7*sigma-0.5);
mask_size = 2*N+1;
t = floor(mask_size/2);
x=(-t:t);
mask=zeros(mask_size,mask_size);
coef=(1/(2*pi*(sigma^2)));
for i=1:mask_size
    for j=1:mask_size
        mask(i,j)=coef*exp(-((x(i)^2)+(x(j)^2))/(2*(sigma^2)));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Outputs from this function are returned to the command line.
function varargout = Final_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
imshow('C:/Users/HP/Desktop/WhatsApp Image 2023-12-17 at 22.56.54_c47b19c4.jpg')
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.jpg*', 'Pick an Image');
 name=strcat(pathname,filename);
 global a;
  a=imread(name);
axes(handles.axes2);
imshow(a);
setappdata(0,'a',a)
            imshow(a)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.jpg*', 'Pick an Image');
 name=strcat(pathname,filename);
 global img2_read;
img2_read=imread(name);
axes(handles.axes3);
imshow(img2_read);
setappdata(0,'img2_read',img2_read)
            imshow(img2_read)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
x=str2double(get(handles.edit1,'string'));
z=str2double(get(handles.edit5,'string'));
y=imresize(a,[x z]);
axes(handles.axes3);
imshow(y);
setappdata(0,'y',y)
            imshow(y)
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
y=Gray_im(a);
axes(handles.axes3);
imshow(y);
setappdata(0,'y',y)
            imshow(y)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[r,c]=size(a);
h=zeros(1,256);
for i=1:r
    for j=1:c
        h(a(i,j)+1)= h(a(i,j)+1) + 1;
    end
end
x=0:255;
axes(handles.axes3);
stem(x,h),title('Histo')
       


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
New_Max=str2double(get(handles.max,'string'));
New_Min=str2double(get(handles.min,'string'));
%--------------------------------------------------------------------------
[r,c,ch]=size(a);
New_Value=zeros(r,c,ch);
Old_Max=a(1,1,1);
Old_Min=a(1,1,1);
for k=1:ch
    for i=1:r
        for j=1:c
            if(a(i,j,k)>=Old_Max) 
                Old_Max=a(i,j,k);
            end
            if(a(i,j,k)<=Old_Min) 
                Old_Min=a(i,j,k);
            end
        end
    end
end

for k=1:ch
    for i=1:r
        for j=1:c
            v = ((((a(i,j,k) - Old_Min)/(Old_Max - Old_Min)) * (New_Max - New_Min)) + New_Min);
            if v < 0
                New_Value(i,j,k) = 0;
                
            elseif v > 255
                New_Value(i,j,k) = 255; 
            else
                New_Value(i,j,k)=v;
            end
        end
    end
end

New_Value = uint8(New_Value);
axes(handles.axes3);
imshow(New_Value);
setappdata(0,'New_Value',New_Value)
            imshow(New_Value)



function max_Callback(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max as text
%        str2double(get(hObject,'String')) returns contents of max as a double


% --- Executes during object creation, after setting all properties.
function max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_Callback(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min as text
%        str2double(get(hObject,'String')) returns contents of min as a double


% --- Executes during object creation, after setting all properties.
function min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
f% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
    global a;

    % Read offset from the GUI
    offset = str2double(get(handles.offset, 'string'));

    % Call the Brightness function
    new_image = Brightness(a, offset);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);

    % Save the result to appdata for potential future use
    setappdata(0, 'new_image', new_image);


function new_im = Brightness(im, offset)
    [rows, cols, channels] = size(im);
    
    % Display the original image
    %figure, imshow(im), title('Original');

    % Apply brightness adjustment to each pixel
    for k = 1:channels
        for i = 1:rows
            for j = 1:cols
                pixel_value = im(i, j, k) + offset;
                
                % Ensure pixel values are in the valid range [0, 255]
                if pixel_value > 255
                    pixel_value = 255;
                elseif pixel_value < 0
                    pixel_value = 0;
                end
                
                im(i, j, k) = pixel_value;
            end
        end
    end
    
    % Return the modified image
    new_im = im;




function offset_Callback(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of offset as text
%        str2double(get(hObject,'String')) returns contents of offset as a double


% --- Executes during object creation, after setting all properties.
function offset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.

function pushbutton9_Callback(hObject, eventdata, handles)
    global a;

    % Read gamma from the GUI
    gamma = str2double(get(handles.gamma, 'string'));

    % Call the power_low function
    new_image = power_low(a, gamma);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);

    % Save the result to appdata for potential future use
    setappdata(0, 'new_image', new_image);


function new_im = power_low(im, gamma)
    % Convert the image to double for mathematical operations
    image_double = im2double(im);
    
    % Apply power-law transformation
    new_im = image_double .^ gamma;
    
    % Convert back to uint8 for displaying
    new_im = uint8(new_im * 255);




function gamma_Callback(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma as text
%        str2double(get(hObject,'String')) returns contents of gamma as a double


% --- Executes during object creation, after setting all properties.
function gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[r,c,ch]=size(a);
pixels=r*c;%total number of pixels
num=zeros(256,1);
%Calculate the histogram
for i=1:r
    for j=1:c
        v=a(i,j);
        num(v+1)=num(v+1)+1;
    end
end
sum=0;
pc=zeros(256,1);
c=zeros(256,1);
out=zeros(256,1);
for i=1:size(num)
       sum=sum+num(i);
       c(i)=sum;%Calculate running sum over the histogram
       pc(i)=c(i)/pixels;%Divide each value by the max value
       out(i)=round(pc(i)*255);%Multiply by the new range
end
[r,c,ch]=size(a);
Hp=uint8(zeros(r,c));
for i=1:r
    for j=1:c
            Hp(i,j)=out(a(i,j)+1);
    end
end
axes(handles.axes3);
imshow(Hp);
setappdata(0,'Hp',Hp)
            imshow(Hp)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  a;
global img2_read;

y=H_matching(a,img2_read);
axes(handles.axes3);
imshow(y);
setappdata(0,'y',y)
imshow(y),title('Histogram Matching')


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  a;
global img2_read;
[r1, c1, ch1]=size(a);
%[r2, c2, ch2]=size(im2);
img2_read = imresize(img2_read,[r1 c1]);
new_im=zeros(r1,c1,ch1);
for k=1:ch1
    for i=1:r1
        for j=1:c1
            v=a(i,j,k)+img2_read(i,j,k);
            if v>255
                new_im(i,j,k)=255;
            else
                new_im(i,j,k)=v;
            end
        end
    end
end

new_im = uint8(new_im);
axes(handles.axes3);
imshow(new_im);
setappdata(0,'new_im',new_im)
imshow(new_im)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  a;
global img2_read;
[r1, c1, ch1]=size(a);
img2_read = imresize(img2_read,[r1 c1]);
new_im=zeros(r1,c1,ch1);
for k=1:ch1
    for i=1:r1
        for j=1:c1
            v=a(i,j,k)-img2_read(i,j,k);
            if v<0
                new_im(i,j,k)=abs(v);
            else
                new_im(i,j,k)=v;
            end
        end
    end
end

new_im = uint8(new_im);
axes(handles.axes3);
imshow(new_im);
setappdata(0,'new_im',new_im)
imshow(new_im)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[r,c,ch]=size(a);
New_Value=zeros(r,c,ch);
for k=1:ch
    for i=1:r
        for j=1:c
            New_Value(i,j,k) = 255 - a(i,j,k);
        end
    end
end

New_Value = uint8(New_Value);
axes(handles.axes3);
imshow(New_Value);
setappdata(0,'New_Value',New_Value)
imshow(New_Value)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
Numbit=str2double(get(handles.Numbit,'string'));
%--------------------------------------------------------------------------
[r, c, ch]=size(a);
New_img = zeros(r,c,ch);
Gray_level =power(2,Numbit);  % s represent number of bits per pixel
Gap = 256/Gray_level;
Colors = Gap:Gap:256;
for k=1:ch
    for i=1:r
        for j=1:c
            Temp=a(i,j,k)/Gap;
            Index = floor(Temp);
            if(Index==0)
                Index=Index+1;
            end
            New_img(i,j,k) = Colors(Index);
        end  
    end
end

New_img = uint8( New_img);
axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


function Numbit_Callback(hObject, eventdata, handles)
% hObject    handle to Numbit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Numbit as text
%        str2double(get(hObject,'String')) returns contents of Numbit as a double


% --- Executes during object creation, after setting all properties.
function Numbit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Numbit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
    global a;
    
    % Get the size from the GUI or set it as needed
    n_size = str2double(get(handles.size, 'string'));

    % Call the Mean_filter function
    new_image = Mean_filter(a, n_size);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);
    title('Mean Filter Result');

    % Save the result to appdata for potential future use
    setappdata(0, 'New_img', new_image);


function new_image = Mean_filter(image, mask)
    [row, col, ch] = size(image);
    image = padarray(image, [(mask-1)/2 (mask-1)/2], 'replicate');
    new_image = zeros(row, col, ch);

    for k=1:ch
        for i=1:row
            for j=1:col
                new_image(i,j,k) = mean2(image(i:i+mask-1, j:j+mask-1, k));
            end        
        end
    end

    new_image = uint8(new_image);









function size_Callback(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size as text
%        str2double(get(hObject,'String')) returns contents of size as a double


% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





    % --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
    global a;

    % Get the mask size from the GUI or set it as needed
    maskSize = str2double(get(handles.size, 'string'));

    % Call the gaussianNoise function
    newImage = gaussianNoise(a, maskSize);

    % Display the result
    axes(handles.axes3);
    imshow(newImage);
    title('Gaussian Noise Result');

    % Save the result to appdata for potential future use
    setappdata(0, 'New_img', newImage);


function New_Image = gaussianNoise(image, maskSize)
    [row, col, ch] = size(image);

    % Generate Gaussian noise
    noisyImage = imnoise(image, 'gaussian');
       % Ensure the result is of type uint8
    New_Image = uint8( noisyImage);

function sigma1_Callback(hObject, eventdata, handles)
% hObject    handle to sigma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
;
% Hints: get(hObject,'String') returns contents of sigma1 as text
%        str2double(get(hObject,'String')) returns contents of sigma1 as a double


% --- Executes during object creation, after setting all properties.
function sigma1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a; 
[r, c, ch]=size(a);
New_img = zeros(r,c,ch);
add=3;%number of columns and rows added
Padding_org_img = padarray(a,[add add],'replicate','both');
mask_size=7;
arr=zeros(mask_size,mask_size);
for k=1:ch
    for i=1:r
        for j=1:c
            for fr=0:mask_size-1
               for fc=0:mask_size-1
                   arr(fr+1,fc+1)=Padding_org_img(i+fr,j+fc,k);
               end 
            end
            sortarr=sort(arr(:));
            New_img(i,j,k)=sortarr(5);      
        end
    end
end

New_img = uint8( New_img);
axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[r, c, ch]=size(a);
New_img = zeros(r,c,ch);
add=1;%number of columns and rows added
Padding_org_img = padarray(a,[add add],'replicate','both');
mask_size=3;
arr=zeros(3,3);
for k=1:ch
    for i=1:r
        for j=1:c
            for fr=0:mask_size-1
               for fc=0:mask_size-1
                   arr(fr+1,fc+1)=Padding_org_img(i+fr,j+fc,k);
               end 
            end
            New_img(i,j,k)=max(arr(:));      
        end
    end
end

New_img = uint8( New_img);
axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[r, c, ch]=size(a);
New_img = zeros(r,c,ch);
add=1;%number of columns and rows added
Padding_org_img = padarray(a,[add add],'replicate','both');
mask_size=3;
arr=zeros(3,3);
for k=1:ch
    for i=1:r
        for j=1:c
            for fr=0:mask_size-1
               for fc=0:mask_size-1
                   arr(fr+1,fc+1)=Padding_org_img(i+fr,j+fc,k);
               end 
            end
            New_img(i,j,k)=min(arr(:));      
        end
    end
end

New_img = uint8( New_img);
axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a; 
add=1;%number of columns and rows added
a = a(:,:,1);
Padding_org_img = padarray(a,[add add],'replicate','both');
[r, c, ch]=size(a);
New_img = zeros(r,c,ch);
for i=2:r-1    
    for j=2:c-1    
        value = Padding_org_img(i+1,j)+Padding_org_img(i-1,j)+Padding_org_img(i,j+1)+Padding_org_img(i,j-1)-4*Padding_org_img(i,j);
%Threshold 
        if value>20
           New_img(i,j)=255;
        else
            New_img(i,j)=0;
        end
       % New_img(i,j)=value;
    end
end

New_img = uint8( New_img);
axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
contents=cellstr(get(hObject,'String'));
pop_choice=contents{get(hObject,'Value')};

if(strcmp(pop_choice,'Edge Point Detection'))
    global a; 
    add=1;%number of columns and rows added
    a = a(:,:,1);
    Padding_org_img = padarray(a,[add add],'replicate','both');
    [r, c, ch]=size(a);
    New_img = zeros(r,c,ch);
    for i=2:r-1    
     for j=2:c-1    
         value = Padding_org_img(i+1,j)+Padding_org_img(i-1,j)+Padding_org_img(i,j+1)+Padding_org_img(i,j-1)-4*Padding_org_img(i,j);
%Threshold 
            if value>20
                New_img(i,j)=255;
            else
                New_img(i,j)=0;
            end
       % New_img(i,j)=value;
     end
    end

    New_img = uint8( New_img);
    axes(handles.axes3);
    imshow(New_img);
    setappdata(0,'New_img',New_img)
    imshow(New_img)
elseif(strcmp(pop_choice,'Edge Detection Horizontal'))
    add=1;%number of columns and rows added
    a = a(:,:,1);
    Padding_org_img = padarray(a,[add add],'replicate','both');
    [r, c, ch]=size(Padding_org_img);
    New_img = zeros(r,c,ch);    
    for i=2:r-1    
        for j=2:c-1    
            value =Padding_org_img(i-1,j-1)+2*Padding_org_img(i-1,j)+Padding_org_img(i-1,j+1)-Padding_org_img(i+1,j-1)-2*Padding_org_img(i+1,j)-Padding_org_img(i+1,j+1);
%Threshold 
            if value>30
                New_img(i,j)=255;
            else
                New_img(i,j)=0;
            end
       % New_img(i,j)=value;
        end
    end

    New_img = uint8( New_img);
    axes(handles.axes3);
    imshow(New_img);
    setappdata(0,'New_img',New_img)
    imshow(New_img)
elseif(strcmp(pop_choice,'Edge Detection Vertical'))
    
    add=1;%number of columns and rows added
    a = a(:,:,1);
    Padding_org_img = padarray(a,[add add],'replicate','both');
    [r, c, ch]=size(Padding_org_img);
    New_img = zeros(r,c,ch);
    for i=2:r-1    
        for j=2:c-1    
            value = Padding_org_img(i-1,j-1)+2*Padding_org_img(i,j-1)+Padding_org_img(i+1,j-1)-Padding_org_img(i-1,j+1)-2*Padding_org_img(i,j+1)-Padding_org_img(i+1,j+1);
%Threshold 
            if value>20
             New_img(i,j)=255;
            else
             New_img(i,j)=0;
            end
       % New_img(i,j)=value;
        end
    end

    New_img = uint8( New_img);


    axes(handles.axes3);
    imshow(New_img);
    setappdata(0,'New_img',New_img)
    imshow(New_img)
 
elseif(strcmp(pop_choice,'Edge Detection Diagonal'))
 
    add=1;%number of columns and rows added
    a = a(:,:,1);
    Padding_org_img = padarray(a,[add add],'replicate','both');
    [r, c, ch]=size(Padding_org_img);
    New_img = zeros(r,c,ch);
    for i=2:r-1    
        for j=2:c-1    
            value =Padding_org_img(i-1,j)+2*Padding_org_img(i-1,j+1)-1*Padding_org_img(i,j-1)+Padding_org_img(i,j+1)-2*Padding_org_img(i+1,j-1)-Padding_org_img(i+1,j);
%Threshold 
            if value>30
                New_img(i,j)=255;
            else
                New_img(i,j)=0;
            end
       % New_img(i,j)=value;
        end
    end

    New_img = uint8( New_img);


    axes(handles.axes3);
    imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)
end


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
    global a;

    % Get the mask size from the GUI or set it as needed
    maskSize = str2double(get(handles.size, 'string'));

    % Call the Geometric filter function
    newImage = Geometric(a, maskSize);

    % Display the result
    axes(handles.axes3);
    imshow(newImage);
    title('Geometric Filter Result');

    % Save the result to appdata for potential future use
    setappdata(0, 'New_img', newImage);


function new_image = Geometric(image, mask)
    [row, col, ch] = size(image);
    image = padarray(image, [(mask-1)/2, (mask-1)/2], 'replicate');
    new_image = zeros(row, col, ch);

    for k = 1:ch
        for i = 1:row
            for j = 1:col
                neighborhood = image(i:i+mask-1, j:j+mask-1, k);
                w = prod(neighborhood(:)).^(1/(mask*mask));
                new_image(i, j, k) = double(w);
            end
        end
    end

    new_image = uint8(new_image);


% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function pushbutton22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
add=1;%number of columns and rows added
Padding_org_img = padarray(a,[add add],'replicate','both');
[r, c, ch]=size(a);
New_img = zeros(r,c,ch);
for k=1:ch
    for i=2:r-1    
        for j=2:c-1    
            %value = 5*Padding_org_img(i,j,k)-Padding_org_img(i+1,j,k)-Padding_org_img(i-1,j,k)-Padding_org_img(i,j+1,k)-Padding_org_img(i,j-1,k);
             value = -1*Padding_org_img(i-1,j-1,k)-Padding_org_img(i-1,j,k)-Padding_org_img(i-1,j+1,k)-Padding_org_img(i,j-1,k)+9*Padding_org_img(i,j,k)-Padding_org_img(i,j+1,k)-Padding_org_img(i+1,j-1,k)-Padding_org_img(i+1,j,k)-Padding_org_img(i+1,j+1,k);
            New_img(i,j,k)=value;
        end
    end
end


New_img = uint8( New_img);

axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[r, c, ch]=size(a);
New_img = zeros(r,c,ch);
imgnoise = imnoise(a,'salt & pepper');
add=1;%number of columns and rows added
Padding_org_img = padarray(imgnoise,[add add],'replicate','both');

mask_size=3;
arr=zeros(3,3);
for k=1:ch
    for i=1:r
        for j=1:c
            for fr=0:mask_size-1
               for fc=0:mask_size-1
                   arr(fr+1,fc+1)=Padding_org_img(i+fr,j+fc,k);
               end 
            end
            New_img(i,j,k)=(max(arr(:))+min(arr(:)))/2;      
        end
    end
end

New_img = uint8( New_img);

axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
D0=str2double(get(handles.D0,'string'));
a = a(:,:,1);
%Convert into Frequency Domain
FT = fft2(a);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);
%Filter
HIGH=1;
[Real,Imag]=LowHigh_pass_Ideal(a,D0,Real,Imag,HIGH);
%Convert into Spatial Domain
FT = ifftshift(Real + i * Imag);
IFT = ifft2(FT);

New_img = uint8(IFT);

axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)



function D0_Callback(hObject, eventdata, handles)
% hObject    handle to D0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D0 as text
%        str2double(get(hObject,'String')) returns contents of D0 as a double


% --- Executes during object creation, after setting all properties.
function D0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
D0=str2double(get(handles.D0,'string'));
n=str2double(get(handles.order_n,'string'));
%--------------------------------------------------------------------------
a = a(:,:,1);
%Convert into Frequency Domain
FT = fft2(a);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);
%Filter
HIGH=1;
[Real,Imag]=LowHigh_pass_Butterworth(a,D0,Real,Imag,n,HIGH);
%Convert into Spatial Domain
FT = ifftshift(Real + i * Imag);
IFT = ifft2(FT);
New_img=IFT;

New_img = uint8( New_img);

axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)




function order_n_Callback(hObject, eventdata, handles)
% hObject    handle to order_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of order_n as text
%        str2double(get(hObject,'String')) returns contents of order_n as a double


% --- Executes during object creation, after setting all properties.
function order_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
D0=str2double(get(handles.D0,'string'));
a = a(:,:,1);
%Convert into Frequency Domain
FT = fft2(a);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);
%Filter
HIGH=1;
[Real,Imag]=LowHigh_pass_Gaussian(a,D0,Real,Imag,HIGH);
%Convert into Spatial Domain
FT = ifftshift(Real + i * Imag);
IFT = ifft2(FT);
New_img=IFT;

New_img = uint8( New_img);

axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
globla a;
D0=str2double(get(handles.D0,'string'));
%Convert into Frequency Domain
FT = fft2(a);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);
%Filter
LOW=0;
[Real,Imag]=LowHigh_pass_Ideal(a,D0,Real,Imag,LOW);
%Convert into Spatial Domain
FT = ifftshift(Real + i * Imag);
IFT = ifft2(FT);

New_img = uint8(IFT);

axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
globla a;
D0=str2double(get(handles.D0,'string'));
n=str2double(get(handles.order_n,'string'));
FT = fft2(a);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);
%Filter
LOW=0;
[Real,Imag]=LowHigh_pass_Butterworth(a,D0,Real,Imag,n,LOW);
%Convert into Spatial Domain
FT = ifftshift(Real + i * Imag);
IFT = ifft2(FT);
New_img=IFT;

New_img = uint8( New_img);

axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
D0=str2double(get(handles.D0,'string'));
FT = fft2(a);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);
%Filter
LOW=0;
[Real,Imag]=LowHigh_pass_Gaussian(a,D0,Real,Imag,LOW);
%Convert into Spatial Domain
FT = ifftshift(Real + i * Imag);
IFT = ifft2(FT);
New_img=IFT;
New_img = uint8(New_img);

New_img = uint8( New_img);

axes(handles.axes3);
imshow(New_img);
setappdata(0,'New_img',New_img)
imshow(New_img)


% --- Executes on button press in pushbutton31.


function pushbutton31_Callback(hObject, eventdata, handles)
    global a;

    % Read the resizing factors from the GUI or set them as needed
    fact_r = 2; % Example value, you need to adjust this
    fact_c = 2; % Example value, you need to adjust this

    % Call the DM_0O function
    new_image = DM_0O(a, fact_r, fact_c);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);
    setappdata(0, 'New_img', new_image);
    imshow(new_image);


function new_image = DM_0O(in, fact_r, fact_c)
    [r, c, ch] = size(in);
    new_r = r * fact_r;
    new_c = c * fact_c;
    r_ratio = r / new_r;
    c_ratio = c / new_c;
    out = zeros(new_r, new_c, ch);

    for k = 1:ch
        for new_x = 1:new_r
            old_x = new_x * r_ratio;
            old_x = floor(old_x);
            if (old_x == 0)
                old_x = 1;
            end
            for new_y = 1:new_c
                old_y = new_y * c_ratio;
                old_y = floor(old_y);
                if (old_y == 0)
                    old_y = 1;
                end
                out(new_x, new_y, k) = in(old_x, old_y, k);
            end
        end
    end

    disp(out);
    new_image = uint8(out);
    
  







% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
    global a;

    % Read fact from the GUI or set it as needed
    fact = 2; % Example value, you need to adjust this

    % Call the DM_1O function
    new_image = DM_1O(a, fact);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);
    setappdata(0, 'New_img', new_image);
    imshow(new_image);


function new_image = DM_1O(im, fact)
    [rows, cols, channels] = size(im);
    new_rows = rows * fact;
    new_cols = cols * fact;
    new_image = zeros(new_rows, new_cols, channels);

    for k = 1:channels
        for i = 1:new_rows
            for j = 1:new_cols
                x = ((i - 1) / fact) + 1;
                y = ((j - 1) / fact) + 1;

                x_floor = floor(x);
                y_floor = floor(y);

                if x_floor >= rows || y_floor >= cols
                    new_image(i, j, k) = 0;  % Handle out-of-bounds
                else
                    dx = x - x_floor;
                    dy = y - y_floor;

                    Min = im(x_floor, y_floor, k);
                    Max = im(min(x_floor + 1, rows), min(y_floor + 1, cols), k);

                    Pixel = round(((Max - Min) / fact) * i + Min);
                    new_image(i, j, k) = Pixel;
                end
            end
        end
    end

    new_image = uint8(new_image);
  
% Rest of the code remains unchanged...

   
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
    global a;

    % Read fact_r and fact_c from the GUI or set them as needed
    fact_r = 2; % Example value, you need to adjust this
    fact_c = 2; % Example value, you need to adjust this

    % Perform RM_0_order and other operations
    new_image = RM_0_order(a, fact_r, fact_c);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);
    setappdata(0, 'New_img', new_image);
    imshow(new_image);


function new_image = RM_0_order(in, fact_r, fact_c)
    [r, c, ch] = size(in);
    new_r = r * fact_r;
    new_c = c * fact_c;
    r_ratio = r / new_r;
    c_ratio = c / new_c;
    out = zeros(new_r, new_c, ch);

    for k = 1:ch
        for new_x = 1:new_r
            old_x = new_x * r_ratio;
            old_x = floor(old_x);
            if (old_x == 0)
                old_x = 1;
            end
            for new_y = 1:new_c
                old_y = new_y * c_ratio;
                old_y = floor(old_y);
                if (old_y == 0)
                    old_y = 1;
                end
                out(new_x, new_y, k) = in(old_x, old_y, k);
            end
        end
    end

    disp(out);
    % out = uint8(out);
    % figure, imshow(in), title('Original')
    % figure, imshow(out), title('Resized 1')


% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
 global a;

    % Read f1 and f2 from the GUI or set them as needed
    f1 = 2; % Example values, you need to adjust these
    f2 = 2; % Example values, you need to adjust these

    % Perform RM_1_order and other operations
    new_image = RM_1_order(a, f1, f2);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);
    setappdata(0, 'New_img', new_image);
    imshow(new_image);


function new_image = RM_1_order(image, f1, f2)
    [r, c, ch] = size(image);
    new_r = r * f1;
    new_c = c * f2;
    new_image = zeros(new_r, new_c, ch);

    rows_ratio = r / new_r;
    col_ratio = c / new_c;

    for k = 1:ch
        for i = 1:new_r
            old_x = i * rows_ratio;
            x1 = floor(old_x);
            x2 = min(x1 + 1, r);
            if x1 == 0
                x1 = 1;
            end

            for j = 1:new_c
                old_y = j * col_ratio;
                y1 = floor(old_y);
                y2 = min(y1 + 1, c);
                if y1 == 0
                    y1 = 1;
                end

                p1 = image(x1, y1, k);
                p2 = image(x2, y1, k);
                p3 = image(x1, y2, k);
                p4 = image(x2, y2, k);

                x_fraction = old_x - x1;
                y_fraction = old_y - y1;

                z1 = p1 * (1 - x_fraction) + p2 * x_fraction;
                z2 = p3 * (1 - x_fraction) + p4 * x_fraction;

                new_pixel = z1 * (1 - y_fraction) + z2 * y_fraction;
                new_image(i, j, k) = new_pixel;
            end
        end
    end
    
    new_image = uint8(new_image);  % Convert to uint8
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton35.
% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
    global a;

    % Call the single_color_ch function for each channel
    for k = 1:size(a, 3)
        gray_im = single_color_ch(a, k);

        % Display the result (optional, you can comment this line if needed)
        axes(handles.axes3);
        imshow(gray_im);
        title(['Single Color Channel Result (Channel: ', num2str(k), ')']);

        % Save the result to appdata for potential future use
        setappdata(0, ['New_img_Channel_', num2str(k)], gray_im);
    end


function gray_im = single_color_ch(image, channel)
    gray_im = image(:, :, channel);
    gray_im = uint8(gray_im);


   
    % Display the grayscale image
   % figure, imshow(uint8(gray_image(:, :, ch + 1))), title('Grayscale Image');
  


        % Display individual color channels
      % figure, imshow(uint8(gray_image(:, :, k))), title(['Channel: ', num2str(k)]);
   % Convert to uint8

   


% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
    global a;

    % Call the Averaging function
    grayImage = Averaging(a);

    % Display the result
    axes(handles.axes3);
    imshow(grayImage);
    title('Averaging Result');

    % Save the result to appdata for potential future use
    setappdata(0, 'New_img', grayImage);


function gray_im = Averaging(image)
    [row, col, ch] = size(image);
    gray_im = zeros(row, col);

    for i = 1:row
        for j = 1:col
            gray_im(i, j) = sum(image(i, j, :)) / ch;
        end
    end

    gray_im = uint8(gray_im);


% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton37.
% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
    global a;

    % Call the Luminance function
    gray_image = Luminance(a);

    % Display the result
    axes(handles.axes3);
    imshow(gray_image);
    setappdata(0, 'New_img', gray_image);
    imshow(gray_image);
function gray_im = Luminance(image)
[row,col,~] = size(image);
gray_im=zeros(row,col);
for i=1:row
    for j=1:col
        gray_im(i,j) = (0.3*image(i,j,1))+(0.59*image(i,j,2))+(0.11*image(i,j,3));
    end
end
gray_im = uint8(gray_im);

% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
    global a;

    % Call the Desaturation function
    gray_image = Desaturation(a);

    % Display the result
    axes(handles.axes3);
    imshow(gray_image);
    setappdata(0, 'New_img', gray_image);
    imshow(gray_image);


function gray_im = Desaturation(image)
    [row, col, ~] = size(image);
    gray_im = zeros(row, col);

    for i = 1:row
        for j = 1:col
            gray_im(i, j) = (max([image(i, j, 1), image(i, j, 2), image(i, j, 3)]) + min([image(i, j, 1), image(i, j, 2), image(i, j, 3)])) / 2;
        end
    end

    gray_im = uint8(gray_im);


% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton39.

function pushbutton39_Callback(hObject, eventdata, handles)
    global a;

    % Get the original axes limits
    xlim_original = get(handles.axes3, 'XLim');
    ylim_original = get(handles.axes3, 'YLim');

    % Call the Decomposing function
    [gray_image1, gray_image2] = Decomposing(a);

    % Display the results
    axes(handles.axes3);
    subplot(1, 2, 1);
    imshow(gray_image1);
    title('Max Component');

    subplot(1, 2, 2);
    imshow(gray_image2);
    title('Min Component');

    setappdata(0, 'New_img1', gray_image1);
    setappdata(0, 'New_img2', gray_image2);

    % Restore the original axes limits
    set(handles.axes3, 'XLim', xlim_original);
    set(handles.axes3, 'YLim', ylim_original);


function [gray_im1, gray_im2] = Decomposing(image)
    [row, col, ~] = size(image);
    gray_im1 = zeros(row, col);
    gray_im2 = zeros(row, col);

    for i = 1:row
        for j = 1:col
            gray_im1(i, j) = max([image(i, j, 1), image(i, j, 2), image(i, j, 3)]);
        end
    end

    for i = 1:row
        for j = 1:col
            gray_im2(i, j) = min([image(i, j, 1), image(i, j, 2), image(i, j, 3)]);
        end
    end

    gray_im1 = uint8(gray_im1);
    gray_im2 = uint8(gray_im2);





% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
    % Get the image from the GUI or use your global variable (e.g., 'a')
    global a;

    % Assuming 'a' is the first image
    % You may replace 'a' with the appropriate image variable

    % Load the second image for histogram matching
    [filename, pathname] = uigetfile({'*.png;*.jpg;*.jpeg;*.bmp;*.tif', 'Image Files (*.png, *.jpg, *.jpeg, *.bmp, *.tif)'; '*.*', 'All Files (*.*)'}, 'Select Image for Histogram Matching');
    if isequal(filename, 0) || isequal(pathname, 0)
        % User canceled the file selection
        return;
    end
    second_image_path = fullfile(pathname, filename);
    b = imread(second_image_path);

    % Call the H_matching function
    new_image = H_matching(a, b);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);
    title('Histogram Matching Result');

    % Save the result to appdata for potential future use
    setappdata(0, 'new_image', new_image);


% H_matching Function
function new_im = H_matching(im, im_2)
    [r, c, ch] = size(im);
    [r_2, c_2, ch_2] = size(im_2);
    new_im = zeros(r, c, ch);

    Run_sum_2 = 0;
    for k = 1:ch
        %--------------------------------------------------
        Run_sum_1 = 0;
        for color = 0:255
            min = 100000;
            num_pix = 0;
            for i = 1:r
                for j = 1:c
                    if color == im(i, j, k)
                        num_pix = num_pix + 1;
                    end
                end
            end
            Run_sum_1 = Run_sum_1 + num_pix;
            EQ1 = round((Run_sum_1 / (r * c)) * 255);
            %--------------------------------------------------
            % number_2
            for co = 0:255
                % Run_sum_2=0;
                num_pix = 0;
                for i = 1:r_2
                    for j = 1:c_2
                        if co == im_2(i, j, k)
                            num_pix = num_pix + 1;
                        end
                    end
                end
                Run_sum_2 = Run_sum_2 + num_pix;
                EQ2 = round((Run_sum_2 / (r * c)) * 255);

                if abs(EQ1 - EQ2) < min
                    min = abs(EQ1 - EQ2);
                    if color < co
                        matching = co;
                    else
                        matching = color;
                    end
                end

            end
            %--------------------------------------------------
            for i = 1:r
                for j = 1:c
                    if color == im(i, j, k)
                        % Edite
                        % New_im(i,j,k)=round((Run_sum/(16))*7 );
                        new_im(i, j, k) = matching;
                    end
                end
            end

        end

    end
    new_im = uint8(new_im);
 







  

   

% hObject    handle to pushbutton42 (see GCBO)

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
    % Assuming 'a' and 'b' are the images to be added or subtracted
    % You may replace 'a' and 'b' with the appropriate image variables

    % Load the second image
    [filename, pathname] = uigetfile({'*.png;*.jpg;*.jpeg;*.bmp;*.tif', 'Image Files (*.png, *.jpg, *.jpeg, *.bmp, *.tif)'; '*.*', 'All Files (*.*)'}, 'Select Image for Addition/Subtraction');
    if isequal(filename, 0) || isequal(pathname, 0)
        % User canceled the file selection
        return;
    end
    second_image_path = fullfile(pathname, filename);
    b = imread(second_image_path);

    % Get the operation from the GUI or set it as needed
    op = get(handles.operation, 'String');  % Assuming 'operation' is the tag of your operation input field

    % Call the sub_add function
    new_image = sub_add(a, b, op);

    % Display the result in the correct axes
    axes(handles.axes3);
    imshow(new_image);
    title(['Result of ', op]);

    % Save the result to appdata for potential future use
    setappdata(0, 'new_image', new_image);


% sub_add Function
function new_im = sub_add(im_1, im_2, op)
    if op == '+'
        new_im = im_1 + im_2;
    elseif op == '-'
        new_im = im_1 - im_2;
    end

    % Display the result in a new figure
    figure;
    imshow(new_im);
    if op == '+'
        title('Addition Result');
    elseif op == '-'
        title('Subtraction Result');
    end




  


% hObject    handle to pushbutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton44.
function pushbutton44_Callback(hObject, eventdata, handles)
    global a;
    
    % Get the sigma value from the GUI
    sigma = str2double(get(handles.sigma1, 'String'));

    % Call the Weighted_filter function
    new_image = Weighted_filter(a, sigma);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);
    title('Weighted Filter Result');

    % Save the result to appdata for potential future use
    setappdata(0, 'New_img', new_image);


function new_image = Weighted_filter(image, sigma)
    [row, col, ch] = size(image);
    new_image = zeros(row, col, ch);

    N = floor(3.7 * sigma - 0.5);
    mask_size = 2 * N + 1;
    t = floor(mask_size / 2);
    x = (-t:t);
    mask = zeros(mask_size, mask_size);
    image = padarray(image, [(mask_size - 1) / 2, (mask_size - 1) / 2], 'replicate');
    coef = 1 / (2 * pi * (sigma^2));

    for i = 1:mask_size
        for j = 1:mask_size
            mask(i, j) = coef * exp(-((x(i)^2) + (x(j)^2)) / (2 * (sigma^2)));
        end
    end

    for k = 1:ch
        for i = 1:row
            for j = 1:col
                new_image(i, j, k) = sum(sum(double(image(i:i + mask_size - 1, j:j + mask_size - 1, k)) .* mask));
            end        
        end
    end

    new_image = uint8(new_image);






% hObject    handle to pushbutton44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton46.
function pushbutton46_Callback(hObject, eventdata, handles)
    global a;

    % Get the mask size from the GUI or set it as needed
    maskSize = str2double(get(handles.size, 'string'));

    % Call the Mid_point filter function
    newImage = Mid_point(a, maskSize);

    % Display the result
    axes(handles.axes3);
    imshow(newImage);
    title('Mid-point Filter Result');

    % Save the result to appdata for potential future use
    setappdata(0, 'New_img', newImage);

function new_image = Mid_point(image, mask)
    [row, col, ch] = size(image);
    image = padarray(image, [(mask-1)/2, (mask-1)/2], 'replicate');
    new_image = zeros(row, col, ch);

    for k = 1:ch
        for i = 1:row-2
            for j = 1:col-2
                x = max(max(image(i:i+mask-1, j:j+mask-1, k))); 
                y = min(min(image(i:i+mask-1, j:j+mask-1, k)));
                new_image(i+1, j+1, k) = (x + y) / 2;
            end        
        end
    end

    new_image = uint8(new_image);


% hObject    handle to pushbutton46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton47.
function pushbutton47_Callback(hObject, eventdata, handles)
    global a;

    % Call the Unsharpe_Masking function
    new_image = Unsharpe_Masking(a);

    % Display the result
    axes(handles.axes3);
    imshow(new_image);
    title('Unsharp Masking Result');

    % Save the result to appdata for potential future use
    setappdata(0, 'New_img', new_image);


function new_image = Unsharpe_Masking(image)
    sigma = 2;

    [row, col, ch] = size(image);
    new_image = zeros(row, col, ch);

    N = floor(3.7 * sigma - 0.5);
    mask_size = 2 * N + 1;
    t = floor(mask_size / 2);
    x = (-t:t);
    mask = zeros(mask_size, mask_size);
    coef = 1 / (2 * pi * (sigma^2));

    for i = 1:mask_size
        for j = 1:mask_size
            mask(i, j) = coef * exp(-((x(i)^2) + (x(j)^2)) / (2 * (sigma^2)));
        end
    end

    add = 6;
    Padding_org_img = padarray(image, [add add], 'replicate', 'both');
    sum = 0;

    for k = 1:ch
        for i = 1:row
            for j = 1:col
                for fr = 0:mask_size-1
                    for fc = 0:mask_size-1
                        sum = sum + (mask(fr+1, fc+1) * Padding_org_img(i+fr, j+fc, k));
                    end
                end
                new_image(i, j, k) = sum;
                sum = 0;
            end
        end
    end

    image1 = image;
    image2 = new_image;
    [r1, c1, ch1] = size(image1);
    image2 = imresize(image2, [r1 c1]);
    new_im = zeros(r1, c1, ch1);

    for k = 1:ch1
        for i = 1:r1
            for j = 1:c1
                v = image1(i, j, k) - image2(i, j, k);
                if v < 0
                    new_im(i, j, k) = abs(v);
                else
                    new_im(i, j, k) = v;
                end
            end
        end
    end

    image1 = image;
    image2 = new_im;
    [r1, c1, ch1] = size(image1);
    image2 = imresize(image2, [r1 c1]);
    new_im = zeros(r1, c1, ch1);

    for k = 1:ch1
        for i = 1:r1
            for j = 1:c1
                v = image1(i, j, k) + image2(i, j, k);
                if v > 255
                    new_im(i, j, k) = 255;
                else
                    new_im(i, j, k) = v;
                end
            end
        end
    end

    new_image = uint8(new_im);


% hObject    handle to pushbutton47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         


% --- Executes when uibuttongroup2 is resized.
function uibuttongroup2_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton48.
function pushbutton48_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.jpg*', 'Pick an Image');
 name=strcat(pathname,filename);
 global a;
  a=imread(name);
axes(handles.axes4);
imshow(a);
setappdata(0,'a',a)
            imshow(a)

% 
obal  a;
global img2_read;
[r1, c1, ch1]=size(a);
%[r2, c2, ch2]=size(im2);
img2_read = imresize(img2_read,[r1 c1]);
new_im=zeros(r1,c1,ch1);
for k=1:ch1
    for i=1:r1
        for j=1:c1
            v=a(i,j,k)+img2_read(i,j,k);
            if v>255
                new_im(i,j,k)=255;
            else
                new_im(i,j,k)=v;
            end
        end
    end
end

new_im = uint8(new_im);
axes(handles.axes3);
imshow(new_im);
setappdata(0,'new_im',new_im)
imshow(new_im)



% --- Executes on button press in pushbutton49.
% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
    % Get the new_min and new_max values from the GUI or set them as needed
    new_min_str = get(handles.edit18, 'String');
    new_max_str = get(handles.edit19, 'String');

    % Check if edit fields are empty, set default values if true
    if isempty(new_min_str)
        new_min = 2;  % Replace with your default value
    else
        new_min = str2double(new_min_str);
    end

    if isempty(new_max_str)
        new_max = 6;  % Replace with your default value
    else
        new_max = str2double(new_max_str);
    end

    % Get the image from the handles structure
    image = handles.a;

    % Call the Contrast function
    new_image = Contrast(image, new_min, new_max);

    % Display the result in the correct axes
    axes(handles.axes3);
    imshow(new_image, 'Parent', handles.axes3);
    title(handles.axes3, 'Contrast Adjusted Image');

    % Save the result to appdata for potential future use
    setappdata(handles.figure1, 'new_image', new_image);

% Contrast Function
function new_image = Contrast(image, new_min, new_max)
    [row, col, ch] = size(image);
    new_image = zeros(row, col, ch);

    for k = 1:ch
        old_min = min(image(:, :, k), [], 'all');
        old_max = max(image(:, :, k), [], 'all');
        
        for i = 1:row
            for j = 1:col
                new_value = ((image(i, j, k) - old_min) / (old_max - old_min)) * (new_max - new_min) + new_min;
                new_image(i, j, k) = max(0, min(new_value, 255));
            end
        end
    end

    new_image = uint8(new_image);
    

% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
