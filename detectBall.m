function [ balls, difference] = detectBall( frame, background, f, pix_min, nd )
%test
%frame = movie.mov(50).gray;
%f=0.01;
%pix_min = 190;
%nd =50;

difference = imabsdiff(frame, background);
differenceMed = mean(mean(double(difference)));

dif = double(difference).^2-differenceMed^2;
difMed = mean(mean(dif));

bw = (dif>difMed*f);
test1=bw;
bw = bwareaopen(bw, pix_min);
test2=bw;
SE = strel('disk', nd);
bw = imclose(bw, SE);
test3 = bw;

[balls, nCG] = bwlabeln(bw);

med = 0;
for i=1:nCG
    m = mean(mean(dif(balls == i)));
    if m > med
        med = mean(mean(dif(balls == i)));
        balls = (balls == i);
    end
end
balls = uint8(balls*255);

%imshow(movie.mov(60).rgb)
%imshow(difference)
