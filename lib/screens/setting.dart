import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app_web/theme/color.dart';
import 'package:hotel_app_web/utils/data.dart';
import 'package:hotel_app_web/widgets/custom_image.dart';
import 'package:hotel_app_web/widgets/icon_box.dart';
import 'package:hotel_app_web/widgets/setting_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  //RECUPERAR DATOS
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              title: getAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => buildBody(),
                childCount: 1,
              ),
            )
          ],
        ));
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Configuración",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconBox(
            child: SvgPicture.asset(
              "assets/icons/edit.svg",
              width: 18,
              height: 18,
            ),
            bgColor: appBgColor,
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                CustomImage(
                  profile["image"]!,
                  width: 80,
                  height: 80,
                  radius: 50,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Erick Garfias",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Phone: +51 999 999 999",
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Email: " + user.email!,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          SettingItem(
              title: "Configuración",
              leadingIcon: Icons.settings,
              leadingIconColor: orange,
              onTap: () {}),
          SizedBox(height: 10),
          SettingItem(
              title: "Reservas",
              leadingIcon: Icons.bookmark_border,
              leadingIconColor: blue,
              onTap: () {}),
          SizedBox(height: 10),
          SettingItem(
              title: "Favoritos",
              leadingIcon: Icons.favorite,
              leadingIconColor: red,
              onTap: () {}),
          SizedBox(height: 10),
          SettingItem(
              title: "Políticas de Privacidad",
              leadingIcon: Icons.privacy_tip_outlined,
              leadingIconColor: green,
              onTap: () {}),
          SizedBox(height: 10),
          SettingItem(
            title: "Salir",
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: Colors.grey.shade400,
            onTap: () {
              showConfirmLogout();
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  showConfirmLogout() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: Text("¿Desea cerrar sesión?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text(
              "Salir",
              style: TextStyle(color: actionColor),
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
