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
