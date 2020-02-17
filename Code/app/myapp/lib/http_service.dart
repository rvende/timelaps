import 'package:myapp/dataStart.dart';
import 'package:http/http.dart' as http;


Future<void> fetchPost(DataStart toto, bool valid) async {
  final response =
      await http.get('10.0.0.1/toto.php?dateDebut='+toto.dateDebut
                                      +'&dateFin='+toto.dateFin
                                      +'&nom='+toto.nom
                                      +'&nombrePhoto='+toto.nbPhoto.toString());

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    //return Post.fromJson(json.decode(response.body));
    valid = true;
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    //throw Exception('Failed to load post');
    valid = false;
    throw Exception('Failed to load post');
  }
}