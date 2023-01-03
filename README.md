<font size="30">**Knight Travail Project**</font>
<br>

This project was made for the Odin Project. It is written in vanilla Ruby for the terminal.<br>
It is a simple chess board with only one knight. You choose a starting coordinate and an ending coordinate, and the program will find a path from the start to the end, moving only as a knight is allowed (only moves in the L shape). 

To find the path, the program utilises a multi-way tree and searches it  using the level order method.<br>
Each node contains a @position, for example, [3,4], and a @from value, which points to the node that created it. <br>
The tree is initialized with the starting position as the root, it's @from value is nil <br>
It then checks all the squares it can move to, and creates a new node for each possible move, with their respective coordinates and their @from values all points to the node that created it. These new nodes are added as it's children in the tree, then they are all pushed onto the queue.<br>
The program repeats this with the next value in the queue, until it detects that it has reached the desired endpoint, at which point it will simply follow the @from values back to the root, recording the path into an array to display to the user.