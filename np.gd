class_name np extends Node

func add(m1:Matrix, m2:Matrix):
	var rows = len(m1.matrix)
	var cols = len(m1.matrix[0])
	
	var out = Matrix.new(rows, cols, 0)
	
	for r in range(rows):
		for c in range(cols):
			out.matrix[r][c] = m1.matrix[r][c] + m2.matrix[r][c]
	
	return out
	
	

func matmul(m1:Matrix, m2:Matrix):
	if len(m1.matrix[0]) != len(m2.matrix):
		printerr("Invalid Dimensions ", len(m1.matrix[0]), " and ", len(m2.matrix))
		return
	
	var out = Matrix.new(len(m1.matrix), len(m2.matrix[0]), 0)
	
	for i in range(len(m1.matrix)):
		for j in range(len(m2.matrix[0])):
			for k in range(len(m2.matrix)):
				out.matrix[i][j] += m1.matrix[i][k] * m2.matrix[k][j]
				
	return out

func inner(m1:Matrix, m2:Matrix):
	return matmul(m1.T(), m2)


func outer(m1:Matrix, m2:Matrix):
	return matmul(m1, m2.T())


	
	
