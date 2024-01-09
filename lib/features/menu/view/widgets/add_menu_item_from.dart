import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/image_perviewer.dart';
import '../../../../shared/widgets/input_text_form_field.dart';
import '../../validation/value_failures/dicraption_failures.dart';
import '../../validation/value_failures/food_name_failures.dart';
import '../../validation/value_failures/price_failure.dart';
import '../bloc/create_menu_bloc.dart';

class CreateMenuitemWidget extends StatelessWidget {
  const CreateMenuitemWidget(
      {super.key,
      required this.nameKey,
      required this.pricKey,
      required this.discraptionKey,
      required this.nameCont,
      required this.priceCont,
      required this.discraptionCont,
      required this.fKey});
  final TextEditingController nameCont; // = TextEditingController();
  final TextEditingController priceCont; //  = TextEditingController();
  final TextEditingController discraptionCont; // = TextEditingController();
  final GlobalKey nameKey; //= GlobalKey();
  final GlobalKey pricKey; //= GlobalKey();
  final GlobalKey discraptionKey; //= GlobalKey();
  final GlobalKey fKey; //= GlobalKey();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Form(
        key: fKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                width: 150,
                child: ImagePerViewer(
                  source: ImageSource.camera,
                  onTab: (value) => BlocProvider.of<CreateMenuBloc>(context)
                      .add(CreateMenuImageChange(value.path)),
                  tempImage: const Image(
                      image: AssetImage("assets/images/bestfood/bf10.jpeg")),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // name
                    InputTextFormField(
                      width: w * .45,
                      controller: nameCont,
                      tkey: nameKey,
                      icon: const Icon(Icons.text_snippet_rounded),
                      txthint: "اسم الطبق",
                      onChanged: (p0) =>
                          BlocProvider.of<CreateMenuBloc>(context)
                              .add(CreateMenuFoodNameChange(p0)),
                      validator: (_) =>
                          (BlocProvider.of<CreateMenuBloc>(context).state
                                  as CreateMenuInitial)
                              .name
                              .value
                              .fold((l) {
                        if (l is NullFoodName) {
                          return "صيغة غير صحيحة ";
                        } else if (l is ShortFoodName) {
                          return "قصير جدا";
                        } else {
                          return null;
                        }
                      }, (r) => null),
                    ),
                    // price
                    InputTextFormField(
                      width: w * .45,
                      controller: priceCont,
                      tkey: pricKey,
                      icon: const Icon(Icons.price_change),
                      txthint: " السعر",
                      onChanged: (p0) =>
                          BlocProvider.of<CreateMenuBloc>(context)
                              .add(CreateMenuPriceChange(p0)),
                      validator: (_) =>
                          (BlocProvider.of<CreateMenuBloc>(context).state
                                  as CreateMenuInitial)
                              .price
                              .value
                              .fold((l) {
                        if (l is NotNumPrice) {
                          return "صيغة غير صحيحة ";
                        } else if (l is NigativeorZerorPrice) {
                          return "قليل جدا";
                        } else {
                          return null;
                        }
                      }, (r) => null),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // discraption
              SizedBox(
                height: 50,
                child: InputTextFormField(
                  controller: discraptionCont,
                  tkey: discraptionKey,
                  icon: const Icon(Icons.description),
                  txthint: "الوصف",
                  onChanged: (p0) => BlocProvider.of<CreateMenuBloc>(context)
                      .add(CreateMenuDiscraptionChange(p0)),
                  validator: (_) => (BlocProvider.of<CreateMenuBloc>(context)
                          .state as CreateMenuInitial)
                      .discraption
                      .value
                      .fold((l) {
                    if (l is NullDicraption) {
                      return "الوصف مطلوب";
                    } else if (l is ShortDicraption) {
                      return "خمس احرف علي الاقل ";
                    } else {
                      return null;
                    }
                  }, (r) => null),
                ),
              ),
              const SizedBox(height: 15),

              CustomBoutton(
                  text: "Add",
                  onTab: () {
                    BlocProvider.of<CreateMenuBloc>(context)
                        .add(CreateMenuAddItem());
                  }),
            ],
          ),
        ));
  }
}
