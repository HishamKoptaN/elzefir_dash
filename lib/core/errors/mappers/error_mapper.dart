import '../models/error_info.dart';

abstract interface class ErrorMapper {
  bool canHandle(Object error, StackTrace? stackTrace);
  ErrorInfo map(Object error, StackTrace? stackTrace);
}
// Exception
// │
// ├── FormatException
// ├── TimeoutException
// ├── HttpException
// ├── SocketException
// ├── IOException
// ├── HandshakeException
// ├── FileSystemException
// ├── ProcessException
// ├── TlsException
// └── ...

// DioException
// FirebaseException
// FirebaseAuthException
// PlatformException

// Error
// │
// ├── AssertionError
// ├── StateError
// ├── ArgumentError
// ├── RangeError
// ├── UnsupportedError
// ├── UnimplementedError
// ├── ConcurrentModificationError
// ├── TypeError
// ├── CastError (في بعض الإصدارات)
// ├── NoSuchMethodError
// ├── LateInitializationError
// ├── StackOverflowError
// └── AbstractClassInstantiationError