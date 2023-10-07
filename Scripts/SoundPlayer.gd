extends Node

enum SoundType { MasterBus = 0, MusicBus = 1, SfxBus = 2, UiBus = 3, AmbienceBus = 4}

@export var sounds: Array[AudioStream]

func _ready():
	for sound in sounds:
		load(sound.get_path())

func _PlaySound(soundId: int, type: SoundType = SoundType.MasterBus, volume: float = 1, pitch: float = 1) -> void:
	var sound: AudioStreamPlayer = AudioStreamPlayer.new()
	sound.stream = sounds[soundId]
	sound.bus = AudioServer.get_bus_name(type)
	sound.volume_db = linear_to_db(volume)
	sound.pitch_scale = pitch
	
	add_child(sound)
	sound.finished.connect(Callable(sound.queue_free))
	sound.play()
