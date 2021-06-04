class Country {
  final String? name,
      alpha2Code,
      alpha3Code,
      capital,
      region,
      subregion,
      population,
      demonym,
      nativeName,
      numericCode,
      flag;
  final int? area;
  final List<String>? callingCodes, timezones, borders;
  final List<double>? latlng;
  final List<Map>? currencies, languages, regionalBlocs;
  final Map? translations;
  final bool error;

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
      this.regionalBlocs,
      this.translations,
      this.error);

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
        regionalBlocs = json['regionalBlocs'],
        translations = json['translations'],
        error = false;

  Country.error()
      : name = '',
        alpha2Code = '',
        alpha3Code = '',
        capital = '',
        region = '',
        subregion = '',
        population = '',
        demonym = '',
        nativeName = '',
        numericCode = '',
        flag = '',
        area = 0,
        callingCodes = [],
        timezones = [],
        borders = [],
        latlng = [],
        currencies = [],
        languages = [],
        regionalBlocs = [],
        translations = {},
        error = true;
}