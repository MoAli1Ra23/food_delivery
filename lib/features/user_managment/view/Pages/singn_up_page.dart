import 'package:flutter/material.dart';
import 'package:icon_icons/icon_icons.dart';

class SigenUpPage extends StatelessWidget {
  const SigenUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(
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
            child: const InkWell(
                child: Text(
              "Sign UP",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            )),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Divider(
                height: 2,
                color: Colors.black,
              )),
              Text('OR',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
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
                IconIcons.user(height: 40, width: 40),
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
    ));
  }
}
