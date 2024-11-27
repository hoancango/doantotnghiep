class MatchStatistics {
  String? get;
  Parameters? parameters;
  int? results;
  Paging? paging;
  List<Response>? response;

  MatchStatistics(
      {this.get,
        this.parameters,
        this.results,
        this.paging,
        this.response});

  MatchStatistics.fromJson(Map<String, dynamic> json) {
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
  String? id;

  Parameters({this.id});

  Parameters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;
  List<Events>? events;
  List<Lineups>? lineups;
  List<Statistics>? statistics;
  List<BothTeamsPlayers>? players;

  Response(
      {this.fixture,
        this.league,
        this.teams,
        this.goals,
        this.score,
        this.events,
        this.lineups,
        this.statistics,
        this.players});

  Response.fromJson(Map<String, dynamic> json) {
    fixture =
    json['fixture'] != null ? new Fixture.fromJson(json['fixture']) : null;
    league =
    json['league'] != null ? new League.fromJson(json['league']) : null;
    teams = json['teams'] != null ? new Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
    if (json['lineups'] != null) {
      lineups = <Lineups>[];
      json['lineups'].forEach((v) {
        lineups!.add(new Lineups.fromJson(v));
      });
    }
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(new Statistics.fromJson(v));
      });
    }
    if (json['players'] != null) {
      players = <BothTeamsPlayers>[];
      json['players'].forEach((v) {
        players!.add(new BothTeamsPlayers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fixture != null) {
      data['fixture'] = this.fixture!.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league!.toJson();
    }
    if (this.teams != null) {
      data['teams'] = this.teams!.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals!.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    if (this.lineups != null) {
      data['lineups'] = this.lineups!.map((v) => v.toJson()).toList();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
    }
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fixture {
  int? id;
  String? referee;
  String? timezone;
  String? date;
  int? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  Fixture(
      {this.id,
        this.referee,
        this.timezone,
        this.date,
        this.timestamp,
        this.periods,
        this.venue,
        this.status});

  Fixture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referee = json['referee'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
    periods =
    json['periods'] != null ? new Periods.fromJson(json['periods']) : null;
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referee'] = this.referee;
    data['timezone'] = this.timezone;
    data['date'] = this.date;
    data['timestamp'] = this.timestamp;
    if (this.periods != null) {
      data['periods'] = this.periods!.toJson();
    }
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Periods {
  int? first;
  int? second;

  Periods({this.first, this.second});

  Periods.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}

class Venue {
  int? id;
  String? name;
  String? city;

  Venue({this.id, this.name, this.city});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    return data;
  }
}

class Status {
  String? long;
  String? short;
  int? elapsed;
  int? extra;

  Status({this.long, this.short, this.elapsed, this.extra});

  Status.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    short = json['short'];
    elapsed = json['elapsed'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['long'] = this.long;
    data['short'] = this.short;
    data['elapsed'] = this.elapsed;
    data['extra'] = this.extra;
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
  String? round;

  League(
      {this.id,
        this.name,
        this.country,
        this.logo,
        this.flag,
        this.season,
        this.round});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;
    data['round'] = this.round;
    return data;
  }
}

class Teams {
  Home? home;
  Home? away;

  Teams({this.home, this.away});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
    away = json['away'] != null ? new Home.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away!.toJson();
    }
    return data;
  }
}

class Home {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Home({this.id, this.name, this.logo, this.winner});

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['winner'] = this.winner;
    return data;
  }
}

class Goals {
  int? home;
  int? away;

  Goals({this.home, this.away});

  Goals.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home'] = this.home;
    data['away'] = this.away;
    return data;
  }
}

class Score {
  Goals? halftime;
  Goals? fulltime;
  Goals? extratime;
  Goals? penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  Score.fromJson(Map<String, dynamic> json) {
    halftime =
    json['halftime'] != null ? new Goals.fromJson(json['halftime']) : null;
    fulltime =
    json['fulltime'] != null ? new Goals.fromJson(json['fulltime']) : null;
    extratime = json['extratime'] != null
        ? new Goals.fromJson(json['extratime'])
        : null;
    penalty = json['penalty'] != null
        ? new Goals.fromJson(json['penalty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.halftime != null) {
      data['halftime'] = this.halftime!.toJson();
    }
    if (this.fulltime != null) {
      data['fulltime'] = this.fulltime!.toJson();
    }
    if (this.extratime != null) {
      data['extratime'] = this.extratime!.toJson();
    }
    if (this.penalty != null) {
      data['penalty'] = this.penalty!.toJson();
    }
    return data;
  }
}

// class Extratime {
//   Null? home;
//   Null? away;
//
//   Extratime({this.home, this.away});
//
//   Extratime.fromJson(Map<String, dynamic> json) {
//     home = json['home'];
//     away = json['away'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['home'] = this.home;
//     data['away'] = this.away;
//     return data;
//   }
// }

class Events {
  Time? time;
  Team? team;
  Person? player;
  Player? assist;
  String? type;
  String? detail;
  String? comments;

  Events(
      {this.time,
        this.team,
        this.player,
        this.assist,
        this.type,
        this.detail,
        this.comments});

  Events.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    player = json['player'] != null ? new Person.fromJson(json['player']) : null;
    assist =
    json['assist'] != null ? new Player.fromJson(json['assist']) : null;
    type = json['type'];
    detail = json['detail'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.assist != null) {
      data['assist'] = this.assist!.toJson();
    }
    data['type'] = this.type;
    data['detail'] = this.detail;
    data['comments'] = this.comments;
    return data;
  }
}

class Time {
  int? elapsed;
  int? extra;

  Time({this.elapsed, this.extra});

  Time.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elapsed'] = this.elapsed;
    data['extra'] = this.extra;
    return data;
  }
}

