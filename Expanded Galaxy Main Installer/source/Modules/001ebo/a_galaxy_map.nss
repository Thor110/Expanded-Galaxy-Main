void main() {
  SetPlanetAvailable(10, 1);
  SetPlanetSelectable(10, 0);
  SetPlanetAvailable(5, 1);
  SetPlanetSelectable(5, 1);
  DelayCommand(0.1, ShowGalaxyMap(10));
}