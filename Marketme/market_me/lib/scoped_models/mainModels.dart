import './productModel.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
ProductModel productModel;
MainModel(){
  productModel=ProductModel();
}
}