import 'package:flutter/material.dart';
import 'package:salesapp251/Widgets/rejectedForm.dart';

import '../../Widgets/acceptedForm.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController bldNameCont = TextEditingController();
  final TextEditingController bldLocationCont = TextEditingController();
  final TextEditingController rejectedFormCont = TextEditingController();
  final TextEditingController acceptedNameCont = TextEditingController();
  final TextEditingController acceptedPhoneCont = TextEditingController();
  final TextEditingController acceptedEmailCont = TextEditingController();
  Confirmation groupValue = Confirmation.accepted;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 27.0),
            const Text(
              "Building Name:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.5,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 13.5),
            TextField(
              controller: bldNameCont,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                hintText: "Building's name here...",
              ),
            ),
            const SizedBox(height: 27.0),
            const Text(
              "Building Address:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.5,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 13.5),
            TextField(
              controller: bldLocationCont,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                hintText: "Address here...",
              ),
            ),
            const SizedBox(height: 13.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text("Accepted "),
                    Radio(
                      value: Confirmation.accepted,
                      groupValue: groupValue,
                      onChanged: (Confirmation? value) {
                        groupValue = value!;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 30.0),
                Row(
                  children: [
                    const Text('Rejected '),
                    Radio(
                      value: Confirmation.rejected,
                      groupValue: groupValue,
                      onChanged: (Confirmation? value) {
                        groupValue = value!;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 27.0),
            groupValue == Confirmation.accepted
                ? AcceptedForm(
                    nameCont: acceptedNameCont,
                    phoneCont: acceptedPhoneCont,
                    emailCont: acceptedEmailCont,
                  )
                : RejectedForm(formCont: rejectedFormCont),
            const SizedBox(height: 27.0),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Confirmation {
  accepted,
  rejected,
}
