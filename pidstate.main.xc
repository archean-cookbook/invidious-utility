include "pid.xc"

var $myPid1 = ""
var $myPid2 = ""

update
	var $setPoint = 100
	var $processValue = 95
	
	var $Kp = 1
	var $Ki = 1
	var $Kd = 1
	var $min = 0
	var $max = 100
	var $extraUnwind = 1
	$myPid1.@kOSPid2($setPoint, $processValue, $Kp, $Ki, $Kd, $min, $max, $extraUnwind)
	print($myPid1)
	
	
	
	$myPid2.@kOSPid2(80, 20, $Kp, $Ki, $Kd, $min, $max, $extraUnwind)
	print($myPid2)