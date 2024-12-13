class MatchStatistics {
  String? get;
  Parameters? parameters;
  int? results;
  Paging? paging;
  List<BothTeams>? bothTeams;

  MatchStatistics(
      {this.get,
        this.parameters,
        this.results,
        this.paging,
        this.bothTeams});

  MatchStatistics.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;

    results = json['results'];
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      bothTeams = <BothTeams>[];
      json['response'].forEach((v) {
        bothTeams!.add(new BothTeams.fromJson(v));
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
    if (this.bothTeams != null) {
      data['response'] = this.bothTeams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? fixture;

  Parameters({this.fixture});

  Parameters.fromJson(Map<String, dynamic> json) {
    fixture = json['fixture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fixture'] = this.fixture;
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

class BothTeams {
  Team? team;
  List<Statistics>? statistics;

  BothTeams({this.team, this.statistics});

  BothTeams.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(new Statistics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class Statistics {
  String? type;
  dynamic value;

  Statistics({this.type, this.value});

  Statistics.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}
