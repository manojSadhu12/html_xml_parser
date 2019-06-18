import 'package:html_xml_parser/html_xml_parser.dart';

main() {
  Node node = RootNode([
    ElementNode(tag: "message", children: [
      ElementNode(tag: "text", children: [TextNode("Hello!!")]),
      ElementNode(tag: "from", children: [TextNode("Manoj sadhu")]),
      CommentNode("A simple comment")
    ])
  ]);

  String markup = node.toMarKup();
  print(markup); //<message><text>Hello!!</text><from>Manoj sadhu</from><!--A simple comment--></message>

  node.children.add(
      ElementNode(tag: "time", children: [TextNode("18-06-2019 09:18:00")]));

  String editedMarkup = node.toMarKup();
  print(editedMarkup); //<message><text>Hello!!</text><from>Manoj sadhu</from><!--A simple comment--></message><time>18-06-2019 09:18:00</time>
}
