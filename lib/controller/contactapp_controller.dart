import 'package:contact_app/model/contactapp_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contactapp_controller.g.dart';

@riverpod
class ContactServices extends _$ContactServices {
  @override
  List<ContactModel> build() {
    return [];
  }

  void addtodo(String name, String phonenum, String email) {
    state = [
      ...state,
      ContactModel(name: name, phonenum: phonenum, email: email)
    ];
  }

  void deletetodo(int index) {
    state = List.from(state)..removeAt(index);
  }

  void edittodo(
      int index, String newName, String newPhonenum, String newEmail) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)
        ..[index] = ContactModel(
          name: newName,
          phonenum: newPhonenum,
          email: newEmail,
        );
    }
  }
}
