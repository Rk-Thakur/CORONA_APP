import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:korana/models/world_model.dart';

final worldProvider =
    StateNotifierProvider<WorldProvider, world>((ref) => WorldProvider());

class WorldProvider extends StateNotifier<world> {
  WorldProvider()
      : super(world(
            updated: null,
            cases: null,
            todayCases: null,
            deaths: null,
            todayDeaths: null,
            recovered: null,
            todayRecovered: null,
            active: null,
            critical: null,
            casesPerOneMillion: null,
            affectedCountries: null)) {
    getWorld();
  }

  Future<void> getWorld() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://disease.sh/v3/covid-19/all');
      final updated = (response.data['updated']);
      final cases = (response.data['cases']);
      final todayCases = (response.data['todayCases']);
      final death = (response.data['deaths']);
      final todayDeaths = (response.data['catodayDeathsses']);
      final recovered = (response.data['recovered']);
      final todayRecovered = (response.data['todayRecovered']);
      final active = (response.data['active']);
      final critical = (response.data['critical']);
      final casesPerOneMillion = (response.data['casesPerOneMillion']);
      final affectedCountries = (response.data['affectedCountries']);

      state = world(
          updated: updated,
          cases: cases,
          todayCases: todayCases,
          deaths: death,
          todayDeaths: todayDeaths,
          recovered: recovered,
          todayRecovered: todayRecovered,
          active: active,
          critical: critical,
          casesPerOneMillion: casesPerOneMillion,
          affectedCountries: affectedCountries);
    } on DioError catch (e) {
      throw (e);
    }
  }
}
