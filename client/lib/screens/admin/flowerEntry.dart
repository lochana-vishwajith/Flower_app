import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FlowerEntry extends StatefulWidget {
  const FlowerEntry({Key? key}) : super(key: key);

  @override
  State<FlowerEntry> createState() => _FlowerEntryState();
}

class _FlowerEntryState extends State<FlowerEntry> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile>? _imageList = [];

  late String _kingdom;
  late String _family;
  late String _tribe;
  late String _genus;
  late String _synonym;
  late String _bloom;
  late String _description;

  Widget _InputKingdomField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter Kingdom',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 82, 115, 77), width: 0.8))),
      onSaved: (value) {
        _kingdom = value.toString();
      },
    );
  }

  Widget _InputFamilyField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter Family',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 82, 115, 77), width: 0.8))),
      onSaved: (value) {
        _family = value.toString();
      },
    );
  }

  Widget _InputTribeField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter Tribe',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 82, 115, 77), width: 0.8))),
      onSaved: (value) {
        _tribe = value.toString();
      },
    );
  }

  Widget _InputGenusField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter Genus',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 82, 115, 77), width: 0.8))),
      onSaved: (value) {
        _genus = value.toString();
      },
    );
  }

  Widget _InputSynonymField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter Synonyms',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 82, 115, 77), width: 0.8))),
      onSaved: (value) {
        _synonym = value.toString();
      },
    );
  }

  Widget _InputBloomingField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter Blooming Seasons',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 82, 115, 77), width: 0.8))),
      onSaved: (value) {
        _bloom = value.toString();
      },
    );
  }

  Widget _InputDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter Description',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 82, 115, 77), width: 0.8))),
      onSaved: (value) {
        _description = value.toString();
      },
      maxLines: 7,
    );
  }

  Widget _InputImages() {
    return Stack(
      children: [
        OutlinedButton(
          onPressed: () {
            selectImages();
          },
          child: Text('Select Images'),
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return const Text('Hello');
              }),
        )
      ],
    );
  }

  void selectImages() async {
    final XFile? images =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    print(images!.path.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower Entry'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputKingdomField(),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0), child: _InputFamilyField()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputTribeField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputGenusField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputSynonymField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputBloomingField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _InputDescriptionField(),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                child: const Text('ADD'),
                onPressed: () {},
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
