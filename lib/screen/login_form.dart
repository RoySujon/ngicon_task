import 'package:flutter/material.dart';
import 'package:ngicon_task/screen/add_project.dart';
// import 'package:ngicon_task/screen/dashboard.dart';
import 'package:ngicon_task/utls/const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _employiIdController = TextEditingController();
  final _passController = TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: horizontal16,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Enter employee Id'),
              controller: _employiIdController,
            ),
          ),
          sboxH16,
          // sboxH16,
          Padding(
            padding: horizontal16,
            child: TextField(
              obscureText: isVisible ? true : false,
              decoration: InputDecoration(
                  hintText: 'Enter employee password',
                  suffixIcon: InkWell(
                      onTap: () async {
                        setState(() {
                          isVisible = !isVisible;
                        });
                        Future.delayed(
                          Duration(seconds: 3),
                          () {
                            setState(() {
                              isVisible = true;
                            });
                          },
                        );
                      },
                      child: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        color: kLabel,
                      ))),
              controller: _passController,
              keyboardType: TextInputType.text,
            ),
          ),
          sboxH16,
          Container(
            padding: horizontal16,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddProjectScreen(),
                ));
              },
              child: Text('Login'),
            ),
          )
        ],
      ),
    );
  }
}
