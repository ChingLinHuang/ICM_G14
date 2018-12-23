function [ balls, difference ] = detectBall( frame, background, f, pix_min, nd )
%test
%frame = movie.mov(60).gray;
%f=0;
%pix_min = 10;
%nd =10;

difference = imabsdiff(frame, background);
differenceMed = mean(mean(double(difference)));

dif = double(difference).^2-differenceMed^2;
difMed = mean(mean(dif));

bw = (dif>difMed*f);
bw = bwareaopen(bw, pix_min);
SE = strel('disk', nd);
bw = imclose(bw, SE);
balls = bwlabeln(bw);
balls = uint8(balls);

%imshow(movie.mov(60).rgb)
%imshow(difference)
