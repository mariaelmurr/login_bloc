import 'package:bloc_tutorial/business_logic/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            BlocBuilder<ThemeCubit, bool>(
              builder: (context, state) {
                return SwitchListTile(
                  title: Text("Dark mode"),
                  value: state,
                  onChanged: (value) {
                    BlocProvider.of<ThemeCubit>(context)
                        .toggleTheme(value: value);
                  },
                );
              },
            ),
            ListTile(
              title: Text('Button in Drawer'),
              onTap: () {
                // Do something when the button is tapped
                // For example, you can navigate to another page
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}
