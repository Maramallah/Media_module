import 'package:flutter/material.dart';
import 'package:media/Models/contentManagar.dart';


class Socialmediascreen extends StatefulWidget {
  @override
  State<Socialmediascreen> createState() => _SocialmediascreenState();
}

class _SocialmediascreenState extends State<Socialmediascreen> {
  final ContentManger contentManger = ContentManger();
  final TextEditingController linkController = TextEditingController();

  Future<void> addNewPost() async {
    final link = linkController.text;
    try {
      contentManger.addLinkContent(link);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Media Committee'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Materials'),
              Tab(text: 'Tasks'),
              Tab(text: 'Events'),
              Tab(text: 'Social Media'),
              Tab(text: 'Memes'),
            ],
          ),
        ),
        
        body: TabBarView(
          children: [
            Center(child: Text('Materials')),
            Center(child: Text('Tasks')),
            Column(
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: linkController,
                    decoration: InputDecoration(
                      labelText: 'Enter link',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                /*
                ElevatedButton(
                  onPressed: addNewPost,
                  style: ButtonStyle(
                   backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  child: Text('Add Post',style: TextStyle(color: Colors.white),),
                ),*/
                Expanded(
                  child: ListView.builder(
                    itemCount: contentManger.content.length,
                    itemBuilder: (ctx, i) => ListTile(
                      leading: contentManger.content[i].imageUrl != null
                          ? Image.network(contentManger.content[i].imageUrl!)
                          : null,
                      title: Text(contentManger.content[i].title),
                      subtitle: contentManger.content[i].description != null
                          ? Text(contentManger.content[i].description!)
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            Center(child: Text('Social Media')),
            Center(child: Text('Memes')),
          ],
        ),
        
        
      ),
    );
  }
}