import 'package:chat/moduls/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image(
        image: const AssetImage(
          'images/image.png',
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
      Center(
          child: Container(
        height: 300,
        width: 450,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const  Icon(Icons.supervisor_account,
                size: 70, color: Color.fromARGB(255, 89, 127, 229)),
            // const Text("Вход", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 2, 50, 220)),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: controller.nameController,
                onFieldSubmitted: (value) => controller.signIn(),
                decoration: const InputDecoration(
                  labelText: 'Введите ник',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20,width: 20,),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  controller.signIn();
                },
                child: const Text(
                  'Войти',
                  style:
                      TextStyle(color: Color.fromARGB(255, 60, 96, 194),fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ))
    ]));
  }
}
