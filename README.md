A Dart library for parsing HTML or XML into Dart objects, Map, json string and vice-versa.


## Usage

To use this plugin, add html_xml_parser as a dependency in your pubspec.yaml file.

## Library overview

```
Checkout the Elements class to understand available elements.

* RootNode -> Start of the markup. It holds children.
* ElementNode -> tag should be specified(ex: div). Supports attributes and children.
* TextNode -> It is the text at appeares inside a HTML/Markup tag.
* CommentNode -> It is a comment that can be place in between elements,
* Attribute -> `Name`, `value` should be given. `valueOriginal` is optional, It is used in creating markup.
```

```
Checkout the MarkupUtils class which contains many utils for conversion.

* Node mapToNode(Map<String, dynamic> json)
* Node jsonToNode(String jsonString) 
* Node markup2json(String markupString)
* String jsonToMarkup(String jsonString)
* String mapToMarkup(Map<String, dynamic> jsonMap)
```
## Examples

## Markup to dart object

Here Markup in string format is converted to dart object.

```dart
import 'package:html_xml_parser/html_xml_parser.dart';

main() {
  var markup = """
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="UTF-8">
          <title>title</title>
        </head>
        <body>
        
        </body>
      </html>
""";

  Node node = MarkupUtils.markup2json(markup);

  print(
      node); //{"type":"root","children":[{"type":"element","tag":"html","children":[{"type":"element","tag":"head","children":[{"type":"element","tag":"meta","attributes":[{"name":"charset","value":"UTF-8","valueOriginal":"\"UTF-8\""}]},{"type":"element","tag":"title","children":[{"type":"text","text":"title"}]}]},{"type":"element","tag":"body"}]}]}
}
```

## JSON to markup
Convert JSON to markup. JSON should this type of syntax only.


```dart
import 'package:html_xml_parser/html_xml_parser.dart';

main() {
  String jsonString = r"""
  {
    "type": "root",
    "children": [{
        "type": "element",
        "tag": "html",
        "children": [{
            "type": "element",
            "tag": "head",
            "children": [{
                "type": "element",
                "tag": "meta",
                "attributes": [{
                    "name": "charset",
                    "value": "UTF-8",
                    "valueOriginal": "\"UTF-8\""
                }]
            }, {
                "type": "element",
                "tag": "title",
                "children": [{
                    "type": "text",
                    "text": "title"
                }]
            }]
        }, {
            "type": "element",
            "tag": "body"
        }]
    }]
}
""";
  String markup = MarkupUtils.jsonToMarkup(jsonString);

  print(markup);//<html><head><meta charset="UTF-8"/><title>title</title></head><body/></html>
}
```

## Create or edit markup
Create or edit existing markup Node tree.

```dart
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
```

## Features and bugs

Please file feature requests and bugs.
