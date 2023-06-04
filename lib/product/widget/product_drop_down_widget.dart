import 'package:flutter/material.dart';

class ProductDropdown extends StatefulWidget {
  const ProductDropdown({
    Key? key,
    required this.items,
    required this.onSelected,
  }) : super(key: key);
  final List<String> items;
  final void Function(String categories) onSelected;

  @override
  State<ProductDropdown> createState() => _ProductDropdownState();
}

class _ProductDropdownState extends State<ProductDropdown> {
  String? _selectedValue;
  @override
  void didUpdateWidget(covariant ProductDropdown oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.items != oldWidget.items && widget.items.isNotEmpty) {
      _changeValue(widget.items.first);
    }
  }

  void _changeValue(String? data) {
    if (data?.isNotEmpty ?? true) return;
    setState(() {
      _selectedValue = data!;
    });
    widget.onSelected(data!);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      isExpanded: true,
      items: widget.items
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (String? value) {
        _changeValue(value);
      },
    );
  }
}
