void Train::updateSpeed()
{
	double frictionDeceleration = std::min(fabs(this->speed), this->frictionForce / this->weight);
	if (ridingState.accelerationState != RidingState::AccelerationState::Braking)
    this->speed -= (this->speed >= 0 ? frictionDeceleration : -frictionDeceleration);
	
	if (ridingState.accelerationState == RidingState::AccelerationState::Braking)
	{
		double remainingDistance = this->getRemainingDistance();
		if (this->inManualMode() || remainingDistance <= 0)
		{
			double deceleration = std::min(fabs(this->speed), this->brakingForce / this->weight);
			this->speed -= (this->speed >= 0 ? deceleration : -deceleration);
		}
		else
		{
			double deceleration = std::min(fabs(this->speed), 0.5 * (this->speed * this->speed) / remainingDistance);
			this->speed -= (this->speed >= 0 ? deceleration : -deceleration);
		}
	}
	else if (ridingState.accelerationState == RidingState::AccelerationState::Accelerating)
	{
		double power = 0;
		// extract energy
		for (Locomotive* locomotive: this->frontMovers)
		power += locomotive->extractEnergy(RailDirection::Front);
		this->speed += power / this->weight / 1000.0;
		if (power == 0 && this->inManualMode())
		{
			for (Locomotive* locomotive: this->backMovers)
			power += locomotive->extractEnergy(RailDirection::Back);
			this->speed += power / this->weight / 1000.0;
		}
	}
	else if (ridingState.accelerationState == RidingState::AccelerationState::Reversing)
	{
		double power = 0;
		// extract energy
		for (Locomotive* locomotive: this->backMovers)
		power += locomotive->extractEnergy(RailDirection::Front);
		this->speed -= power / this->weight / 1000.0;
		if (power == 0 && this->inManualMode())
		{
			for (Locomotive* locomotive: this->frontMovers)
			power += locomotive->extractEnergy(RailDirection::Back);
			this->speed -= power / this->weight / 1000.0;
		}
	}
	
	// simplification
	// air resistance is not calculated when braking to be able to calculate precisely and fast the braking distance
	if (ridingState.accelerationState != RidingState::AccelerationState::Braking)
    this->speed *= (1 - this->airResistance / (this->weight / 1000.0));
	
	// limit the max speed
	this->speed = std::max(-1 * this->maxSpeed, std::min(this->maxSpeed, this->speed));
}