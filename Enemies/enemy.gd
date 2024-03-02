extends CharacterBody2D

@export var movementSpeed = 30.0

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var anim = $AnimationPlayer

func _ready():
	anim.play('walk')

func _physics_process(_delta):
	movement()

func movement():
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movementSpeed
	move_and_slide()
	
	if direction.x > 0.1:
		sprite.flip_h = true
	elif direction.x < -0.1:
		sprite.flip_h = false
			
	
