import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.007,
              width: MediaQuery.of(context).size.height * 0.14,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    submit();
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
