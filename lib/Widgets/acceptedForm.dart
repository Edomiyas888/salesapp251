import 'package:flutter/material.dart';

class AcceptedForm extends StatefulWidget {
  const AcceptedForm({super.key});

  @override
  State<AcceptedForm> createState() => _AcceptedFormState();
}

class _AcceptedFormState extends State<AcceptedForm> {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 13.5),
        const Text(
          "Manager Name:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.5,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 13.5),
        TextField(
          controller: nameCont,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            hintText: "Manager's name ...",
          ),
        ),
        const SizedBox(height: 13.5),
        const SizedBox(height: 13.5),
        const Text(
          "Manager's Phone:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.5,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 13.5),
        TextField(
          controller: phoneCont,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            hintText: "Phone number ...",
          ),
        ),
        const SizedBox(height: 13.5),
      ],
    );
  }
}
