%This func calculates the cost with TSP.

%Created by Süleyman Utku Daðlý and Zeynep Naz Turan
%%
function [cost, path, uniquexy] = tsp(BatchInfo, ShelfInfo)
%%
%First we have to initialize the batch information and shelf information
batchInfo = BatchInfo;
shelfInfo = ShelfInfo;
[uniquexy] = matching(batchInfo, ShelfInfo); %calling the matching script to find which shelves must be visited

XY = uniquexy; %records x and y values of the shelves 
[dMat] = tspmd(XY); %calling the tspmd script to create distance matrix
Dmat = dMat;

%%
%This part calculates the cost between shelves
%So picker must visit every shelf which is not visited then return back to
%the entreance point
[DmatX, DmatY] = size(Dmat);
Shelfs = zeros(1, DmatY); % if 0 it means not visited if 1 it means visited
cost = 0;
current = 1;
path = ones (1,1);
index = 1;
smallest = 0;
for i = 1:DmatX-1
   temp = 100;
   Shelfs(1,current) = 1;
   for j = 1:DmatY
       if Dmat(current,j) < temp && Shelfs(1,j) == 0 
           temp = Dmat(current,j);
           smallest = Dmat(current,j);
           index = j;
       end
       if j == DmatY
           Shelfs(1,index)= 1;
       end
   end
   if Shelfs(1,index)== 1
      path = [path; index];
      cost = cost + smallest;
      current = index;
   end
end
%calculates the last cost from last shelves to entrance point
path = [path; 1];
cost = cost + Dmat(current,1);
end