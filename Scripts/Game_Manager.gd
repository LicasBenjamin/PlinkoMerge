extends Node

###Global Signals
##Outgoing Signals
#Round Start
signal round_started
#Round End
signal round_ended
#UI Update
signal update_UI(current_score : int, target_score : int)
#Chip Spawned
signal chip_spawned
#Notify Game Loss
signal notify_loss
##Incoming Signals
#Chip Landed

#Enum
#Game State
enum State {Playing, Idle}

##Constants
#Total Chips
const total_chips = 5

##Global Variables
#Current Round
var current_round := 0
#Current Game State
var current_state := State.Idle
#Current Score
var current_score := 0
#Target Score
var target_score := 1
#Remaining Chips
var remaining_chips = total_chips
#Chips in play
var chips_dropping = 0
#Enemy values saved
var enemy_1_value
var enemy_2_value
var enemy_3_value

##Global Functions
#Start Round
func start_round(enemy: EnemyData):
	#increase round number, reset the score, change the state to Playing
	current_round += 1
	current_score = 0
	current_state = State.Playing
	target_score = enemy.target_score
	remaining_chips = total_chips
	chips_dropping = 0
	#emit signals for round start and update UI
	chip_spawned.emit()
	round_started.emit()
	update_UI.emit(current_score, target_score)

#End Round
func end_round():
	#check for win or lose, change state to Idle
	#if won
	Currency.add_c_coins(target_score)
	current_state = State.Idle
	round_ended.emit()

#Need a function for when score is changed from award area
func add_score(score : int):
	if(current_state == State.Idle):
		return
	current_score += score
	
	chips_dropping -= 1
	update_UI.emit(current_score, target_score)
	
	if(current_score >= target_score):
		end_round()
	if(chips_dropping == 0 && current_score < target_score):
		notify_loss.emit()

func request_chip():
	if remaining_chips == 0:
		return false
	remaining_chips -= 1
	chips_dropping += 1
	chip_spawned.emit()
	return true

func set_enemies(enemy_1, enemy_2, enemy_3):
	enemy_1_value = enemy_1
	enemy_2_value = enemy_2
	enemy_3_value = enemy_3
