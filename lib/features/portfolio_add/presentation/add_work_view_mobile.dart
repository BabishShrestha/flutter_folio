import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/font.dart';

class AddWorkScreen extends StatefulWidget {
  const AddWorkScreen({super.key});

  @override
  State<AddWorkScreen> createState() => _AddWorkScreenState();
}

final _formKey = GlobalKey<FormState>();

class _AddWorkScreenState extends State<AddWorkScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Work Details',
              style: FontStyle().poppinsMedium,
            ),
            Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // Project Id
                TextFormFieldLabel(
                  projectTitle: 'Project Id:',
                  hintText: 'Enter Project ID',
                  errorText: 'Project ID cannot be empty',
                  validator: ((value) {
                    if (value != null && value == int) {
                      return null;
                    }
                    return 'Please enter a valid Project ID';
                  }),
                ),
                // Project Title
                const TextFormFieldLabel(
                  projectTitle: 'Project Title:',
                  hintText: 'Enter Project Title',
                  errorText: 'Project Title cannot be empty',
                ),
                //  Project Image
                const TextFormFieldLabel(
                  projectTitle: 'Project Image:',
                  hintText: 'Enter Project Image',
                  errorText: 'Project Image cannot be empty',
                ),
                //  PlayStore Link
                const TextFormFieldLabel(
                  projectTitle: 'PlayStore Link:',
                  hintText: 'Enter PlayStore Link',
                  errorText: 'PlayStore Link cannot be empty',
                ),
                //  Project Tools
                const TextFormFieldLabel(
                  projectTitle: 'Project Tools:',
                  hintText: 'eg: VS Code, Android Studio, Figma',
                  errorText: 'Project Tools cannot be empty',
                ),
                //  Project Description
                const TextFormFieldLabel(
                  projectTitle: 'Project Description:',
                  hintText: 'Fill in the project description',
                  errorText: 'Project Description cannot be empty',
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Add'),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFormFieldLabel extends StatelessWidget {
  final String projectTitle;
  final String? hintText;
  final String? errorText;
  final FormFieldValidator? validator;
  const TextFormFieldLabel({
    super.key,
    required this.projectTitle,
    this.hintText,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          projectTitle,
          style: FontStyle().poppinsSmall,
        ),
        TextFormField(
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              border: const OutlineInputBorder(),
              hintText: hintText,
              errorText: errorText),
          validator: validator ??
              (val) {
                if (val == null) {
                  return 'Please enter title';
                }
                return null;
              },
        ),
      ],
    );
  }
}
