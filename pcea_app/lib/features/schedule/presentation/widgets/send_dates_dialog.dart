import 'package:flutter/material.dart';
import 'package:pcea_app/core/utils/AppColors.dart';
import 'package:pcea_app/features/schedule/presentation/stores/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

void showSendDatesDialog(BuildContext context) {
  final userStore = Modular.get<UserStore>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.pink,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning, color: Colors.white, size: 50),
              SizedBox(height: 20),
              Text(
                "Confirmação",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Tem certeza de que deseja enviar?",
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellowLight,
                    ),
                    child: Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Fecha o diálogo
                      userStore.updateAvailableDatesSchedule(); // Atualiza as datas
                      Navigator.of(context).pop(); // Volta para a tela anterior
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                    ),
                    child: Text("Enviar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
