part of '../pages.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return MainPage();
              } else if (snapshot.hasError) {
                return Center(child: Text('Something Went Wrong!'));
              } else {
                return SignUpWidget();
              }
            }));
  }
}
