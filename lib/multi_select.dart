import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> selectedItems = [];

  void itemChange(String item, bool? isSelected) {
    if (isSelected == true) {
      setState(() {
        selectedItems.add(item);
      });
    } else {
      setState(() {
        selectedItems.remove(item);
      });
    }
  }

  void submit() {
    Navigator.pop(context, selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.73,
            child: SingleChildScrollView(
              child: ListBody(
                children: widget.items.map((item) {
                  return CheckboxListTile(
                      value: selectedItems.contains(item),
                      title: Text(item),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isSelected) {
                        itemChange(item, isSelected!);
                      });
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                submit();
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
