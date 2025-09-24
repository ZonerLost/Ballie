import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/watcher/w_shop/w_cart.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_check_box_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WShop extends StatefulWidget {
  const WShop({super.key});

  @override
  State<WShop> createState() => _WShopState();
}

class _WShopState extends State<WShop> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(
          title: 'Shop',
          actions: [
            Center(
              child: Container(
                height: 26,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.imagesPoint, height: 16, width: 16),
                    MyText(
                      text: '300',
                      size: 10,
                      weight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Center(child: Image.asset(Assets.imagesCart, height: 32)),
            SizedBox(width: 20),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppSizes.DEFAULT,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: TextFormField(
                  style: TextStyle(
                    color: kTertiaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    prefixIcon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.imagesSearchRounded, height: 38),
                      ],
                    ),
                    suffixIcon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(Assets.imagesFt, height: 38)],
                    ),
                    filled: true,
                    fillColor: kTertiaryColor.withValues(alpha: 0.1),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: kTertiaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: _CustomTabBar()),
          ],
        ),
      ),
    );
  }
}

class _CustomTabBar extends StatefulWidget {
  @override
  State<_CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['Shirts', 'Wallpapers'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            height: 48,
            width: 250,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: kTertiaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              spacing: 8,
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? kSecondaryColor
                            : kTertiaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: MyText(
                          text: tabs[index],
                          size: 14,
                          color: isSelected ? kPrimaryColor : kTertiaryColor,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(height: 16),
        Expanded(child: selectedIndex == 0 ? _Shirts() : _Wallpapers()),
      ],
    );
  }
}

class _Shirts extends StatefulWidget {
  const _Shirts({super.key});

  @override
  State<_Shirts> createState() => _ShirtsState();
}

class _ShirtsState extends State<_Shirts> {
  final Set<int> cartItems = {};
  final Map<int, int> quantities = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          shrinkWrap: true,
          padding: AppSizes.HORIZONTAL,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 15,
          itemBuilder: (context, index) {
            final inCart = cartItems.contains(index);
            final quantity = quantities[index] ?? 1;
            return BlurContainer(
              radius: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        CommonImageView(
                          url: dummyImg,
                          height: Get.height,
                          width: Get.width,
                          fit: BoxFit.cover,
                          radius: 0,
                        ),
                        if (!inCart)
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartItems.add(index);
                                  quantities[index] = 1;
                                });
                              },
                              child: Image.asset(
                                Assets.imagesAddToCart,
                                height: 38,
                              ),
                            ),
                          ),
                        if (inCart)
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              height: 28,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: kPrimaryColor.withValues(
                                      alpha: 0.25,
                                    ),
                                    blurRadius: 12,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                spacing: 8,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantities[index] = quantity - 1;
                                        } else {
                                          cartItems.remove(index);
                                          quantities.remove(index);
                                        }
                                      });
                                    },
                                    child: Image.asset(
                                      Assets.imagesTrash,
                                      height: 20,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  MyText(
                                    text: quantity.toString(),
                                    size: 14,
                                    weight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantities[index] = quantity + 1;
                                      });
                                    },
                                    child: Image.asset(
                                      Assets.imagesPlus,
                                      height: 20,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'Chelsea\nJersey',
                            size: 12,
                            maxLines: 2,
                            textOverflow: TextOverflow.ellipsis,
                            weight: FontWeight.w500,
                            color: kTertiaryColor,
                          ),
                        ),
                        Image.asset(
                          Assets.imagesPoint,
                          height: 14,
                          width: 14,
                          color: kSecondaryColor,
                        ),
                        MyText(
                          paddingLeft: 4,
                          text: '300',
                          size: 12,
                          weight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Get.to(() => WCart());
            },
            child: Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: '${cartItems.length} items',
                    size: 12,
                    color: kPrimaryColor,
                  ),
                  MyText(
                    text: 'Go to Cart',
                    size: 14,
                    weight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                  Image.asset(
                    Assets.imagesArrowNext,
                    height: 24,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Wallpapers extends StatefulWidget {
  const _Wallpapers({super.key});

  @override
  State<_Wallpapers> createState() => _WallpapersState();
}

class _WallpapersState extends State<_Wallpapers> {
  final Set<int> cartItems = {};
  final Map<int, int> quantities = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          shrinkWrap: true,
          padding: AppSizes.HORIZONTAL,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 15,
          itemBuilder: (context, index) {
            final inCart = cartItems.contains(index);
            final quantity = quantities[index] ?? 1;
            return BlurContainer(
              radius: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        CommonImageView(
                          url: dummyImg,
                          height: Get.height,
                          width: Get.width,
                          fit: BoxFit.cover,
                          radius: 0,
                        ),
                        if (!inCart)
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartItems.add(index);
                                  quantities[index] = 1;
                                });
                              },
                              child: Image.asset(
                                Assets.imagesAddToCart,
                                height: 38,
                              ),
                            ),
                          ),
                        if (inCart)
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              height: 28,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: kPrimaryColor.withValues(
                                      alpha: 0.25,
                                    ),
                                    blurRadius: 12,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                spacing: 8,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantities[index] = quantity - 1;
                                        } else {
                                          cartItems.remove(index);
                                          quantities.remove(index);
                                        }
                                      });
                                    },
                                    child: Image.asset(
                                      Assets.imagesTrash,
                                      height: 20,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  MyText(
                                    text: quantity.toString(),
                                    size: 14,
                                    weight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantities[index] = quantity + 1;
                                      });
                                    },
                                    child: Image.asset(
                                      Assets.imagesPlus,
                                      height: 20,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesPoint,
                          height: 14,
                          width: 14,
                          color: kSecondaryColor,
                        ),
                        MyText(
                          paddingLeft: 4,
                          text: '300',
                          size: 12,
                          weight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Get.to(() => WCart());
            },
            child: Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: '${cartItems.length} items',
                    size: 12,
                    color: kPrimaryColor,
                  ),
                  MyText(
                    text: 'Go to Cart',
                    size: 14,
                    weight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                  Image.asset(
                    Assets.imagesArrowNext,
                    height: 24,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
