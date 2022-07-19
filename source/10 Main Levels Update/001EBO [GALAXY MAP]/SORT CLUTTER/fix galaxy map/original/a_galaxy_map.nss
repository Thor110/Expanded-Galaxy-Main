void main() {
	int nParam1 = GetScriptParameter(1);
	if ((nParam1 == 0)) {
		SetPlanetAvailable(11, 1);
		SetPlanetSelectable(11, 0);
		SetPlanetAvailable(2, 1);
		SetPlanetSelectable(2, 1);
		DelayCommand(0.1, ShowGalaxyMap(2));
	}
	else {
		SetPlanetAvailable(2, 1);
		SetPlanetSelectable(2, 1);
		SetPlanetAvailable(8, 1);
		SetPlanetSelectable(8, 1);
		SetPlanetAvailable(11, 0);
		SetPlanetSelectable(11, 0);
		DelayCommand(0.1, ShowGalaxyMap(2));
	}
}

