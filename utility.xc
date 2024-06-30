; Controls
function @read_seat($alias:text) : text
	var $seat = ""
	$seat.using = input_number($alias, 0)
	$seat.backward = input_number($alias, 1)
	$seat.left = input_number($alias, 2)
	$seat.down = input_number($alias, 3)
	$seat.pitch = input_number($alias, 4)
	$seat.roll = input_number($alias, 5)
	$seat.yaw = input_number($alias, 6)
	$seat.main_thrust = input_number($alias, 7)
	$seat.aux1 = input_number($alias, 8)
	$seat.aux2 = input_number($alias, 9)
	$seat.aux3 = input_number($alias, 10)
	$seat.aux4 = input_number($alias, 11)
	$seat.aux5 = input_number($alias, 12)
	$seat.aux6 = input_number($alias, 13)
	$seat.aux7 = input_number($alias, 14)
	$seat.aux8 = input_number($alias, 15)
	$seat.aux9 = input_number($alias, 16)
	$seat.aux0 = input_number($alias, 17)
	return $seat

function @read_thruster($alias:text) : text
	var $thr = ""
	$thr.thrust = input_number($alias, 0)
	$thr.burned_flow = input_number($alias, 1)
	$thr.unburned_flow = input_number($alias, 2)
	return $thr

; Nav
function @configure_beacon($alias:text, $data:text, $tx:number, $rx:number)
	output_number($alias, 1, $tx)
	output_number($alias, 2, $rx)
	output_text($alias, 0, $data)

function @copy_locator($beacon:text, $navAlias:text)
	output_number($navAlias, 1, $beacon.distance:number)
	output_number($navAlias, 2, $beacon.direction_x:number)
	output_number($navAlias, 3, $beacon.direction_y:number)
	output_number($navAlias, 4, $beacon.direction_z:number)

function @read_beacon($alias:text) : text
	var $beacon = ""
	$beacon.data = input_text($alias, 0)
	$beacon.distance = input_number($alias, 1)
	$beacon.direction_x = input_number($alias, 2)
	$beacon.direction_y = input_number($alias, 3)
	$beacon.direction_z = input_number($alias, 4)
	$beacon.is_receiving = input_number($alias, 5)
	return $beacon

function @read_nav($alias:text) : text
	var $nav = ""
	$nav.forward_airspeed = input_number($alias, 0)
	$nav.vertical_speed = input_number($alias, 1)
	$nav.altitude = input_number($alias, 2)
	$nav.above_terrain = input_number($alias, 3)
	$nav.horizon_pitch = input_number($alias, 4)
	$nav.horizon_roll = input_number($alias, 5)
	$nav.heading = input_number($alias, 6)
	$nav.course = input_number($alias, 7)
	$nav.latitude = input_number($alias, 8)
	$nav.longitude = input_number($alias, 9)
	$nav.ground_speed = input_number($alias, 10)
	$nav.ground_speed_forward = input_number($alias, 11)
	$nav.ground_speed_right = input_number($alias, 12)
	$nav.current_celestial = input_text($alias, 13)
	$nav.celestial_inner_radius = input_number($alias, 14)
	$nav.celestial_outer_radius = input_number($alias, 15)
	$nav.orbital_speed = input_number($alias, 16)
	$nav.periapsis = input_number($alias, 17)
	$nav.apoapsis = input_number($alias, 18)
	$nav.prograde_pitch = input_number($alias, 19)
	$nav.prograde_yaw = input_number($alias, 20)
	$nav.retrograde_pitch = input_number($alias, 21)
	$nav.retrograde_yaw = input_number($alias, 22)
	$nav.locator_distance = input_number($alias, 23)
	$nav.locator_pitch = input_number($alias, 24)
	$nav.locator_yaw = input_number($alias, 25)
	$nav.orbital_inclination = input_number($alias, 26)
	$nav.orbital_target_speed = input_number($alias, 27)
	$nav.orbital_target_altitude = input_number($alias, 28)
	return $nav

; Power
function @read_battery($alias:text):text
	var $batt = ""
	$batt.voltage = input_number($alias, 0)
	$batt.max_capacity = input_number($alias, 1)
	$batt.state_of_charge = input_number($alias, 2)
	$batt.throughput = input_number($alias, 3)
	return $batt

function @read_rtg($alias:text):text
	var $rtg = ""
	$rtg.generated_power = input_number($alias, 0)
	$rtg.output_power = input_number($alias, 1)
	return $rtg

function @read_solar($alias:text):text
	var $solar = ""
	$solar.generated_power = input_number($alias, 0)
	$solar.output_power = input_number($alias, 1)
	return $solar

; Sensors
function @read_altitude_sensor($alias:text):text
	var $sensor = ""
	$sensor.absolute_altitude = input_number($alias, 0)
	$sensor.above_terrain = input_number($alias, 1)
	return $sensor

function @read_angular_velocity_sensor($alias:text):text
	var $sensor = ""
	$sensor.x = input_number($alias, 0)
	$sensor.y = input_number($alias, 1)
	$sensor.z = input_number($alias, 2)
	return $sensor

function @read_linear_velocity_sensor($alias:text):text
	var $sensor = ""
	$sensor.x = input_number($alias, 0)
	$sensor.y = input_number($alias, 1)
	$sensor.z = input_number($alias, 2)
	return $sensor

function @read_solar_sensor($alias:text):text
	var $sensor = ""
	$sensor.normalized_angle = input_number($alias, 0)
	$sensor.solar_power = input_number($alias, 1)
	return $sensor

function @read_vehicle_physics_sensor($alias:text):text
	var $sensor = ""
	$sensor.active_physics = input_number($alias, 0)
	$sensor.mass = input_number($alias, 1)
	$sensor.size_x = input_number($alias, 2)
	$sensor.size_y = input_number($alias, 3)
	$sensor.size_z = input_number($alias, 4)
	$sensor.com_x = input_number($alias, 5)
	$sensor.com_y = input_number($alias, 6)
	$sensor.com_z = input_number($alias, 7)
	$sensor.moi_x = input_number($alias, 8)
	$sensor.moi_y = input_number($alias, 9)
	$sensor.moi_z = input_number($alias, 10)
	return $sensor

; Misc
function @pid($setpoint:number, $processvalue:number, $kp:number, $ki:number, $kd:number, $integral:number, $prev_error:number) : text
	var $error = $setpoint - $processvalue
	var $dt = delta_time
	var $derivative = ($error - $prev_error) / $dt
	var $tuple = ""
	$tuple.integral = $integral + $error * $dt
	$tuple.prev_error = $error
	$tuple.value = $kp * $error + $ki * $integral + $kd * $derivative
	return $tuple

function @calculate_heading_error($actual:number, $requested:number):number
	var $diff = $requested - $actual
	var $absDiff = abs($diff)
	if $absDiff <= 180
		if $absDiff == 180
			return $absDiff
		else
			return $diff
	elseif $requested > $actual
		return $absDiff - 360
	else
		return 360 - $absDiff