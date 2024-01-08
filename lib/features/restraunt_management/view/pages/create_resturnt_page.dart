import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/restraunt_management/view/bloc/create_restrunt_bloc.dart';
import 'package:food_delivery/shared/widgets/custom_button.dart';

import '../../../../shared/widgets/input_text_form_field.dart';
import '../../validation/value_failure/name_failure.dart';

class CreateRestrunPage extends StatelessWidget {
  final TextEditingController cot = TextEditingController();
  final GlobalKey textKey = GlobalKey();
  final GlobalKey fKey = GlobalKey<FormState>();

  CreateRestrunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateRestruntBloc, CreateRestruntState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new_outlined)),
              title: const Text("add Restrunt"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                  key: fKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InputTextFormField(
                        controller: cot,
                        tkey: textKey,
                        icon: const Icon(Icons.text_fields),
                        onChanged: (value) {
                          BlocProvider.of<CreateRestruntBloc>(context)
                              .add(CreateRestruntNameChanaged(value));
                        },
                        validator: (_) {
                          if (state is CreateRestruntInitial) {
                            (BlocProvider.of<CreateRestruntBloc>(context).state
                                    as CreateRestruntInitial)
                                .name
                                .value
                                .fold((l) {
                              if (l is ShortName) {
                                return "short name";
                              } else if (l is NullRestruntName) {
                                return "empty name";
                              }
                              else {
                                return null;
                              }
                            }, (r) => null);
                          }
                        },
                      ),
                      Center(child: CustomBoutton(text: 'حفظ', onTab: () {
                         
                        BlocProvider.of<CreateRestruntBloc>(context).add(CreateRestruntSave());
                      })),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
