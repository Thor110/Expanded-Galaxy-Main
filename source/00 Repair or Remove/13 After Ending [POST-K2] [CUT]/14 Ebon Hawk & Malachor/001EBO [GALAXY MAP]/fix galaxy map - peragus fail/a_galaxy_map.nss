void main() {
	int nParam1 = GetScriptParameter(1);
	if ((nParam1 == 0)) {
		//SetPlanetAvailable(2, 1);
    //SetPlanetSelectable(2, 1);
		SetPlanetAvailable(5, 0);
		SetPlanetSelectable(5, 0);
		DelayCommand(0.1, ShowGalaxyMap(0));
	}
	else {
		//SetPlanetAvailable(2, 1);
		//SetPlanetSelectable(2, 1);
		SetPlanetAvailable(5, 1);
		SetPlanetSelectable(5, 1);
		DelayCommand(0.1, ShowGalaxyMap(0));
	}
}

