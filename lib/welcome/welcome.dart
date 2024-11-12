import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_data.dart';
import 'package:mynewapp/common_resources.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              safeText(
                text: 'Welcome!',
                fontSize: 30.sp,
                isBold: true,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              safeText(
                safeEnable: false,
                text:
                    'Help us tailor your experience by answering a few quick and easy questions',
                color: Colors.white,
                isBold: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              button(
                text: 'Get started',
                color: Colors.white,
                height: 50.h,
                width: ScreenUtil().screenWidth,
              ),
              SizedBox(
                height: 10.h,
              ),
              safeText(
                text: 'If you already have an account',
                color: Colors.white,
                isBold: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              button(
                text: 'Log in',
                color: commonColor(),
                textColor: Colors.white,
                height: 50.h,
                width: ScreenUtil().screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button({
    required String text,
    Color? color,
    Color? textColor,
    double? height,
    double? width,
    bool isBold = false,
    void Function()? onTab,
  }) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: safeText(
            text: text,
            color: textColor,
          ),
        )),
      ),
    );
  }
}



class CustomSearchDelegate extends SearchDelegate<String> {
  final Map<String, List<String>> leagues = {
    "Premier League": ["Manchester United", "Liverpool", "Chelsea", "Arsenal"],
    "La Liga": ["Barcelona", "Real Madrid", "Atletico Madrid", "Sevilla"],
    "Serie A": ["Juventus", "AC Milan", "Inter Milan", "Napoli"],
    "Bundesliga": ["Bayern Munich", "Dortmund", "Leipzig", "Frankfurt"],
    "Ligue 1": ["PSG", "Marseille", "Lyon", "Monaco"],
  };

  String selectedLeague = "";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: commonColor(),
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
        color: Colors.white54,
      )),
      textTheme: TextTheme(
          titleLarge: TextStyle(
        color: Colors.white,
      )),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.white,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = leagues[selectedLeague]!
        .where((team) => team.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions;

    if (query.isEmpty && selectedLeague.isEmpty) {
      // Hiển thị thanh danh mục giải đấu nằm ngang cùng gợi ý mặc định
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thanh danh mục giải đấu nằm ngang
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: leagues.keys.map((league) {
                return GestureDetector(
                  onTap: () {
                    selectedLeague = league;
                    showResults(context);
                  },
                  child: Container(
                    width: 120,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        league,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Danh sách gợi ý mặc định
          Expanded(
            child: ListView(
              children: leagues.values
                  .expand((teams) => teams)
                  .map((team) => ListTile(
                        title: Text(team),
                        onTap: () {
                          query = team;
                          showResults(context);
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      );
    } else if (query.isEmpty && selectedLeague.isNotEmpty) {
      // Hiển thị toàn bộ đội bóng của giải đấu đã chọn
      suggestions = leagues[selectedLeague]!;
    } else {
      // Hiển thị các gợi ý tìm kiếm dựa trên từ khóa người dùng nhập
      suggestions = leagues.values
          .expand((teams) => teams)
          .where((team) => team.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    // Hiển thị danh sách gợi ý tìm kiếm
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
