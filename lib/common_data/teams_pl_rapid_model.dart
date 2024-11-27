
class RapidPLTeams {
  String? get;
  Parameters? parameters;
  int? results;
  Paging? paging;
  List<PlTeams>? plTeams;

  RapidPLTeams(
      {this.get,
        this.parameters,
        this.results,
        this.paging,
        this.plTeams});

  RapidPLTeams.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;
    results = json['results'];
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      plTeams = <PlTeams>[];
      json['response'].forEach((v) {
        plTeams!.add(new PlTeams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['get'] = this.get;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.toJson();
    }
    data['results'] = this.results;
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    if (this.plTeams != null) {
      data['response'] = this.plTeams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? league;
  String? season;

  Parameters({this.league, this.season});

  Parameters.fromJson(Map<String, dynamic> json) {
    league = json['league'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['league'] = this.league;
    data['season'] = this.season;
    return data;
  }
}

class Paging {
  int? current;
  int? total;

  Paging({this.current, this.total});

  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['total'] = this.total;
    return data;
  }
}

class PlTeams {
  Team? team;
  Venue? venue;

  PlTeams({this.team, this.venue});

  PlTeams.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? code;
  String? country;
  int? founded;
  bool? national;
  String? logo;

  Team(
      {this.id,
        this.name,
        this.code,
        this.country,
        this.founded,
        this.national,
        this.logo});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    country = json['country'];
    founded = json['founded'];
    national = json['national'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['country'] = this.country;
    data['founded'] = this.founded;
    data['national'] = this.national;
    data['logo'] = this.logo;
    return data;
  }
}

class Venue {
  int? id;
  String? name;
  String? address;
  String? city;
  int? capacity;
  String? surface;
  String? image;

  Venue(
      {this.id,
        this.name,
        this.address,
        this.city,
        this.capacity,
        this.surface,
        this.image});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    capacity = json['capacity'];
    surface = json['surface'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['capacity'] = this.capacity;
    data['surface'] = this.surface;
    data['image'] = this.image;
    return data;
  }
}
