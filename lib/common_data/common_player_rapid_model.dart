class TotalPlPlayers {
  List<PlPlayers>? plPlayers;

  TotalPlPlayers({this.plPlayers});

  TotalPlPlayers.fromJson(Map<String, dynamic> json) {
    if (json['plPlayers'] != null) {
      plPlayers = <PlPlayers>[];
      json['plPlayers'].forEach((v) {
        plPlayers!.add(new PlPlayers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plPlayers != null) {
      data['plPlayers'] = this.plPlayers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlPlayers {
  String? get;
  Parameters? parameters;
  int? results;
  Paging? paging;
  List<TeamsPlayers>? teamsPlayers;

  PlPlayers(
      {this.get,
        this.parameters,
        this.results,
        this.paging,
        this.teamsPlayers});

  PlPlayers.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;

    results = json['results'];
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      teamsPlayers = <TeamsPlayers>[];
      json['response'].forEach((v) {
        teamsPlayers!.add(new TeamsPlayers.fromJson(v));
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
    if (this.teamsPlayers != null) {
      data['response'] = this.teamsPlayers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? team;

  Parameters({this.team});

  Parameters.fromJson(Map<String, dynamic> json) {
    team = json['team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team'] = this.team;
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

class TeamsPlayers {
  Team? team;
  List<Players>? players;

  TeamsPlayers({this.team, this.players});

  TeamsPlayers.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? logo;

  Team({this.id, this.name, this.logo});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}

class Players {
  int? id;
  String? name;
  int? age;
  int? number;
  String? position;
  String? photo;

  Players(
      {this.id, this.name, this.age, this.number, this.position, this.photo});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    number = json['number'];
    position = json['position'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['number'] = number;
    data['position'] = position;
    data['photo'] = photo;
    return data;
  }
}
