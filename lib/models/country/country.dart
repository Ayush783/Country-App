class Country {
  final String? name, cca2, cca3, capital, region, subregion, demonym, flag;
  final int? population;
  final List? callingCodes, timezones, borders, latlng, currencies, languages;
  final Map? translations;
  final double? area;

  Country(
    this.name,
    this.cca2,
    this.cca3,
    this.capital,
    this.region,
    this.subregion,
    this.population,
    this.demonym,
    this.flag,
    this.area,
    this.callingCodes,
    this.timezones,
    this.borders,
    this.latlng,
    this.currencies,
    this.languages,
    this.translations,
  );

  Country.fromJson(Map<String, dynamic> json)
      : name = json['name']['official'],
        cca2 = json['cca2'],
        cca3 = json['cca3'],
        capital = json.containsKey('capital') ? json['capital'][0] : '',
        region = json['region'],
        subregion = json['subregion'],
        population = json['population'],
        demonym = json['demonym'],
        flag = json['flags']['svg'],
        area = json['area'],
        callingCodes = json['callingCodes'],
        timezones = json['timezones'],
        borders = json['borders'],
        latlng = json['latlng'],
        currencies = (json['currencies'] as Map).values.toList(),
        languages = (json['languages'] as Map).values.toList(),
        translations = json['translations'];

  Map<String, dynamic> toJson(Country c) {
    Map<String, dynamic> json = {
      'name': c.name,
      'cca2': c.cca2,
      'cca3': c.cca3,
      'capital': c.capital,
      'region': c.region,
      'subregion': c.subregion,
      'population': c.population,
      'demonym': c.demonym,
      'flag': c.flag,
      'area': c.area,
      'callingCodes': c.callingCodes,
      'timezones': c.timezones,
      'borders': c.borders,
      'latlng': c.latlng,
      'currencies': c.currencies,
      'languages': c.languages,
      'translations': c.translations,
    };
    return json;
  }
}
