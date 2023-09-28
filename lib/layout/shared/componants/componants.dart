import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/modules/webviwe/web_view.dart';

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isupper = true,
  double redius = 5.0,
  // ignore: use_function_type_syntax_for_parameters
  required Function() fun1,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: fun1,
        child: Text(
          isupper ? text.toUpperCase() : text,
          style: const TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
var d = TextEditingController();
var s = TextStyle(
  color: Colors.grey[3000],
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);
Widget defultfromfild({
  IconData? sufix,
  Function()? ontap,
  required TextEditingController controller,
  required TextInputType type,
  required Function(String) fin1,
  required String? Function(String?) valdidate,
  required String text,
  double radius = 10.0,
  Color background = Colors.white,
  Color? colorText,
  Function()? sufixprass,
  required IconData prfix,
  bool ispassword = false,
  bool isclicklable = true,
  Color? colorLabel,
  Color? colortextinput,
  Function(String)? onchange,
}) =>
    TextFormField(
      onChanged: onchange,
      enabled: isclicklable,
      obscureText: ispassword,
      validator: valdidate,
      controller: controller,
      style: s,
      onFieldSubmitted: fin1,
      keyboardType: type,
      onTap: ontap,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: colortextinput),
        labelStyle: TextStyle(
          color: colorLabel,
        ),
        counterStyle: TextStyle(color: colorText),
        suffix: sufix != null
            ? IconButton(
                onPressed: sufixprass,
                icon: Icon(
                  sufix,
                  color: colorLabel,
                ))
            : null,
        prefix: Icon(
          prfix,
          color: colorLabel,
          size: 30.0,
        ),
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
    );

Widget bulidTaskItem(Map modle) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[500],
            radius: 40.0,
            child: Text(
              '${modle['time']}',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${modle['title']}',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${modle['data']}',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
Widget buldArticleItem(artical, context) => InkWell(
      onTap: () {
        navigateTo(
          context,
          WebviewScreen(
            artical['url'],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: artical['urlToImage'] != null
                      ? NetworkImage('${artical['urlToImage']}')
                      : NetworkImage(
                          'https://www.elegantthemes.com/blog/wp-content/uploads/2020/08/000-http-error-codes.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 140.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${artical['title']}',
                        style: Theme.of(context).textTheme.headlineMedium,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('${artical['publishedAt']}',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider({HexColor? ca}) => Divider(
      color: ca,
      endIndent: 20.0,
      indent: 20.0,
      thickness: 2,
      height: 10,
    );
Widget bulidItemNews(list, {isSearsh = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buldArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      fallback: (context) =>
          isSearsh ? Container() : Center(child: CircularProgressIndicator()),
    );
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
