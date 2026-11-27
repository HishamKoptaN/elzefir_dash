import 'package:alzefr_dash/config/firebase/firebase_options_prod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('خيارات Firebase للإنتاج تشير إلى المشروع الحالي لا المحذوف', () {
    expect(ProdFirebaseOptions.web.projectId, 'elzefir');
    expect(ProdFirebaseOptions.web.authDomain, 'elzefir.firebaseapp.com');
    expect(ProdFirebaseOptions.android.projectId, 'elzefir');
    expect(ProdFirebaseOptions.web.apiKey, isNotEmpty);
  });
}
