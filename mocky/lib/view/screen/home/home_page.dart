import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mocky/data/model/menu_model.dart';
import 'package:mocky/util/app_color.dart';
import 'package:mocky/util/app_constant.dart';
import 'package:mocky/view/widget/app_app_bar.dart';
import 'package:mocky/view/widget/app_text_view.dart';
import '../../../data/service/Api_service.dart';
import '../../shimmer/menu_shimmer.dart';
import '../../widget/no_internet_widget.dart';
import 'bloc/menu_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bloc
  late MenuBloc menuBloc;

  List<MenuModel> menuList = [];

  //item qty
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();

    menuBloc = MenuBloc(RepositoryProvider.of<APIService>(context));
    //add event
    menuBloc.add(const MenuApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => menuBloc,
      child: Scaffold(
        //app Appbar
        appBar: AppAppBar(name: 'Home'),
        body: Padding(
          padding: commonPaddingAll,
          child: BlocConsumer<MenuBloc, MenuState>(
            listener: (context, state) {
              if (state is MenuLoadedState) {
                var data = state.response.tableMenuList![0].categoryDishes;
                for (int i = 0; i < data!.length; i++) {
                  var menuData = data[i];
                  menuList.add(
                    MenuModel(
                      id: menuData.dishId.toString(),
                      itemName: menuData.dishName.toString(),
                      itemPrice: menuData.dishPrice.toString(),
                      imageUrl: menuData.dishImage.toString(),
                    ),
                  );
                }
              }
            },
            builder: (context, state) {
              log("No Internet");
              if (state is NoInternetState) {
                return const NoInterNet();
              }
              if (state is MenuInitialState) {
                log("Inital");

                return menuShimmer(context);
              }
              if (state is MenuLoadingState) {
                log("Loading");

                return menuShimmer(context);
              }
              if (state is MenuLoadedState) {
                log("Loaded");

                return menuShimmer(context);
              }
              if (state is ErrorState) {
                log("Error");

                return Center(
                  child: appTextView(
                      name: '404', isBold: true, color: AppColor.kRed),
                );
              }
              if (state is UnAuthorizedState) {
                log("Un");

                return Center(
                  child: appTextView(
                      name: 'Plase Log out',
                      isBold: true,
                      color: AppColor.kRed),
                );
              }
              log("Else");

              return menuItemUi(menuList);
            },
          ),
        ),
      ),
    );
  }

  Widget menuItemUi(List<MenuModel> menuList) {
    return ListView.separated(
      itemCount: menuList.length,
      separatorBuilder: (context, index) => dividerSH(),
      itemBuilder: (context, index) {
        //dish details
        log("Item Length>>>${menuList.length}");
        var itemName = 'Biriyani';
        // var itemImage = meniList[index].dishImage.toString();
        var itemPrice = '120';

        return Card(
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
                  appTextView(name: itemName, isBold: true, size: 17),
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
                      name: '\u{20B9}  $itemPrice',
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
        );
      },
    );
  }
}
