import 'package:flutter_project_orm_janggo/data/data_source/picture_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('pixabay test', () async {
    final dataSource = PictureDataSource();
    final picData = await dataSource.getPictureData('사과');
    print(picData);
  });
}
