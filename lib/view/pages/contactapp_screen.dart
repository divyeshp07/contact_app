import 'package:contact_app/controller/contactapp_controller.dart';
import 'package:contact_app/view/widget/contactapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactApp extends ConsumerWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController numcontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    final mycontact = ref.watch(contactServicesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact Here'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mycontact.length,
        itemBuilder: (context, index) => SizedBox(
          height: 100,
          child: Card(
            color: Colors.amber,
            child: ListTile(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite)),
              trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {
                            ref
                                .read(contactServicesProvider.notifier)
                                .deletetodo(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  )),
              title: Text(
                mycontact[index].name,
                style: const TextStyle(fontSize: 22, color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mycontact[index].phonenum,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                  Text(mycontact[index].email,
                      style:
                          const TextStyle(fontSize: 17, color: Colors.black)),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: 700,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Create',
                          style: TextStyle(fontSize: 22),
                        ),
                        textfeildwidget(
                          hinttext: 'Name',
                          controller: namecontroller,
                          keybordtype: TextInputType.text,
                        ),
                        textfeildwidget(
                          hinttext: 'Number',
                          controller: numcontroller,
                          keybordtype: TextInputType.number,
                        ),
                        textfeildwidget(
                          hinttext: 'Email',
                          controller: emailcontroller,
                          keybordtype: TextInputType.emailAddress,
                        ),
                        FloatingActionButton.extended(
                            onPressed: () {
                              ref
                                  .read(contactServicesProvider.notifier)
                                  .addtodo(namecontroller.text,
                                      numcontroller.text, emailcontroller.text);
                              Navigator.pop(context);
                            },
                            label: const Text('Save'))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          label: const Text('Add Contact +')),
    );
  }
}
