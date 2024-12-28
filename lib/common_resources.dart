import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mynewapp/images_assets.dart';

class Common {
  static Widget loadImages(
      {required String imageUrl,
      required double height,
      required double width,
      bool? isBorder,
      double? circularRadius}) {
    return Container(
      height: height,
      width: width,
      decoration: (isBorder == true && circularRadius != null)
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(circularRadius),
            )
          : null,
      clipBehavior: (isBorder == true && circularRadius != null)
          ? Clip.antiAlias
          : Clip.none,
      child: (imageUrl.contains('.svg'))
          ? SvgPicture.network(
              imageUrl,
              fit: BoxFit.fill,
            )
          : Image.network(
              imageUrl,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
    );
  }

  static Widget safeText(
      {required String text, Color? color, bool? isBold, double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: (color != null) ? color : null,
        fontWeight: (isBold == true) ? FontWeight.bold : null,
        fontSize: (fontSize != null) ? fontSize : null,
      ),
      maxLines: 3,
    );
  }

  static Widget getMatches(
      {bool hasScore = false,
      int? homeGoals,
      int? awayGoals,
      required String homeTeamName,
      required String awayTeamName,
      required String homeTeamFlagUrl,
      String? utcTime,
      required String awayTeamFlagUrl}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(homeTeamName),
                  SizedBox(
                    width: 5.0,
                  ),
                  loadImages(imageUrl: homeTeamFlagUrl, height: 30, width: 30)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 8.0,
                    ),
                    child: (hasScore == false && utcTime != null)
                        ? safeText(text: toLocalTime(utcString: utcTime))
                        : (hasScore == true &&
                                homeGoals != null &&
                                awayGoals != null)
                            ? safeText(text: '$homeGoals - $awayGoals')
                            : safeText(text: '!Lỗi'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      loadImages(
                          imageUrl: awayTeamFlagUrl, height: 30, width: 30),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(awayTeamName),
                    ],
                  ),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey.shade500,
          thickness: 1.0,
          height: 30.0,
        ),
      ],
    );
  }

  static Color commonColor() {
    return Color.alphaBlend(
        Colors.black.withOpacity(0.5), Colors.purple.shade700);
  }

  static BoxShadow commonShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 3,
      offset: const Offset(0, 1),
    );
  }

  static Widget shadowContainer({
    required Widget child,
    Color color = Colors.white,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          commonShadow(),
        ],
      ),
      child: child,
    );
  }

  static Widget commonDivider() {
    return Divider(
      color: Colors.grey.shade500,
      thickness: 1.0,
      height: 16.0,
    );
  }
}

//Để ngoài class dành cho những func nhớ tên

Widget button({
  Color? color,
  double? height,
  double? width,
  double? borderRadius,
  Widget? child,
  bool isBold = false,
  void Function()? onTab,
}) {
  return InkWell(
    onTap: onTab,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius:
            (borderRadius != null) ? BorderRadius.circular(borderRadius) : null,
        color: color,
      ),
      child: child,
    ),
  );
}

