class_name Network extends Node

var L1 = Layer.new(7, 10)
var L2 = Layer.new(10, 10)
var L3 = Layer.new(10, 1)

var NP = np.new()

func _init():
	pass

func forward(x):
	var inp = Matrix.new()
	inp.matrix = [x]
	inp = inp.T()
	
	var x1 = L1.forward(inp)  # x is now (10)
	var x2 = L2.forward(x1)   # x is now (10)
	var out = L3.forward(x2)  # out is now (2)
	
	return out

func mutate():
	L1.matrix.mutate(0.5, 0.1)
	L1.bias.mutate(0.5, 0.1)
	
	L2.matrix.mutate(1, 0)
	L2.bias.mutate(1, 0)
	
	L3.matrix.mutate(0.5, 0.1)
	L3.bias.mutate(0.5, 0.1)


