import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/bottom_sheets/static_bottom_seet.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'dragabble_bottom_sheet.dart';
import 'types.dart';

class Bottomsheets {
  Bottomsheets._();

  static void draggableBottomSheet(BottomSheetTypes type) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5, // Ocupa la mitad de la pantalla al inicio
        minChildSize: 0.3, // Tamaño mínimo cuando está contraído
        maxChildSize: 0.9, // Tamaño máximo al arrastrar hacia arriba
        expand:
            false, // Esto evita que se expanda automáticamente al tamaño máximo
        builder: (context, scrollController) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Container(
              color: Colors.white, // Fondo del modal
              child: Column(
                children: [
                  // Header o contenido superior del BottomSheet
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Header',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(height: 1),
                  // Lista de elementos o contenido principal
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Elemento $index'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    // showCupertinoModalBottomSheet(
    //   context: Get.context!,
    //   isDismissible: true,
    //   enableDrag: true,
    //   shadow: BoxShadow(color: Colors.transparent),
    //   barrierColor: Colors.black.withOpacity(0.5),
    //   backgroundColor: Colors.transparent,
    //   builder: (context) => DraggableScrollableSheet(
    //     initialChildSize: 0.5, // Toma la mitad de la pantalla inicialmente
    //     minChildSize: 0.5, // Tamaño mínimo (mitad de pantalla)
    //     maxChildSize: 0.9, // Tamaño máximo (casi toda la pantalla)
    //     builder: (context, scrollController) {
    //       return ClipRRect(
    //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //         child: DraggableBottomSheet(
    //             type: type, scrollController: scrollController),
    //       );
    //     },
    //   ),
    // );
    // showModalBottomSheet(
    //   context: Get.context!,
    //   isScrollControlled: true,
    //   // shadow: BoxShadow(color: Colors.transparent),
    //   isDismissible: true,

    //   backgroundColor: Colors.transparent,
    //   builder: (context) => DraggableScrollableSheet(
    //     initialChildSize: 0.5, // Toma la mitad de la pantalla inicialmente
    //     minChildSize: 0.5, // Tamaño mínimo (mitad de pantalla)
    //     maxChildSize: 0.9, // Tamaño máximo (casi toda la pantalla)
    //     builder: (context, scrollController) {
    //       return ClipRRect(
    //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //         child: DraggableBottomSheet(
    //             type: type, scrollController: scrollController),
    //       );
    //     },
    //   ),
    // );
  }

  static void staticBottomSheet(BottomSheetTypes type) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StaticBottomSeet(type: type),
      ),
    );
  }
}
