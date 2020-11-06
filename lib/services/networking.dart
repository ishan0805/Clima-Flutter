import 'dart:convert';
import 'package:http/http.dart'as http;


class NetworkingHelper
{
     NetworkingHelper(this.url);
     String url;
     Future getData()async
     {
       var response = await http.get(url);
       if(response.statusCode == 200) {
         String data = response.body;

         return jsonDecode(data);
       }
       else
         {
           print(response.statusCode);
         }

     }

}