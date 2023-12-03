import 'package:gsheets/gsheets.dart';
import 'package:sgs/Screens/Data%20Managment/sheets_columns.dart';

class SheetsFlutter{
  static String _sheetId = "1Ug9WIdJ3VxemL8Rkq_8pn9-IWVJsqGOP7IqyZgfqvrQ";

  static const _sheetCredentials = r'''
  {
  "type": "service_account",
  "project_id": "starry-seat-406917",
  "private_key_id": "93735719a4827d4ad6352fea4184b3ba6fcc5178",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDdn1K7JKDlgjN1\nO0w2UEd70wkHKj0UB/l3FtC6mhTXmaKVDO8OfavFQ6e/f3oFYRvq6po8nB9HTLfH\ngrXuYYU8UNRqW/aALD6kLVNdFC6RnL/q4EjoJlOdhE39kjZub9nxEUP7S7KOwm2z\nR5J3S6wsFnoOeZW4ykNlRQI4SCD4txJbaThrJ7VO7UXiszOBv1FdQ2Clhc0mHQpO\n82OvKHKUhcMee6LKrlpiHlwTFcDHpYmHKBwn3i/YjGhb00aznhGG320LAv3JLzp4\nlmUxqr2RSRmzZMxMWoSjibww8d1tkt69EmM7QIgr7KWzfEIHJMcQcPauoG9riGHH\nzGP0coW3AgMBAAECggEADLrsoSRS+6v1cbv0vj/xQzsVjyxNctucaEtOtRFJtjK0\nhJRIHRB57+xZc+YKJ8nytRVBw86B+3H8MoEfGzDN2u+Xq/5ZU/Z2qK6T1cplfGbB\nHWhBt9gPwIILis+9wa06Gx9PRN2NxaaEb6JiVujpXGT0IOW6BHHV2jjTDlGSV0bt\nbW3mXmy/Wa1gHXVj3osZk7Ha5AYPcx/OuFEVu3wm8Rf7AJn0DVRyC1zRMIVWGcvo\nYBf1xclMpL5YVhiWPqti83b9oJWWtgalCEkmHEDm7IU+tK6TBotBjHqWfKVFwczz\n8FqrNx8s1Mx3gU/funS0nRXdlZTEx9KqfGM4ulcAmQKBgQD2Mosi5JEaS8IxkXOv\nikuAwVVFijoPirHQC+pHAOz3nNXh1dT82kIEsWpVDarXFXKcY5JMzLSrXGvETW7p\nTnfEj/7DgnWLfq+RL5hIor3LIOcKv/T5O30KGWTxM2DNy3ogufu1+TC5YRzbd/1J\nXNbnLjHlFZ8XZE1fhvS96dwiqQKBgQDmckoNwFDH7xeCJ5hxKwkKddGSkDtJGqua\ni/LnzY5QWLMaiZBDuPdge10deTE0FUefLDLoXV4OHxlknN10zhIG/6duTAxsXext\n43wYc2Ia+XeQ8evzfuBCsU34tQXl6G6mDcq2P7Bm2a8pWcQPdUQLFJIOROUHm4zd\nQXC3lQcBXwKBgQC0f3niqxB25vQIw0q9d/bC/vs1cJIAsv6KOTIZvGP/ZcypNcxh\nVOLx7eC3Wr3V0rOkVJv+ElajC682zE50XkMQqUFutUbYbpjpKKvNFQNw2T6KcxF3\naFXUAaov7CsctgFj3PbeA0PlpX0yqlXYY2hrNUL/YUqyK6dOUfM9CSeLgQKBgHMN\nfIuBCNPJOyNwQVu+8LSYPhm+iNrmxeZTGONCbVsP7dvB8pTdNCSncsXUTAyE001U\n89WvR9YlELh62NYITFfSK/WVYl54RiJXAQ30DXcKNffX0MWxAqZJf3Q8bMVsVlHx\ncNOs2JWA+ULb3lcZZO9jRch5/R7fOmT81xnQ/b5hAoGAfiXKajO19MSIC5KcBoWp\npfWvFIag0odbmqxQj24RhLUI7CB4ULHxp2OKTZIX08vGwXTtJjH6/yHa6OuTrLYp\nWg9608iLV74VYciFcCdylRuvFV4JUV2UDtWYiHbMUTVtOpoKRLmz1keLIrlRIDpp\nK3ZJaho+QR38cV4JLFGuDWI=\n-----END PRIVATE KEY-----\n",
  "client_email": "sgs-623@starry-seat-406917.iam.gserviceaccount.com",
  "client_id": "112139550333636543316",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sgs-623%40starry-seat-406917.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
  }
  ''';

  static Worksheet? _userSheet;
  static final _gsheet = GSheets(_sheetCredentials);

  static Future init() async{
    try{
      final spreadsheet = await _gsheet.spreadsheet(_sheetId);

      _userSheet = await _getWorkSheet(spreadsheet, title: "Farm");

      final firstRow = SheetColumn.getColumns();
      _userSheet!.values.insertRow(1, firstRow);

    }catch(e){
      print(e);
    }
  }

  static Future <Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, {
        required String title,
  }) async{
    try{
      return await spreadsheet.addWorksheet(title);
    }catch(e){
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async{
    _userSheet!.values.map.appendRows(rowList);
  }

}

