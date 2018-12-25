function [row column] = getPosition(balls_logical)
balls = balls_logical;
[row,column] = find(balls==1);
row = mean(row);
column = mean(column);