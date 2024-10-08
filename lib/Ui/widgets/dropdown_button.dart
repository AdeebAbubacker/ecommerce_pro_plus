import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownButtons extends StatefulWidget {
  final List<CategoryItem> categoryItems;
  final Function(CategoryItem?) onClassChanged;
  final String hinttext;

  const DropdownButtons({
    Key? key,
    required this.categoryItems,
    required this.onClassChanged,
    required this.hinttext,
  }) : super(key: key);

  @override
  State<DropdownButtons> createState() => _DropdownButtonsState();
}

class _DropdownButtonsState extends State<DropdownButtons> {
  CategoryItem? _selectedCategoryItem;

  List<DropdownMenuItem<CategoryItem>> _addDividersAfterItems(
      List<CategoryItem> items) {
    final List<DropdownMenuItem<CategoryItem>> menuItems = [];
    for (final CategoryItem item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<CategoryItem>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.displayName, // Display the class name
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // If it's the last item, we will not add a Divider after it.
          if (item != items.last)
            const DropdownMenuItem<CategoryItem>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (widget.categoryItems.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }

      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190, // Use the full screen width
      height: 50,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0XFFFEFFFF),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color.fromARGB(255, 92, 92, 92), // Black border color
          width: 1.0, // Width of the border
        ),
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton2<CategoryItem>(
          isExpanded: true,
          hint: Text(
            widget.hinttext,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: const Color.fromARGB(255, 88, 88, 88),
            ),
          ),
          items: _addDividersAfterItems(widget.categoryItems),
          value: _selectedCategoryItem,
          onChanged: (CategoryItem? value) {
            setState(() {
              _selectedCategoryItem = value;
            });
            widget.onClassChanged(value); // Pass the selected value back
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            customHeights: _getCustomItemsHeights(),
          ),
          iconStyleData: const IconStyleData(
            openMenuIcon: Icon(Icons.arrow_drop_up),
          ),
        ),
      ),
    );
  }
}

class CategoryItem {
  final String displayName;
  final String id;
  final String slug;
  CategoryItem({
    required this.displayName,
    required this.id,
    required this.slug,
  });
}
