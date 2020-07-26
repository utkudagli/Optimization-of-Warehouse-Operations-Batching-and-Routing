%This script finds the shelves which will be visited for each product.
%In our problem pickers knows the places of the products so for this we
%need to tell our program where are the products.
%Then with it will match the products location with shelf location then it
%will find which shelf to go.
%This product may exist more than one shelf so it finds the closest shelf
%for that product.

%Created by Süleyman Utku Daðlý and Zeynep Naz Turan

%%
%Initilize the function
function [uniquexy] = matching(BatchInfo, ShelfInfo)
[BIR,BIC] = size(BatchInfo);
[SIR,SIC] = size(ShelfInfo);
%%
%To match the orders and shelves with each other so after this lines of
%code program knows which product may collect from which shelves.
xz = zeros(1,1);
yz = zeros(1,1);
order = zeros (1,1);
for i = 1:BIR
    for j = 1:SIR
        if BatchInfo(i,1) == ShelfInfo{j,1}
            ordvalue = ShelfInfo{j,1};
            xvalue = ShelfInfo{j,2};
            yvalue = ShelfInfo{j,3};
            order = [order; ordvalue];
            xz = [xz; xvalue];
            yz = [yz; yvalue];
        end
    end
end

%In previous part our program calculates for every product in the batch 
%after that part we need to record only unique values.   
orderxy = [order xz yz];
uniorderxy = unique(orderxy, 'rows');

%%
%This part calculates the closest shelves
%It first the calculates the distance with current shelf next location then
%decides which path that it should follow
[uniqx, uniy] = size(uniorderxy);
temDist = 1000000;
xy = zeros(1,2);
[sizex, ~] = size(xy);
temp = uniorderxy(1,1);
x = zeros(1,1);
y = zeros(1,1);
i = 1;
j = 2;
temX = 0;
temY = 0;
while i <= sizex
    while j <= uniqx
        if temp == uniorderxy(j,1)
           manDist = abs((uniorderxy(j,2)-xy(i,1)))+abs((uniorderxy(j,3)-xy(i,2)));
           if manDist <= temDist
               temDist = manDist;
               temX = uniorderxy(j,2);
               temY = uniorderxy(j,3);              
           end
           if j == uniqx
               temX = uniorderxy(j,2);
               temY = uniorderxy(j,3);
               temxy = [temX temY];
               xy = [xy; temxy];
           end
        else
            temp = uniorderxy(j,1);
            temxy = [temX temY];
            xy = [xy; temxy];
            i = i+1;
            j = j-1;
            [sizex, ~] = size(xy);
            temDist = 1000000;
        end
        j = j+1;   
    end
    i = i+1;
end

%%
%This part matches the locations with the shelf names
%It starts with A0 which means entrance point than decides which shelves
%must be visited
uniquexy = unique(xy, 'rows');
[ux, uy] = size(uniquexy);
shelves = 'A0';

for i = 1:ux
    for j = 1:SIR
        if (uniquexy(i, 1) == ShelfInfo{j, 2}) && (uniquexy(i, 2) == ShelfInfo{j, 3})
            shelf = ShelfInfo{j,4};
            shelves = [shelves; shelf];
        end
    end
end
uShelves = unique(shelves, 'stable');
end