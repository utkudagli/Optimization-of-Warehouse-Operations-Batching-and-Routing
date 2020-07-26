%This function will do the crossover operation for the given parents.

%%Created by Süleyman Utku Daðlý and Zeynep Naz Turan

%%
function [COChild] = crossover (parentPop, popSize, crossRate, elitIndex, coStatus)
[x, y] = size(parentPop);
[xx,yy] = size(parentPop);
        if coStatus == "Two"
            totxx = 0;
            for ff = 1:xx
                totxx = totxx + parentPop(ff,1);
            end
             i = 1;
             while(i < popSize-2)
                 j =1;
                while j < length(elitIndex)
                     if(i == elitIndex(1,j) || i+1 == elitIndex(1,j))
                        if(i == elitIndex(1,j) && i+1 ~= elitIndex(1,j+1))
                            if i+2 > popSize
                                break;
                            end
                            chrom1 = parentPop(:,i+1);
                            chrom2 = parentPop(:,i+2);
                            break;
                        elseif(i == elitIndex(1,j) && i+1 == elitIndex(1,j+1))
                            if i+4>popSize
                               break; 
                            end
                            chrom1 = parentPop(:,i+3);
                            chrom2 = parentPop(:,i+4);
                            j=j+1;
                            break;
                        end
                     else
                        chrom1 = parentPop(:,i);
                        chrom2 = parentPop(:,i+1);
                     end
                     j = j+1;
                end
                totCapC1 = 0;
                totCapC2 = 0;
                
                     crossP1 = ceil((x-1) *rand());
                     crossP2 = crossP1;

                     while crossP1 == crossP2
                           crossP2 = ceil((x-1) * rand());
                     end

                     if crossP1 > crossP2
                            temp = crossP1;
                            crossP1 = crossP2;
                            crossP2 = temp;
                      end

                      P1 = chrom1(1:crossP1,1);
                      P2 = chrom2(crossP1+1:crossP2,1);
                      P3 = chrom1(crossP2+1: x, 1);

                      child1 = [P1; P2; P3];

                      P1 = chrom2(1:crossP1,1);
                      P2 = chrom1(crossP1+1:crossP2,1 );
                      P3 = chrom2(crossP2 +1: x, 1);

                      child2= [P1; P2; P3];
                      
                        capC1 = 0;
                        capC2 = 0;
                        totCapC1 = 0;
                        totCapC2 = 0;
                        for a = 1:x
                            capC1 = child1(a,1);
                            capC2 = child2(a,1);
                            totCapC1 = totCapC1 + capC1;
                            totCapC2 = totCapC2 + capC2;
                        end
                   while totCapC1 > totxx || totCapC1< totxx 
                        while totCapC1 > totxx
                            capc1 = totCapC1 - totxx;
                            totCapC1 = totCapC1 - capc1;
                            for a = 1:capc1
                                p = ceil((x-1) * rand());
                                if child1(p,1) <= 0
                                    p1 = p;
                                    while p == p1
                                        p1 = ceil((x-1) * rand());
                                        if p ~= p1 && child1(p1,1) > 0
                                            child1(p1,1) = child1(p1,1)-1;
                                        end
                                    end
                                else
                                    child1(p,1) = child1(p,1)-1;
                                end
                            end
                            break;
                        end
                        while totCapC1 < totxx
                            capc1 = totxx-totCapC1;
                            totCapC1 = totCapC1 + capc1;
                            for a = 1:capc1
                                p = ceil((x-1) * rand());
                                child1(p,1) = child1(p,1) + 1;
                            end
                            if totCapC1 == totxx
                               break; 
                            end
                        end
                   end
                   
                  while totCapC2 > totxx || totCapC2< totxx      
                        while totCapC2 > totxx
                            capc2 = totCapC2 - xx;
                            totCapC2 = totCapC2 - capc2;
                            for a = 1:capc2
                                p = ceil((x-1) * rand());
                                if child2(p,1) <= 0 
                                    p2 = p;
                                    while p == p2
                                        p2 = ceil((x-1) * rand());
                                        if p ~= p2 && child2(p2, 1) > 0
                                            child2(p2,1) = child2(p2,1)-1;
                                        end
                                    end
                                else
                                    child2(p,1) = child2(p,1)-1;
                                end
                            end
                            break;
                        end
                        while totCapC2 < totxx
                            capc2 = totxx-totCapC2;
                            totCapC2 = totCapC2 + capc2;
                            for a = 1:capc2
                                p = ceil((x-1) * rand());
                                child2(p,1) = child2(p,1) + 1;
                            end
                            if totCapC2 == totxx
                               break; 
                            end
                        end
                  end

                      Child(:, i) = child1;
                      Child(:, i+1) = child2;
                      i = i+2;
                      
             end
          xRate = crossRate * popSize;
          for co = 1:xRate-1
              randPoint = ceil((y-2)* rand());
              COChild(:,co) = Child(:, randPoint);
          end
          CoChild = COChild;
