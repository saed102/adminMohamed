


import 'package:ahmed_store_admin/views/screens/side_bar_screens/categories_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/orders_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/products_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/upload_banner_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:ahmed_store_admin/views/screens/side_bar_screens/withdrawal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = OrderScreen();

  screenSelctor(item){

    switch (item.route){
      case DashboardScreen.routeName:
      setState(() {
        _selectedItem = DashboardScreen() ;
      });

      break;

    case VendorScreen.routeName:
      setState(() {
        _selectedItem = VendorScreen() ;
      });

      break;

    case WithdrawalScreen.routeName:
      setState(() {
        _selectedItem = WithdrawalScreen() ;
      });

      break;

    case OrderScreen.routeName:
      setState(() {
        _selectedItem = OrderScreen() ;
      });

      break;

    case CategoriesScreen.routeName:
      setState(() {
        _selectedItem = CategoriesScreen() ;
      });

      break;

    case ProductScreen.routeName:
      setState(() {
        _selectedItem = ProductScreen() ;
      });

      break;

    case UploadBnnerScreen.routeName:
      setState(() {
        _selectedItem = UploadBnnerScreen() ;
      });

      break;

    }

  }



  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        backgroundColor: Colors.white,
      
      sideBar: SideBar(items: [

        AdminMenuItem(
          title: 'Dashboard6',
          icon: Icons.dashboard, 
          route: DashboardScreen.routeName,
          ),
         AdminMenuItem(
          title: 'Vendors',
          icon: CupertinoIcons.person_3,
           route: VendorScreen.routeName,
           ),
          AdminMenuItem(
            title: 'Withdrawal',
            icon: CupertinoIcons.money_dollar,
             route: WithdrawalScreen.routeName,
             ),
           AdminMenuItem(
            title: 'Orders'
            ,icon: CupertinoIcons.shopping_cart,
             route: OrderScreen.routeName,
             ),
              AdminMenuItem(
            title: 'Categories'
            ,icon: Icons.category,
             route: CategoriesScreen.routeName,
             ),
              AdminMenuItem(
            title: 'Products'
            ,icon:  Icons.shop,
             route: ProductScreen.routeName
             ),
             AdminMenuItem(
            title: 'Upload Banners'
            ,icon: CupertinoIcons.add,
             route: UploadBnnerScreen.routeName,
             ),
      ], selectedRoute: '' , onSelected: (item){
        screenSelctor(item);
      },

      header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Pharmacy Store Panel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'By Ahmed M',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedItem );
  }
}