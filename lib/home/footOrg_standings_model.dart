
class FotOrgPLStandings {
  Filters? filters;
  Area? area;
  Competition? competition;
  Season? season;
  List<Standings>? standings;

  FotOrgPLStandings(
      {this.filters, this.area, this.competition, this.season, this.standings});

  FotOrgPLStandings.fromJson(Map<String, dynamic> json) {
    filters =
    json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
    season =
    json['season'] != null ? new Season.fromJson(json['season']) : null;
    if (json['standings'] != null) {
      standings = <Standings>[];
      json['standings'].forEach((v) {
        standings!.add(new Standings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.competition != null) {
      data['competition'] = this.competition!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    if (this.standings != null) {
      data['standings'] = this.standings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filters {
  String? season;

  Filters({this.season});

  Filters.fromJson(Map<String, dynamic> json) {
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    return data;
  }
}

class Area {
  int? id;
  String? name;
  String? code;
  String? flag;

  Area({this.id, this.name, this.code, this.flag});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['flag'] = this.flag;
    return data;
  }
}

class Competition {
  int? id;
  String? name;
  String? code;
  String? type;
  String? emblem;

  Competition({this.id, this.name, this.code, this.type, this.emblem});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    type = json['type'];
    emblem = json['emblem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['type'] = this.type;
    data['emblem'] = this.emblem;
    return data;
  }
}

class Season {
  int? id;
  String? startDate;
  String? endDate;
  int? currentMatchday;
  Null? winner;

  Season(
      {this.id,
        this.startDate,
        this.endDate,
        this.currentMatchday,
        this.winner});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    currentMatchday = json['currentMatchday'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['currentMatchday'] = this.currentMatchday;
    data['winner'] = this.winner;
    return data;
  }
}

class Standings {
  String? stage;
  String? type;
  Null? group;
  List<Table>? table;

  Standings({this.stage, this.type, this.group, this.table});

  Standings.fromJson(Map<String, dynamic> json) {
    stage = json['stage'];
    type = json['type'];
    group = json['group'];
    if (json['table'] != null) {
      table = <Table>[];
      json['table'].forEach((v) {
        table!.add(new Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stage'] = this.stage;
    data['type'] = this.type;
    data['group'] = this.group;
    if (this.table != null) {
      data['table'] = this.table!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  int? position;
  Team? team;
  int? playedGames;
  Null? form;
  int? won;
  int? draw;
  int? lost;
  int? points;
  int? goalsFor;
  int? goalsAgainst;
  int? goalDifference;

  Table(
      {this.position,
        this.team,
        this.playedGames,
        this.form,
        this.won,
        this.draw,
        this.lost,
        this.points,
        this.goalsFor,
        this.goalsAgainst,
        this.goalDifference});

  Table.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    playedGames = json['playedGames'];
    form = json['form'];
    won = json['won'];
    draw = json['draw'];
    lost = json['lost'];
    points = json['points'];
    goalsFor = json['goalsFor'];
    goalsAgainst = json['goalsAgainst'];
    goalDifference = json['goalDifference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['playedGames'] = this.playedGames;
    data['form'] = this.form;
    data['won'] = this.won;
    data['draw'] = this.draw;
    data['lost'] = this.lost;
    data['points'] = this.points;
    data['goalsFor'] = this.goalsFor;
    data['goalsAgainst'] = this.goalsAgainst;
    data['goalDifference'] = this.goalDifference;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;

  Team({this.id, this.name, this.shortName, this.tla, this.crest});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    tla = json['tla'];
    crest = json['crest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['tla'] = this.tla;
    data['crest'] = this.crest;
    return data;
  }
}
