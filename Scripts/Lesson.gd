extends Resource
class_name lesson

@export_multiline var label1
@export_multiline var label2
@export_multiline var label3
@export_multiline var label4
@export_multiline var label5
@export_multiline var label6
@export_multiline var label7
@export_multiline var label8
var labels :Array

func export() -> Array:
	labels.append(label1)
	labels.append(label2)
	labels.append(label3)
	labels.append(label4)
	labels.append(label5)
	labels.append(label6)
	labels.append(label7)
	labels.append(label8)
	return labels
