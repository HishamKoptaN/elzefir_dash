import 'envs/dev_env.dart';
import 'env.dart';
import 'envs/local_env.dart';
import 'envs/prod_env.dart';

class EnvConfig {
  static final Env _config = _getConfig();

  static Env _getConfig() {
    const env = String.fromEnvironment('ENV', defaultValue: 'dev');
    switch (env) {
      case 'local':
        return LocalEnv();
      case 'prod':
        return ProdEnv();
      case 'dev':
        return DevEnv();
      default:
        return LocalEnv();
    }
  }

  static Env get config => _config;
}
