extends Node

var grid = []
var current_player: State = O.new()
var game_active: bool = true

func _ready() -> void:
	$Label.text = get_current_player_message()
	for i in range(3):
		grid.append([])
		for j in range(3):
			grid[i].append(None.new())

func _process(delta: float) -> void:
	if game_active:
		var winner = check_winner()
		if winner.state != State.StateVal.None:
			$Label.text = winner.text + " is the winner!"
			game_active = false
	

	
func check_winner() -> State:
	var row_winner = check_row_winner()
	if row_winner.state != State.StateVal.None:
		return row_winner
	var col_winner = check_col_winner()
	if col_winner.state != State.StateVal.None:
		return col_winner
	var diag_winner = check_diag_winner()
	if diag_winner.state != State.StateVal.None:
		return diag_winner
	return None.new()

func check_row_winner() -> State:
	for i in range(3):
		if (grid[i][0].state == grid[i][1].state and grid[i][1].state == grid[i][2].state) and (grid[i][0].state != State.StateVal.None):
			return grid[i][0]
	return None.new()
	

func check_col_winner() -> State:
	for i in range(3):
		if (grid[0][i].state == grid[1][i].state and grid[1][i].state == grid[2][i].state) and grid[0][i].state != State.StateVal.None:
			return grid[0][i]
	return None.new()
	

func check_diag_winner() -> State:
	if (grid[0][0].state == grid[1][1].state and grid[1][1].state == grid[2][2].state) and grid[0][0].state != State.StateVal.None:
		return grid[0][0]
	if (grid[0][2].state == grid[1][1].state and grid[1][1].state == grid[2][0].state) and grid[0][2].state != State.StateVal.None:
		return grid[0][2]
	return None.new()


func get_current_player_message() -> String:
	return current_player.text  + "'s turn!"


func on_space_pressed(button: Space) -> void:
	var row = button.row
	var col = button.col
	grid[row][col] = current_player
	button.text = current_player.text
	if current_player.state == State.StateVal.X:
		current_player = O.new()
	elif current_player.state == State.StateVal.O:
		current_player = X.new()
	$Label.text = get_current_player_message()

func _on_space_pressed() -> void:
	on_space_pressed($Space1)


func _on_space_2_pressed() -> void:
	on_space_pressed($Space2)


func _on_space_3_pressed() -> void:
	on_space_pressed($Space3)


func _on_space_4_pressed() -> void:
	on_space_pressed($Space4)


func _on_space_5_pressed() -> void:
	on_space_pressed($Space5)


func _on_space_6_pressed() -> void:
	on_space_pressed($Space6)


func _on_space_7_pressed() -> void:
	on_space_pressed($Space7)


func _on_space_8_pressed() -> void:
	on_space_pressed($Space8)


func _on_space_9_pressed() -> void:
	on_space_pressed($Space9)
