%function [disp,movie] = showDisp(movie)
function [movie] = removeOthers(movie,remov_disp)
%remov_disp  = 700;

disp = [];


for k = 1:movie.nFrames-2

    disp = [disp norm(movie.mov(k).position-movie.mov(k+1).position)];

    if disp(end) > remov_disp
        movie.mov(k).balls = movie.mov(k).balls*0;
    end
end

%x = 1:movie.nFrames-1;
%plot(x,disp);

