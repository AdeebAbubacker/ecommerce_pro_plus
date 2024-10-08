import 'package:ecommerce/Ui/widgets/search_delegate.dart';
import 'package:google_fonts/google_fonts.dart';
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
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color:
                const Color.fromARGB(255, 198, 198, 198), // Add a grey border
            width: 1, // Set the thickness of the border
          ),
        ),
        child: Row(
          children: [
            Text(
              'What do you want to buy today?',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 122, 122, 122),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.search,
              color: Colors.black,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
