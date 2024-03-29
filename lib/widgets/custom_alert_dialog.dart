import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.description,
      this.onPlay,
      required this.validatePop})
      : super(key: key);

  final String title;
  final String description;
  final Function? onPlay;
  final bool validatePop;

  @override
  State<CustomAlertDialog> createState() => _AlertDialogState();
}

class _AlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 210,
        child: Column(children: [
          const SizedBox(
            height: 6,
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (widget.validatePop) {
                    _play();
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  "Sim",
                  style: TextStyle(color: Color.fromARGB(255, 252, 252, 252)),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 17, 131, 7)),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Color.fromARGB(255, 255, 254, 254))),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Não",
                  style: TextStyle(color: Color.fromARGB(255, 252, 252, 252)),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 190, 14, 14)),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Color.fromARGB(255, 255, 254, 254))),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void _play() {
    widget.onPlay!();
  }
}
