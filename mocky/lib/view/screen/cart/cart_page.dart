import 'package:flutter/material.dart';
import 'package:mocky/util/app_constant.dart';
import 'package:mocky/view/screen/cart/widget/cart_total_widget.dart';
import 'package:mocky/view/widget/app_app_bar.dart';

import '../../../util/app_color.dart';
import '../../widget/app_text_view.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(name: 'Cart'),
      body: Padding(
        padding: commonPaddingAll,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 3,
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
                          appTextView(
                              name: '\u{20B9}  120',
                              color: AppColor.kGold,
                              isBold: true),
                        ],
                      ),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
            //grand total widget
            const GrandTotalWidget(),
          ],
        ),
      ),
    );
  }
}
