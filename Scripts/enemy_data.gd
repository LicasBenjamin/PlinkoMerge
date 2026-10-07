extends Resource

class_name EnemyData

enum  Difficulty {Easy, Medium, Hard}

@export var difficulty: Difficulty
@export var target_score : int
@export var reward: int
@export var enemy_id: int

func difficulty_to_string() -> String:
	return Difficulty.keys()[difficulty]
