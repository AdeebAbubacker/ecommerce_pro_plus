import 'package:ecommerce/Ui/widgets/search_delegate.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: ProductSearchDelegate(),
        );
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: const Row(
          children: [
            Text(
              'What do you want to buy today?',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Spacer(),
            Icon(Icons.search, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
