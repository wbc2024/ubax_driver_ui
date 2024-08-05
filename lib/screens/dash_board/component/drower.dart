import 'package:flutter/material.dart';
import 'package:udex_driver/screens/dash_board/component/profilewideget.dart';
import 'package:udex_driver/screens/dashboard/change_password_screen.dart';
import 'package:udex_driver/screens/dashboard/my_earnings_screen.dart';
import 'package:udex_driver/screens/dashboard/my_wallet_screen.dart';
import 'package:udex_driver/screens/dashboard/notifications_screen.dart';
import 'package:udex_driver/screens/dashboard/profile_overview_screen.dart';
import 'package:udex_driver/screens/sign%20in/sign_in_screen.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';

dashboard_drower(BuildContext context) => Drawer(
      child: ListView(
        //portant: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: drower_topview(context),
            decoration: BoxDecoration(
              color: CustomColor.accentColor,
            ),
          ),
          ListTile(
            title: Text(
              Strings.profileOverview,
              style: CustomStyle.textStyle,
            ),
            leading: Icon(Icons.streetview_sharp, color: CustomColor.greyColor),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileOverviewScreen()));
            },
          ),
          ListTile(
            title: Text(
              Strings.yourEarning,
              style: CustomStyle.textStyle,
            ),
            leading: Icon(Icons.money, color: CustomColor.greyColor),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyEarningsScreen()));
            },
          ),
          ListTile(
            title: Text(
              Strings.myWallet,
              style: CustomStyle.textStyle,
            ),
            leading: Icon(Icons.account_balance_wallet,
                color: CustomColor.greyColor),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyWalletScreen()));
            },
          ),
          ListTile(
            title: Text(
              Strings.notification,
              style: CustomStyle.textStyle,
            ),
            leading: Icon(Icons.notifications, color: CustomColor.greyColor),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen()));
            },
          ),
          ListTile(
            title: Text(
              Strings.changePassword,
              style: CustomStyle.textStyle,
            ),
            leading: Icon(Icons.lock, color: CustomColor.greyColor),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangePasswordScreen()));
            },
          ),
          ListTile(
            title: Text(
              Strings.settings,
              style: CustomStyle.textStyle,
            ),
            leading: Icon(Icons.settings, color: CustomColor.greyColor),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              Strings.signOut,
              style: CustomStyle.textStyle,
            ),
            leading: Icon(Icons.exit_to_app, color: CustomColor.greyColor),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          ),
        ],
      ),
    );
