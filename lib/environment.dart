class Env {
  Env._private();

  static const serverClient = String.fromEnvironment(
    'SERVER_CLIENT',
    defaultValue: 'Dev',
  );

  static const backendURL = String.fromEnvironment(
    'FLUTTER_APP_BACKEND_URL',
    defaultValue: 'http://localhost:5002/api/v1',
  );

  static const realtimeURL = String.fromEnvironment(
    'FLUTTER_APP_REALTIME_URL',
    defaultValue: 'ws://localhost:5002/api/ws',
  );
  
  static const previewURL = String.fromEnvironment(
    'FLUTTER_APP_PREVIEW_URL',
    defaultValue: 'http://localhost:8009/#',
  );

  // static String get accessToken => 'eyJraWQiOiJpYW0yS2V5SUQiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJmaXJzdG5hbWUiOiJVc2VyIiwidXNlcl9pZCI6MzM0OSwiZ3JvdXBfaWQiOi0yLCJzeXN0ZW1faWQiOnsiNDEzMCI6eyJyb2xlcyI6WyJjdXNlciJdfX0sImV4cCI6MTcyNzQ5NjA3NSwiZW1haWwiOiJ5aWdleWUxOTY5QGdsYWxlbi5jb20iLCJsYXN0bmFtZSI6IjEifQ.UD7DpZtv_E2o102A3zfjxmKVi-6vzEDF25H68PkmAObCTL4aCPX0SbY3ts0Bql7gJrnscQFMFsotrC8G-Rf9RB6q9k4-iyquP9hYoQHpE8REAPxnoBdMFWneLWe9Q8dWRFNVzKGKIAajf1YZ0A0VnNFMQBW9KrEX--9OqPNTAKowHjyTtnvSws_kBEtaxKAWofYNOW_sFG3Jd8rcI0lQrHUGNM-KHQi4Ycfe2OtCHLULwbuPduttERTb-rrcCtqHCZLppV947gNlm_RiA4RBfx-LKr4I-GM4Lj_JWvS3mxBci5oJozzOogq139Np1cYjkCGnLGFlcOBQSEw4eLgNQw';
}