function [] = makevideo(background, movie, newVideoName)

v = VideoWriter(newVideoName);
nFrames = movie.nFrames
open(v)
for i=1:nFrames
    frame = imabsdiff(background,movie.mov(i).gray);
    %frame(:,width+2, :) = 0;
    writeVideo(v, frame);
end
close(v)