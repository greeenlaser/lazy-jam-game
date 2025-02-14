extends CharacterBody3D

var movement_speed: float = 7.0
var movement_target_position: Vector3 = Vector3(-3.0,0.0,2.0)

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var shape_cast: ShapeCast3D = $ShapeCast3D

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5

	# Make sure to not await during _ready.
	actor_setup.call_deferred()
	
var is_frozen: bool = false
var time_since_freeze: float = 0

func freeze():
	if time_since_freeze >= 10:
		is_frozen = true
		time_since_freeze = 0

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector3):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
	
	if time_since_freeze < 10:
		time_since_freeze += delta
	if is_frozen:
		if time_since_freeze >= 5:
			is_frozen = false
			set_movement_target(global_position)
		else:
			return

	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shape_cast.is_colliding():
		var player = shape_cast.get_collider(0)
		set_movement_target(player.global_position)
