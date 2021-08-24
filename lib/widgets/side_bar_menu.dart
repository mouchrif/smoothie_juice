import 'package:flutter/material.dart';
import 'package:smoothie_juices/widgets/rps_custom_painter.dart';
import 'package:smoothie_juices/widgets/vertical_text.dart';

import '../constants.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  _SideBarMenuState createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  GlobalKey _sideBarKey = GlobalKey();
  List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  List<String> _menuList = [
    "Shake",
    "Coffee",
    "Drinks",
    "Cocktail",
  ];
  int _selectedIndex = 0;
  Offset _positionWidget = Offset(0,0);
  Size _sizeWidget = Size(0,0);

  // Size _sideBarSize = Size(0, 0);

  Size _getSizeWidget(int index) {
    final RenderBox renderBoxWidget =
        _keys[index].currentContext!.findRenderObject() as RenderBox;
    final sizeWidget = renderBoxWidget.size;
    return sizeWidget;
  }

  // Size _getSizeSideBar() {
  //   final RenderBox renderBoxWidget =
  //       _sideBarKey.currentContext!.findRenderObject() as RenderBox;
  //   final sizeSideBar = renderBoxWidget.size;
  //   return sizeSideBar;
  // }

  Offset _getPositionWidget(int index) {
    final RenderBox renderBoxWidget =
        _keys[index].currentContext!.findRenderObject() as RenderBox;
    final positionWidget = renderBoxWidget.localToGlobal(Offset.zero);
    return positionWidget;
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
  }

  // _afterLayout(_) {
  //   _positionWidget =
  //       Offset(_getPositionWidget(0).dx, _getPositionWidget(0).dy);
  //   _sizeWidget = Size(_getSizeWidget(0).width, _getSizeWidget(0).height);
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          key: _sideBarKey,
          width: size.width * 0.2,
          child: Container(
            padding: const EdgeInsets.only(
              top: kDefaultPadding * 2,
            ),
            color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/menu.png",
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          _menuList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                                _positionWidget = Offset(
                                    _getPositionWidget(index).dx,
                                    _getPositionWidget(index).dy);
                                // _sideBarSize = Size(_getSizeSideBar().width,
                                //     _getSizeSideBar().height);
                                _sizeWidget = Size(
                                    _getSizeWidget(index).width,
                                    _getSizeWidget(index).height);
                              });
                            },
                            child: VerticalText(
                              globalKey: _keys[index],
                              text: _menuList[index],
                              checked: _selectedIndex == index,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          curve: Curves.fastOutSlowIn,
          top: _positionWidget.dy - 60 + _sizeWidget.height / 2,
          right: -2,
          child: CustomPaint(
            size: Size(
                100,
                (120 * 1)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          curve: Curves.fastOutSlowIn,
          top: _positionWidget.dy - 6 + _sizeWidget.height / 2,
          right: 0,
          child: CircleAvatar(
            radius: 6,
            backgroundColor: kYellowColor,
          ),
        ),
      ],
    );
  }
}
