import 'dart:io';

import 'package:client/models/flower_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class FlowerEntry extends StatefulWidget {
  const FlowerEntry({Key? key}) : super(key: key);

  @override
  State<FlowerEntry> createState() => _FlowerEntryState();
}

class _FlowerEntryState extends State<FlowerEntry> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FlowerModel? flowerModel;
  bool isEditMode = false;
  bool isImageSelected = false;

  @override
  void initState() {
    super.initState();
    flowerModel = FlowerModel();
  }

  Widget flowerForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          flowerImagePicker(isImageSelected, flowerModel!.imageUrl ?? "",
              (file) {
            setState(() {
              flowerModel!.imageUrl = file.path;
              isImageSelected = true;
            });
          }),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHelper.inputFieldWidget(
                context, "Kingdom", "Enter Kingdom", (onValidateValue) {
              if (onValidateValue.isEmpty) {
                return "Kingdom can't be empty";
              }
              return null;
            }, (onSaved) {
              flowerModel?.kingdom = onSaved;
            },
                initialValue: flowerModel!.kingdom ?? "",
                borderColor: Color.fromARGB(255, 82, 115, 77),
                borderFocusColor: Color.fromARGB(255, 121, 180, 112),
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.5),
                borderRadius: 10.0,
                showPrefixIcon: false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
                context, "Family", "Enter Family", (onValidateValue) {
              if (onValidateValue.isEmpty) {
                return "Family can't be empty";
              }
              return null;
            }, (onSaved) {
              flowerModel?.family = onSaved;
            },
                initialValue: flowerModel!.family ?? "",
                borderColor: Color.fromARGB(255, 82, 115, 77),
                borderFocusColor: Color.fromARGB(255, 121, 180, 112),
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.5),
                borderRadius: 10.0,
                showPrefixIcon: false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(context, "Tribe", "Enter Tribe",
                (onValidateValue) {
              if (onValidateValue.isEmpty) {
                return "Tribe can't be empty";
              }
              return null;
            }, (onSaved) {
              flowerModel?.tribe = onSaved;
            },
                initialValue: flowerModel!.tribe ?? "",
                borderColor: Color.fromARGB(255, 82, 115, 77),
                borderFocusColor: Color.fromARGB(255, 121, 180, 112),
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.5),
                borderRadius: 10.0,
                showPrefixIcon: false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(context, "Genus", "Enter Genus",
                (onValidateValue) {
              if (onValidateValue.isEmpty) {
                return "Genus can't be empty";
              }
              return null;
            }, (onSaved) {
              flowerModel?.genus = onSaved;
            },
                initialValue: flowerModel!.genus ?? "",
                borderColor: Color.fromARGB(255, 82, 115, 77),
                borderFocusColor: Color.fromARGB(255, 121, 180, 112),
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.5),
                borderRadius: 10.0,
                showPrefixIcon: false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
                context, "Synonyms", "Enter Synonyms", (onValidateValue) {
              if (onValidateValue.isEmpty) {
                return "Synonyms can't be empty";
              }
              return null;
            }, (onSaved) {
              flowerModel?.synonym = onSaved;
            },
                initialValue: flowerModel!.synonym ?? "",
                borderColor: Color.fromARGB(255, 82, 115, 77),
                borderFocusColor: Color.fromARGB(255, 121, 180, 112),
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.5),
                borderRadius: 10.0,
                showPrefixIcon: false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
                context, "BloomingSeasons", "Enter Blooming Seasons",
                (onValidateValue) {
              if (onValidateValue.isEmpty) {
                return "Blooming Seasons can't be empty";
              }
              return null;
            }, (onSaved) {
              flowerModel?.bloom = onSaved;
            },
                initialValue: flowerModel!.bloom ?? "",
                borderColor: Color.fromARGB(255, 82, 115, 77),
                borderFocusColor: Color.fromARGB(255, 121, 180, 112),
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.5),
                borderRadius: 10.0,
                showPrefixIcon: false),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
                context, "Description", "Enter Description", (onValidateValue) {
              if (onValidateValue.isEmpty) {
                return "Description can't be empty";
              }
              return null;
            }, (onSaved) {
              flowerModel?.description = onSaved;
            },
                initialValue: flowerModel!.description ?? "",
                borderColor: Color.fromARGB(255, 82, 115, 77),
                borderFocusColor: Color.fromARGB(255, 121, 180, 112),
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.5),
                borderRadius: 10.0,
                showPrefixIcon: false,
                isMultiline: true,
                multilineRows: 5),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: FormHelper.submitButton("Add Flower", () {
              if (saveForm()) {
                //API call
              }
            },
                    btnColor: Color.fromARGB(255, 82, 115, 77),
                    borderColor: Color.fromARGB(255, 82, 115, 77),
                    width: 161.0,
                    height: 36.0)),
          )
        ],
      ),
    );
  }

  bool saveForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  static Widget flowerImagePicker(
    bool isImageSelected,
    String imageName,
    Function onImagePicked,
  ) {
    Future<XFile?> _imageFie;
    ImagePicker _imagePicker = ImagePicker();

    return Column(
      children: [
        imageName.isNotEmpty
            ? isImageSelected
                ? Image.file(
                    File(imageName),
                    height: 200,
                    width: 200,
                  )
                : SizedBox(
                    child: Image.network(
                      imageName,
                      width: 200,
                      height: 200,
                      fit: BoxFit.scaleDown,
                    ),
                  )
            : SizedBox(
                child: Image.network(
                  "https://www.babypillowth.com/images/templates/upload.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.scaleDown,
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
              width: 30.0,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    Icons.image,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _imageFie =
                        _imagePicker.pickImage(source: ImageSource.gallery);
                    _imageFie.then((file) async {
                      onImagePicked(file);
                    });
                  }),
            ),
            SizedBox(
                height: 30.0,
                width: 30.0,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.camera,
                      size: 30.0,
                    ),
                    onPressed: () {
                      _imageFie =
                          _imagePicker.pickImage(source: ImageSource.camera);
                      _imageFie.then((file) async {
                        onImagePicked(file);
                      });
                    }))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower Entry'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: flowerForm(),
        ),
      ),
    );
  }
}
