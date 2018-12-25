function [ balls, position] = detectBall( frame, background, f, pix_min, pix_max,nd)
%test
%frame = movie.mov(49).gray;
%f=1.5;
%pix_min = 25;
%pix_max = 800;
%nd =10;
%med_inf = 140;

difference = imabsdiff(frame, background);
differenceMed = mean(mean(double(difference)));

dif = double(difference).^2-differenceMed^2;
difMed = mean(mean(dif));

bw = (dif>difMed*f);
%test1=uint8(bw*255);
%remove small objects
bw = bwareaopen(bw, pix_min);
%test2=uint8(bw*255);

SE = strel('disk', nd);
bw = imclose(bw, SE);
%test3 = bw;

%remove big objects
bw = bw - bwareaopen(bw,pix_max);
%test4 = bw;

[balls, nCG] = bwlabeln(bw);

med = 0;
for i=1:nCG
    m = mean(mean(dif(balls == i)));
    if m > med
        med = mean(mean(dif(balls == i)));
        balls = (balls == i);
    end
end

[row column] = getPosition(balls);
position = [row column];
balls = uint8(balls*255);
%{
if (med > med_inf)  & (row>0)
    position = [row column];
    balls = uint8(balls*255);
else
    position =[0 0];
    balls = (balls == balls)*0;
end
%}    
%imshow(movie.mov(60).rgb)
%imshow(balls)
