# pakage dependency

### 💡 SPM(Swift Package Manager)

- 종속성 관리를 위한 Apple의 공식 도구
- Xcode11에 내재된 기능으로 추가됨
- 자체 빌드 시스템 포함
- 소프트웨어의 구성과 테스트, 실행까지 포함

### Swift Package Manager 사용법

- 프로젝트에 Pacakge 추가하기
    1. Xcode 열고 프로젝트 선택
    2. Package dependencies 탭 아래 `+` 선택
    3. 검색창에 Package URL 넣고 Add Package 선택
    4. 원하는 Target을 정하고 Add Package 선택
    5. Package Dependencies 목록에 Package 추가됨
    6. 확인 : 선택한 Targe에서 General > Frameworks, Libraries, and Embedded Content
- Package 생성하기
    1. Xcode 툴로 생성
        1. File > New > Package 선택
    2. 터미널 명령어로 생성하기
        1. 터미널에서 특정 디렉터리에 아래 명령어 입력하면, 해당 폴더 이름을 기준으로 기본적인 디렉터리 구조를 만들어줌
            
            ```bash
            swift package init
            ```
            

# 참고

[Apple Developer Documentation](https://developer.apple.com/documentation/packagedescription/package/dependency)

[Swift Package Manager 적용기](https://tech.kakao.com/2022/06/02/swift-package-manager/)