import 'package:flutter/material.dart';

class RejectedForm extends StatefulWidget {
  const RejectedForm({super.key, required this.formCont});
  final TextEditingController formCont;

  @override
  State<RejectedForm> createState() => _RejectedFormState();
}

class _RejectedFormState extends State<RejectedForm> {
  List<String> list = ["No Budget", "No manager", "Existing Sytem", "Other"];
  String dropdownValue = "No Budget";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward_sharp),
          elevation: 16,
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        dropdownValue == "Other"
            ? TextFormField(
                controller: widget.formCont,
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: Colors.black45,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  hintText: "Enter reason here ...",
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
