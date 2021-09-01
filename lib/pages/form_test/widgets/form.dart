import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../index.dart';

class HelloWidget extends GetView<FormTestController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0.w),
        child: FormBuilder(
          child: ListView(
            scrollDirection: Axis.vertical,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FormBuilderTextField(
                // controller: controller.usernameController,
                name: 'full_name',
                decoration: InputDecoration(labelText: '账号'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
              ),
              FormBuilderTextField(
                // controller: controller.passwordController,
                name: 'password',
                decoration: InputDecoration(labelText: '密码'),
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
              ),
              FormBuilderFilterChip(
                name: 'filter_chip',
                decoration: InputDecoration(
                  labelText: '多选菜单',
                ),
                options: [
                  FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                  FormBuilderFieldOption(
                      value: 'Test 1', child: Text('Test 1')),
                  FormBuilderFieldOption(
                      value: 'Test 2', child: Text('Test 2')),
                  FormBuilderFieldOption(
                      value: 'Test 3', child: Text('Test 3')),
                  FormBuilderFieldOption(
                      value: 'Test 4', child: Text('Test 4')),
                ],
              ),
              FormBuilderChoiceChip(
                name: 'choice_chip',
                decoration: InputDecoration(
                  labelText: '单选菜单',
                ),
                options: [
                  FormBuilderFieldOption(value: 'Test', child: Text('Test')),
                  FormBuilderFieldOption(
                      value: 'Test 1', child: Text('Test 1')),
                  FormBuilderFieldOption(
                      value: 'Test 2', child: Text('Test 2')),
                  FormBuilderFieldOption(
                      value: 'Test 3', child: Text('Test 3')),
                  FormBuilderFieldOption(
                      value: 'Test 4', child: Text('Test 4')),
                ],
              ),
              FormBuilderDateTimePicker(
                name: 'date',
                // onChanged: _onChanged,
                inputType: InputType.time,
                decoration: InputDecoration(
                  labelText: '时间选择器',
                ),
                initialTime: TimeOfDay(hour: 8, minute: 0),
                // initialValue: DateTime.now(),
                // enabled: true,
              ),
              FormBuilderDateRangePicker(
                name: 'date_range',
                firstDate: DateTime(1970),
                lastDate: DateTime(2030),
                // format: DateFormat('yyyy-MM-dd'),
                // onChanged: _onChanged,
                decoration: InputDecoration(
                  labelText: '日期期限',
                  // helperText: 'Helper text',
                  hintText: 'Hint text',
                ),
              ),
              FormBuilderSlider(
                name: 'slider',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.min(context, 6),
                ]),
                // onChanged: _onChanged,
                min: 0.0,
                max: 10.0,
                initialValue: 7.0,
                divisions: 20,
                activeColor: Colors.red,
                inactiveColor: Colors.pink[100],
                decoration: InputDecoration(
                  labelText: 'slider选择条',
                ),
              ),
              FormBuilderCheckbox(
                name: 'accept_terms',
                initialValue: false,
                // onChanged: _onChanged,
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'I have read and agree to the ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.equal(
                  context,
                  true,
                  errorText: 'You must accept terms and conditions to continue',
                ),
              ),
              FormBuilderTextField(
                name: 'age',
                decoration: InputDecoration(
                  labelText:
                      '此值传递到用于显示提示文本的 [文本] 小部件的 [文本. maxLines] 属性。',
                ),
                // onChanged: _onChanged,
                // valueTransformer: (text) => num.tryParse(text),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.numeric(context),
                  FormBuilderValidators.max(context, 70),
                ]),
                keyboardType: TextInputType.number,
              ),
                    FormBuilderDropdown(
              name: 'gender',
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
              // initialValue: 'Male',
              allowClear: true,
              hint: Text('Select Gender'),
              // validator: FormBuilderValidatrors.compose(
              //     [FormBuilderValidators.required(context)]),
              items: controller.genderOptions
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text('$gender'),
                      ))
                  .toList(),
            ),
            ElevatedButton(onPressed: ()=>controller.showPickerModal(context), child: Text("data"))
            ],
          ),
        ));
  }
}
