# Swift-Battlesnake
Battlesnake is a multiplayer programming game played by developers all over the world. Each participant creates an AI to compete for resources with other agents. The agents have a fixes amount of time (500ms) to respond with their next move each turn.

# Strategy
This particular battlesnake was written in Swift as an exercise. It uses the Minimax algorithm and Alpha-Beta pruning to choose an optimal direction. The minimax uses a heuristic based on the floodfill of its end state and its hunger to determine which moves are desirable.

![image](https://user-images.githubusercontent.com/32989729/162643794-e91744e8-649e-4861-8e71-2bfcd1570c21.png)

This project also contains unit tests for many of the functions using XCode's unit test system.
