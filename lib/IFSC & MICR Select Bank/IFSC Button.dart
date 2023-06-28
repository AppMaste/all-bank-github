import 'package:all_bank/ScreenSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ConstantsWidgets {
  static List<BoxShadow> boxShadow = [
    const BoxShadow(
        offset: Offset(0.8, 0.9),
        color: Colors.black,
        spreadRadius: 0,
        blurRadius: 0.5)
  ];

  static Widget gradientButton(
      {required Function() onTap,
      required String title,
      double? titleSize,
      Widget? suffixChild,
      required double height,
      required double width,
      double? borderRadius}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenSize.fSize_45(),
        width: ScreenSize.fSize_110(),
        decoration: BoxDecoration(
            color: const Color(0xFF12356E),
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenSize.fSize_10()))),
        // height: height,
        // width: width,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSansThaiLooped(
                fontSize: titleSize ?? 15.5, color: Colors.white),
          ),
        ),
      ),
    );
  }

  static PreferredSizeWidget appBar(
      {required String title,
      Function()? onTapBack,
      bool isShareButtonEnable = true}) {
    return AppBar(
      title: Text(title),
      leading: onTapBack == null
          ? const SizedBox.shrink()
          : IconButton(
              onPressed: onTapBack,
              icon: const Icon(CupertinoIcons.arrow_left)),
      leadingWidth: onTapBack == null ? 0 : 56.0,
      actions: [
        isShareButtonEnable
            ? InkWell(
                onTap: () {
                  // AdService adService = AdService();
                  // adService.checkCounterAd();
                  // Share.share('Look what i found') ;
                },
                child: const Icon(Icons.search),
              )
            : const SizedBox.shrink(),
        isShareButtonEnable
            ? const SizedBox(width: 15)
            : const SizedBox.shrink()
      ],
      // backgroundColor: ConstantsColor.backgroundDarkColor,
      elevation: 0,
    );
  }
}
