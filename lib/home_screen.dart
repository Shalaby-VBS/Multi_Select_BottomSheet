import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'multi_select.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedItems = [];

  void showMultiSelect() async {
    final List<String> items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
      'Item 6',
      'Item 7',
      'Item 8',
      'Item 9',
      'Item 10',
      'Item 11',
      'Item 12',
      'Item 13',
      'Item 14',
    ];
    final List<String>? results = await showSlidingBottomSheet(
      context,
      builder: (_) {
        return SlidingSheetDialog(
          elevation: 10,
          backdropColor: Colors.white,
          cornerRadius: 20,
          snapSpec: const SnapSpec(
            snappings: [1.0, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (_, state) {
            return Material(
              child: MultiSelect(items: items),
            );
          },
        );
      },
    );
    if (results != null) {
      setState(() {
        selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Multi-Select'),
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    showMultiSelect();
                  },
                  child: const Text('Select your favorite Topics')),
            ),
            Wrap(
              children: selectedItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                    label: Text(item),
                    onDeleted: () {
                      setState(() {
                        selectedItems.remove(item);
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
