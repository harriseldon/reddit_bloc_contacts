import 'package:azlistview/azlistview.dart';
import 'package:flutter_contacts/contact.dart';

class ContactModel extends ISuspensionBean {
  ContactModel({required this.contact});

  final Contact contact;

  @override
  String getSuspensionTag() {
    return contact.displayName;
  }
}
