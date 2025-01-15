import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/features/personalization/controller/update_name_controller.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/validators/validation.dart';
import 'package:get/get.dart';

class ChangeName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    // TODO: implement build

    return Scaffold(
      // custom app bar

      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADINGS
            Text(
              'Use real name for easy verification . This name will appear n several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // Text Field and Buttons
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: ((value) =>
                      Validator.validateEmptyText('First Name', value)),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TText.firstName,
                      prefixIcon: Icon(Icons.contact_mail)),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.lastName,
                  validator: ((value) =>
                      Validator.validateEmptyText('Last Name', value)),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TText.lastName,
                      prefixIcon: Icon(Icons.contact_mail)),
                )
              ],
            )),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // save Button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    log('1');
                    controller.updateUserName();
                  },
                  child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
