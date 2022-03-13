import 'package:flutter/foundation.dart';

class world {
  late int? updated;
  late int? cases;
  late int? todayCases;
  late int? deaths;
  late int? todayDeaths;
  late int? recovered;
  late int? todayRecovered;
  late int? active;
  late int? critical;
  late int? casesPerOneMillion;
  late int? affectedCountries;

  world(
      {required this.updated,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active,
      required this.critical,
      required this.casesPerOneMillion,
      required this.affectedCountries});

  factory world.fromJson(Map<String, dynamic> json) {
    return world(
        updated: json['updated'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['death'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        todayRecovered: json['todayRecovered'],
        active: json['active'],
        critical: json['critical'],
        casesPerOneMillion: json['casesPerOneMillion'],
        affectedCountries: json['affectedCountires']);
    // world(
    //     updated: json['updated'],
    //     cases: json['cases'],
    //     todayCases: json['todayCases'],
    //     deaths: json['deaths']
    //     );
  }
}
