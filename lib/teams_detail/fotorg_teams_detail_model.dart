

class TotalTeamsDetails {
  Area? area;
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  String? address;
  String? website;
  int? founded;
  String? clubColors;
  String? venue;
  List<RunningCompetitions>? runningCompetitions;
  Coach? coach;
  List<Squad>? squad;
  String? lastUpdated;

  TotalTeamsDetails(
      {this.area,
        this.id,
        this.name,
        this.shortName,
        this.tla,
        this.crest,
        this.address,
        this.website,
        this.founded,
        this.clubColors,
        this.venue,
        this.runningCompetitions,
        this.coach,
        this.squad,
        this.lastUpdated});

  TotalTeamsDetails.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    tla = json['tla'];
    crest = json['crest'];
    address = json['address'];
    website = json['website'];
    founded = json['founded'];
    clubColors = json['clubColors'];
    venue = json['venue'];
    if (json['runningCompetitions'] != null) {
      runningCompetitions = <RunningCompetitions>[];
      json['runningCompetitions'].forEach((v) {
        runningCompetitions!.add(new RunningCompetitions.fromJson(v));
      });
    }
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
    if (json['squad'] != null) {
      squad = <Squad>[];
      json['squad'].forEach((v) {
        squad!.add(new Squad.fromJson(v));
      });
    }

    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['tla'] = this.tla;
    data['crest'] = this.crest;
    data['address'] = this.address;
    data['website'] = this.website;
    data['founded'] = this.founded;
    data['clubColors'] = this.clubColors;
    data['venue'] = this.venue;
    if (this.runningCompetitions != null) {
      data['runningCompetitions'] =
          this.runningCompetitions!.map((v) => v.toJson()).toList();
    }
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    if (this.squad != null) {
      data['squad'] = this.squad!.map((v) => v.toJson()).toList();
    }
    data['lastUpdated'] = this.lastUpdated;
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

class RunningCompetitions {
  int? id;
  String? name;
  String? code;
  String? type;
  String? emblem;

  RunningCompetitions({this.id, this.name, this.code, this.type, this.emblem});

  RunningCompetitions.fromJson(Map<String, dynamic> json) {
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

class Coach {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? dateOfBirth;
  String? nationality;
  Contract? contract;

  Coach(
      {this.id,
        this.firstName,
        this.lastName,
        this.name,
        this.dateOfBirth,
        this.nationality,
        this.contract});

  Coach.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    name = json['name'];
    dateOfBirth = json['dateOfBirth'];
    nationality = json['nationality'];
    contract = json['contract'] != null
        ? new Contract.fromJson(json['contract'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['name'] = this.name;
    data['dateOfBirth'] = this.dateOfBirth;
    data['nationality'] = this.nationality;
    if (this.contract != null) {
      data['contract'] = this.contract!.toJson();
    }
    return data;
  }
}

class Contract {
  String? start;
  String? until;

  Contract({this.start, this.until});

  Contract.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    until = json['until'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['until'] = this.until;
    return data;
  }
}

class Squad {
  int? id;
  String? name;
  String? position;
  String? dateOfBirth;
  String? nationality;

  Squad(
      {this.id, this.name, this.position, this.dateOfBirth, this.nationality});

  Squad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    dateOfBirth = json['dateOfBirth'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['dateOfBirth'] = this.dateOfBirth;
    data['nationality'] = this.nationality;
    return data;
  }
}
