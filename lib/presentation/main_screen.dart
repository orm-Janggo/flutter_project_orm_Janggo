import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/repository/chat_gpt_reopository_impl.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainScreen extends StatefulWidget {
  State<StatefulWidget> createState() =>
      _MainScreenState(impl: ChatGptRepositoryImpl());
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

  List<TextEditingController> _controllers = [TextEditingController()];
  final ChatGptRepositoryImpl _impl;

  _MainScreenState({
    required ChatGptRepositoryImpl impl,
  }) : _impl = impl;

  void _addTextField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeTextField(int index) {
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

  void _onButtonPressed() {
    List<String> values = _getTextFieldValues();
    String concatenatedValues = values.join(", "); // 데이터를 문자열로 결합
    _impl.getRecipes(concatenatedValues); // 문자열로 레포지토리에 전달
    print(concatenatedValues);
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
        leading: _user != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(
                  //   radius: 15,
                  //   backgroundImage: NetworkImage(_user!.kakaoAccount!.profile!.profileImageUrl!),
                  // ),
                  Text(_user!.kakaoAccount!.profile!.nickname!),
                ],
              )
            : const CircularProgressIndicator(),
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
                onPressed: _onButtonPressed,
                child: const Text("레시피 보기"),
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
