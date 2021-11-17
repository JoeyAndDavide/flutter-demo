import 'package:demo_srapp/themes/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const String patronName = 'FEI FEI HO';
    const String patronID = '4988800';
    const String patronExp = '2021-10-31';

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/profile/bg_gold.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          top: true,
          bottom: true,
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Text(
                    patronName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'No. $patronID',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15),
                  ),
                  Text(
                    'Valid until | $patronExp',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset('assets/profile/card_gold.png'),
              const SizedBox(height: 23),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [Text('My points')],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('0'),
                              Text("Today's Earned"),
                              Text('Sands Rewards Points'),
                            ],
                          ),
                          Column(
                            children: [
                              Text('0'),
                              Text('Sands Rewards Points'),
                              Text('Balance'),
                            ],
                          ),
                          Column(
                            children: [
                              Text('0'),
                              Text('Lifestyle Points'),
                              Text('Balance'),
                            ],
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(children: [
                    Icon(Icons.settings),
                    SizedBox(width: 5),
                    Text('My Offers')
                  ], mainAxisAlignment: MainAxisAlignment.start),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('\$100'),
                          Text('My Wallet'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('0'),
                          Text('My Tickets'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('0'),
                          Text('My Bookings'),
                        ],
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(children: [
                    Icon(Icons.settings),
                    SizedBox(width: 5),
                    Text('My Offers')
                  ], mainAxisAlignment: MainAxisAlignment.start),
                ),
              ),
              const SizedBox(height: 15),
              Text('Hello world. hahaha.!', style: TextStyle(fontSize: 100)),
              ElevatedButton(
                onPressed: () {
                  Provider.of<CustomTheme>(context, listen: false)
                      .toggleTheme();
                },
                child: const Text('Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