Widget globalDropDownBox({
  bool hasTitle = true,
  String? title,
  List<String>? addImageData,
  double imageHeight = 30,
  double imageWidth = 30,
  int initialIndex = 0,
  required List<String> dropDownData,
  required void Function(int newValue) onValueChanged,
}) {
  RxInt selectedIndex = initialIndex.obs;
  return Container(
    height: 60.h,
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasTitle == true && title != null)
          safeText(
            text: title,
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        Obx(
          () => Container(
            height: 30.h,
            child: DropdownButton(
              underline: const SizedBox.shrink(),
              isExpanded: true,
              value: selectedIndex.value,
              dropdownColor: Colors.white,
              iconEnabledColor: Colors.black,
              items: List.generate(dropDownData.length, (index) {
                return DropdownMenuItem<int>(
                  value: index,
                  child: Row(
                    children: [
                      if (addImageData != null)
                        loadImages(
                          imageUrl: addImageData[index],
                          height: imageHeight,
                          width: imageWidth,
                        ),
                      SizedBox(
                        width: 5.0.w,
                      ),
                      safeText(
                          text: dropDownData[index],
                          fontSize: 14.sp,
                          color: Colors.black),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (int? newIndex) {
                if (newIndex != null) {
                  selectedIndex.value = newIndex;
                  onValueChanged(newIndex);
                }
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget infoImageRow(
    {required String imageUrl,
    required double imageHeight,
    required double imageWidth,
    required String label,
    String? otherInfo,
    double labelSize = 16,
    Widget? imageContent}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        loadImages(
          imageUrl: imageUrl,
          height: imageHeight,
          width: imageWidth,
          errorWidget: Image.asset(ImagesAssets.cup),
        ),
        SizedBox(
          width: 10.0.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            safeText(
              text: label,
              fontSize: labelSize,
            ),
            if (otherInfo != null)
              safeText(
                text: otherInfo,
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            if (imageContent != null) imageContent,
          ],
        )
      ],
    ),
  );
}

Widget infoBlock({
  String? title,
  required Widget content,
  double titleSize = 17,
  BoxBorder? border,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
}) {
  return shadowContainer(
    border: border,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          if (title != null)
            safeText(
              text: title,
              fontSize: titleSize,
              isBold: true,
            ),
          if (title != null)
            SizedBox(
              height: 10.h,
            ),
          content,
        ],
      ),
    ),
  );
}

Widget infoRow(
    {required String label,
    Widget? content,
    double labelSize = 16,
    bool hasImage = false,
    String? text}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(flex: 1, child: safeText(text: label, fontSize: labelSize)),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: (hasImage == false && text != null)
                  ? safeText(
                      text: text,
                      fontSize: labelSize,
                      isBold: true,
                    )
                  : (content != null)
                      ? content
                      : const Text(''),
            ),
          ),
        ],
      ),
      Divider(
        color: Colors.grey[300],
        height: 16.0,
        thickness: 1.0,
      ),
    ],
  );
}

Widget commonDivider() {
  return Divider(
    color: Colors.grey.shade500,
    thickness: 1.0,
    height: 16.0,
  );
}

Widget shadowContainer({
  required Widget child,
  Color color = Colors.white,
  BoxBorder? border,
}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.w),
      boxShadow: [
        commonShadow(),
      ],
      border: border,
    ),
    child: child,
  );
}

BoxShadow commonShadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    blurRadius: 3,
    offset: const Offset(0, 1),
  );
}

Color commonColor() {
  return Color.alphaBlend(
      Colors.black.withOpacity(0.5), Colors.purple.shade700);
}

Widget loadImages({
  required String imageUrl,
  required double height,
  required double width,
  double? circularRadius,
  double? brighterWithOpacity,
  Color? backgroundColor,
  BoxShape shape = BoxShape.rectangle,
  Widget errorWidget = const SizedBox(),
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: (shape == BoxShape.rectangle && circularRadius != null)
          ? BorderRadius.circular(circularRadius)
          : null,
      color: (backgroundColor != null) ? backgroundColor : null,
      shape: shape,
    ),
    clipBehavior: Clip.antiAlias,
    child: ColorFiltered(
      colorFilter: (brighterWithOpacity != null)
          ? ColorFilter.mode(
              Colors.white.withOpacity(brighterWithOpacity), BlendMode.screen)
          : const ColorFilter.mode(
              Colors.transparent,
              BlendMode.multiply,
            ),
      child: (imageUrl.contains('.svg'))
          ? SvgPicture.network(
              imageUrl,
              fit: BoxFit.fill,
              placeholderBuilder: (context) {
                return errorWidget;
              },
            )
          : Image.network(
              imageUrl,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return errorWidget;
              },
            ),
    ),
  );
}

Widget safeText({
  required String text,
  Color? color,
  bool? isBold,
  TextAlign? textAlign,
  double? fontSize,
  bool safeEnable = true,
  int maxLines = 1,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      overflow: (safeEnable == true) ? TextOverflow.ellipsis : null,
      color: (color != null) ? color : null,
      fontWeight: (isBold == true) ? FontWeight.bold : null,
      fontSize: (fontSize != null) ? fontSize : null,
    ),
    maxLines: (safeEnable == true) ? maxLines : null,
  );
}

