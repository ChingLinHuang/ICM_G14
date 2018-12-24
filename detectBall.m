function [ balls, test2] = detectBall( frame, background, f, pix_min, pix_max,nd )
%test
%frame = movie.mov(58).gray;
%f=0.7;
%pix_min = 80;
%pix_max = 800;
%nd =10;

difference = imabsdiff(frame, background);
differenceMed = mean(mean(double(difference)));

dif = double(difference).^2-differenceMed^2;
difMed = mean(mean(dif));

bw = (dif>difMed*f);
test1=uint8(bw*255);
%remove small objects
bw = bwareaopen(bw, pix_min);
test2=uint8(bw*255);

SE = strel('disk', nd);
bw = imclose(bw, SE);
test3 = bw;

%remove big objects
bw = bw - bwareaopen(bw,pix_max);
test4 = bw;

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
%imshow(balls)
