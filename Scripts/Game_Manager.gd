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

##Global Functions
#Start Round
func start_round():
	#increase round number, reset the score, change the state to Playing
	current_round += 1
	current_score = 0
	current_state = State.Playing
	target_score += current_round
	remaining_chips = total_chips
	#emit signals for round start and update UI
	chip_spawned.emit()
	round_started.emit()
	update_UI.emit(current_score, target_score)

#End Round
func end_round():
	#check for win or lose, change state to Idle
	current_state = State.Idle
	round_ended.emit()

#Need a function for when score is changed from award area
func add_score(score : int):
	current_score += score
	update_UI.emit(current_score, target_score)
	
	if(current_score >= target_score):
		end_round()

func request_chip():
	if remaining_chips == 0:
		return false
	remaining_chips -= 1
	chip_spawned.emit()
	return true
	
