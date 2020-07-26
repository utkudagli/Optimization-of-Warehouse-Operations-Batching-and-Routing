%This function will calculates the fitness of the batches than will do the
%elitist selection at the parents.
 
%%Created by Süleyman Utku Daðlý and Zeynep Naz Turan

%%
function[elitChromosomes, elitCost] = elitisizm(parentProdPop, parentBatchPop, shelfInfo, popSize, elitR)
%This part calculates each chromosome and finds their costs then it will
%compare with other costs as a result it will return the finest chromosome
%index
[x,y] = size(parentBatchPop);
[xx,yy] = size(parentProdPop);
i = 1;
totalCost = 0;
while i < popSize
   j = 1;
   index = 0;
   while j <= x
       batchIndex = parentBatchPop(j,i);
       a = 1;
       batchInfo = zeros(1,1);
       while a <= batchIndex
           if a+index > xx
              break; 
           end
           batchInfo(a,1) = parentProdPop(a+index,i);
           if (a == batchIndex)
               [cost, ~] = tsp(batchInfo, shelfInfo);
               totalCost = totalCost + cost;
           end
           a = a + 1;
       end
       a = a-1;
       index = index +a;
       j = j+1;
   end
   costTable(1,i) = totalCost;
   i = i+1;
   totalCost = 0;
end

%%
%this part will find the finest chromosomes Indexes
[elitCosts,Index] = sort(costTable);
elitRate = popSize*elitR;
elitChromosomes = zeros(1,1);
for el = 1:elitRate
    elitChromosomes(1,el) = Index(1,el);
end
elitCost = elitCosts(1,1);
end