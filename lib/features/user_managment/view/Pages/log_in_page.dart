import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/user_managment/view/Pages/profile_page.dart';
import 'package:food_delivery/features/user_managment/view/Pages/singn_up_page.dart';
import 'package:food_delivery/features/user_managment/view/bloc/profile_bloc_bloc.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../../validation/value_failure/value_failure.dart';
import '../bloc/log_in_bloc.dart' as login;
import '../bloc/log_in_state.dart';
import '../bloc/sing_up_bloc.dart';
import '../messegs/on_failure_msg.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  final GlobalKey mailKey = GlobalKey();
  final GlobalKey passKey = GlobalKey();
  final TextEditingController mailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<login.LogInBloc, LogInState>(
      listener: (context, state) {
        if (state.result != null) {
          String? uid;
          Failure? f;
          state.result!.fold((l) => f = l, (r) => uid = r.user!.uid);
          if (f != null) {
            showFailureMsg(f!, context);
          }
          if (uid != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              BlocProvider.of<ProfileBlocBloc>(context)
                  .add(ProfileBlocRequsit(uid!));
              return const ProfilePage();
            }));
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("login"),
            ),
            body: Column(
              children: [
                Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Image(
                      image: AssetImage("assets/images/auth/login.webp"),
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 20,
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
                                  BlocProvider.of<login.LogInBloc>(context)
                                      .add(login.EmailChange(value)),
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
                                  BlocProvider.of<login.LogInBloc>(context)
                                      .add(login.PassWordChange(value)),
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
                  height: 5,
                ),
                TextButton(
                    onPressed: () {}, child: const Text("Forget password")),
                const SizedBox(height: 20),
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
                          BlocProvider.of<login.LogInBloc>(context)
                              .add(login.LogInCommand());
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
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return BlocProvider(
                          create: (context) => SingUpBloc(),
                          child: SigenUpPage(),
                        );
                      }));
                    },
                    child: const Text("Sing up")),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3))
                            ]),
                        child: const Image(
                            image: AssetImage("assets/images/auth/fa.jpg")),
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3))
                            ]),
                        child: const Image(
                            image: AssetImage("assets/images/auth/go.png")),
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 3))
                            ]),
                        child: const Image(
                            image: AssetImage("assets/images/auth/tw.jpg")),
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