String toLocalTime({
  required String utcString,
  bool byWeekday = false,
  bool byDay = false,
  bool byYear = false,
}) {
  String localTimeString = '';
  try {
    DateTime utcTime = DateTime.parse(utcString);
    DateTime localTime = utcTime.toLocal();
    String weekDay = weekDayFormatter(localTime.weekday);
    String year = localTime.year.toString().padLeft(2, '0');
    String day = localTime.day.toString().padLeft(2, '0');
    String month = localTime.month.toString().padLeft(2, '0');
    String hours = localTime.hour.toString().padLeft(2, '0');
    String minutes = localTime.minute.toString().padLeft(2, '0');

    if (byWeekday == false && byDay == false && byYear == false) {
      localTimeString = '$hours:$minutes';
    } else if (byDay == true) {
      localTimeString = '$day-$month \n $hours:$minutes';
    } else if(byYear == true){
      localTimeString = '$weekDay, ngày $day-$month-$year';
    }else {
      localTimeString = '$weekDay ngày $day tháng $month';
    }
  } catch (e) {
    Get.snackbar('Error', 'Error occur toLocalTime');
  }

  return localTimeString;
}

String weekDayFormatter(int weekDayInt) {
  String result = '';
  (weekDayInt == 7) ? result = 'Chủ nhật' : result = 'Thứ ${weekDayInt + 1}';
  return result;
}

Widget getMatches(
    {bool hasScore = false,
    bool hasNavigationArrow = false,
    int? homeGoals,
    int? awayGoals,
    required String homeTeamName,
    required String awayTeamName,
    required String homeTeamFlagUrl,
    String? utcTime,
    required String awayTeamFlagUrl}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    flex: 4,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: safeText(text: homeTeamName))),
                SizedBox(
                  width: 3.0.w,
                ),
                Expanded(
                    flex: 1,
                    child: loadImages(
                        imageUrl: homeTeamFlagUrl, height: 30.h, width: 30.w))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 8.0,
                  ),
                  child: (hasScore == false && utcTime != null)
                      ? safeText(text: toLocalTime(utcString: utcTime))
                      : (hasScore == true &&
                              homeGoals != null &&
                              awayGoals != null)
                          ? safeText(text: '$homeGoals - $awayGoals')
                          : safeText(text: ''),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: loadImages(
                      imageUrl: awayTeamFlagUrl, height: 30.h, width: 30.w),
                ),
                SizedBox(
                  width: 3.0.w,
                ),
                Expanded(flex: 4, child: safeText(text: awayTeamName)),
                if (hasNavigationArrow == true)
                  const Icon(Icons.arrow_right_alt),
              ],
            ),
          ),
        ],
      ),
      Divider(
        color: Colors.grey.shade500,
        thickness: 1.0,
        height: 30.0,
      ),
    ],
  );
}

