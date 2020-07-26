%In our project we have orders which will be picked in the warehouse. So to
%minimize the time that spent and to deliver the orders as soon as possible
%we need to create batches for group of orders. This batches will be assign
%to pickers. To create most appropriate batches we will use Genetic
%Algorithm (GA). We will use elitist selection from the initial population. 
%Then we will use Traveling Salesman Problem (TSP) as our fitness function
%to find the shortest path. Then we will apply mutation and crossover to
%crate new generation.Than we will calculate their fitness again. We will
%follow these steps until we reach our stoping criteria. In our initial
%population we have two sub cromosomes. In first subchromosome there is
%orders which assigned to a batch. In second subchromosome there is batch
%size which is represent that the amount of product at the first
%subchromosome. We are creating these batches according to the size of the
%pickers car.

%Created by Süleyman Utku Daðlý and Zeynep Naz Turan

%%
function [bestBatchParent, bestProdParent, elitCost] = genAlg(InitialProduct, InitialBatchSizes, ShelfInfo)

%Initialize the subchromosomes
popSize = 50;
[parentProdPop] = Initialize(popSize, InitialProduct);
[parentBatchPop] = Initialize(popSize, InitialBatchSizes);

%Initialize parameters
mutRate = 0.02;
CrossRate = 0.8;
elitRate = 0.18;
maxIter = 100;
index = 1;
checkCond = zeros(1,25);
checkValue = 0;
cI = 1;
elitCost = 0;
bestProdParent = 0;
bestBatchParent = 0;
ind = 1;
%%
%Main loop 
while index< maxIter && checkCond(1,25) == 0
    index
    %finding elitist chromosomes
    [elitchromosomes, elitCost] = elitisizm(parentProdPop, parentBatchPop, ShelfInfo, popSize,elitRate);
    [~, ECC] = size(elitchromosomes);
    for el = 1:ECC
        survivedProdChild(:,el) = parentProdPop(:,elitchromosomes(1,el));
        survivedBatchChild(:,el) = parentBatchPop(:,elitchromosomes(1,el));
    end
    
    %Two point crossover for batchSize and position based for product
    [COChildProdPop] = crossover(parentProdPop, popSize, CrossRate, elitchromosomes, "PBased");
    [COChildBatchPop] = crossover(parentBatchPop, popSize, CrossRate, elitchromosomes, "Two");
    
    %Swap based mutation for batchSize and Neigbour based mutation for prod
    [mutChildProdPop] = NBasedMutation(parentProdPop, popSize, mutRate, elitchromosomes);
    [mutChildBatchPop] = mutation(parentBatchPop, popSize, mutRate, elitchromosomes);
    
    %find the best chromosome
    bestProdParent = parentProdPop(:, elitchromosomes(1,1));
    bestBatchParent = parentBatchPop(:, elitchromosomes(1,1));
    
    
    %create next generation
    parentProdPop = [survivedProdChild, COChildProdPop, mutChildProdPop];
    parentBatchPop = [survivedBatchChild, COChildBatchPop, mutChildBatchPop];
    
    
    %Check condition if the last 50 conditoin is the same
    if(elitCost == checkValue)
        checkCond(1,ind) = elitCost;
        ind = ind + 1;
    else
        checkValue = elitCost;
        ind = 1;
    end
    cTable (index) = elitCost;
    indTable(index) = index;
    index = index+1;
    
end

    figure
    plot(indTable, cTable, 'r*-', 'LineWidth', 3);
    xlabel('Generation');
    ylabel('Fitness of the best elite');
    grid on;
    
    [xxx,y] = printPath(bestProdParent, bestBatchParent, ShelfInfo);
    
end