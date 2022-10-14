void main() {
	//int nParam1 = GetScriptParameter(1);
	//if ((nParam1 == 0)) {
		//SetPlanetAvailable(10, 1);
		//SetPlanetSelectable(10, 1);
		//SetPlanetAvailable(5, 1);
		//SetPlanetSelectable(5, 1);
		//DelayCommand(0.1, ShowGalaxyMap(2));
	//}
	//else {
		SetPlanetAvailable(10, 1);
		SetPlanetSelectable(10, 0);
		SetPlanetAvailable(5, 1);
		SetPlanetSelectable(5, 1);
		DelayCommand(0.1, ShowGalaxyMap(10));
	//}
}

