void main() {
	int nParam1 = GetScriptParameter(1);
	if ((nParam1 == 0)) {
		//SetPlanetAvailable(2, 1);
		//SetPlanetSelectable(2, 1);
		DelayCommand(0.1, ShowGalaxyMap(2));
	}
	else {
		//SetPlanetAvailable(2, 1);
		//SetPlanetSelectable(2, 1);
		SetPlanetAvailable(8, 1);
		SetPlanetSelectable(8, 1);
		DelayCommand(0.1, ShowGalaxyMap(2));
	}
}

