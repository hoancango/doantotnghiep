Map<String, dynamic> matchData = {
  "get": "fixtures",
  "parameters": {"id": "1208113"},
  "errors": [],
  "results": 1,
  "paging": {"current": 1, "total": 1},
  "response": [
    {
      "fixture": {
        "id": 1208113,
        "referee": "M. Oliver",
        "timezone": "UTC",
        "date": "2024-11-02T15:00:00+00:00",
        "timestamp": 1730559600,
        "periods": {"first": 1730559600, "second": 1730563200},
        "venue": {
          "id": 504,
          "name": "Vitality Stadium",
          "city": "Bournemouth, Dorset"
        },
        "status": {
          "long": "Match Finished",
          "short": "FT",
          "elapsed": 90,
          "extra": 7
        }
      },
      "league": {
        "id": 39,
        "name": "Premier League",
        "country": "England",
        "logo": "https://media.api-sports.io/football/leagues/39.png",
        "flag": "https://media.api-sports.io/flags/gb-eng.svg",
        "season": 2024,
        "round": "Regular Season - 10"
      },
      "teams": {
        "home": {
          "id": 35,
          "name": "Bournemouth",
          "logo": "https://media.api-sports.io/football/teams/35.png",
          "winner": true
        },
        "away": {
          "id": 50,
          "name": "Manchester City",
          "logo": "https://media.api-sports.io/football/teams/50.png",
          "winner": false
        }
      },
      "goals": {"home": 2, "away": 1},
      "score": {
        "halftime": {"home": 1, "away": 0},
        "fulltime": {"home": 2, "away": 1},
        "extratime": {"home": null, "away": null},
        "penalty": {"home": null, "away": null}
      },
      "events": [
        {
          "time": {"elapsed": 6, "extra": null},
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "player": {"id": 1125, "name": "Ryan Christie"},
          "assist": {"id": null, "name": null},
          "type": "Card",
          "detail": "Yellow Card",
          "comments": "Foul"
        },
        {
          "time": {"elapsed": 9, "extra": null},
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "player": {"id": 19281, "name": "A. Semenyo"},
          "assist": {"id": 206254, "name": "M. Kerkez"},
          "type": "Goal",
          "detail": "Normal Goal",
          "comments": null
        },
        {
          "time": {"elapsed": 64, "extra": null},
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "player": {"id": 152856, "name": "Evanilson"},
          "assist": {"id": 206254, "name": "M. Kerkez"},
          "type": "Goal",
          "detail": "Normal Goal",
          "comments": null
        },
        {
          "time": {"elapsed": 66, "extra": null},
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "player": {"id": 1125, "name": "R. Christie"},
          "assist": {"id": 1150, "name": "T. Adams"},
          "type": "subst",
          "detail": "Substitution 1",
          "comments": null
        },
        {
          "time": {"elapsed": 71, "extra": null},
          "team": {
            "id": 50,
            "name": "Manchester City",
            "logo": "https://media.api-sports.io/football/teams/50.png"
          },
          "player": {"id": 627, "name": "Kyle Walker"},
          "assist": {"id": null, "name": null},
          "type": "Card",
          "detail": "Yellow Card",
          "comments": "Foul"
        },
        {
          "time": {"elapsed": 73, "extra": null},
          "team": {
            "id": 50,
            "name": "Manchester City",
            "logo": "https://media.api-sports.io/football/teams/50.png"
          },
          "player": {"id": 18861, "name": "N. Aké"},
          "assist": {"id": 284230, "name": "R. Lewis"},
          "type": "subst",
          "detail": "Substitution 1",
          "comments": null
        },
        {
          "time": {"elapsed": 78, "extra": null},
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "player": {"id": 792, "name": "J. Kluivert"},
          "assist": {"id": 47499, "name": "E. Ünal"},
          "type": "subst",
          "detail": "Substitution 2",
          "comments": null
        },
        {
          "time": {"elapsed": 78, "extra": null},
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "player": {"id": 152856, "name": "Evanilson"},
          "assist": {"id": 18870, "name": "D. Brooks"},
          "type": "subst",
          "detail": "Substitution 3",
          "comments": null
        },
        {
          "time": {"elapsed": 82, "extra": null},
          "team": {
            "id": 50,
            "name": "Manchester City",
            "logo": "https://media.api-sports.io/football/teams/50.png"
          },
          "player": {"id": 129033, "name": "J. Gvardiol"},
          "assist": {"id": 633, "name": "İ. Gündoğan"},
          "type": "Goal",
          "detail": "Normal Goal",
          "comments": null
        },
        {
          "time": {"elapsed": 85, "extra": null},
          "team": {
            "id": 50,
            "name": "Manchester City",
            "logo": "https://media.api-sports.io/football/teams/50.png"
          },
          "player": {"id": 633, "name": "İ. Gündoğan"},
          "assist": {"id": 1422, "name": "J. Doku"},
          "type": "subst",
          "detail": "Substitution 2",
          "comments": null
        },
        {
          "time": {"elapsed": 90, "extra": 1},
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "player": {"id": 1150, "name": "Tyler Adams"},
          "assist": {"id": null, "name": null},
          "type": "Card",
          "detail": "Yellow Card",
          "comments": "Foul"
        },
        {
          "time": {"elapsed": 90, "extra": null},
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "player": {"id": 19245, "name": "M. Tavernier"},
          "assist": {"id": 361497, "name": "Dean Huijsen"},
          "type": "subst",
          "detail": "Substitution 4",
          "comments": null
        }
      ],
      "lineups": [
        {
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png",
            "colors": {
              "player": {
                "primary": "ff0000",
                "number": "dbb85e",
                "border": "ff0000"
              },
              "goalkeeper": {
                "primary": "3fcdf1",
                "number": "020300",
                "border": "3fcdf1"
              }
            }
          },
          "coach": {
            "id": 2108,
            "name": "Andoni Iraola",
            "photo": "https://media.api-sports.io/football/coachs/2108.png"
          },
          "formation": "4-2-3-1",
          "startXI": [
            {
              "player": {
                "id": 18860,
                "name": "M. Travers",
                "number": 42,
                "pos": "G",
                "grid": "1:1"
              }
            },
            {
              "player": {
                "id": 18869,
                "name": "A. Smith",
                "number": 15,
                "pos": "D",
                "grid": "2:4"
              }
            },
            {
              "player": {
                "id": 161671,
                "name": "I. Zabarnyi",
                "number": 27,
                "pos": "D",
                "grid": "2:3"
              }
            },
            {
              "player": {
                "id": 6610,
                "name": "M. Senesi",
                "number": 5,
                "pos": "D",
                "grid": "2:2"
              }
            },
            {
              "player": {
                "id": 206254,
                "name": "M. Kerkez",
                "number": 3,
                "pos": "D",
                "grid": "2:1"
              }
            },
            {
              "player": {
                "id": 18872,
                "name": "L. Cook",
                "number": 4,
                "pos": "M",
                "grid": "3:2"
              }
            },
            {
              "player": {
                "id": 1125,
                "name": "R. Christie",
                "number": 10,
                "pos": "M",
                "grid": "3:1"
              }
            },
            {
              "player": {
                "id": 19281,
                "name": "A. Semenyo",
                "number": 24,
                "pos": "M",
                "grid": "4:3"
              }
            },
            {
              "player": {
                "id": 792,
                "name": "J. Kluivert",
                "number": 19,
                "pos": "M",
                "grid": "4:2"
              }
            },
            {
              "player": {
                "id": 19245,
                "name": "M. Tavernier",
                "number": 16,
                "pos": "M",
                "grid": "4:1"
              }
            },
            {
              "player": {
                "id": 152856,
                "name": "Evanilson",
                "number": 9,
                "pos": "F",
                "grid": "5:1"
              }
            }
          ],
          "substitutes": [
            {
              "player": {
                "id": 1150,
                "name": "T. Adams",
                "number": 12,
                "pos": "M",
                "grid": null
              }
            },
            {
              "player": {
                "id": 47499,
                "name": "E. Ünal",
                "number": 26,
                "pos": "F",
                "grid": null
              }
            },
            {
              "player": {
                "id": 18870,
                "name": "D. Brooks",
                "number": 7,
                "pos": "M",
                "grid": null
              }
            },
            {
              "player": {
                "id": 361497,
                "name": "Dean Huijsen",
                "number": 2,
                "pos": "D",
                "grid": null
              }
            },
            {
              "player": {
                "id": 2734,
                "name": "P. Billing",
                "number": 29,
                "pos": "M",
                "grid": null
              }
            },
            {
              "player": {
                "id": 19070,
                "name": "M. Aarons",
                "number": 37,
                "pos": "D",
                "grid": null
              }
            },
            {
              "player": {
                "id": 51051,
                "name": "J. Araujo",
                "number": 22,
                "pos": "D",
                "grid": null
              }
            },
            {
              "player": {
                "id": 20093,
                "name": "J. Hill",
                "number": 23,
                "pos": "D",
                "grid": null
              }
            },
            {
              "player": {
                "id": 151756,
                "name": "W. Dennis",
                "number": 40,
                "pos": "G",
                "grid": null
              }
            }
          ]
        },
        {
          "team": {
            "id": 50,
            "name": "Manchester City",
            "logo": "https://media.api-sports.io/football/teams/50.png",
            "colors": {
              "player": {
                "primary": "abd1f5",
                "number": "ffffff",
                "border": "abd1f5"
              },
              "goalkeeper": {
                "primary": "30c492",
                "number": "f5ff3c",
                "border": "30c492"
              }
            }
          },
          "coach": {
            "id": 4,
            "name": "Pep Guardiola",
            "photo": "https://media.api-sports.io/football/coachs/4.png"
          },
          "formation": "4-1-4-1",
          "startXI": [
            {
              "player": {
                "id": 617,
                "name": "Ederson",
                "number": 31,
                "pos": "G",
                "grid": "1:1"
              }
            },
            {
              "player": {
                "id": 627,
                "name": "K. Walker",
                "number": 2,
                "pos": "D",
                "grid": "2:4"
              }
            },
            {
              "player": {
                "id": 5,
                "name": "M. Akanji",
                "number": 25,
                "pos": "D",
                "grid": "2:3"
              }
            },
            {
              "player": {
                "id": 18861,
                "name": "N. Aké",
                "number": 6,
                "pos": "D",
                "grid": "2:2"
              }
            },
            {
              "player": {
                "id": 129033,
                "name": "J. Gvardiol",
                "number": 24,
                "pos": "D",
                "grid": "2:1"
              }
            },
            {
              "player": {
                "id": 2291,
                "name": "M. Kovačić",
                "number": 8,
                "pos": "M",
                "grid": "3:1"
              }
            },
            {
              "player": {
                "id": 631,
                "name": "P. Foden",
                "number": 47,
                "pos": "M",
                "grid": "4:4"
              }
            },
            {
              "player": {
                "id": 636,
                "name": "Bernardo Silva",
                "number": 20,
                "pos": "M",
                "grid": "4:3"
              }
            },
            {
              "player": {
                "id": 633,
                "name": "İ. Gündoğan",
                "number": 19,
                "pos": "M",
                "grid": "4:2"
              }
            },
            {
              "player": {
                "id": 41621,
                "name": "Matheus Nunes",
                "number": 27,
                "pos": "M",
                "grid": "4:1"
              }
            },
            {
              "player": {
                "id": 1100,
                "name": "E. Haaland",
                "number": 9,
                "pos": "F",
                "grid": "5:1"
              }
            }
          ],
          "substitutes": [
            {
              "player": {
                "id": 284230,
                "name": "R. Lewis",
                "number": 82,
                "pos": "D",
                "grid": null
              }
            },
            {
              "player": {
                "id": 1422,
                "name": "J. Doku",
                "number": 11,
                "pos": "F",
                "grid": null
              }
            },
            {
              "player": {
                "id": 158697,
                "name": "J. McAtee",
                "number": 87,
                "pos": "M",
                "grid": null
              }
            },
            {
              "player": {
                "id": 25004,
                "name": "S. Ortega",
                "number": 18,
                "pos": "G",
                "grid": null
              }
            },
            {
              "player": {
                "id": 266657,
                "name": "Savinho",
                "number": 26,
                "pos": "F",
                "grid": null
              }
            },
            {
              "player": {
                "id": 629,
                "name": "K. De Bruyne",
                "number": 17,
                "pos": "M",
                "grid": null
              }
            },
            {
              "player": {
                "id": 307123,
                "name": "N. O'Reilly",
                "number": 75,
                "pos": "M",
                "grid": null
              }
            },
            {
              "player": {
                "id": 382355,
                "name": "J. Wright",
                "number": 56,
                "pos": "M",
                "grid": null
              }
            },
            {
              "player": {
                "id": 404656,
                "name": "J. Simpson-Pusey",
                "number": 66,
                "pos": "D",
                "grid": null
              }
            }
          ]
        }
      ],
      "statistics": [
        {
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png"
          },
          "statistics": [
            {"type": "Shots on Goal", "value": 6},
            {"type": "Shots off Goal", "value": 4},
            {"type": "Total Shots", "value": 12},
            {"type": "Blocked Shots", "value": 2},
            {"type": "Shots insidebox", "value": 9},
            {"type": "Shots outsidebox", "value": 3},
            {"type": "Fouls", "value": 11},
            {"type": "Corner Kicks", "value": 3},
            {"type": "Offsides", "value": 2},
            {"type": "Ball Possession", "value": "36%"},
            {"type": "Yellow Cards", "value": 2},
            {"type": "Red Cards", "value": null},
            {"type": "Goalkeeper Saves", "value": 3},
            {"type": "Total passes", "value": 334},
            {"type": "Passes accurate", "value": 282},
            {"type": "Passes %", "value": "84%"},
            {"type": "expected_goals", "value": "2.04"},
            {"type": "goals_prevented", "value": 0}
          ]
        },
        {
          "team": {
            "id": 50,
            "name": "Manchester City",
            "logo": "https://media.api-sports.io/football/teams/50.png"
          },
          "statistics": [
            {"type": "Shots on Goal", "value": 4},
            {"type": "Shots off Goal", "value": 10},
            {"type": "Total Shots", "value": 18},
            {"type": "Blocked Shots", "value": 4},
            {"type": "Shots insidebox", "value": 13},
            {"type": "Shots outsidebox", "value": 5},
            {"type": "Fouls", "value": 6},
            {"type": "Corner Kicks", "value": 10},
            {"type": "Offsides", "value": 0},
            {"type": "Ball Possession", "value": "64%"},
            {"type": "Yellow Cards", "value": 1},
            {"type": "Red Cards", "value": null},
            {"type": "Goalkeeper Saves", "value": 4},
            {"type": "Total passes", "value": 600},
            {"type": "Passes accurate", "value": 541},
            {"type": "Passes %", "value": "90%"},
            {"type": "expected_goals", "value": "1.56"},
            {"type": "goals_prevented", "value": 0}
          ]
        }
      ],
      "players": [
        {
          "team": {
            "id": 35,
            "name": "Bournemouth",
            "logo": "https://media.api-sports.io/football/teams/35.png",
            "update": "2024-11-12T04:19:01+00:00"
          },
          "players": [
            {
              "player": {
                "id": 18860,
                "name": "Mark Travers",
                "photo":
                    "https://media.api-sports.io/football/players/18860.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 42,
                    "position": "G",
                    "rating": "7.3",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 1,
                    "assists": 0,
                    "saves": 3
                  },
                  "passes": {"total": 27, "key": null, "accuracy": "18"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": 0
                  }
                }
              ]
            },
            {
              "player": {
                "id": 18869,
                "name": "Adam Smith",
                "photo":
                    "https://media.api-sports.io/football/players/18869.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 15,
                    "position": "D",
                    "rating": "7",
                    "captain": true,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 1, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 23, "key": 1, "accuracy": "21"},
                  "tackles": {"total": 3, "blocks": null, "interceptions": 2},
                  "duels": {"total": 9, "won": 4},
                  "dribbles": {"attempts": 2, "success": 1, "past": null},
                  "fouls": {"drawn": null, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 161671,
                "name": "Illia Zabarnyi",
                "photo":
                    "https://media.api-sports.io/football/players/161671.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 27,
                    "position": "D",
                    "rating": "6.9",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 31, "key": null, "accuracy": "28"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": 1
                  },
                  "duels": {"total": 4, "won": 1},
                  "dribbles": {"attempts": null, "success": null, "past": 1},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 6610,
                "name": "Marcos Senesi",
                "photo": "https://media.api-sports.io/football/players/6610.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 5,
                    "position": "D",
                    "rating": "7.7",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 57, "key": null, "accuracy": "48"},
                  "tackles": {
                    "total": 3,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 9, "won": 8},
                  "dribbles": {"attempts": 1, "success": 1, "past": null},
                  "fouls": {"drawn": null, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 206254,
                "name": "Miloš Kerkez",
                "photo":
                    "https://media.api-sports.io/football/players/206254.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 3,
                    "position": "D",
                    "rating": "8.3",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 2,
                    "saves": null
                  },
                  "passes": {"total": 30, "key": 2, "accuracy": "29"},
                  "tackles": {"total": null, "blocks": 1, "interceptions": 1},
                  "duels": {"total": 6, "won": 2},
                  "dribbles": {"attempts": 3, "success": 2, "past": null},
                  "fouls": {"drawn": null, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 18872,
                "name": "Lewis Cook",
                "photo":
                    "https://media.api-sports.io/football/players/18872.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 4,
                    "position": "M",
                    "rating": "6.9",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 31, "key": null, "accuracy": "27"},
                  "tackles": {"total": 3, "blocks": null, "interceptions": 4},
                  "duels": {"total": 9, "won": 3},
                  "dribbles": {"attempts": null, "success": null, "past": 2},
                  "fouls": {"drawn": null, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 1125,
                "name": "Ryan Christie",
                "photo": "https://media.api-sports.io/football/players/1125.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 66,
                    "number": 10,
                    "position": "M",
                    "rating": "6.7",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 26, "key": null, "accuracy": "22"},
                  "tackles": {"total": 1, "blocks": 1, "interceptions": 1},
                  "duels": {"total": 7, "won": 2},
                  "dribbles": {"attempts": 1, "success": 1, "past": 1},
                  "fouls": {"drawn": null, "committed": 2},
                  "cards": {"yellow": 1, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 19281,
                "name": "Antoine Semenyo",
                "photo":
                    "https://media.api-sports.io/football/players/19281.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 24,
                    "position": "M",
                    "rating": "8.9",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 2, "on": 2},
                  "goals": {
                    "total": 1,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 35, "key": 3, "accuracy": "29"},
                  "tackles": {
                    "total": 3,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 17, "won": 14},
                  "dribbles": {"attempts": 7, "success": 6, "past": null},
                  "fouls": {"drawn": 2, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 792,
                "name": "Justin Kluivert",
                "photo": "https://media.api-sports.io/football/players/792.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 78,
                    "number": 19,
                    "position": "M",
                    "rating": "7.3",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 3, "on": 2},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 23, "key": 2, "accuracy": "21"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": 1
                  },
                  "duels": {"total": 2, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 19245,
                "name": "Marcus Tavernier",
                "photo":
                    "https://media.api-sports.io/football/players/19245.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 89,
                    "number": 16,
                    "position": "M",
                    "rating": "6.9",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 1, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 27, "key": 1, "accuracy": "23"},
                  "tackles": {"total": 2, "blocks": null, "interceptions": 1},
                  "duels": {"total": 12, "won": 4},
                  "dribbles": {"attempts": 2, "success": null, "past": 2},
                  "fouls": {"drawn": 1, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 152856,
                "name": "Evanilson",
                "photo":
                    "https://media.api-sports.io/football/players/152856.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 78,
                    "number": 9,
                    "position": "F",
                    "rating": "7.2",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": 2,
                  "shots": {"total": 2, "on": 2},
                  "goals": {
                    "total": 1,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 8, "key": null, "accuracy": "6"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 7, "won": 4},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": 1, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 1150,
                "name": "Tyler Adams",
                "photo": "https://media.api-sports.io/football/players/1150.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 24,
                    "number": 12,
                    "position": "M",
                    "rating": "6.7",
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 8, "key": 1, "accuracy": "5"},
                  "tackles": {"total": 1, "blocks": 1, "interceptions": 1},
                  "duels": {"total": 3, "won": 1},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": 1},
                  "cards": {"yellow": 1, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 18870,
                "name": "David Brooks",
                "photo":
                    "https://media.api-sports.io/football/players/18870.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 12,
                    "number": 7,
                    "position": "M",
                    "rating": "6.6",
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": 1, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 2, "key": null, "accuracy": "1"},
                  "tackles": {
                    "total": null,
                    "blocks": 1,
                    "interceptions": null
                  },
                  "duels": {"total": 1, "won": 1},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": 1, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 47499,
                "name": "Enes Ünal",
                "photo":
                    "https://media.api-sports.io/football/players/47499.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 12,
                    "number": 26,
                    "position": "F",
                    "rating": "6.3",
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 5, "key": null, "accuracy": "3"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 5, "won": 1},
                  "dribbles": {"attempts": 1, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 361497,
                "name": "Dean Huijsen",
                "photo":
                    "https://media.api-sports.io/football/players/361497.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 1,
                    "number": 2,
                    "position": "D",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 1, "key": null, "accuracy": "1"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 151756,
                "name": "Will Dennis",
                "photo":
                    "https://media.api-sports.io/football/players/151756.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 40,
                    "position": "G",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 51051,
                "name": "Julian Araujo",
                "photo":
                    "https://media.api-sports.io/football/players/51051.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 22,
                    "position": "D",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 20093,
                "name": "James Hill",
                "photo":
                    "https://media.api-sports.io/football/players/20093.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 23,
                    "position": "D",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 19070,
                "name": "Max Aarons",
                "photo":
                    "https://media.api-sports.io/football/players/19070.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 37,
                    "position": "D",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 2734,
                "name": "Philip Billing",
                "photo": "https://media.api-sports.io/football/players/2734.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 29,
                    "position": "M",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            }
          ]
        },
        {
          "team": {
            "id": 50,
            "name": "Manchester City",
            "logo": "https://media.api-sports.io/football/teams/50.png",
            "update": "2024-11-12T04:19:01+00:00"
          },
          "players": [
            {
              "player": {
                "id": 617,
                "name": "Ederson",
                "photo": "https://media.api-sports.io/football/players/617.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 31,
                    "position": "G",
                    "rating": "7.3",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 2,
                    "assists": 0,
                    "saves": 4
                  },
                  "passes": {"total": 47, "key": null, "accuracy": "41"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 1, "won": 1},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": 0
                  }
                }
              ]
            },
            {
              "player": {
                "id": 627,
                "name": "Kyle Walker",
                "photo": "https://media.api-sports.io/football/players/627.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 2,
                    "position": "D",
                    "rating": "6.5",
                    "captain": true,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 51, "key": 1, "accuracy": "41"},
                  "tackles": {"total": 2, "blocks": null, "interceptions": 1},
                  "duels": {"total": 13, "won": 4},
                  "dribbles": {"attempts": null, "success": null, "past": 3},
                  "fouls": {"drawn": 1, "committed": 2},
                  "cards": {"yellow": 1, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 5,
                "name": "Manuel Akanji",
                "photo": "https://media.api-sports.io/football/players/5.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 25,
                    "position": "D",
                    "rating": "6.6",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 46, "key": null, "accuracy": "44"},
                  "tackles": {
                    "total": 2,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 9, "won": 5},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": 1, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 18861,
                "name": "Nathan Aké",
                "photo":
                    "https://media.api-sports.io/football/players/18861.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 73,
                    "number": 6,
                    "position": "D",
                    "rating": "6.2",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 1, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 76, "key": null, "accuracy": "74"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 3, "won": 1},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 129033,
                "name": "Joško Gvardiol",
                "photo":
                    "https://media.api-sports.io/football/players/129033.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 24,
                    "position": "D",
                    "rating": "7.9",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 2, "on": 1},
                  "goals": {
                    "total": 1,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 48, "key": 1, "accuracy": "45"},
                  "tackles": {"total": 2, "blocks": 2, "interceptions": 2},
                  "duels": {"total": 13, "won": 6},
                  "dribbles": {"attempts": 3, "success": 1, "past": 1},
                  "fouls": {"drawn": 1, "committed": 2},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 2291,
                "name": "Mateo Kovačić",
                "photo": "https://media.api-sports.io/football/players/2291.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 8,
                    "position": "M",
                    "rating": "6.9",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 1, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 74, "key": null, "accuracy": "73"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": 1
                  },
                  "duels": {"total": 6, "won": 2},
                  "dribbles": {"attempts": 2, "success": 1, "past": 2},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 631,
                "name": "Phil Foden",
                "photo": "https://media.api-sports.io/football/players/631.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 47,
                    "position": "M",
                    "rating": "7.2",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 4, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 44, "key": 1, "accuracy": "39"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 10, "won": 5},
                  "dribbles": {"attempts": 2, "success": 1, "past": 2},
                  "fouls": {"drawn": 4, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 636,
                "name": "Bernardo Silva",
                "photo": "https://media.api-sports.io/football/players/636.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 20,
                    "position": "M",
                    "rating": "6.9",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 71, "key": 1, "accuracy": "59"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": 1
                  },
                  "duels": {"total": 6, "won": 4},
                  "dribbles": {"attempts": 2, "success": 2, "past": 2},
                  "fouls": {"drawn": 1, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 633,
                "name": "İlkay Gündoğan",
                "photo": "https://media.api-sports.io/football/players/633.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 85,
                    "number": 19,
                    "position": "M",
                    "rating": "7.2",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 1,
                    "saves": null
                  },
                  "passes": {"total": 63, "key": 2, "accuracy": "59"},
                  "tackles": {
                    "total": 1,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 5, "won": 4},
                  "dribbles": {"attempts": 1, "success": null, "past": null},
                  "fouls": {"drawn": 1, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 41621,
                "name": "Matheus Nunes",
                "photo":
                    "https://media.api-sports.io/football/players/41621.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 27,
                    "position": "M",
                    "rating": "7.6",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 46, "key": 5, "accuracy": "36"},
                  "tackles": {
                    "total": 5,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 15, "won": 10},
                  "dribbles": {"attempts": 1, "success": 1, "past": 1},
                  "fouls": {"drawn": 1, "committed": 1},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 1100,
                "name": "Erling Haaland",
                "photo": "https://media.api-sports.io/football/players/1100.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 90,
                    "number": 9,
                    "position": "F",
                    "rating": "6.2",
                    "captain": false,
                    "substitute": false
                  },
                  "offsides": null,
                  "shots": {"total": 5, "on": 2},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 7, "key": null, "accuracy": "5"},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 5, "won": 1},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 284230,
                "name": "Rico Lewis",
                "photo":
                    "https://media.api-sports.io/football/players/284230.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 17,
                    "number": 82,
                    "position": "D",
                    "rating": "7",
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 21, "key": 1, "accuracy": "21"},
                  "tackles": {
                    "total": 1,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 2, "won": 1},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 1422,
                "name": "Jérémy Doku",
                "photo": "https://media.api-sports.io/football/players/1422.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": 12,
                    "number": 11,
                    "position": "F",
                    "rating": "7",
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": 1, "on": 1},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": 0,
                    "saves": null
                  },
                  "passes": {"total": 6, "key": 1, "accuracy": "4"},
                  "tackles": {
                    "total": 1,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": 3, "won": 2},
                  "dribbles": {"attempts": 1, "success": null, "past": null},
                  "fouls": {"drawn": 1, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 25004,
                "name": "Stefan Ortega",
                "photo":
                    "https://media.api-sports.io/football/players/25004.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 18,
                    "position": "G",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 404656,
                "name": "Jahmai Simpson-Pusey",
                "photo":
                    "https://media.api-sports.io/football/players/404656.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 66,
                    "position": "D",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 629,
                "name": "Kevin De Bruyne",
                "photo": "https://media.api-sports.io/football/players/629.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 17,
                    "position": "M",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 266657,
                "name": "Savinho",
                "photo":
                    "https://media.api-sports.io/football/players/266657.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 26,
                    "position": "F",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 158697,
                "name": "James McAtee",
                "photo":
                    "https://media.api-sports.io/football/players/158697.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 87,
                    "position": "M",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 382355,
                "name": "Jacob Wright",
                "photo":
                    "https://media.api-sports.io/football/players/382355.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 56,
                    "position": "M",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            },
            {
              "player": {
                "id": 307123,
                "name": "Nico O'Reilly",
                "photo":
                    "https://media.api-sports.io/football/players/307123.png"
              },
              "statistics": [
                {
                  "games": {
                    "minutes": null,
                    "number": 75,
                    "position": "M",
                    "rating": null,
                    "captain": false,
                    "substitute": true
                  },
                  "offsides": null,
                  "shots": {"total": null, "on": null},
                  "goals": {
                    "total": null,
                    "conceded": 0,
                    "assists": null,
                    "saves": null
                  },
                  "passes": {"total": null, "key": null, "accuracy": null},
                  "tackles": {
                    "total": null,
                    "blocks": null,
                    "interceptions": null
                  },
                  "duels": {"total": null, "won": null},
                  "dribbles": {"attempts": null, "success": null, "past": null},
                  "fouls": {"drawn": null, "committed": null},
                  "cards": {"yellow": 0, "red": 0},
                  "penalty": {
                    "won": null,
                    "commited": null,
                    "scored": 0,
                    "missed": 0,
                    "saved": null
                  }
                }
              ]
            }
          ]
        }
      ]
    }
  ]
};
