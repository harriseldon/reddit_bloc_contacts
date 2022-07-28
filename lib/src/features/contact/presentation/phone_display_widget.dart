import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class PhoneDisplayWidget extends StatelessWidget {
  const PhoneDisplayWidget({Key? key, required this.phones}) : super(key: key);

  final List<Phone> phones;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          ...phones.map<Widget>(
            (phone) => Text(
              '${phone.label == PhoneLabel.custom ? phone.customLabel : phone.label.toString().substring(11)} - ${phone.number}',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
