import 'package:flutter/material.dart';
import 'package:login_screen_color_picker_example/views/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;

  List<int> selectedColorIndex = [];
  List<Color> myColorList = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              final SharedPreferences preferences =
                  await SharedPreferences.getInstance();

              await preferences.setBool("isLogged", false);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
                (route) => false,
              );
            },
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 5),
                Text("Logout"),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => StatefulBuilder(
              builder: (context, insetState) => Container(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: myColorList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      selectedIndex = index;
                      insetState(() {});
                      selectedColorIndex.add(selectedIndex!);
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: myColorList[index].withOpacity(.5),
                        border: selectedIndex == index
                            ? Border.all(
                                color: myColorList[index].withOpacity(1),
                                width: 5,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: selectedColorIndex.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(3),
            child: Container(
              height: 50,
              width: double.infinity,
              color: myColorList[selectedColorIndex[index]],
            ),
          ),
        ),
      ),
    );
  }
}
