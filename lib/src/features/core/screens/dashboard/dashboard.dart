import 'package:flutter/material.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness ==
        Brightness.dark; //Dark mode

    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(isDark: isDark),

        /// Create a new Header
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                currentAccountPicture: Image(image: AssetImage(tLogoImage)),
                currentAccountPictureSize: Size(100, 100),
                accountName: Text('Zyckcode'),
                accountEmail: Text('Zyckcode27.com'),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(
                  leading: Icon(Icons.verified_user), title: Text('Profile')),
              ListTile(leading: Icon(Icons.shopping_bag), title: Text('Shop')),
              ListTile(leading: Icon(Icons.favorite), title: Text('Wishlist')),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Heading
                Text(tDashboardTitle, style: txtTheme.bodyMedium),
                Text(tDashboardHeading, style: txtTheme.displayMedium),
                const SizedBox(height: tDashboardPadding),

                //Search Box
                DashboardSearchBox(txtTheme: txtTheme),
                const SizedBox(height: tDashboardPadding),

                //Categories
                DashboardCategories(txtTheme: txtTheme),
                const SizedBox(height: tDashboardPadding),

                //Banners
                DashboardBanners(txtTheme: txtTheme, isDark: isDark),
                const SizedBox(height: tDashboardPadding),

                //Top Course
                Text(tDashboardTopCourses,
                    style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2)),
                DashboardTopCourses(txtTheme: txtTheme, isDark: isDark)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
