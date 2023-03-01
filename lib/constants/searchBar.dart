import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(12),
      height: height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
      ),
      child: TextFormField(
        style: const TextStyle(fontSize: 12),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintStyle: TextStyle(fontSize: 12),
            hintText: "Borrower Name/LAN/Area",
            border: InputBorder.none),
      ),
    );
  }
}
