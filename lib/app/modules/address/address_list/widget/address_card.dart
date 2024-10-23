import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({required this.address, super.key});

  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(address.toString()),
      ),
    );
  }
}
