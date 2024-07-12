; https://github.com/MuMech/MechJeb2/blob/dev/MechJeb2/AttitudeControllers/KosPIDLoop.cs
function @kOSPid($sp:number, $pv:number, $kp:number, $ki:number, $kd:number, $min:number, $max:number, $extraUnwind:number, $_loopKi:number, $_prevError:number, $_errorSum:number, $_pTerm:number, $_iTerm:number, $_dTerm:number, $_changeRate:number, $_unwinding:number, $_pv:number):number
	var $error = $sp - $pv
	var $pTerm = $error * $kp
	var $iTerm = 0
	var $dTerm = 0
	var $dt = delta_time
	if $_loopKi != 0
		if $extraUnwind
			if sign($error) != sign($_errorSum)
				if !$_unwinding
					$_loopKi *= 2
					$_unwinding = 1
			elseif $_unwinding
				$_loopKi = $ki
				$_unwinding = 0
		$iTerm = $_iTerm + $error * $dt * $_loopKi
		
	$_changeRate = ($pv - $_pv) / $dt
	if $kd !=0
		$dTerm = -$_changeRate * $kd
		
	var $output = $pTerm + $iTerm + $dTerm
	
	if $output > $max
		$output = $max
		if $_loopKi != 0 
			$iTerm = $output - min($pTerm + $dTerm, $max)
	
	if $output < $min
		$output = $min
		if $_loopKi != 0
			$iTerm = $output - max($pTerm + $dTerm, $min)
	
	$_pv = $pv
	$_prevError = $error
	$_pTerm = $pTerm
	$_iTerm = $iTerm
	$_dTerm = $dTerm
	
	if $_loopKi != 0
		$_errorSum = $iTerm / $_loopKi
	else
		$_errorSum = 0
	
	return $output
	
function @kOSPid2($_pidState:text, $sp:number, $pv:number, $kp:number, $ki:number, $kd:number, $min:number, $max:number, $extraUnwind:number):text
	var $error = $sp - $pv
	var $pTerm = $error * $kp
	var $iTerm = 0
	var $dTerm = 0
	var $dt = delta_time
	if $_pidState.loopKi != 0
		if $extraUnwind
			if sign($error) != sign($_pidState.errorSum)
				if !$_pidState.unwinding
					$_pidState.loopKi *= 2
					$_pidState.unwinding = 1
			elseif $_pidState.unwinding
				$_pidState.loopKi = $ki
				$_pidState.unwinding = 0
		$iTerm = $_pidState.iTerm + $error * $dt * $_pidState.loopKi
		
	$_pidState.changeRate = ($pv - $_pidState.pv) / $dt
	if $kd !=0
		$dTerm = -$_pidState.changeRate * $kd
		
	var $output = $pTerm + $iTerm + $dTerm
	
	if $output > $max
		$output = $max
		if $_pidState.loopKi != 0 
			$iTerm = $output - min($pTerm + $dTerm, $max)
	
	if $output < $min
		$output = $min
		if $_pidState.loopKi != 0
			$iTerm = $output - max($pTerm + $dTerm, $min)
	
	$_pidState.pv = $pv
	$_pidState.prevError = $error
	$_pidState.pTerm = $pTerm
	$_pidState.iTerm = $iTerm
	$_pidState.dTerm = $dTerm
	$_pidState.output = $output
	
	if $_pidState.loopKi != 0
		$_pidState.errorSum = $iTerm / $_pidState.loopKi
	else
		$_pidState.errorSum = 0
	
	return $_pidState