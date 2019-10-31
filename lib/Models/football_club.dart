class FootballClub {

  FootballClub({String name, String logo, String location = 'local'}) : _name = name, _logo = logo, _location = location;

  final String _name;
  final String _logo;
  final String _location;

  String get name => _name;
  String get logo => _logo;
  String get location => _location;
}