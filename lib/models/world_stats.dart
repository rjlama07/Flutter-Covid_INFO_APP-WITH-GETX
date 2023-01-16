class WorldStatsModel {
  num? updated;
  num? cases;
  num? todayCases;
  num? deaths;
  num? todayDeaths;
  num? recovered;
  num? todayRecovered;
  num? active;
  num? critical;
  num? casesPerOneMillion;
  num? deathsPerOneMillion;
  num? tests;
  num? testsPerOneMillion;
  num? population;
  num? oneCasePerPeople;
  num? oneDeathPerPeople;
  num? oneTestPerPeople;
  num? activePerOneMillion;
  num? recoveredPerOneMillion;
  num? criticalPerOneMillion;
  num? affectedCountries;

  WorldStatsModel(
      {this.updated,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion,
      this.affectedCountries});

  WorldStatsModel.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    todayRecovered = json['todayRecovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    tests = json['tests'];
    testsPerOneMillion = json['testsPerOneMillion'];
    population = json['population'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
    affectedCountries = json['affectedCountries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updated'] = updated;
    data['cases'] = cases;
    data['todayCases'] = todayCases;
    data['deaths'] = deaths;
    data['todayDeaths'] = todayDeaths;
    data['recovered'] = recovered;
    data['todayRecovered'] = todayRecovered;
    data['active'] = active;
    data['critical'] = critical;
    data['casesPerOneMillion'] = casesPerOneMillion;
    data['deathsPerOneMillion'] = deathsPerOneMillion;
    data['tests'] = tests;
    data['testsPerOneMillion'] = testsPerOneMillion;
    data['population'] = population;
    data['oneCasePerPeople'] = oneCasePerPeople;
    data['oneDeathPerPeople'] = oneDeathPerPeople;
    data['oneTestPerPeople'] = oneTestPerPeople;
    data['activePerOneMillion'] = activePerOneMillion;
    data['recoveredPerOneMillion'] = recoveredPerOneMillion;
    data['criticalPerOneMillion'] = criticalPerOneMillion;
    data['affectedCountries'] = affectedCountries;
    return data;
  }
}
