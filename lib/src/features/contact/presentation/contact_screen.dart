import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_bloc_contacts/src/features/contact/bloc/contact_bloc.dart';
import 'package:reddit_bloc_contacts/src/features/contact/bloc/contact_event.dart';

import '../bloc/contact_state.dart';
import 'phone_display_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<ContactBloc>(context).add(ContactEventLoad());
            },
          )
        ],
      ),
      body: BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
        if (state is ContactStateLoaded) {
          return AzListView(
            data: state.contacts,
            itemCount: state.contacts.length,
            itemBuilder: ((context, index) => ListTile(
                  title: Text(
                    state.contacts[index].contact.displayName,
                  ),
                  subtitle: PhoneDisplayWidget(
                    phones: state.contacts[index].contact.phones,
                  ),
                )),
          );
        } else if (state is ContactStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          //initial state
          return const Center(
            child: Text('Please refresh your contacts'),
          );
        }
      }),
    );
  }
}
