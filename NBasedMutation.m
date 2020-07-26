% Neighbour Based Mutation function 

%Created by Süleyman Utku Daðlý and Zeynep Naz Turan
%%
function[mutChild] = NBasedMutation(parentPop, popSize, mutRate, elitIndex)
[x,y] = size(parentPop);
i = 1;
mutChild = ones(x,1);
while i < popSize
	j = 1;
	while j < length(elitIndex)
    	if(i == elitIndex(1,j) && i+1 == elitIndex(1,j+1))
            if i+2 > popSize
               break; 
            end
        	chrom = parentPop(:,i+2);
        	break;
        	elseif (i == elitIndex(1,j) && i+1 ~= elitIndex(1, j+1))
                if i+1 >popSize
                    break;
                end
            	chrom = parentPop(:, i+1);
            	break;
            else
            	chrom = parentPop(:,i);
                end
                j = j+1;
            end
                
            mutP1 = ceil((x-1) *rand());
            mutP2 = mutP1 + 1;
                
            temp = chrom(mutP1, 1);
            chrom(mutP1,1) = chrom(mutP2,1);
            chrom(mutP2,1) = temp;
            child = chrom;
                
            Child(:, i) = child;
            i = i+1;
end
        
%         AChild = table2array(Child);
        
        mRate = mutRate * popSize;
        for co = 1:mRate
        	randPoint = ceil((y-1) *rand());
        	mutChild(:,co) = Child(:, randPoint);
        end
end
