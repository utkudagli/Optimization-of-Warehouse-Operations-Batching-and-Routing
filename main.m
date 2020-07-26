%%Main function for the project

%Created by Süleyman Utku Daðlý and Zeynep Naz Turan
%%

%Initializing the shelf infos
shelfInfo = ShelfInfo;

%Initialize the order info and size of the order. In ordersInfo there is
%productIds and order volumes. Every row represents a order.
InitialOrderInfo = ordersInfo;
[orderx, ordery] = size(InitialOrderInfo);

%Seperate productIds and their volume
for i=1: orderx
    copy = InitialOrderInfo{i,1};
    InitialProduct(i,1) = copy;
end

%create initial batch sizes
cap = 0;
i = 1;
cartCap = 2000;
batchVol = 0;
Batches = zeros(1,1);
totalCap = 0;
check = orderx;
while(i < orderx)
   if(batchVol < cartCap)
       batchVol = batchVol + InitialOrderInfo{i,2};
       cap = cap + 1;
       i = i+1;
   else
       i = i-1;
       totalCap = totalCap + cap;
       check = check - cap;
       Batches = [Batches; cap];
       batchVol = 0;
       cap = 0;
   end
end
if check > 0
      cap = abs(check);
      totalCap = totalCap + cap;
      check = check - cap;
      Batches = [Batches; cap];
end
Batches(1,:) = [];

[bestBatchSize, bestProdParent, elitCost] = genAlg (InitialProduct, Batches, shelfInfo);