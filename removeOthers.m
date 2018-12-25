%function [disp,movie] = showDisp(movie)
function [movie] = removeOthers(movie,remov_disp)
%remov_disp  = 650

disp = [];


for k = 1:movie.nFrames-2

    disp1 = [disp norm(movie.mov(k).position-movie.mov(k+1).position)];
    disp2 = [disp norm(movie.mov(k).position-movie.mov(k+2).position)];
    if (disp1 > remov_disp)&(disp2>remov_disp)
        movie.mov(k).balls = movie.mov(k).balls*0;
    end
end

%x = 1:movie.nFrames-1;
%plot(x,disp);

