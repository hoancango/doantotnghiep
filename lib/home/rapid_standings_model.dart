class PLStandings {
  String? get;
  Parameters? parameters;
  int? results;
  Paging? paging;
  List<Response>? response;

  PLStandings(
      {this.get, this.parameters, this.results, this.paging, this.response});

  PLStandings.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;
    results = json['results'];
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
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
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
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

class Response {
  League? league;

  Response({this.league});

  Response.fromJson(Map<String, dynamic> json) {
    league =
        json['league'] != null ? new League.fromJson(json['league']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.league != null) {
      data['league'] = this.league!.toJson();
    }
    return data;
  }
}

class League {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  List<List<CurrentStandings>>? standings;

  League(
      {this.id,
      this.name,
      this.country,
      this.logo,
      this.flag,
      this.season,
      this.standings});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
    if (json['standings'] != null) {
      standings = [<CurrentStandings>[]];

      json['standings'][0].forEach((v) {
        standings![0].add(CurrentStandings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;
    if (this.standings != null) {
      data['standings'] = standings!
          .map((subList) => subList.map((e) => e.toJson()).toList())
          .toList();
    }
    return data;
  }
}

class CurrentStandings {
  int? rank;
  Team? team;
  int? points;
  int? goalsDiff;
  String? group;
  String? form;
  String? status;
  String? description;
  All? all;
  All? home;
  All? away;
  String? update;

  CurrentStandings(
      {this.rank,
      this.team,
      this.points,
      this.goalsDiff,
      this.group,
      this.form,
      this.status,
      this.description,
      this.all,
      this.home,
      this.away,
      this.update});

  CurrentStandings.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    points = json['points'];
    goalsDiff = json['goalsDiff'];
    group = json['group'];
    form = json['form'];
    status = json['status'];
    description = json['description'];
    all = json['all'] != null ? new All.fromJson(json['all']) : null;
    home = json['home'] != null ? new All.fromJson(json['home']) : null;
    away = json['away'] != null ? new All.fromJson(json['away']) : null;
    update = json['update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['points'] = this.points;
    data['goalsDiff'] = this.goalsDiff;
    data['group'] = this.group;
    data['form'] = this.form;
    data['status'] = this.status;
    data['description'] = this.description;
    if (this.all != null) {
      data['all'] = this.all!.toJson();
    }
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away!.toJson();
    }
    data['update'] = this.update;
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

class All {
  int? played;
  int? win;
  int? draw;
  int? lose;
  Goals? goals;

  All({this.played, this.win, this.draw, this.lose, this.goals});

  All.fromJson(Map<String, dynamic> json) {
    played = json['played'];
    win = json['win'];
    draw = json['draw'];
    lose = json['lose'];
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['played'] = this.played;
    data['win'] = this.win;
    data['draw'] = this.draw;
    data['lose'] = this.lose;
    if (this.goals != null) {
      data['goals'] = this.goals!.toJson();
    }
    return data;
  }
}

class Goals {
  int? goalsFor;
  int? goalAgainst;

  Goals({this.goalsFor, this.goalAgainst});

  Goals.fromJson(Map<String, dynamic> json) {
    goalsFor = json['for'];
    goalAgainst = json['against'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['for'] = this.goalsFor;
    data['against'] = this.goalAgainst;
    return data;
  }
}
