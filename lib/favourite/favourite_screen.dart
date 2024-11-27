import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/favourite/favourite_controller.dart';
import 'package:mynewapp/images_assets.dart';
import 'package:mynewapp/players_detail/players_detail.dart';
import 'package:mynewapp/tabview_base.dart';
import 'package:mynewapp/teams_detail/teams_detail.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite>
    with SingleTickerProviderStateMixin {
  late FavouriteController _controller;

  @override
  void initState() {
    _controller = FavouriteController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      label: 'Theo dõi',
      appBar: AppBar(
        title: safeText(text: 'Theo dõi', color: Colors.white),
        backgroundColor: commonColor(),
      ),
      body: TabBase(
        tabTextSize: 15.sp,
        tabBarColor: commonColor(),
        tabTitleList: const ['Đội bóng', 'Cầu thủ'],
        tabs: [
          favTeamTab(),
          favPlayersTab(),
        ],
      ),
    );
  }

  Widget favTeamTab() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.favTeams.toList().length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return (index == _controller.favTeams.length)
                      ? InkWell(
                          onTap: () async {
                            final teamsList = _controller
                                    .commonRapidPLTeams.plTeams
                                    ?.map((team) => team.team?.name ?? '')
                                    .toList() ??
                                [];
                            final teamsId = _controller
                                    .commonRapidPLTeams.plTeams
                                    ?.map((team) => team.team?.id ?? 0)
                                    .toList() ??
                                [];
                            final teamProfile =
                                _controller.commonRapidPLTeams.plTeams ?? [];
                            final result = await showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(
                                groups: ['Premier League'],
                                details: [teamsList],
                                detailsId: [teamsId],
                                groupsProfiles: [39],
                                detailsProfiles: [teamProfile],
                              ),
                            );

                            if (result != null) {
                              if (result['detailID'] is int) {
                                final color = _controller.getColorPLDataById(
                                    teamRapidId: result['detailID']);
                                _controller.colorByTeams.add(color);
                                _controller.orgIds.add(
                                    _controller.getOrgIdByRapidId(
                                        teamRapidId: result['detailID']));
                                final beforeLength =
                                    _controller.favTeams.length;
                                _controller.favTeams
                                    .add(result['detailProfile']);
                                final afterLength = _controller.favTeams.length;
                                if (afterLength == beforeLength) {
                                  _controller.colorByTeams.removeLast();
                                }
                              }
                            }
                          },
                          child: addNewMark('Lưu đội bóng mới'),
                        )
                      : (_controller.favTeams.isEmpty)
                          ? null
                          : InkWell(
                              onTap: () {
                                final basePath =
                                    _controller.favTeams.toList()[index].team;
                                final color = _controller.colorByTeams[index];
                                final clubName = basePath?.name ?? '';
                                final crest = basePath?.logo ?? '';
                                //Đang test
                                (basePath?.id != null)
                                    ? Get.to(
                                        TeamsDetail(
                                          clubColor: color,
                                          clubName: clubName,
                                          clubCrest: crest,
                                        ),
                                        arguments: {
                                            'orgTeamId': _controller.orgIds
                                                .toList()[index],
                                            'rapidTeamId': basePath?.id,
                                          })
                                    : null;
                              },
                              child: favouriteWidget(
                                name: _controller.favTeams
                                        .toList()[index]
                                        .team
                                        ?.name ??
                                    '',
                                image: _controller.favTeams
                                        .toList()[index]
                                        .team
                                        ?.logo ??
                                    '',
                                stadium: _controller.favTeams
                                        .toList()[index]
                                        .venue
                                        ?.name ??
                                    '',
                                teamColor: _controller.colorByTeams[index],
                                onClose: () {
                                  _controller.colorByTeams.removeAt(index);
                                  _controller.favTeams.remove(
                                      _controller.favTeams.toList()[index]);
                                },
                              ),
                            );
                },
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget favPlayersTab() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.favPlayers.toList().length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return (index == _controller.favPlayers.length)
                      ? InkWell(
                          onTap: () async {
                            final listOfAllPlayersListsByTeam =
                                _controller.commonPlPlayers.plPlayers;

                            final teamList = listOfAllPlayersListsByTeam
                                    ?.map((e) =>
                                        e.teamsPlayers?[0].team?.name ?? '')
                                    .toList() ??
                                [];

                            final teamsProfileList = listOfAllPlayersListsByTeam
                                    ?.map((e) => e.teamsPlayers?[0].team ?? '')
                                    .toList() ??
                                [];

                            final playerList = listOfAllPlayersListsByTeam
                                    ?.map((e) =>
                                        e.teamsPlayers?[0].players
                                            ?.map((player) => player.name ?? '')
                                            .toList() ??
                                        [])
                                    .toList() ??
                                [];

                            final playersId = listOfAllPlayersListsByTeam
                                    ?.map((e) =>
                                        e.teamsPlayers?[0].players
                                            ?.map((player) => player.id ?? 0)
                                            .toList() ??
                                        [])
                                    .toList() ??
                                [];

                            final playersProfileList =
                                listOfAllPlayersListsByTeam
                                        ?.map((e) =>
                                            e.teamsPlayers?[0].players ?? [])
                                        .toList() ??
                                    [];

                            final result = await showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(
                                groups: teamList,
                                details: playerList,
                                detailsId: playersId,
                                groupsProfiles: teamsProfileList,
                                detailsProfiles: playersProfileList,
                              ),
                            );

                            if (result != null) {
                              _controller.teamsOfFavPlayers
                                  .add(result['groupProfile']);
                              final color = _controller.getColorPLDataById(
                                  teamRapidId:
                                      _controller.teamsOfFavPlayers.last.id);
                              _controller.colorByPlayers.add(color);

                              final beforeLength =
                                  _controller.favPlayers.length;
                              _controller.favPlayers
                                  .add(result['detailProfile']);
                              final afterLength = _controller.favPlayers.length;
                              if (afterLength == beforeLength) {
                                _controller.teamsOfFavPlayers.removeLast();
                                _controller.colorByPlayers.removeLast();
                              }
                            }
                          },
                          child: addNewMark('Lưu cầu thủ mới'),
                        )
                      : (_controller.favPlayers.isNotEmpty &&
                              _controller.teamsOfFavPlayers.isNotEmpty)
                          ? InkWell(
                              onTap: () {
                                final basePath =
                                    _controller.favPlayers.toList()[index];
                                final playerName = basePath.name ?? '';
                                final playerImage = basePath.photo ?? '';
                                final clubName =
                                    _controller.teamsOfFavPlayers[index].name ??
                                        '';
                                final clubCrest =
                                    _controller.teamsOfFavPlayers[index].logo ??
                                        '';
                                final color = _controller.colorByPlayers[index];

                                if (basePath.id != null) {
                                  Get.to(
                                    PlayersDetail(
                                      playerImage: playerImage,
                                      playerName: playerName,
                                      clubName: clubName,
                                      clubCrest: clubCrest,
                                      color: color,
                                    ),
                                    arguments: {
                                      'rapidPlayerId': basePath.id,
                                    },
                                  );
                                }
                              },
                              child: favouriteWidget(
                                name: _controller.favPlayers
                                        .toList()[index]
                                        .name ??
                                    '',
                                image: _controller.favPlayers
                                        .toList()[index]
                                        .photo ??
                                    '',
                                teamColor: _controller.colorByPlayers[index],
                                playerClubImage: _controller.teamsOfFavPlayers
                                    .toList()[index]
                                    .logo,
                                onClose: () {
                                  _controller.teamsOfFavPlayers.removeAt(index);
                                  _controller.colorByPlayers.removeAt(index);
                                  _controller.favPlayers.remove(
                                      _controller.favPlayers.toList()[index]);
                                },
                                playerClubName:
                                    _controller.teamsOfFavPlayers[index].name,
                                isPlayer: true,
                              ),
                            )
                          : null;
                },
              ),
            ),

            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: topValueTeams.length,
            //     itemBuilder: (context, index){
            //     return topValue(topValueTeams[index]["clubImage"], topValueTeams[index]["clubName"], index);
            //     },
            // ),

            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget addNewMark(
    String description,
  ) {
    return shadowContainer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.add_circle_outline,
          size: 22,
        ),
        const SizedBox(
          height: 10,
        ),
        safeText(
          text: description,
          fontSize: 17.sp,
        )
      ],
    ));
  }

  Widget favouriteWidget({
    required String name,
    required String image,
    String? stadium,
    String? playerClubName,
    required Color teamColor,
    String? playerClubImage,
    void Function()? onClose,
    bool isPlayer = false,
  }) {
    return Stack(children: [
      shadowContainer(
        color: Color.alphaBlend(
          Colors.black.withOpacity(0.1),
          teamColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  loadImages(
                    imageUrl: image,
                    height: 50.h,
                    width: 50.w,
                    shape: (isPlayer = true)
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                  ),
                ],
              ),
              safeText(
                text: name,
                fontSize: 17.sp,
                isBold: true,
                color: (teamColor != Colors.white) ? Colors.white : null,
              ),
              SizedBox(
                height: 7.h,
              ),
              if (stadium != null)
                Row(
                  children: [
                    Icon(
                      Icons.stadium,
                      color: (teamColor != Colors.white) ? Colors.white : null,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    safeText(
                      text: 'Stadium',
                      color: (teamColor != Colors.white) ? Colors.white : null,
                      fontSize: 12.sp,
                    ),
                  ],
                ),
              if (stadium != null)
                safeText(
                  text: stadium,
                  color: (teamColor != Colors.white) ? Colors.white : null,
                  fontSize: 12.sp,
                ),
              if (playerClubName != null)
                Row(
                  children: [
                    if (playerClubImage != null)
                      loadImages(
                        imageUrl: playerClubImage,
                        height: 30,
                        width: 30,
                        shape: BoxShape.circle,
                        errorWidget: Image.asset(
                          ImagesAssets.crest,
                          height: 30.h,
                          width: 30.w,
                          color:
                              (teamColor != Colors.white) ? Colors.white : null,
                        ),
                      ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    safeText(
                      text: playerClubName,
                      color: (teamColor != Colors.white) ? Colors.white : null,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: onClose,
              child: Container(
                decoration:
                    BoxDecoration(color: commonColor(), shape: BoxShape.circle),
                child: const Icon(
                  Icons.close_outlined,
                  color: Colors.white,
                ),
              ),
            )),
      ),
    ]);
  }
}

class CustomSearchDelegate extends SearchDelegate<Map<String, dynamic>?> {
  final List<String> groups;
  final List<List<String>> details;
  final List<List<int>> detailsId;
  final List<dynamic> groupsProfiles; //dua vao class cua data model
  final List<List<dynamic>> detailsProfiles; //dua vao class cua data model
  CustomSearchDelegate({
    required this.groups,
    required this.details,
    required this.detailsId,
    required this.groupsProfiles,
    required this.detailsProfiles,
  });

  int groupIndex = 0;
  int idIndexAfterExpand = 0;
  int selectedId = 0;
  String selectedGroup = '';

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
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final detailsAddIndex = details.asMap().entries.toList();
    final choiceList = detailsAddIndex[groupIndex].value;
    final filter = choiceList
        .asMap()
        .entries
        .where(
            (entry) => entry.value.toLowerCase().contains(query.toLowerCase()))
        .toList();
    int positionInGroup = 0;

    return ListView.builder(
      itemCount: filter.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filter[index].value),
          onTap: () {
            positionInGroup = filter.map((entry) => entry.key).toList()[index];
            selectedId = detailsId[groupIndex][positionInGroup];

            close(context, {
              'groupName': groups[groupIndex],
              'groupProfile': groupsProfiles[groupIndex],
              'detailName': filter[index].value,
              'detailProfile': detailsProfiles[groupIndex][positionInGroup],
              'detailID': selectedId,
            });
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final profileResult = detailsProfiles.expand((profile) => profile).toList();
    final expandDetails = details.expand((detail) => detail).toList();

    final elementsByIndex = List.generate(expandDetails.length,
        (index) => {'index': index, 'detail': expandDetails[index]});

    List<Map<String, dynamic>> suggestionsWithIndex = [];

    if (query.isEmpty && selectedGroup.isEmpty) {
      suggestionsWithIndex = elementsByIndex.where((detail) {
        final data = detail['detail'] as String;
        return data.contains(query.toLowerCase());
      }).toList();

      // Hiển thị thanh danh mục giải đấu nằm ngang cùng gợi ý mặc định
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thanh danh mục giải đấu nằm ngang
          if (groups.length > 1)
            Container(
              height: 80.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: groups.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      selectedGroup = groups[index];
                      groupIndex = index;
                      showResults(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: safeText(
                              safeEnable: false,
                              color: Colors.white,
                              text: groups[index],
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          // Danh sách gợi ý mặc định
          Expanded(
            child: ListView.builder(
              itemCount: suggestionsWithIndex.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(suggestionsWithIndex[index]['detail']),
                  onTap: () {
                    query = suggestionsWithIndex[index]['detail'] as String;
                    idIndexAfterExpand =
                        suggestionsWithIndex[index]['index'] as int;
                    selectedId = detailsId
                        .expand((id) => id)
                        .toList()[idIndexAfterExpand];
                    groupIndex =
                        detailsId.indexWhere((ids) => ids.contains(selectedId));
                    close(context, {
                      'groupName': groups[groupIndex],
                      'groupProfile': groupsProfiles[groupIndex],
                      'detailName': suggestionsWithIndex[index]['detail'],
                      'detailProfile': profileResult[idIndexAfterExpand],
                      'detailID': selectedId,
                    });
                  },
                );
              },
            ),
          ),
        ],
      );
    } else if (query.isNotEmpty && selectedGroup.isEmpty) {
      // Hiển thị toàn bộ đội bóng của giải đấu đã chọn
      suggestionsWithIndex = elementsByIndex.where((detail) {
        final data = detail['detail'] as String;
        return data.toLowerCase().contains(query.toLowerCase());
      }).toList();
      final profileResult =
          detailsProfiles.expand((profile) => profile).toList();

      return ListView.builder(
        itemCount: suggestionsWithIndex.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestionsWithIndex[index]['detail']),
            onTap: () {
              query = suggestionsWithIndex[index]['detail'];
              idIndexAfterExpand = suggestionsWithIndex[index]['index'];
              selectedId =
                  detailsId.expand((id) => id).toList()[idIndexAfterExpand];
              groupIndex =
                  detailsId.indexWhere((ids) => ids.contains(selectedId));
              close(context, {
                'groupName': groups[groupIndex],
                'groupProfile': groupsProfiles[groupIndex],
                'detailName': suggestionsWithIndex[index]['detail'],
                'detailProfile': profileResult[idIndexAfterExpand],
                'detailID': selectedId,
              });
            },
          );
        },
      );
    } else {
      // Hiển thị các gợi ý tìm kiếm dựa trên từ khóa người dùng nhập
      final detailsAddIndex = details.asMap().entries.toList();
      final choiceList = detailsAddIndex[groupIndex].value;
      final filter = choiceList
          .asMap()
          .entries
          .where((entry) =>
              entry.value.toLowerCase().contains(query.toLowerCase()))
          .toList();
      int positionInGroup = 0;

      // Hiển thị danh sách gợi ý tìm kiếm
      return ListView.builder(
        itemCount: filter.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filter[index].value),
            onTap: () {
              positionInGroup =
                  filter.map((entry) => entry.key).toList()[index];
              selectedId = detailsId[groupIndex][positionInGroup];

              close(context, {
                'groupName': groups[groupIndex],
                'groupProfile': groupsProfiles[groupIndex],
                'detailName': filter[index].value,
                'detailProfile': detailsProfiles[groupIndex][positionInGroup],
                'detailID': selectedId,
              });
            },
          );
        },
      );
    }
  }
}