Widget standingsRow({
  required int position,
  required String crest,
  required String shortName,
  required int playedGames,
  required int goalDifference,
  required int points,
  int? goalsFor,
  int? goalsAgainst,
  int? won,
  int? draw,
  int? lost,
}) {
  int positionFlex = 1;
  int clubRowFlex = 5;
  int crestFlex = 1;
  int shortNameFlex = 4;
  int playedGamesFlex = 1;
  int wonFlex = 1;
  int drawFlex = 1;
  int lostFlex = 1;
  int goalDifferenceFlex = 1;
  int pointsFlex = 1;
  double headerSize = 11.sp;

  return Column(
    children: [
      if (position == 1)
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Row(
              children: [
                Expanded(
                  flex: positionFlex,
                  child: safeText(
                    text: 'Pos',
                    fontSize: headerSize,
                  ),
                ),
                Expanded(
                  flex: clubRowFlex,
                  child: safeText(
                    text: 'Club',
                    fontSize: headerSize,
                  ),
                ),
                Expanded(
                  flex: playedGamesFlex,
                  child: Center(
                      child: safeText(
                    text: 'Pl',
                    fontSize: headerSize,
                  )),
                ),
                Expanded(
                  flex: wonFlex,
                  child: Center(
                      child: safeText(
                    text: 'W',
                    fontSize: headerSize,
                  )),
                ),
                Expanded(
                  flex: drawFlex,
                  child: Center(
                      child: safeText(
                    text: 'D',
                    fontSize: headerSize,
                  )),
                ),
                Expanded(
                  flex: lostFlex,
                  child: Center(
                      child: safeText(
                    text: 'L',
                    fontSize: headerSize,
                  )),
                ),
                Expanded(
                  flex: goalDifferenceFlex,
                  child: Center(
                      child: safeText(
                    text: 'GD',
                    fontSize: headerSize,
                  )),
                ),
                Expanded(
                  flex: pointsFlex,
                  child: Center(
                      child: safeText(
                    text: 'Pts',
                    fontSize: headerSize,
                  )),
                ),
              ],
            ),
          ),
        ),
      Row(
        children: [
          Expanded(
            flex: positionFlex,
            child: safeText(text: '$position'),
          ),
          Expanded(
            flex: clubRowFlex,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: crestFlex,
                  child: Center(
                    child: loadImages(
                      imageUrl: crest,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                ),
                Expanded(
                  flex: shortNameFlex,
                  child: safeText(text: shortName),
                ),
              ],
            ),
          ),
          Expanded(
            flex: playedGamesFlex,
            child: Center(child: safeText(text: '$playedGames')),
          ),
          if (won != null)
            Expanded(
              flex: wonFlex,
              child: Center(child: safeText(text: '$won')),
            ),
          if (draw != null)
            Expanded(
              flex: drawFlex,
              child: Center(child: safeText(text: '$draw')),
            ),
          if (lost != null)
            Expanded(
              flex: lostFlex,
              child: Center(child: safeText(text: '$lost')),
            ),
          Expanded(
            flex: goalDifferenceFlex,
            child: Center(
                child: safeText(
                    text: (goalDifference > 0)
                        ? '+$goalDifference'
                        : '$goalDifference')),
          ),
          Expanded(
            flex: pointsFlex,
            child: Center(child: safeText(text: '$points')),
          ),
        ],
      ),
      Divider(
        color: Colors.grey.shade500,
        thickness: 1.0,
        height: 16.0,
      ),
    ],
  );
}

Widget standings(List<Map<String, dynamic>> totalData) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: totalData.length,
      itemBuilder: (context, index) {
        int position = totalData[index]['position'];
        Map<String, dynamic> teamData = totalData[index]['team'];
        String shortName = teamData['shortName'];
        String crest = teamData['crest'];
        int playedGames = totalData[index]['playedGames'];
        int goalDifference = totalData[index]['goalDifference'];
        int points = totalData[index]['points'];
        int won = totalData[index]['won'];
        int draw = totalData[index]['draw'];
        int lost = totalData[index]['lost'];
        int goalsFor = totalData[index]['goalsFor'];
        int goalsAgainst = totalData[index]['goalsAgainst'];

        return standingsRow(
          position: position,
          crest: crest,
          shortName: shortName,
          playedGames: playedGames,
          goalDifference: goalDifference,
          points: points,
          won: won,
          draw: draw,
          lost: lost,
          goalsFor: goalsFor,
          goalsAgainst: goalsAgainst,
        );
      });
}

Color convertColor(String input) {
  List<String> modifiedInput = input.split(' ');
  String filteredInput = '';

  Map<String, Color> colorMap = {
    'red': Colors.red,
    'blue': Colors.blue,
    'green': Colors.green,
    'yellow': Colors.yellow,
    'orange': Colors.orange,
    'purple': Colors.purple,
    'pink': Colors.pink,
    'brown': Colors.brown,
    'grey': Colors.grey,
    'black': Colors.black,
    'white': Colors.white,
    'cyan': Colors.cyan,
    'lime': Colors.lime,
    'teal': Colors.teal,
    'indigo': Colors.indigo,
    'amber': Colors.amber,
  };
  filteredInput = modifiedInput.firstWhere(
      (modInput) => colorMap.containsKey(modInput.toLowerCase()),
      orElse: () => '');

  return colorMap[filteredInput.toLowerCase()] ?? Colors.grey;
}
