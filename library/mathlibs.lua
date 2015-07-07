function round (number, figure)
	local significantFigure = figure
	local numberToRound = number
	local roundedNumber, decimal = 0
	local stepper = 0

	if numberToRound*significantFigure < 0 then
		stepper = -0.5
	else
		stepper = 0.5
	end
	roundedNumber, decimal = math.modf(numberToRound * significantFigure + stepper)
	return roundedNumber / significantFigure
end