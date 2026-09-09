// lib/constants/app_constants.dart
//
// CAMBIO CLAVE: el backend expone todo bajo el prefijo /api/v1
// (ver main.py: app.include_router(reco_router, prefix=API_V1)),
// así que ese prefijo debe ir en el baseUrl del Dio para que
// dio.get('/recommendations/$userId') resuelva bien.

class AppConstants {
  // Backend FastAPI (UniMarket). Ajusta el host según dónde corras
  // "uvicorn main:app --reload --port 8000":
  //   - Emulador Android            -> http://10.0.2.2:8000/api/v1
  //   - Simulador iOS / Flutter Web -> http://localhost:8000/api/v1
  //   - Dispositivo físico          -> http://<IP-de-tu-máquina>:8000/api/v1
  //   - Backend desplegado          -> https://tu-dominio.com/api/v1
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8000/api/v1',
  );

  // Timeout en milisegundos para las peticiones HTTP.
  static const int apiTimeout = 5000;
}
