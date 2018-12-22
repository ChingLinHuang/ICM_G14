video = VideoReader('C:\ICM_project\video\testVideo.mp4');
nFrames = video.NumberOfFrames;
% figure
for k = 1 : nFrames
    mov(k).rgb = read(video,k);
    mov(k).gray = rgb2gray(mov(k).rgb);
%     imshow(mov(k).gray);
%     fprintf('%f', k);
end

movie.mov = mov;
movie.nFrames = nFrames;
