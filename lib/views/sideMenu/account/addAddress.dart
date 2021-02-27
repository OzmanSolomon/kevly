import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kyveli/core/base/consts.dart';
import 'package:kyveli/core/providers/addressProvider.dart';
import 'package:kyveli/widgets/customAppbar.dart';
import 'package:kyveli/widgets/validators.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  void initState() {
    super.initState();

    Provider.of<AddressProvider>(context, listen: false).getLoc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final SlidableController slidableController = SlidableController();
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
    );
    var height = MediaQuery.of(context).size.height;
    return ResponsiveWidgets.builder(
      height: 812.0,
      width: 375.0,
      allowFontScaling: true,
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'ADD NEW ADDRESS'.toUpperCase(),
          hideFilter: true,
          backgroundColor: Color(0xffF7F8FA),
          isBackButton: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Container(
                height: height - 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerResponsive(
                      color: Color(0xffF7F8FA),
                      height: 50,
                    ),
                    Expanded(
                      child: Provider.of<AddressProvider>(context, listen: true)
                                  .lng ==
                              null
                          ? Center(child: CupertinoActivityIndicator())
                          : Stack(
                              children: [
                                GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    onTap: (pos) {
                                      Provider.of<AddressProvider>(context,
                                              listen: false)
                                          .onMapTaped(pos);
                                    },
                                    markers: Provider.of<AddressProvider>(
                                            context,
                                            listen: true)
                                        .markers,
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          Provider.of<AddressProvider>(context,
                                                  listen: true)
                                              .lat,
                                          Provider.of<AddressProvider>(context,
                                                  listen: true)
                                              .lng),
                                      zoom: 11.0,
                                    )),
                              ],
                            ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 38,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Address name'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(14),
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: Provider.of<AddressProvider>(context,
                                    listen: false)
                                .formKey,
                            child: TextFormField(
                              controller: Provider.of<AddressProvider>(context,
                                      listen: false)
                                  .newAddressController,
                              focusNode: Provider.of<AddressProvider>(context,
                                      listen: false)
                                  .newAddressFocus,
                              validator: Validator.validateName,
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(0.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (!isRelease ||
                                    Provider.of<AddressProvider>(context,
                                            listen: false)
                                        .formKey
                                        .currentState
                                        .validate()) {
                                  Provider.of<AddressProvider>(context,
                                          listen: false)
                                      .saveAddress(context);
                                }
                              },
                              child: ContainerResponsive(
                                padding: EdgeInsetsResponsive.all(8),
                                margin: EdgeInsetsResponsive.only(bottom: 28),
                                width: 325,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      'SAVE',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(17),
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column customTextField({title, controller, focusNode, validator, keyboard}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(14),
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            validator: validator,
            keyboardType: keyboard != null ? keyboard : TextInputType.text,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(0.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
