import 'package:flutter/material.dart';

class AcceptedForm extends StatefulWidget {
  const AcceptedForm({super.key, required this.nameCont, required this.phoneCont});
  final TextEditingController nameCont;
  final TextEditingController phoneCont;

  @override
  State<AcceptedForm> createState() => _AcceptedFormState();
}

class _AcceptedFormState extends State<AcceptedForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          controller: widget.nameCont,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
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
          controller: widget.phoneCont,
          keyboardType: TextInputType.phone,
          maxLength: 10,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "0910...",
          ),
        ),
        const SizedBox(height: 13.5),
      ],
    );
  }
}
