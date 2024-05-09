import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('개인정보 처리방침'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // 외부 여백 추가
          child: Column( // 여러 텍스트 위젯을 포함할 수 있는 컬럼 사용
            crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 정렬
            children: [
              Text(
                '개인정보 처리방침', // 대제목
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16), // 여백 추가
              Text(
                '본 어플리케이션은 사용자의 개인정보를 중요하게 생각하며, 개인정보 보호를 위해 최선을 다합니다. 이 개인정보 처리방침은 본 어플리케이션이 개인정보를 어떻게 수집, 사용, 저장, 공유하는지에 관한 정보를 제공합니다.',
                style: TextStyle(fontSize: 16), // 기본 텍스트 스타일
              ),
              SizedBox(height: 16), // 추가 여백
              Text(
                '1. 개인정보의 처리 목적',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '본 어플리케이션은 사용자 인증 및 서비스 제공을 위해 일부 개인정보를 수집합니다. 이메일 주소와 닉네임은 로그인 및 사용자의 식별을 위해 사용됩니다.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '2. 개인정보의 처리 및 보유 기간',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '수집된 개인정보는 본 어플리케이션의 서비스 제공을 위해 필요할 때까지 보유됩니다. 사용자가 계정을 삭제하거나 개인정보의 삭제를 요청하면, 해당 정보는 즉시 또는 일정 기간 내에 파기됩니다.',
                style: TextStyle(fontSize: 16),
              ),
              // 필요한 내용을 계속 추가
              SizedBox(height: 16),
              Text(
                '3. 처리하는 개인정보의 항목',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '본 어플리케이션은 다음과 같은 개인정보를 수집합니다:\n- 이메일 주소\n- 닉네임 (이름)\n이 정보는 사용자의 로그인, 서비스 개인화, 레시피 저장 및 추천 기능을 위해 사용됩니다.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '4. 개인정보의 제3자 제공에 관한 사항',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '본 어플리케이션은 사용자 정보를 제3자에게 제공하지 않습니다. 그러나 Firebase, Google, Kakao와 같은 외부 서비스와 연동할 때, 이러한 서비스는 자체적인 개인정보 처리 방침을 따릅니다.',
                style: TextStyle(fontSize: 16),
              ),
              // 계속해서 추가 필요한 내용들
              SizedBox(height: 16),
              Text(
                '5. 개인정보처리 위탁에 관한 사항',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '본 어플리케이션은 개인정보를 외부 업체나 기관에 위탁하지 않습니다.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '6. 정보주체의 권리, 의무 및 행사 방법',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '사용자는 본인의 개인정보에 대해 열람, 정정, 삭제, 처리정지 등의 권리를 행사할 수 있습니다. 이러한 권리를 행사하려면 앱의 고객 지원 또는 아래 연락처로 연락해 주십시오.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '7. 개인정보의 파기절차 및 방법',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '사용자가 계정을 삭제하거나 개인정보의 삭제를 요청하면, 해당 정보는 즉시 또는 일정 기간 내에 안전하게 파기됩니다. 파기 절차는 전자적 방법 또는 물리적 파기로 이루어지며, 파기된 정보는 복구할 수 없습니다.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '8. 개인정보의 안전성 확보 조치에 관한 사항',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '본 어플리케이션은 개인정보의 안전성을 확보하기 위해 다음과 같은 조치를 취합니다:\n- 안전한 데이터 저장 및 전송 프로토콜 사용\n- 개인정보 접근 권한을 최소화하고, 인증된 사용자만 접근 가능하도록 제한\n- 정기적인 보안 점검 및 취약점 테스트.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '9. 개인정보 보호책임자에 관한 사항',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '본 어플리케이션은 개인정보 보호를 책임질 담당자를 지정하고 있습니다. 개인정보 보호와 관련하여 궁금한 점이나 문제가 있는 경우 아래 연락처로 문의해 주십시오:\n\n성명: 최지원\n이메일: jiwon30931@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '10. 개인정보의 열람청구를 접수·처리하는 부서',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '사용자는 개인정보에 대한 열람, 정정, 삭제 요청을 할 수 있습니다. 이러한 요청은 아래 연락처로 문의해 주십시오:\n\n이메일: jiwon30931@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '11. 정보주체의 권익침해에 대한 구제방법',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '개인정보 관련 문제 또는 침해에 대한 구제를 받기 위해 다음의 기관에 연락할 수 있습니다:\n\n- 개인정보분쟁조정위원회: (국번없이) 1833-6972 (www.kopico.go.kr)\n- 개인정보침해신고센터: (국번없이) 118 (privacy.kisa.or.kr)\n- 대검찰청: (국번없이) 1301 (www.spo.go.kr)\n- 경찰청: (국번없이) 182 (ecrm.cyber.go.kr)',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '12. 개인정보 처리방침의 변경에 관한 사항',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '법령 및 정책 변경 등에 따라 개인정보 처리방침이 변경될 경우, 변경 사항은 사용자에게 공지됩니다. 이 개인정보 처리방침은 2024년 5월 9일부터 적용됩니다.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}