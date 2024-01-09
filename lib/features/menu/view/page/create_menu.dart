import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/menu/view/bloc/create_menu_bloc.dart';

import '../widgets/add_menu_item_from.dart';

class CreateMenu extends StatelessWidget {
  CreateMenu({super.key});
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController priceCont = TextEditingController();
  final TextEditingController discraptionCont = TextEditingController();
  final GlobalKey nameKey = GlobalKey();
  final GlobalKey pricKey = GlobalKey();
  final GlobalKey discraptionKey = GlobalKey();
  final GlobalKey fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton.filled(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Column(
          children: [
            SizedBox(
                height: h * .5,
                child: CreateMenuitemWidget(
                  discraptionKey: discraptionKey,
                  nameKey: nameKey,
                  pricKey: pricKey,
                  discraptionCont: discraptionCont,
                  nameCont: nameCont,
                  priceCont: priceCont,
                  fKey: fKey,
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: h * .35, child: const MenuItems()),
          ],
        ),
      ),
    );

    // form for adding
    //
    //
    /* 
  text for name;
  text for price
  image for selcteing image in prod mode 
  in deuge use image from assets
  button for submit;
  

    */

    // list of menu items

  }
  showBottomSheat(BuildContext context ){Scaffold.of(context).showBottomSheet((context) =>  CreateMenuitemWidget(
                  discraptionKey: discraptionKey,
                  nameKey: nameKey,
                  pricKey: pricKey,
                  discraptionCont: discraptionCont,
                  nameCont: nameCont,
                  priceCont: priceCont,
                  fKey: fKey,
                ));}
}

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return BlocBuilder<CreateMenuBloc, CreateMenuState>(
      buildWhen: (previous, current) {
        if (current is CreateMenuInitial) {
          if (previous is CreateMenuInitial &&
              current.items != previous.items) {
            return true;
          } else {
            return false;
          }
        } else {
          return true;
        }
      },
      builder: (context, state) {
        if (state is CreateMenuInitial) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: state.items != null ? state.items!.length : 0,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 120,
                      // width: w-40,
                       child: Card(
                        shadowColor: Colors.grey,
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //TODO: chage it to more advanced
                            const SizedBox(
                              width: 120,
                              height: 110,
                              child: Image(
                                  image:
                                      AssetImage("assets/images/bestfood/bf10.jpeg")),
                            ),
                            SizedBox(
                              height: 120,
                               child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.items![index].dissName,
                                    style: const TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width:w-150 ,
                                  
                                    child: Text(
                                      state.items![index].discraption,
                                      style: const TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    state.items![index].price.toString(),
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            )
                          ],
                                           ),
                       ));
                }),
          );
        } else {
          return const SizedBox(
            width: 0,
          );
        }
      },
    );
  }
}
