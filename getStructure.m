function [ movie ] = getStructure( video )
%getStructure: returns  structure and number of frames 
%   INPUTS:
%           video: video file of type VideoReader
%   OUTPUTS:
%           mov: structure that for each frame contains the RGB and gray
%           matrix.
%           nFrames: number of frames of the video.

%test
%video = VideoReader('C:\ICM_project\video\testVideo2.mp4');
cut_right = 1100;
%cut_left = 0;

nFrames = video.NumberOfFrames;
% figure
for k = 1 : nFrames
    movie.mov(k).rgb = read(video,k); %2* PERQUE PILLA PARELLES DE FRAMES IGUALS (ES AIXI A TOTS ELS VIDEOS?? 
    movie.mov(k).gray = rgb2gray(movie.mov(k).rgb(:,1:cut_right,:));
%    movie.mov(k).gray(:,cut_left:cut_right)=0;
%     fprintf('%f', k);
end
movie.nFrames = nFrames;

