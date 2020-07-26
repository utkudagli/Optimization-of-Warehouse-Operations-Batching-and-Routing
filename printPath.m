function [xx, yy] = printPath(parentProdPop, parentBatchPop, shelfInfo)
[x,~] = size(parentBatchPop);
i = 1;
[xx,yy] = size(parentProdPop);
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
               [~, path, uniquexy] = tsp(batchInfo, shelfInfo);
               [xx,~] = size(path);
               
               for f = 1:xx
               xxx(f) = uniquexy(path(f,1),1);
               y(f) = uniquexy(path(f,1),2);
               end
               figure
               plot(xxx, y, 'r*-', 'LineWidth', 3);
               xlabel('x');
               ylabel('y');
               grid on;
           end
           
           
           a = a + 1;
       end
       a = a-1;
       index = index +a;
       j = j+1;
   end
   i = i+1;
   
end
