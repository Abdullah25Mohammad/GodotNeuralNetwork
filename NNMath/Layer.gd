class_name Layer extends Node

var matrix
var bias
var last_output

var NP = np.new()

func relu(x:Matrix):
	for ri in range(len(x.matrix)):
		for ci in range(len(x.matrix[0])):
			x.matrix[ri][ci] = max(x.matrix[ri][ci], 0)
	
	return x

func _init(input_size, output_size):
	matrix = (Matrix.new(output_size, input_size)).toRandRange()
	bias = (Matrix.new(output_size, 1)).toRandRange()
	
	last_output = null

func forward(x):	
	var out = NP.add(NP.matmul(matrix, x), bias)
	#last_output = relu(out)
	last_output = out
	return last_output
	
	
	
	
	
