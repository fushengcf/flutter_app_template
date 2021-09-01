import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';

import '../index.dart';

/// login
class HelloWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(),
        child: FormBuilder(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Obx(() => Text(controller.state.userProfile.expiresIn.toString())),
              Obx(() => Text(controller.state.number.toString())),
              FormBuilderTextField(
                controller: controller.usernameController,
                name: 'full_name',
                decoration: InputDecoration(labelText: '账号'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
              ),
              FormBuilderTextField(
                controller: controller.passwordController,
                name: 'password',
                decoration: InputDecoration(labelText: '密码'),
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
              ),
              ElevatedButton(onPressed: controller.login, child: Text("登录"))
            ],
          ),
        ));
  }
}
