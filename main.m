video = VideoReader('C:\ICM_project\video\testVideo2.mp4');
movie = getStructure(video);


background = getBackground(movie,20,10);

 
%find the ball
for k = 1:movie.nFrames
[ balls, position ] = detectBall(movie.mov(k).gray,background,0.1,25,800,10,80);
movie.mov(k).balls = balls;
movie.mov(k).position = position;
%movie.mov(k).difference = difference;
end

makevideo(movie, 'testFunction_balls.avi');
movie = removeOthers(movie,800);




makevideo(movie, 'testFunction_balls_removed.avi');

