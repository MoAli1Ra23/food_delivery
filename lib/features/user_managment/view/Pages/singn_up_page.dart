import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/user_managment/validation/value_failure/value_failure.dart';
import 'package:food_delivery/features/user_managment/view/Pages/profile_page.dart';
import 'package:food_delivery/features/user_managment/view/bloc/sing_up_bloc.dart';
import 'package:icon_icons/icon_icons.dart';

import '../bloc/profile_bloc_bloc.dart';

class SigenUpPage extends StatelessWidget {
  SigenUpPage({super.key});
  final fkey = GlobalKey<FormState>();
  final firstKey = GlobalKey();
  final lastkey = GlobalKey();
  final mailKey = GlobalKey();
  final passKey = GlobalKey();
  final firstcon = TextEditingController();
  final lastcon = TextEditingController();
  final mailCont = TextEditingController();
  final passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return BlocConsumer<SingUpBloc, SingUpState>(
      listener: (context, state) {
if (state.result != null) {
          String? uid;
          state.result!.fold((l) => null, (r) => uid = r.user!.uid);
          if (uid != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
             return BlocProvider(
                create: (context) =>
                    ProfileBlocBloc()..add(ProfileBlocRequsit(uid!)),
                child: const ProfilePage(),
              );
            }));
          }
        }      },
      builder: (context, state) {
        return BlocBuilder<SingUpBloc, SingUpState>(
          builder: (context, state) {
            return Scaffold(
                body: Form(
              key: fkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 80,
                    color: Colors.grey.shade100,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // names
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: w * .45,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // 01110243904
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Flexible(flex: 1, child: Icon(Icons.mail)),
                              Flexible(
                                  flex: 3,
                                  child: TextFormField(
                                      key: firstKey,
                                      controller: firstcon,
                                      onChanged: (value) =>
                                          BlocProvider.of<SingUpBloc>(context)
                                              .add(FirstNameChange(value)),
                                      validator: (value) => context
                                              .watch<SingUpBloc>()
                                              .state
                                              .firstName
                                              .value
                                              .fold((l) {
                                            if (l is EmptyORShortName) {
                                              return (" short ");
                                            } else {}
                                            return null;
                                          }, ((r) => null)),
                                      decoration: const InputDecoration(
                                        hintText: " Name",
                                        border: InputBorder.none,
                                        alignLabelWithHint: true,
                                      ))),
                            ],
                          ),
                        ),
                        Container(
                          width: w * .45,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              color: Colors.white,

                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Flexible(flex: 1, child: Icon(Icons.mail)),
                              Flexible(
                                  flex: 3,
                                  child: TextFormField(
                                      key: lastkey,
                                      controller: lastcon,
                                      onChanged: (v) =>
                                          BlocProvider.of<SingUpBloc>(context)
                                              .add(LastNameChange(v)),
                                      validator: (value) => context
                                              .watch<SingUpBloc>()
                                              .state
                                              .lastName
                                              .value
                                              .fold((l) {
                                            if (l is EmptyORShortName) {
                                              return ("short ");
                                            }
                                            return null;
                                          }, (r) => null),
                                      decoration: const InputDecoration(
                                        hintText: " Last Name",
                                        border: InputBorder.none,
                                        alignLabelWithHint: true,
                                      ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //mail
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        color: Colors.white,

                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 3))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Flexible(flex: 1, child: Icon(Icons.mail)),
                        Flexible(
                            flex: 5,
                            child: TextFormField(
                                key: mailKey,
                                controller: mailCont,
                                onChanged: (value) =>
                                    BlocProvider.of<SingUpBloc>(context)
                                        .add(EmailAddressChange(value)),
                                validator: (_) => context
                                        .watch<SingUpBloc>()
                                        .state
                                        .emailAddress!
                                        .value
                                        .fold((l) {
                                      if (l is NotMailFailure) {
                                        return "not mail";
                                      }

                                      return null;
                                    }, (r) => null),
                                decoration: const InputDecoration(
                                  hintText: "Email Address",
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        color: Colors.white,

                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 3))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Flexible(flex: 1, child: Icon(Icons.mail)),
                        Flexible(
                            flex: 5,
                            child: TextFormField(
                                key: passKey,
                                controller: passCont,
                                onChanged: (value) =>
                                    BlocProvider.of<SingUpBloc>(context)
                                        .add(PassWordChange(value)),
                                validator: (value) => context
                                        .watch<SingUpBloc>()
                                        .state
                                        .passWord!
                                        .value
                                        .fold((l) {
                                      if (l is ShortPassWord) {
                                        return "short password";
                                      } else if (l is EmptyPassWord) {
                                        return "Empty password";
                                      }
                                      return null;
                                    }, (r) => null),
                                decoration: const InputDecoration(
                                  hintText: "password",
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 60,
                      width: 180,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 193, 193),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            BlocProvider.of<SingUpBloc>(context)
                                .add(SubmittSingup());
                          },
                          child: const Text(
                            "Sign UP",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          )),
                    ),
                  ),

                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Divider(
                          height: 2,
                          color: Colors.black,
                        )),
                        Text('OR',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                        Expanded(
                            child: Divider(
                          height: 2,
                          color: Colors.black,
                        )),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 193, 193),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.mail),
                          InkWell(
                              child: Text(
                            "Sign In with Mail",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 193, 193),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconIcons.whatsapp(height: 40, width: 40),
                          const InkWell(
                              child: Text(
                            "Sign In with Google",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 193, 193),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconIcons.facebook(height: 40, width: 40),
                          const InkWell(
                              child: Text(
                            "Sign In with FaceBook",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
          },
        );
      },
    );
  }
}
