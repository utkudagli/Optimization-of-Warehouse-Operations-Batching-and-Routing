%This script creates the manhattan distance for the shelf which should be visited

%Created by Süleyman Utku Daðlý and Zeynep Naz Turan

%%
%Initialize the x and y coordinates for the batch 
function[dMat] = tspmd(XY)
xy = XY;
[m,~] = size(xy);

%%
%Calculates the manhattan distance of the shelves which will be visited and
%creates the distance matrix
for i = 1:m
    for a = 1:m
        manDist = abs((xy(i,1)-xy(a,1)))+abs((xy(i,2)-xy(a,2)));
        dMat(i,a)=  manDist;
    end
end

%%
%Change the zeros with NaN value because when we calculating their cost we
%don't want to count the zeros
for i = 1:m
   for j = 1:m
       if dMat(i,j) == 0
            dMat(i,j) = NaN;
       end
   end
end
end