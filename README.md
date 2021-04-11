# Optimization-of-Warehouse-Operations-Batching-and-Routing
Bachelor Thesis

We have created an optimization solution of a given scenario in a warehouse with the Genetic Algorithm using Matlab.

In basic, we have a warehouse and in this warehouse, on shelves, we have a bunch of different product with different shape, size and volume. Then we have a picker. This picker has a list (we call them batches) with a group of products. So the case is this picker will go to the warehouse he/she going to collect products in the batch and he/she will return where he/she started.

In our project, we have orders which will be picked in the warehouse. To minimize the time spent and to deliver the orders as soon as possible we needed to create batches for a group of orders. These batches will be assigned to pickers. To create the most appropriate batches we used Genetic Algorithm (GA). We used an elitist selection from the initial population. Then we used Traveling Salesman Problem (TSP) as our fitness function to find the shortest path. Then we applied mutation and crossover to create a new generation. Then we calculated their fitness again. We followed these steps until we reach our stopping criteria.

In our initial population, we have two sub chromosomes. In the first subchromosome, there are orders assigned to a batch. In the second subchromosome, there is a batch size which represents that the amount of product at the first subchromosome. We are creating these batches according to the size of the pickers car.
