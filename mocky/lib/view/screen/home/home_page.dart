import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mocky/util/app_color.dart';
import 'package:mocky/util/app_constant.dart';
import 'package:mocky/view/widget/app_app_bar.dart';
import 'package:mocky/view/widget/app_text_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //item qty
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app Appbar
      appBar: AppAppBar(name: 'Home'),
      body: Padding(
          padding: commonPaddingAll,
          child: ListView.separated(
            itemCount: 13,
            separatorBuilder: (context, index) => dividerSH(),
            itemBuilder: (context, index) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: commonPaddingAll5,
                    child: Image.asset(
                      icPlaceHolder,
                      width: 70,
                    ),
                  ),
                  dividerW(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appTextView(name: 'Biriyani', isBold: true, size: 17),
                      dividerSH(),
                      RatingBar.builder(
                        initialRating: 4.2,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 17,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColor.kGold,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      dividerSH(),
                      appTextView(
                          name: '\u{20B9}  120',
                          color: AppColor.kGold,
                          isBold: true),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            child: const Icon(
                              Icons.remove,
                              color: AppColor.kRed,
                            ),
                            onPressed: () {
                              setState(() {
                                _itemCount--;
                              });
                            },
                          ),
                          appTextView(
                            //item is negative
                            name: _itemCount <= 0 ? '0' : _itemCount.toString(),
                          ),
                          TextButton(
                            child: const Icon(
                              Icons.add,
                              color: AppColor.kGreen,
                            ),
                            onPressed: () {
                              setState(() {
                                _itemCount++;
                              });
                            },
                          ),
                        ],
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        icon: const Icon(Icons.shopping_bag),
                        label: appTextView(name: 'Add to Cart'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