%%          
        elseif coStatus == "PBased"
             i=1;
             select = parentPop(:,1);
             uniquepar = unique(select);
             [ux, ~] = size(uniquepar);
             while i<popSize-1
                 j =1;
                while j < length(elitIndex)
                     if(i == elitIndex(1,j) || i+1 == elitIndex(1,j))
                        if(i == elitIndex(1,j) && i+1 ~= elitIndex(1,j+1))
                            if(i+2> popSize)
                               break; 
                            end
                            chrom1 = parentPop(:,i+1);
                            chrom2 = parentPop(:,i+2);
                            break;
                        elseif(i == elitIndex(1,j) && i+1 == elitIndex(1,j+1))
                            if(i+4 > popSize)
                               break; 
                            end
                            chrom1 = parentPop(:,i+3);
                            chrom2 = parentPop(:,i+4);
                            j=j+1;
                            break;
                        end
                     else
                        chrom1 = parentPop(:,i);
                        chrom2 = parentPop(:,i+1);
                     end
                     j = j+1;
                end
%                 Chrom1 = table2array(chrom1);
%                 Chrom2 = table2array(chrom2);
                b = 1;
                [c1R,~] = size(chrom1);
                child1 = zeros(c1R,1);
                child2 = zeros(c1R,1);
                     while b< x/2-1   
                        crossP1 = ceil((x-1) *rand());
                        crossP2 = crossP1;

                        while crossP1 == crossP2
                            crossP2 = ceil((x-1) * rand());
                        end
                        
                        if chrom1(crossP1,1) ~= 0 && chrom1(crossP2, 1) ~= 0 
                            child1(crossP1, 1) = chrom1(crossP1, 1);
                            chrom1(crossP1, 1) = 0;
                            child1(crossP2, 1) = chrom1(crossP2, 1);
                            chrom1(crossP2, 1) = 0;
                        end
                        if chrom2(crossP1,1) ~= 0 && chrom2(crossP2, 1) ~= 0
                            child2(crossP1, 1) = chrom2(crossP1, 1);
                            chrom2(crossP1, 1) = 0;
                            child2(crossP2, 1) = chrom2(crossP2, 1);
                            chrom2(crossP2, 1) = 0;
                        end
                        b=b+1;
                     end
                     
                     c1 = 1;
                     c2 = 1;
                     while c1 <= c1R
                         if (c1 == c1R+1 || c2 == c1R+1)
                                break; 
                         end
                         while c2 <= c1R
                            if (c1 == c1R+1 || c2 == c1R+1)
                                break; 
                            end
                            if child1(c1,1) == 0 || chrom2(c2,1) ~=0
                                if child1(c1,1) == 0 && chrom2(c2,1) ~=0
                                    child1(c1,1) = chrom2(c2,1);
                                    c1 = c1+ 1;
                                    c2 = c2 +1;
                                elseif child1(c1,1) ~= 0 && chrom2(c2,1) ~=0
                                    c1 = c1+ 1;
                                elseif child1(c1,1) == 0 && chrom2(c2,1) ==0
                                    c2 = c2 +1;
                                end
                            else
                                c1 = c1+ 1;
                                c2 = c2 +1;
                            end
                         end
                     end
                     
                     c1 = 1;
                     c2 = 1;
                     while c2 <= c1R
                         if (c1 == c1R+1 || c2 == c1R+1)
                            break; 
                         end
                         while c1 <= c1R
                             if (c1 == c1R+1 || c2 == c1R+1)
                                break; 
                             end
                            if (child2(c2,1) == 0 || chrom1(c1,1) ~=0) 
                                if child2(c2,1) == 0 && chrom1(c1,1) ~=0
                                    child2(c2,1) = chrom1(c1,1);
                                    c2 = c2+ 1;
                                    c1 = c1 +1;
                                elseif child2(c2,1) ~= 0 && chrom1(c1,1) ~=0
                                    c2 = c2+ 1;
                                elseif child2(c2,1) == 0 && chrom1(c1,1) ==0
                                    c1 = c1 +1;
                                end
                            else
                                c2 = c2+ 1;
                                c1 = c1 +1;
                            end
                         end
                     end
                     
                     g = 1;
                     while g <= ux
                        h = 1;
                        checkCond = 0;
                        while h <= x
                           if child1(h, 1) == uniquepar(g,1)
                              g = g+1;
                              checkCond = 1;
                              break;
                           end
                         h = h +1;
                        end
                        if checkCond == 0
                           ra = ceil((x-1) * rand());
                           child1(ra,1) = uniquepar(g,1);
                           g = 1;
                        end
                     end
                     
                     g = 1;
                     while g <= ux
                        h = 1;
                        checkCond = 0;
                        while h <= x
                           if child2(h, 1) == uniquepar(g,1)
                              g = g+1;
                              checkCond = 1;
                              break;
                           end
                        h = h +1;
                        end
                        if checkCond == 0
                            ra = ceil((x-1) * rand());
                            child2(ra,1) = uniquepar(g,1);
                            g = 1;
                        end
                     end
                     Child(:, i) = child1;
                     Child(:, i+1) = child2;
                     i = i+2;
             end
             xRate = crossRate * popSize;
             for co = 1:xRate
                randPoint = ceil((y-2)* rand());
                COChild(:,co) = Child(:, randPoint);
             end
             CoChild = COChild;
        end
end