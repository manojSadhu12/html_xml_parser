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
