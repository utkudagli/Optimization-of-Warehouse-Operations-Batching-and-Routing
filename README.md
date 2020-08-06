# Optimization-of-Warehouse-Operations-Batching-and-Routing
Bachelor Thesis

We have created an optimization solution of a given scenario in a warehouse with the Genetic Algorithm using Matlab. 

In basic, we have a warehouse and in this warehouse on shelves we have bunch of different product with different shape, size and volume. Then we have a picker. This picker has a list (we call them batches) with group of products. So the case is this picker will go to the ware house he/she going to collect products in the batch and he/she will return where he/she started.

In our project we have orders which will be picked in the warehouse. To minimize the time that spent and to deliver the orders as soon as possible we needed to create batches for group of orders. This batches will be assign to pickers. To create most appropriate batches we used Genetic Algorithm (GA). We used elitist selection from the initial population. Then we used Traveling Salesman Problem (TSP) as our fitness function to find the shortest path. Then we applied mutation and crossover to crate new generation.Than we calculated their fitness again. We followed these steps until we reach our stoping criteria. 

In our initial population we have two sub cromosomes. In first subchromosome there is orders which assigned to a batch. In second subchromosome there is batch size which is represent that the amount of product at the first subchromosome. We are creating these batches according to the size of the pickers car.
