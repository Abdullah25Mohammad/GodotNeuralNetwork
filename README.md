# GodotNeuralNetwork

## Matrix Class
The following files are an implementation of matrix data structures and a matrix operation helper class. Since Godot doesn't natively support n by m matrices, I implemented them using 2d arrays. This implementation includes getting the transpose and filling the matrices with specific values or random values. This class also supports mutating the matrix and scaling the matrix. Other methods also including getting the max element, making the matrix sparse (removing certain values), and getters for dimensions.

## NP helper class
This helper class is meant to imitate NumPy. Though this class does not nearly have as many functions as the original NumPy, it does include the necessary functions to create layers of neural networks. Such include `.add(m1, m2)`, `.matmul(m1, m2)`, `.inner(m1, m2)`, and `.outer(m1, m2)`.

## Layer class
The layer class represents a layer of the Neural Network. This wraps the matrices for matrix multiplication and bias addition in one simple class. Calling `.forward(x)` will feedforward the network. This activates using ReLu, but other methods like sigmoid activation or tanh activation can be easily coded in.

## Network class
Network is a class for a neural network. This requires some recoding depending on your use case. Currently, it takes in 7 inputs, passes it through a layer with 10 neurons, and then through a second layer with 10 neurons, and then finally to an output layer with one neuron. You can easily modify these parameters, and add more layers if necessary.  
  
This network class can be used by calling `.forward(x)` where x is your input as a list. It will convert this list of values into a column vector that can be easily used alongside the layer classes and matrices within these classes for matrix multiplication and addition. It will do this and return a vector matrix containing the outputs depending on how many neurons you choose to have in the output layer.

## Final Comments
This network is a very bare-bones version of real neural networks. It does not support backpropagation and works best with the genetic algorithm and reinforcement learning. Since this is implemented in Godot's GDScript, it is perfect for training simulations to learn to play custom games created in the Godot Game Engine.
