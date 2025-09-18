import 'dart:ui';
import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/owner/o_home/o_home.dart';
import 'package:ballie/view/screens/owner/o_profile/o_profile.dart';
import 'package:ballie/view/screens/owner/o_qr_generator/o_qr_generator.dart';
import 'package:ballie/view/screens/owner/o_upcoming_matches/o_upcoming_matches.dart';
import 'package:ballie/view/screens/owner/o_venue/o_venue.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

// ignore: must_be_immutable
class OwnerNavBar extends StatefulWidget {
  @override
  _OwnerNavBarState createState() => _OwnerNavBarState();
}

class _OwnerNavBarState extends State<OwnerNavBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  void _getCurrentIndex(int index) => setState(() {
    _currentIndex = index;
    isBodyExtended = index == 1;
  });

  bool isBodyExtended = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {'icon': Assets.imagesHome},
      {'icon': Assets.imagesLocPin},
      {'icon': Assets.imagesScan},
      {'icon': Assets.imagesCam},
      {'icon': Assets.imagesStreaming},
    ];

    final List<Widget> _screens = [
      OHome(),
      OVenue(),
      OQrGenerator(),
      OUpcomingMatches(),
      OProfile(),
    ];

    return Scaffold(
      extendBody: isBodyExtended,
      extendBodyBehindAppBar: isBodyExtended,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildNavBar(_items),
    );
  }

  Widget _buildNavBar(List<Map<String, dynamic>> _items) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 40, vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(
            width: Get.width,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: kTertiaryColor.withOpacity(0.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_items.length, (index) {
                var data = _items[index];
                return index == 4
                    ? GestureDetector(
                        onTap: () => _getCurrentIndex(index),
                        child: CommonImageView(
                          height: 42,
                          width: 42,
                          radius: 100,
                          url: dummyImg,
                          fit: BoxFit.cover,
                        ),
                      )
                    : GestureDetector(
                        onTap: () => _getCurrentIndex(index),
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? kSecondaryColor
                                : kPrimaryColor.withValues(alpha: 0.1),
                          ),
                          child: Center(
                            child: ImageIcon(
                              AssetImage(data["icon"]),
                              size: 20,
                            ),
                          ),
                        ),
                      );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
