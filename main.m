video = VideoReader('C:\ICM_project\video\testVideo.mp4');
movie = getStructure(video);


background = getBackground(movie,20,10);
%find the ball
for k = 1:movie.nFrames
[ balls, difference ] = detectBall(movie.mov(k).gray,background,0,1,10);
movie.mov(k).balls = balls;
movie.mov(k).difference = difference;

end

makevideo(movie, 'testFunction_difference.avi', 'testFunction_balls.avi');

