import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/repository/chat_gpt_reopository_impl.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'; // go_router 임포트 추가

class MainScreen extends StatefulWidget {
  State<StatefulWidget> createState() =>
      _MainScreenState();
}

class _MainScreenState extends State<StatefulWidget> {
 late User? _user;

  @override
  void initState() {
    super.initState();
    _initKakaoUser();
  }

  Future<void> _initKakaoUser() async {
    _user = await UserApi.instance.me();
    setState(() {});
  }

  List<TextEditingController> _controllers = [TextEditingController()]; // 재료 텍스트 필드 컨트롤러

  void _addTextField() { // 재료 추가
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeTextField(int index) { // 재료 삭제
    if (_controllers.length > 1) {
      // 최소 1개 이상이 되도록 제한
      setState(() {
        _controllers.removeAt(index);
      });
    }
  }

  List<String> _getTextFieldValues() {
    return _controllers.map((controller) => controller.text).toList();
  }

  void _onButtonPressed(BuildContext context) {
    List<String> values = _getTextFieldValues();
    String concatenatedValues = values.join(", "); // 데이터를 문자열로 결합

    // 레시피 보기 버튼을 누를 때 '/main/recipe' 경로로 이동
    context.go('/main/recipe', extra: concatenatedValues);
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('냉장고 파먹기'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          _user != null
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_user!.kakaoAccount!.profile!.nickname!),
              ],
            ),
          )
              : const CircularProgressIndicator(),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                for (var i = 0; i < _controllers.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _controllers[i],
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _removeTextField(i);
                          },
                        ),
                        labelText: '재료 ${i + 1}',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // 버튼을 화면 맨 아래에 고정시킴
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => _onButtonPressed(context), // 함수 호출 시 context 전달
                child: Text('레시피 보기'), // TextButton 제거
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTextField,
        child: const Icon(Icons.add),
      ),
    );
  }
}
