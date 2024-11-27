
class PLCurrentRound {
  String? get;
  Parameters? parameters;
  int? results;
  Paging? paging;
  List<Response>? response;

  PLCurrentRound(
      {this.get,
        this.parameters,
        this.results,
        this.paging,
        this.response});

  PLCurrentRound.fromJson(Map<String, dynamic> json) {
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
  String? current;
  String? dates;
  String? season;

  Parameters({this.league, this.current, this.dates, this.season});

  Parameters.fromJson(Map<String, dynamic> json) {
    league = json['league'];
    current = json['current'];
    dates = json['dates'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['league'] = this.league;
    data['current'] = this.current;
    data['dates'] = this.dates;
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
  String? round;
  List<String>? dates;

  Response({this.round, this.dates});

  Response.fromJson(Map<String, dynamic> json) {
    round = json['round'];
    dates = json['dates'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['round'] = this.round;
    data['dates'] = this.dates;
    return data;
  }
}
