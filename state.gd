class_name State extends Node

enum StateVal {None, O, X}
var state: StateVal
var text: String

func _init(s: StateVal, t: String):
	state = s
	text = t
