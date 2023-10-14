extends Node2D

# Constants for character states
enum CharacterState { IDLE, FIGHTING, VICTORY, DEFEAT }

# Reference to the characters (Sprite nodes)
var character1: Sprite
var character2: Sprite

# State variables for characters
var character1State: CharacterState = CharacterState.IDLE
var character2State: CharacterState = CharacterState.IDLE

# Label nodes for displaying messages
var victoryLabel: Label
var defeatLabel: Label

func _ready():
	# Initialize references to characters and labels
	character1 = $Character1
	character2 = $Character2
	victoryLabel = $VictoryLabel
	defeatLabel = $DefeatLabel

	# Start the fight
	startFight()

func startFight():
	character1State = CharacterState.FIGHTING
	character2State = CharacterState.FIGHTING
	# Play the fighting animation for both characters

func endFight(winner: int):
	character1State = CharacterState.IDLE
	character2State = CharacterState.IDLE
	# Stop the fighting animations

	if winner == 1:
		displayVictory()
	else:
		displayDefeat()

func displayVictory():
	character1State = CharacterState.VICTORY
	# Show victory animation for character 1
	victoryLabel.text = "Character 1 Wins!"
	victoryLabel.show()

func displayDefeat():
	character2State = CharacterState.DEFEAT
	# Show defeat animation for character 2
	defeatLabel.text = "Character 2 Wins!"
	defeatLabel.show()
