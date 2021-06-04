class Country {
  final String? name,
      alpha2Code,
      alpha3Code,
      capital,
      region,
      subregion,
      demonym,
      nativeName,
      numericCode,
      flag;
  final int? population;
  final List? callingCodes, timezones, borders, latlng, currencies, languages;
  final Map? translations;
  final double? area;

  Country(
    this.name,
    this.alpha2Code,
    this.alpha3Code,
    this.capital,
    this.region,
    this.subregion,
    this.population,
    this.demonym,
    this.nativeName,
    this.numericCode,
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
      : name = json['name'],
        alpha2Code = json['alpha2Code'],
        alpha3Code = json['alpha3Code'],
        capital = json['capital'],
        region = json['region'],
        subregion = json['subregion'],
        population = json['population'],
        demonym = json['demonym'],
        nativeName = json['nativeName'],
        numericCode = json['numericCode'],
        flag = json['flag'],
        area = json['area'],
        callingCodes = json['callingCodes'],
        timezones = json['timezones'],
        borders = json['borders'],
        latlng = json['latlng'],
        currencies = json['currencies'],
        languages = json['languages'],
        translations = json['translations'];

  Map<String, dynamic> toJson(Country c) {
    Map<String, dynamic> json = {
      'name': c.name,
      'alpha2Code': c.alpha2Code,
      'alpha3Code': c.alpha3Code,
      'capital': c.capital,
      'region': c.region,
      'subregion': c.subregion,
      'population': c.population,
      'demonym': c.demonym,
      'nativeName': c.nativeName,
      'numericCode': c.numericCode,
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
