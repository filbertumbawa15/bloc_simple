import 'package:denice_ti4mb/bloc/user/register/bloc/register_waitress_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterWaitressPage extends StatelessWidget {
  RegisterWaitressPage({super.key});

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController namadepan = TextEditingController();
  TextEditingController namabelakang = TextEditingController();
  TextEditingController katasandi = TextEditingController();
  TextEditingController ulangisandi = TextEditingController();
  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => RegisterWaitressBloc(),
          child: Container(
            child: Form(
              key: formState,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Masukkan Username',
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                        controller: username,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Masukkan Email',
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        controller: email,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Masukkan Nama Depan',
                          labelText: 'Nama Depan',
                          border: OutlineInputBorder(),
                        ),
                        controller: namadepan,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Masukkan Nama Belakang',
                          labelText: 'Nama Belakang',
                          border: OutlineInputBorder(),
                        ),
                        controller: namabelakang,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Masukkan Kata Sandi',
                          labelText: 'Sandi',
                          border: OutlineInputBorder(),
                        ),
                        controller: katasandi,
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Ulangi Kata Sandi',
                          labelText: 'Sandi Ulang',
                          border: OutlineInputBorder(),
                        ),
                        controller: ulangisandi,
                        obscureText: true,
                      ),
                    ),
                    BlocConsumer<RegisterWaitressBloc, RegisterWaitressState>(
                      listener: (context, state) {
                        if (state is RegisterWaitressSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text(state.registerUserResponse.message)));
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterWaitressLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is RegisterWaitressError) {
                          return Center(child: Text(state.message));
                        }
                        return ElevatedButton.icon(
                            onPressed: () {
                              // if (formState.currentState!.validate()) {
                              context.read<RegisterWaitressBloc>().add(
                                  CreateWaitressEvent(
                                      username: username.text.toString(),
                                      email: email.text.toString(),
                                      isActive: true,
                                      isWaitress: true,
                                      firstName: namadepan.text.toString(),
                                      lastName: namabelakang.text.toString(),
                                      password1: katasandi.text.toString(),
                                      password2: ulangisandi.text.toString()));
                              // } else {
                              //   print("error");
                              // }
                            },
                            icon: Icon(Icons.check_box),
                            label: Text("REGISTER"));
                      },
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah Punya Akun? "),
                        GestureDetector(
                          onTap: () {
                            print("asdf");
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
