import 'package:flutter/material.dart';
import 'package:get/get.dart';

//This extension can be used throughout the application on all integer values
//Eg: To give a padding of 10 on all sides, just type 10.paddingAll()

extension Integer on int {
  delay(Function function) {
    // 1.delay() = delay of 1 seconds
    Future.delayed(Duration(seconds: this), () {
      function();
    });
  }

  horizontalSpace() => SizedBox(width: toDouble()); //20.horizontalSpace()

  verticalSpace() => SizedBox(height: toDouble()); //20.verticalSpace()

  // toast(context) => Fluttertoast.showToast(
  //       msg: toString(),
  //       backgroundColor: AppTheme.LightBrown,
  //       toastLength: Toast.LENGTH_SHORT,
  //     );

  paddingLeft() {
    //10.paddingLeft()
    return EdgeInsets.only(left: toDouble());
  }

  paddingTop() {
    //10.paddingTop()
    return EdgeInsets.only(top: toDouble());
  }

  paddingAll() {
    //10.paddingAll()
    return EdgeInsets.all(toDouble());
  }

  paddingRight() {
    //10.paddingRight()
    return EdgeInsets.only(right: toDouble());
  }

  paddingHorizontal() {
    //10.paddingHorizontal()
    return EdgeInsets.only(left: toDouble(), right: toDouble());
  }

  paddingVertical() {
    //10.paddingVertical()
    return EdgeInsets.only(top: toDouble(), bottom: toDouble());
  }

  marginAll() {
    //10.marginAll()
    return EdgeInsets.all(toDouble());
  }

  marginLeft() {
    //10.marginLeft()
    return EdgeInsets.only(left: toDouble());
  }

  marginTop() {
    //10.marginTop()
    return EdgeInsets.only(top: toDouble());
  }

  marginRight() {
    //10.marginRight()
    return EdgeInsets.only(right: toDouble());
  }

  marginHorizontal() {
    //10.marginHorizontal()
    return EdgeInsets.only(left: toDouble(), right: toDouble());
  }

  marginVertical() {
    //10.marginVertical()
    return EdgeInsets.only(top: toDouble(), bottom: toDouble());
  }
}

pop() {
  //call pop() to
  Get.back();
}

extension CustomWidget on Widget {
  containerDecoration(
      {EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      Color backgroundColor = Colors.white,
      double radius = 8,
      double width = 1,
      Color? borderColor = const Color(0x0ff0b7ad)}) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(width: width, color: borderColor!),
      ),
      child: this,
    );
  }

  dialog() {
    return Dialog(
      elevation: 0.5,
      insetPadding: 0.paddingAll(),
      backgroundColor: Colors.transparent,
      child: this,
    );
  }

  onTap(Function onTap) {
    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap(),
        child: this,
      ),
    );
  }

  pressBack() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: this,
    );
  }

  navigate(
      {bool isAwait = false,
      bool isRemove = false,
      bool leftToRight = false,
      bool isInfinity = false}) async {
    if (isRemove) {
      return await Get.off(this, transition: Transition.rightToLeftWithFade);
    } else if (isAwait) {
      return await Get.to(this, transition: Transition.rightToLeftWithFade);
    } else if (isInfinity) {
      return await Get.offAll(this, transition: Transition.rightToLeftWithFade);
    } else {
      return await Get.to(this, transition: Transition.rightToLeftWithFade);
    }
  }
}
