class CovidData {
  final String ID;
  final String Message;
  final String Date;
  final Map<String, dynamic> Global;
  final List<dynamic> Countries;
  CovidData({
    required this.ID,
    required this.Message,
    required this.Date,
    required this.Global,
    required this.Countries,
  });

  factory CovidData.fromJson(Map<String, dynamic> json) {
    return CovidData(
      ID: json["ID"],
      Message: json["Message"],
      Date: json["Date"],
      Global: json["Global"],
      Countries: json["Countries"],
    );
  }
}
