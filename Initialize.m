%This function creates an initial population from our initial chromosome

%Created by Süleyman Utku Daðlý and Zeynep Naz Turan

%%
function [population] = Initialize(popSize, InitialOrd)

[x,~] = size(InitialOrd);
population = zeros(x,1);

for i = 1:popSize
        randchr = randperm(x);
        trandchr = randchr.';
        population = [population, trandchr];
end
population(:,1) = [];

i = 1;
while i <= popSize
    j = 1;
    while j  <= x
        z = 1;
        while z <= x && j <= x
            if population(j,i) == z
                population(j,i) = InitialOrd(z,1);
                j = j+1;
            end
            z = z+1;
        end
    end
    i = i+1;
end

end