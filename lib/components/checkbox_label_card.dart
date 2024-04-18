import 'package:flutter/material.dart';

class CheckboxLabelCard extends StatefulWidget {
  const CheckboxLabelCard({super.key});

  @override
  State<CheckboxLabelCard> createState() => _CheckboxLabelCardState();
}

class _CheckboxLabelCardState extends State<CheckboxLabelCard> {
  bool labelChecked = false;

  List<Map<String, dynamic>> stateCheckbox = [
    {'state': false, 'title': 'text'},
    {'state': false, 'title': 'text'},
    {'state': false, 'title': 'text'},
    {'state': false, 'title': 'text'},
    {'state': false, 'title': 'text'},
    {'state': false, 'title': 'text'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: ListView.builder(
        itemBuilder: (
          context,
          index,
        ) =>
            CheckboxListTile(
          title: Text("${stateCheckbox[index]['title']} e $index"),
          value: stateCheckbox[index]['state'],
          onChanged: (value) {
            setState(() => checkboxSetState(
                  index,
                ));
          },
        ),
        itemCount: stateCheckbox.length,
      ),
    );
  }

  void checkboxSetState(int index) {
    Map<String, dynamic> dataCheckbox = stateCheckbox[index];

    if (dataCheckbox.isNotEmpty) {
      setState(() {
        dataCheckbox['state'] = !dataCheckbox['state'];
      });
    }
  }

  void findSelectedCheckbox() {
    stateCheckbox.firstWhere((item) => item['state'] == true);
  }
}
