/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Wrote By Osman Suliman in 2021 
 */
import 'package:dio/dio.dart';
import 'package:kyveli/core/base/client.dart';
import 'package:progress_dialog/progress_dialog.dart';

class UserServices {
  Future login(String email, pass, context, scaffoldKey, pr) async {
    pr = new ProgressDialog(context);
    try {
      var response = await client.post(
        ('user/login'),
        data: ({
          "email": email,
          "password": pass,
        }),
      );
      print(response.data);

      return response.data;
    } on DioError catch (error) {
      pr.hide();

      print('DIO ERROR');
      print(error);
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.CANCEL:
          return throw error;
          break;
        default:
          return throw error;
      }
    } catch (error) {
      pr.hide();
      return throw error;
    }
  }
}
