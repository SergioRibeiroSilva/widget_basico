
import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu AppBar"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Esse é o snacker')));
            },
          ),
          IconButton(
            icon: Icon(Icons.next_plan),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {

                    return Scaffold(
                      appBar: AppBar(title: const Text('Next page')),
                      body: const Center(
                        child: Text(
                          'Essa é a página para a qual fui enviado no click',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                    
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text('Essa é minha página principal', style: TextStyle(fontSize: 24))),
    );
  }
}
