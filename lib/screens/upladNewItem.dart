// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:agric_fresh_app/config.dart';
import 'package:agric_fresh_app/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class UploadProduct extends StatefulWidget {
  final User_ appuser;
  final SupabaseClient supabase;

  const UploadProduct(
      {super.key, required this.appuser, required this.supabase});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  String productNameInput = '';
  String priceInput = '';
  String descriptionInput = '';
  XFile? photo;
  final dio = Dio();
  String imageName = '';

  final ImagePicker _imagePicker = ImagePicker();
  pickImage(BuildContext context) async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      photo = image;
      imageName = Uuid().v4().toString() + image.name;
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Warning!!'),
              content: Text(
                  'No image was selected please ensure you select an image before Submiting.'),
            );
          });
    }
  }

  deleteImage() async {
    await supabase.storage.from('images').remove(['farmersImage/${imageName}']);
  }

  uploadImage(XFile image, String imageName) async {
    try {
      supabase.storage
          .from('images')
          .uploadBinary('farmersImage/${imageName}', await image.readAsBytes(),
              fileOptions: FileOptions(
                upsert: true,
              ),
              retryAttempts: 1)
          .then((value) => print(value));
      return;
    } catch (e) {
      photo = null;
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('An error occured try again'),
            );
          });
    }
  }

  uploadNewItem(
    User_ appuser,
  ) async {
    if (productNameInput.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please select your product name'),
            );
          });
      return;
    }
    if (priceInput.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please select your product price'),
            );
          });
      return;
    }
    if (descriptionInput.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please select your product description'),
            );
          });
      return;
    }
    if (photo != null) {
      showDialog(
          context: context,
          builder: (builder) => AlertDialog(
                elevation: 24,
                backgroundColor: Colors.white,
                content: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      SpinKitDualRing(
                        size: 30,
                        lineWidth: 3.0,
                        color: Color.fromARGB(255, 255, 175, 75),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Uploading Image...')
                    ],
                  ),
                ),
              ));
      await Future.delayed(Duration(milliseconds: 1000));
      await uploadImage(photo as XFile, imageName).then((_) {
        Navigator.pop(context);
      });
      showDialog(
          context: context,
          builder: (builder) => AlertDialog(
                elevation: 24,
                backgroundColor: Colors.white,
                content: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      SpinKitDualRing(
                        size: 30,
                        lineWidth: 3.0,
                        color: Color.fromARGB(255, 255, 175, 75),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Uploading item...')
                    ],
                  ),
                ),
              ));
      await Future.delayed(Duration(milliseconds: 1000));
      try {
        var response = await dio.post('$baseUrl/uploadProduct', data: {
          'product_name': productNameInput.trim(),
          'product_desc': descriptionInput.trim(),
          'product_photo_url': '$ImagebaseUrl/$imageName',
          'product_price': priceInput.trim(),
          'farm_name': appuser.farmName.trim(),
          'owner_email': appuser.email.trim(),
        });
        if (response.statusCode == 200) {
          if (response.data != 0) {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Success!'),
                    content: Text(
                        'Your product have been uploaded successfully, note that this product will be reviewed within the next 48hrs. '),
                  );
                });
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text(
                        'Sorry, an error occured Uploading this item, please try again Latter.'),
                  );
                });
            deleteImage();
          }
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(
                      'Sorry, an error occured Uploading this item, please try again Latter.'),
                );
              });
          deleteImage();
        }
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                    'Sorry, an error occured Uploading this item, please try again Latter.'),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please select your product Image'),
            );
          });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User_ appuser = widget.appuser;
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      appBar: AppBar(
        foregroundColor: Color.fromARGB(255, 255, 175, 54),
        backgroundColor: Colors.white,
        title: Text(
          'Upload product',
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: TextEditingController(text: productNameInput),
                onChanged: (value) {
                  productNameInput = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 175, 54)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 175, 54),
                      ),
                    ),
                    hintText: 'Name of product',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    label: Text('Product name')),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: TextEditingController(text: descriptionInput),
                onChanged: (value) {
                  descriptionInput = value;
                },
                maxLines: 5,
                decoration: InputDecoration(
                    helperText:
                        'This should the weight of item, number of item in stock, and any other vital information.',
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 175, 54)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 175, 54),
                      ),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    label: Text('Product Description')),
              ),
              SizedBox(
                height: 10,
              ),
              DottedBorder(
                  strokeWidth: 1.5,
                  color: Colors.grey,
                  radius: Radius.circular(5.0),
                  child: SizedBox(
                    height: 150,
                    child: Center(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              pickImage(context);
                            },
                            icon: Icon(
                              Icons.add_a_photo_rounded,
                              color: Colors.grey[600],
                            ),
                            focusColor: Color.fromARGB(255, 255, 175, 54),
                          ),
                          SizedBox(width: 20),
                          Text('Upload farm-product Photo')
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: TextEditingController(text: priceInput),
                onChanged: (value) {
                  priceInput = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 175, 54)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 175, 54),
                      ),
                    ),
                    hintText: 'Product Price',
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    label: Text('Product Price')),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  uploadNewItem(appuser);
                },
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  size: 20,
                ),
                label: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(5),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 175, 54)),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
                    foregroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
              SizedBox(
                height: 30,
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
