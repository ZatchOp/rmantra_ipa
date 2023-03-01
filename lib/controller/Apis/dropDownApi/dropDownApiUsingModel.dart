import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

import '../../../model/dispositionModel.dart';

final url = Uri.parse("http://$domain/api/dispositions2");
getData() async {
  var response = await http.get(url);
  if (response.statusCode == 200) {
    DispostionsModel data = dispostionsModelFromJson(response.body);
    return data;
  }
}
