import 'package:flutter/widgets.dart';
import 'package:mocky/util/app_color.dart';
import 'package:mocky/view/widget/app_text_view.dart';

class NoInterNet extends StatelessWidget {
  const NoInterNet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          appTextView(name: 'No Internet', isBold: true, color: AppColor.kRed),
    );
  }
}
