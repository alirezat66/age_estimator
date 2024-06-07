import 'package:age_estimator/core/network/cache/internal_cache_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InternalCacheDataSource', () {
    InternalCacheImpl dataSource = InternalCacheImpl();

    test('add and get value from cache', () {
      dataSource.add('key1', 'value1');
      expect(dataSource.restore('key1'), 'value1');
    });

    test('check key validation true', () async {
      dataSource.add(
        'key2',
        'value2',
        const Duration(minutes: 1),
      ); // 1 minute validation time
      expect(dataSource.checkKeyValidation('key2'), true);

      // Wait for more than 1 minute
    });
    test('check key validation', () async {
      dataSource.add('key2', 'value2', const Duration(seconds: 10));
      await Future.delayed(const Duration(seconds: 15));
      expect(dataSource.checkKeyValidation('key2'), false);
      // Wait for more than 1 minute
    });

    test('delete value from cache', () {
      dataSource.add('key3', 'value3');
      expect(dataSource.restore('key3'), 'value3');

      dataSource.delete('key3');
      expect(dataSource.restore('key3'), null);
    });
  });
}
