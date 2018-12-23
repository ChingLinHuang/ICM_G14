function [background] = getBackground(movie,pix,n)
% This is a function to get the background
%----------------Inputs---------------------------------------
%   pix: remove objects that are smaller than pix pixel
%   n: parameter of dilation
%--------------------------------------------------------
nFrames = movie.nFrames
mov = movie.mov
%----------------Setting index of frames----------------
fr_ind1 = 1;
fr_ind2 = 2;
back_ind = 45;

frame1 = mov(fr_ind1).gray;
frame2 = mov(fr_ind2).gray;
back = mov(back_ind).gray;

sz = size(frame1);
background = zeros(sz(1), sz(2));

%----------------Subtract And Remove Small Object------------------------------------------
difference = imabsdiff(frame1,frame2); %difference between frame1 and frame2
thresh = graythresh(difference); %computes the gray intensity of the difference image by otsu's method
bw = (difference >= thresh * 255); 

% removes from a binary image all connected components (objects) that have
% fewer than P pixels
subs = bwareaopen(bw, pix);

%----------------Find Background----------------------------------------------------------

subs = imdilate(subs, ones(n,n));
background(~subs) = frame1(~subs);
background(subs) = back(subs);
background = uint8(background);
