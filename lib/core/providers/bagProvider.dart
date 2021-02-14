import 'package:flutter/material.dart';
import 'package:kyveli/core/services/userServices.dart';
import 'package:kyveli/widgets/loading.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class BagProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  UserServices _userRepository = new UserServices();
  final FocusNode emailFocus = FocusNode();
  var emailController = TextEditingController();
  final FocusNode passFocus = FocusNode();
  var passController = TextEditingController();
  int current = 0;
  int currentWeekly = 0;
  List<Widget> imageSliders;
  List<Widget> imageWeeklySliders;
  List<DropdownMenuItem<String>> regoins;
  String region = 'LEBANON';
  final List<String> sliderImagesList = [
    'assets/images/slider.png',
    'assets/images/logo.png',
  ];
  final List weeklySliderList = [
    {
      'img': 'assets/images/weeklySlider1.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.390,00'
    },
    {
      'img': 'assets/images/weeklySlider2.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.99,00'
    },
  ];
  final List verticalView = [
    {
      'img': 'assets/images/verticalView1.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.390,00'
    },
    {
      'img': 'assets/images/verticalView2.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.99,00'
    },
    {
      'img': 'assets/images/verticalView3.png',
      'name': 'Waist Shipping Blouse',
      'price': '68.88',
      'discount': '1.390,00'
    },
    {
      'img': 'assets/images/verticalView4.png',
      'name': 'Poplur shirt',
      'price': '60',
      'discount': '29.99,00'
    },
  ];

  var regoinsList = [
    'LEBANON',
  ];
  var cates = [
    {'img': 'assets/images/cate1.png', 'name': 'Jackets'},
    {'img': 'assets/images/cate2.png', 'name': 'Shoes'},
    {'img': 'assets/images/cate3.png', 'name': 'Accessories'},
    {'img': 'assets/images/cate4.png', 'name': 'Bags'},
    {'img': 'assets/images/cate5.png', 'name': 'Hoodies'},
  ];
  void getData(context, email, pass, scaffoldKey, pr) async {
    try {
      var response =
          _userRepository.login(email, pass, context, scaffoldKey, pr);
      FocusScope.of(context).unfocus();
      response.then((onValue) {});
    } catch (e) {}
  }

  changeWeeklySlider(index) {
    currentWeekly = index;
    notifyListeners();
  }

  void navigationPage(context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return OverLayWidgetWithLoader(false);
          }),
    );
  }

  List<DropdownMenuItem<String>> getDropRegoin(List _cats) {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < _cats.length; i++) {
      String a = _cats[i];

      items.add(new DropdownMenuItem<String>(
        value: a,
        child: TextResponsive(
          a,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Oswald',
              fontWeight: FontWeight.w300),
        ),
      ));
    }
    return items;
  }

  void setRegions() {
    regoins = getDropRegoin(regoinsList);
  }

  void setSlider() {
    imageSliders = sliderImagesList
        .map((item) => ContainerResponsive(
              width: 335,
              height: 232,
              margin: EdgeInsetsResponsive.all(5.0),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        ],
                      )),
                ],
              ),
            ))
        .toList();
  }

  void setWeekltySlider() {
    imageWeeklySliders = weeklySliderList
        .map((item) => ContainerResponsive(
              width: 280,
              height: 165,
              margin: EdgeInsetsResponsive.all(5.0),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            item['img'],
                            fit: BoxFit.cover,
                          ),
                        ],
                      )),
                ],
              ),
            ))
        .toList();
  }
}
