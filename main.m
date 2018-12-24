video = VideoReader('C:\ICM_project\video\testVideo2.mp4');
movie = getStructure(video);


background = getBackground(movie,20,10);
%find the ball
for k = 1:movie.nFrames
[ balls, difference ] = detectBall(movie.mov(k).gray,background,0.7,80,800,10);
movie.mov(k).balls = balls;
movie.mov(k).difference = difference;
end



makevideo(movie, 'testFunction_difference.avi', 'testFunction_balls.avi');

