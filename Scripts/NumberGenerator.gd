extends Node2D

onready var LabelNode = get_node("../Label")
onready var LineEditNode = get_node("../LineEdit")
onready var CalculationsNode = get_node("../Calculations")

var rnd = RandomNumberGenerator.new()

var num1 = 0
var num2 = 0

var operation_list = [".", ":", "."]
var operation = "."

var list_of_nums
var list = [[1,0],[2,0],[3,0],[4,0],[5,0],[1,1],\
					[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[2,10], \
					[3,1],[3,2],[3,3],[3,4],[3,5],[3,6],[3,7],[3,8],[3,9],[3,10],\
					[4,1],[4,2],[4,3],[4,4],[4,5],[4,6],[4,7],[4,8],[4,9],[4,10],\
					[5,1],[5,2],[5,3],[5,4],[5,5],[5,6],[5,7],[5,8],[5,9],[5,10],\
					[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7],[6,8],[6,9],[6,10],\
					[7,1],[7,2],[7,3],[7,4],[7,5],[7,6],[7,7],[7,8],[7,9],[7,10],\
					[8,1],[8,2],[8,3],[8,4],[8,5],[8,6],[8,7],[8,8],[8,9],[8,10],\
					[9,1],[9,2],[9,3],[9,4],[9,5],[9,6],[9,7],[9,8],[9,9],[9,10]]

# Called when the node enters the scene tree for the first time.
func _ready():
	rnd.randomize()
	list.shuffle()
	list_of_nums = list.duplicate(true)
	print_to_screen()
	
func print_to_screen():
	operation = operation_list[rnd.randi_range(0,2)]
	if operation == ".":
		num1 = list_of_nums[0][0]
		num2 = list_of_nums[0][1]
		LabelNode.text = str(num1) + " . " + str(num2)
		CalculationsNode.answer = num1 * num2
	elif operation == ":":
		num2 = list_of_nums[0][0]
		var multiple = list_of_nums[0][1]
		num1 = num2 * multiple
		CalculationsNode.answer = num1 / num2
		LabelNode.text = str(num1) + " : " + str(num2)
	list_of_nums.pop_front()
	if list_of_nums.size() == 0:
		list.shuffle()
		list_of_nums = list.duplicate(true)

#func print_to_screen():
#	operation = operation_list[rnd.randi_range(0,2)]
#	if operation == ".":
#		if CalculationsNode.score >= 15:
#			num1 = rnd.randi_range(2,6)
#		else:
#			num1 = rnd.randi_range(0,5)
#		num2 = rnd.randi_range(6,9)
#		LabelNode.text = str(num1) + " . " + str(num2)
#		CalculationsNode.answer = num1 * num2
#	elif operation == ":":
#		num2 = rnd.randi_range(1,9)
#		var multiple
#		if CalculationsNode.score >= 15:
#			multiple = rnd.randi_range(3, 10)
#		else:
#			multiple = rnd.randi_range(0, 6)
#		num1 = num2 * multiple
#		CalculationsNode.answer = num1 / num2
#		LabelNode.text = str(num1) + " : " + str(num2)




