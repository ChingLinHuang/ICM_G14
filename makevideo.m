function [] = makevideo(movie, videoName1, videoName2)
%This is a function to export video

nFrames = movie.nFrames
v = VideoWriter(videoName1);
open(v)
for i=1:nFrames
    writeVideo(v, movie.mov(i).difference);
end
close(v)


w = VideoWriter(videoName2);
open(w)
for i=1:nFrames
    writeVideo(w, movie.mov(i).balls);
end
close(w)

