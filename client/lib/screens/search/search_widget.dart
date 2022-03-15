import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hint;

  const SearchWidget(
      {Key? key,
      required this.text,
      required this.onChanged,
      required this.hint})
      : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(213, 238, 233, 208),
          border: Border.all(color: Colors.greenAccent)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
            icon: const Icon(Icons.search),
            suffixIcon: widget.text.isNotEmpty
                ? GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () {
                      searchController.clear();
                      widget.onChanged('');
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
                : null,
            hintText: widget.hint,
            border: InputBorder.none),
        onChanged: widget.onChanged,
      ),
    );
  }
}
