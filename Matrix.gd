class_name Matrix extends Node

var matrix = []

var NP = np.new()

# Called when the node enters the scene tree for the first time.
func _init(rows=3, cols=3, mode="r"):
	for r in range(rows):
		var row = []
		for c in range(cols):
			var val
			if typeof(mode) == TYPE_INT:
				val = int(mode)
			elif mode == "r":
				val = randf()
			row.append(val)
		matrix.append(row)
	
	#print(matrix)

func getRows():
	return len(matrix)

func getCols():
	return len(matrix[0])

func _to_string():
	return str(matrix)

func toVal(val):
	for ri in range(len(matrix)):
		for ci in range(len(matrix[0])):
			matrix[ri][ci] = val
	
	return self

func toRand():
	for ri in range(len(matrix)):
		for ci in range(len(matrix[0])):
			var val = randf()
			matrix[ri][ci] = val
	
	return self

func toRandRange(l:float=-1.0, h:float=1.0):
	for ri in range(len(matrix)):
		for ci in range(len(matrix[0])):
			var val = randf_range(l, h)
			matrix[ri][ci] = val
	
	return self

func T():
	var m_rows = len(matrix)
	var m_cols = len(matrix[0])
	
	var transposed = []
	# Transpose
	for r in range(m_cols):
		var row = []
		for c in range(m_rows):
			var val
			val = matrix[c][r]
			row.append(val)
		transposed.append(row)
		
	var out = Matrix.new(m_cols, m_rows)
	out.matrix = transposed
	return out
	
func scale(k):
	for ri in range(len(matrix)):
		for ci in range(len(matrix[0])):
			matrix[ri][ci] = k * matrix[ri][ci]
	
	return self
			
			
func max():
	var maxes = []
	for row in matrix:
		maxes.append(row.max())
	
	return maxes.max()

func makeSparse(percentSparse:float):
	percentSparse = clampf(percentSparse, 0.0, 1.0)
	
	for ri in range(len(matrix)):
		for ci in range(len(matrix[0])):
			if randf() <= percentSparse:
				matrix[ri][ci] = 0
	
	return self

func mutate(strength:float=0.2, sparsity:float=0.5):
	"""actually mutates this matrix"""
	matrix = mutated(strength, sparsity).matrix
	
	return self

func mutated(strength:float=0.2, sparsity:float=0.5):
	""""returns a new matrix"""
	# Creating matrix of appropriate size
	var mut_matrix:Matrix = Matrix.new(getRows(), getCols(), 0)
	
	# Mutation Matrix
	mut_matrix.toRandRange(-strength, strength)
	mut_matrix.makeSparse(sparsity)
	
	var out = NP.add(self, mut_matrix)
	
	return out
	
	

	

