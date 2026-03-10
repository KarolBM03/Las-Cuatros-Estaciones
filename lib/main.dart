import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(LasCuatroEstacionesApp());
}

class LasCuatroEstacionesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Las Cuatro Estaciones',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Las Cuatro Estaciones')),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            // ✅ Portada completa (sin recortes)
            Image.asset(
              'assets/Portada.png',
              fit: BoxFit.contain, // muestra la imagen entera
              width: double.infinity,
            ),

            SizedBox(height: 10),

            // Menú principal
            MenuButton(title: 'Personajes', widget: PersonajesPage()),
            MenuButton(title: 'Momentos', widget: MomentosPage()),
            MenuButton(title: 'Acerca de', widget: AcercaDePage()),
            MenuButton(title: 'Contrátame', widget: ContratamePage()),
          ],
        ),
      ),
    );
  }
}

// 🔘 Botón de menú reutilizable con estilo
class MenuButton extends StatelessWidget {
  final String title;
  final Widget widget;

  MenuButton({required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple[100],
          foregroundColor: Colors.purple[800],
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// 🌟 Página de personajes
class PersonajesPage extends StatelessWidget {
  final List<Map<String, String>> personajes = [
    {
      'nombre': 'Jenna Ortega como Remi',
      'descripcion':
          'Remi es una joven prodigio, inteligente y disciplinada, con un futuro cuidadosamente planeado. '
          'A pesar de su vida estructurada, se enfrenta a la necesidad de descubrir quién es realmente, '
          'poniendo a prueba sus propias expectativas y las de su familia. Su encuentro con Barnes la lleva '
          'a cuestionar su camino y aprender sobre la importancia de vivir el momento y seguir su corazón.',
      'imagen': 'assets/remi.jpg',
    },
    {
      'nombre': 'Percy Hynes White como Barnes',
      'descripcion':
          'Barnes es un joven despreocupado y libre, que vive el presente y disfruta cada momento sin pensar demasiado en el futuro. '
          'Su personalidad extrovertida y su forma de ver la vida hacen que Remi reflexione sobre sus propios límites. '
          'Barnes aporta frescura, espontaneidad y un enfoque distinto sobre las relaciones y la vida, convirtiéndose en un catalizador del crecimiento personal de Remi.',
      'imagen': 'assets/barnes.jpg',
    },
    {
      'nombre': 'Marisol Nichols como Carmen',
      'descripcion':
          'Carmen es la madre de Remi y representa la figura de guía y contención familiar, aunque también encarna las expectativas y presiones del hogar. '
          'Desea lo mejor para su hija, esperando que siga un camino de éxito académico y seguridad, pero su rigidez a veces genera conflictos. '
          'A lo largo de la historia, Carmen muestra la complejidad de la maternidad y el equilibrio entre proteger y dejar que los hijos crezcan por sí mismos.',
      'imagen': 'assets/carmen.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personajes')),
      body: ListView.builder(
        itemCount: personajes.length,
        itemBuilder: (context, index) {
          final p = personajes[index];
          return Card(
            margin: EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      p['imagen']!,
                      height: 180, // tamaño uniforme
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    p['nombre']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(p['descripcion']!, textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetallePersonajePage(personaje: p),
                        ),
                      );
                    },
                    child: Text('Ver Detalle'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Detalle de personaje
class DetallePersonajePage extends StatelessWidget {
  final Map<String, String> personaje;
  DetallePersonajePage({required this.personaje});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(personaje['nombre']!)),
      body: Column(
        children: [
          Image.asset(personaje['imagen']!, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              personaje['descripcion']!,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// 🎬 Página de Momentos
class MomentosPage extends StatelessWidget {
  final List<Map<String, String>> momentos = [
    {
      'titulo': 'Primer encuentro en invierno',
      'descripcion':
          'Remi y Barnes se conocen por primera vez en un contexto inesperado.\n\n'
          'A pesar de sus diferencias (Remi organizada y seria, Barnes relajado y espontáneo), surge una conexión genuina que marca el inicio de su amistad y posible romance.\n\n'
          'Este momento es especial porque muestra la magia de los encuentros inesperados y cómo una simple interacción puede cambiar la perspectiva de alguien.',
      'imagen': 'assets/momento1.jpeg',
      'video': 'assets/video1.mp4',
    },
    {
      'titulo': 'Paseo en primavera',
      'descripcion':
          'Durante la primavera, Remi y Barnes comparten un paseo por la ciudad o entorno natural.\n\n'
          'Aquí remiten a conversaciones profundas y risas sinceras, donde Remi empieza a abrirse y disfrutar del presente sin pensar demasiado en su futuro planeado.\n\n'
          'Es un momento lleno de ternura y complicidad, que hace que el espectador sienta la frescura y la emoción de los primeros sentimientos.',
      'imagen': 'assets/momento2.jpeg',
      'video': 'assets/video2.mp4',
    },
    {
      'titulo': 'Decisión y despedida en otoño',
      'descripcion':
          'En otoño, Remi toma una decisión importante sobre su futuro, posiblemente relacionada con estudiar en otro lugar o tomarse un año sabático.\n\n'
          'Barnes la acompaña y la apoya, mostrando que el amor y la amistad también significan dar libertad y confiar en la otra persona.\n\n'
          'Este momento es conmovedor porque combina emoción, madurez y reflexión, cerrando el ciclo de su historia de manera dulce y significativa.',
      'imagen': 'assets/momento3.jpeg',
      'video': 'assets/video3.mp4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Momentos Bonitos')),
      body: ListView.builder(
        itemCount: momentos.length,
        itemBuilder: (context, index) {
          final m = momentos[index];
          return Card(
            margin: EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      m['imagen']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    m['titulo']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    m['descripcion']!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VideoPage(videoPath: m['video']!),
                            ),
                          );
                        },
                        icon: Icon(Icons.play_arrow),
                        label: Text('Ver Video'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetalleMomentoPage(momento: m),
                            ),
                          );
                        },
                        icon: Icon(Icons.info_outline),
                        label: Text('Ver Detalle'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Página de detalle de momento
class DetalleMomentoPage extends StatelessWidget {
  final Map<String, String> momento;
  DetalleMomentoPage({required this.momento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(momento['titulo']!)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(momento['imagen']!, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              momento['descripcion']!,
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

// Página para reproducir video
class VideoPage extends StatefulWidget {
  final String videoPath;
  VideoPage({required this.videoPath});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {}); // Refresca cuando el video esté listo
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video')),
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

// ℹ️ Página Acerca de
class AcercaDePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acerca de')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Las Cuatro Estaciones',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Información básica
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Año: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '2025\n'),
                  TextSpan(
                    text: 'Plataforma: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'Netflix\n'),
                  TextSpan(
                    text: 'Temporadas: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '1\n'),
                  TextSpan(
                    text: 'Creadores: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'Tina Fey y Lang Fisher\n'),
                  TextSpan(
                    text: 'Género: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'Drama / Romance\n'),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            SizedBox(height: 20),

            // Descripción
            Text(
              '“Las Cuatro Estaciones” narra la historia de Remi y Barnes, dos jóvenes con mundos completamente distintos que se encuentran y viven un romance a lo largo de un año, dividido en invierno, primavera, verano y otoño. La película explora cómo las decisiones, los sueños y los desafíos personales afectan sus vidas, mientras enfrentan las expectativas familiares, los planes a futuro y la búsqueda de su verdadera identidad. Una historia llena de emociones, momentos tiernos y reflexiones sobre crecer, amar y seguir lo que realmente se desea en la vida.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                fontStyle: FontStyle.italic,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 20),

            // Frase final llamativa
            Text(
              '✨ ¡Una historia que te hará sentir cada estación del corazón! ✨',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// 💼 Página Contrátame
class ContratamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contrátame')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título de la página
              Text(
                '¡Hablemos y hagamos realidad tus ideas!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  letterSpacing: 1.0,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              // Imagen redonda
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/mifoto.jpeg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 20),

              // Nombre
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Nombre: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    TextSpan(text: 'Karol Scarlen Beras Martínez'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),

              // Teléfono
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Teléfono: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '829-459-0498'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),

              // Correo
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Correo: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'berasmartinezkarol03@gmail.com'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              // Frase final
              Text(
                '“Contáctame y hagamos realidad tus ideas.”',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
