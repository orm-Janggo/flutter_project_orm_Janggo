class GetFoodNameUseCase {
  Future<String> execute(String recipe) async {
    List<String> lines = recipe.split('\n');
    String foodName = '';
    // 레시피 이름 추출
    for (int i = 0; i < lines.length; i++) {
      // 현재 줄의 텍스트
      String line = lines[i].trim();

      // '음식 이름:' 패턴이 포함되어 있으면 해당 부분을 추출
      if (line.toLowerCase().contains('음식 이름:')) {
        int startIndex = line.toLowerCase().indexOf('음식 이름:') + '음식 이름:'.length;
        foodName = line.substring(startIndex).trim();
        break;
      }

      // 음식 이름이 아니면 다음 줄로 넘어감
      if (line.isEmpty || line.toLowerCase().contains('레시피')) {
        continue;
      }

      // 번호가 있으면 제거
      if (line.startsWith(RegExp(r'\d+\. '))) {
        line = line.substring(line.indexOf(' ') + 1);
      }

      // 텍스트가 너무 길면 음식 이름이 아니라고 판단하여 루프 종료
      if (line.length > 20) {
        break;
      }

      // 음식 이름 추출 완료
      foodName = line;
      break;
    }

    return foodName;
  }
}
