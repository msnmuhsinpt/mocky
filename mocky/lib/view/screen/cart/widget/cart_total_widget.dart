import 'package:flutter/material.dart';

import '../../../../util/app_color.dart';
import '../../../../util/app_constant.dart';
import '../../../widget/app_text_view.dart';

class GrandTotalWidget extends StatelessWidget {
  const GrandTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 0.3,
          color: AppColor.kBalck,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            appTextView(name: 'Grand Total', isBold: true, size: 18),
            appTextView(name: '200', isBold: true, size: 18),
          ],
        ),
        dividerH(),
        SizedBox(
          width: screenWidth(context) / 2,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: appTextView(
                name: 'Buy Now', isBold: true, color: AppColor.kWhite),
          ),
        ),
      ],
    );
  }
}
