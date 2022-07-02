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
              children: const [
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
            bgColor: appBgColor,
            child: SvgPicture.asset(
              "assets/icons/edit.svg",
              width: 18,
              height: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                CustomImage(
                  profile["image"]!,
                  width: 80,
                  height: 80,
                  radius: 50,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Erick Garfias",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Phone: +51 999 999 999",
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Email: ${user.email!}",
                  style: const TextStyle(
                    color: labelColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SettingItem(
              title: "Configuración",
              leadingIcon: Icons.settings,
              leadingIconColor: orange,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Reservas",
              leadingIcon: Icons.bookmark_border,
              leadingIconColor: blue,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Favoritos",
              leadingIcon: Icons.favorite,
              leadingIconColor: red,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Políticas de Privacidad",
              leadingIcon: Icons.privacy_tip_outlined,
              leadingIconColor: green,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
            title: "Salir",
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: Colors.grey.shade400,
            onTap: () {
              showConfirmLogout();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  showConfirmLogout() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: const Text("¿Desea cerrar sesión?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text(
              "Salir",
              style: TextStyle(color: actionColor),
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
