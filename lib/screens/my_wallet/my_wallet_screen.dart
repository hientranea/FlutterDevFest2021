import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Wallet',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Available Balance'),
                const Text(
                  '\$23 215.57',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _walletGridMenu(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Cards',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CardImage(
                        imagePath: 'assets/images/card_dummy/card_1.png',
                      ),
                      CardImage(
                        imagePath: 'assets/images/card_dummy/card_2.png',
                      ),
                      CardImage(
                        imagePath: 'assets/images/card_dummy/card_3.png',
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sent to',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ClipOval(
                        child: Material(
                          color: Colors.grey[200],
                          child: InkWell(
                            onTap: () {},
                            child: const SizedBox(
                              width: 60,
                              height: 60,
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: _contactList()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contactAvatar({required String name, required String image}) =>
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              backgroundImage: Image.asset(
                image,
                fit: BoxFit.cover,
              ).image,
            ),
            Text(name),
          ],
        ),
      );

  Widget _contactList() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _contactAvatar(
                name: 'John', image: 'assets/images/contact_dummy/p1.jpg'),
            _contactAvatar(
                name: 'John', image: 'assets/images/contact_dummy/p2.jpg'),
            _contactAvatar(
                name: 'John', image: 'assets/images/contact_dummy/p3.jpg'),
            _contactAvatar(
                name: 'John', image: 'assets/images/contact_dummy/p4.jpg'),
            _contactAvatar(
                name: 'John', image: 'assets/images/contact_dummy/p5.jpg'),
            _contactAvatar(
                name: 'John', image: 'assets/images/contact_dummy/p6.jpg'),
            _contactAvatar(
                name: 'John', image: 'assets/images/contact_dummy/p7.jpg'),
            _contactAvatar(
                name: 'John', image: 'assets/images/contact_dummy/p8.jpg'),
          ],
        ),
      );

  Widget _walletGridMenu() => GridView.count(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children: [
          _menuIcon(
            label: 'Dashboard',
            icon: const Icon(Icons.dashboard_outlined),
            onTap: () {},
          ),
          _menuIcon(
            label: 'Set Limits',
            icon: const Icon(FontAwesomeIcons.lessThanEqual),
            onTap: () {},
          ),
          _menuIcon(
            label: 'Withdraw',
            icon: Image.asset('assets/icons/money-withdrawal.png'),
            onTap: () {},
          ),
          _menuIcon(
            label: 'Load Funds',
            icon: const Icon(FontAwesomeIcons.moneyBillAlt),
            onTap: () {},
          ),
          _menuIcon(
            label: 'Transfer',
            icon: const Icon(FontAwesomeIcons.exchangeAlt),
            onTap: () {},
          ),
          _menuIcon(
            label: 'Block Card',
            icon: const Icon(FontAwesomeIcons.ccDinersClub),
            onTap: () {},
          ),
        ],
      );

  Widget _menuIcon({
    required String label,
    required Widget icon,
    required VoidCallback onTap,
  }) =>
      InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: icon,
              height: 40,
              width: 40,
            ),
            Text(label),
          ],
        ),
      );
}

class CardImage extends StatelessWidget {
  final String imagePath;

  const CardImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        height: 200,
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