// class Team {
//   int? id;
//   String? name;
//   String? logo;
//
//   Team({this.id, this.name, this.logo});
//
//   Team.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     logo = json['logo'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['logo'] = this.logo;
//     return data;
//   }
// }

// class Player {
//   int? id;
//   String? name;
//
//   Player({this.id, this.name});
//
//   Player.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

class Lineups {
  Team? team;
  Person? coach;
  String? formation;
  List<StartXI>? startXI;
  List<Substitutes>? substitutes;

  Lineups(
      {this.team, this.coach, this.formation, this.startXI, this.substitutes});

  Lineups.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    coach = json['coach'] != null ? new Person.fromJson(json['coach']) : null;
    formation = json['formation'];
    if (json['startXI'] != null) {
      startXI = <StartXI>[];
      json['startXI'].forEach((v) {
        startXI!.add(new StartXI.fromJson(v));
      });
    }
    if (json['substitutes'] != null) {
      substitutes = <Substitutes>[];
      json['substitutes'].forEach((v) {
        substitutes!.add(new Substitutes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    data['formation'] = this.formation;
    if (this.startXI != null) {
      data['startXI'] = this.startXI!.map((v) => v.toJson()).toList();
    }
    if (this.substitutes != null) {
      data['substitutes'] = this.substitutes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Substitutes {
  Player? player;

  Substitutes({this.player});

  Substitutes.fromJson(Map<String, dynamic> json) {
    player =
    json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? logo;
  Colors? colors;
  String? update;

  Team({this.id, this.name, this.logo, this.colors});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    colors =
    json['colors'] != null ? new Colors.fromJson(json['colors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    if (this.colors != null) {
      data['colors'] = this.colors!.toJson();
    }
    data['update'] = this.update;
    return data;
  }
}

class Colors {
  PlayerColor? player;
  PlayerColor? goalkeeper;

  Colors({this.player, this.goalkeeper});

  Colors.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? new PlayerColor.fromJson(json['player']) : null;
    goalkeeper = json['goalkeeper'] != null
        ? new PlayerColor.fromJson(json['goalkeeper'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.goalkeeper != null) {
      data['goalkeeper'] = this.goalkeeper!.toJson();
    }
    return data;
  }
}

class PlayerColor {
  String? primary;
  String? number;
  String? border;

  PlayerColor({this.primary, this.number, this.border});

  PlayerColor.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    number = json['number'];
    border = json['border'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['number'] = this.number;
    data['border'] = this.border;
    return data;
  }
}

class Person {
  int? id;
  String? name;
  String? photo;

  Person({this.id, this.name, this.photo});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}

class StartXI {
  Player? player;

  StartXI({this.player});

  StartXI.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}


// class LineupPlayer {
//   int? id;
//   String? name;
//   int? number;
//   String? pos;
//   String? grid;
//
//   LineupPlayer({this.id, this.name, this.number, this.pos, this.grid});
//
//   LineupPlayer.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     number = json['number'];
//     pos = json['pos'];
//     grid = json['grid'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['number'] = this.number;
//     data['pos'] = this.pos;
//     data['grid'] = this.grid;
//     return data;
//   }
// }

class Player {
  int? id;
  String? name;
  int? number;
  String? pos;
  String? grid;

  Player({this.id, this.name, this.number, this.pos, this.grid});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    pos = json['pos'];
    grid = json['grid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['pos'] = this.pos;
    data['grid'] = this.grid;
    return data;
  }
}

class Statistics {
  Team? team;
  List<TeamStatistics>? statistics;

  Statistics({this.team, this.statistics});

  Statistics.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    if (json['statistics'] != null) {
      statistics = <TeamStatistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(new TeamStatistics.fromJson(v));
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

class TeamStatistics {
  String? type;
  int? value;

  TeamStatistics({this.type, this.value});

  TeamStatistics.fromJson(Map<String, dynamic> json) {
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

class BothTeamsPlayers {
  Team? team;
  List<TotalPlayerStats>? players;

  BothTeamsPlayers({this.team, this.players});

  BothTeamsPlayers.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    if (json['players'] != null) {
      players = <TotalPlayerStats>[];
      json['players'].forEach((v) {
        players!.add(new TotalPlayerStats.fromJson(v));
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

// class Team {
//   int? id;
//   String? name;
//   String? logo;
//   String? update;
//
//   Team({this.id, this.name, this.logo, this.update});
//
//   Team.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     logo = json['logo'];
//     update = json['update'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['logo'] = this.logo;
//     data['update'] = this.update;
//     return data;
//   }
// }

class TotalPlayerStats {
  Person? player;
  List<PersonalStatistic>? personalStats;

  TotalPlayerStats({this.player, this.personalStats});

  TotalPlayerStats.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? new Person.fromJson(json['player']) : null;
    if (json['statistics'] != null) {
      personalStats = <PersonalStatistic>[];
      json['statistics'].forEach((v) {
        personalStats!.add(new PersonalStatistic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.personalStats != null) {
      data['statistics'] = this.personalStats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonalStatistic {
  Games? games;
  int? offsides;
  Shots? shots;
  PersonalGoals? goals;
  Passes? passes;
  Tackles? tackles;
  Duels? duels;
  Dribbles? dribbles;
  Fouls? fouls;
  Cards? cards;
  Penalty? penalty;

  PersonalStatistic(
      {this.games,
        this.offsides,
        this.shots,
        this.goals,
        this.passes,
        this.tackles,
        this.duels,
        this.dribbles,
        this.fouls,
        this.cards,
        this.penalty});

  PersonalStatistic.fromJson(Map<String, dynamic> json) {
    games = json['games'] != null ? new Games.fromJson(json['games']) : null;
    offsides = json['offsides'];
    shots = json['shots'] != null ? new Shots.fromJson(json['shots']) : null;
    goals = json['goals'] != null ? new PersonalGoals.fromJson(json['goals']) : null;
    passes =
    json['passes'] != null ? new Passes.fromJson(json['passes']) : null;
    tackles =
    json['tackles'] != null ? new Tackles.fromJson(json['tackles']) : null;
    duels = json['duels'] != null ? new Duels.fromJson(json['duels']) : null;
    dribbles = json['dribbles'] != null
        ? new Dribbles.fromJson(json['dribbles'])
        : null;
    fouls = json['fouls'] != null ? new Fouls.fromJson(json['fouls']) : null;
    cards = json['cards'] != null ? new Cards.fromJson(json['cards']) : null;
    penalty = json['penalty'] != null
        ? new Penalty.fromJson(json['penalty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.games != null) {
      data['games'] = this.games!.toJson();
    }
    data['offsides'] = this.offsides;
    if (this.shots != null) {
      data['shots'] = this.shots!.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals!.toJson();
    }
    if (this.passes != null) {
      data['passes'] = this.passes!.toJson();
    }
    if (this.tackles != null) {
      data['tackles'] = this.tackles!.toJson();
    }
    if (this.duels != null) {
      data['duels'] = this.duels!.toJson();
    }
    if (this.dribbles != null) {
      data['dribbles'] = this.dribbles!.toJson();
    }
    if (this.fouls != null) {
      data['fouls'] = this.fouls!.toJson();
    }
    if (this.cards != null) {
      data['cards'] = this.cards!.toJson();
    }
    if (this.penalty != null) {
      data['penalty'] = this.penalty!.toJson();
    }
    return data;
  }
}

class Games {
  int? minutes;
  int? number;
  String? position;
  String? rating;
  bool? captain;
  bool? substitute;

  Games(
      {this.minutes,
        this.number,
        this.position,
        this.rating,
        this.captain,
        this.substitute});

  Games.fromJson(Map<String, dynamic> json) {
    minutes = json['minutes'];
    number = json['number'];
    position = json['position'];
    rating = json['rating'];
    captain = json['captain'];
    substitute = json['substitute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minutes'] = this.minutes;
    data['number'] = this.number;
    data['position'] = this.position;
    data['rating'] = this.rating;
    data['captain'] = this.captain;
    data['substitute'] = this.substitute;
    return data;
  }
}

class Shots {
  int? total;
  int? on;

  Shots({this.total, this.on});

  Shots.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    on = json['on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['on'] = this.on;
    return data;
  }
}

class PersonalGoals {
  int? total;
  int? conceded;
  int? assists;
  int? saves;

  PersonalGoals({this.total, this.conceded, this.assists, this.saves});

  PersonalGoals.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    conceded = json['conceded'];
    assists = json['assists'];
    saves = json['saves'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['conceded'] = this.conceded;
    data['assists'] = this.assists;
    data['saves'] = this.saves;
    return data;
  }
}

class Passes {
  int? total;
  int? key;
  String? accuracy;

  Passes({this.total, this.key, this.accuracy});

  Passes.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    key = json['key'];
    accuracy = json['accuracy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['key'] = this.key;
    data['accuracy'] = this.accuracy;
    return data;
  }
}

class Tackles {
  int? total;
  int? blocks;
  int? interceptions;

  Tackles({this.total, this.blocks, this.interceptions});

  Tackles.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    blocks = json['blocks'];
    interceptions = json['interceptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['blocks'] = this.blocks;
    data['interceptions'] = this.interceptions;
    return data;
  }
}

class Duels {
  int? total;
  int? won;

  Duels({this.total, this.won});

  Duels.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    won = json['won'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['won'] = this.won;
    return data;
  }
}

class Dribbles {
  int? attempts;
  int? success;
  int? past;

  Dribbles({this.attempts, this.success, this.past});

  Dribbles.fromJson(Map<String, dynamic> json) {
    attempts = json['attempts'];
    success = json['success'];
    past = json['past'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attempts'] = this.attempts;
    data['success'] = this.success;
    data['past'] = this.past;
    return data;
  }
}

class Fouls {
  int? drawn;
  int? committed;

  Fouls({this.drawn, this.committed});

  Fouls.fromJson(Map<String, dynamic> json) {
    drawn = json['drawn'];
    committed = json['committed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drawn'] = this.drawn;
    data['committed'] = this.committed;
    return data;
  }
}

class Cards {
  int? yellow;
  int? red;

  Cards({this.yellow, this.red});

  Cards.fromJson(Map<String, dynamic> json) {
    yellow = json['yellow'];
    red = json['red'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yellow'] = this.yellow;
    data['red'] = this.red;
    return data;
  }
}

class Penalty {
  int? won;
  int? commited;
  int? scored;
  int? missed;
  int? saved;

  Penalty({this.won, this.commited, this.scored, this.missed, this.saved});

  Penalty.fromJson(Map<String, dynamic> json) {
    won = json['won'];
    commited = json['commited'];
    scored = json['scored'];
    missed = json['missed'];
    saved = json['saved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['won'] = this.won;
    data['commited'] = this.commited;
    data['scored'] = this.scored;
    data['missed'] = this.missed;
    data['saved'] = this.saved;
    return data;
  }
}
