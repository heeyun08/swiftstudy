# CocoaPods
- 오픈 소스 관리 도구
- Swift 및 Objective-C 코코아 프로젝트의 종속성 관리자

### 코코아팟 설치하기

```bash
$ sudo gem install cocoapods
```

### 코코아팟을 이용해서 특정 오픈 소스 라이브러리 설치하기

1. 터미널을 통해 프로젝트 경로로 들어가기
    
    ```bash
    cd 프로젝트 경로
    ```
    
2. 프로젝트에 코코아팟 설치
    
    ```bash
    $ pod init
    ```
    
    설치 후, 폴더에 Podfile 파일 생성 → Podfile을 통해 라이브러리 설치 및 관리
    
3. Podfile을 수정하여 라이브러리 설치 (nano, vi 사용)
use_frameworks! 아래에 설치할 라이브러리 추가
    
    ```bash
    $ pod '라이브러리'
    ```
    
4. 터미널에서 추가한 라이브러리 설치
    
    ```bash
    $ pod install
    ```
    

실행 파일이 test.xcodeproj 에서 test.xcworkspace로 변경

### 코코아팟 장/단점

- 장점
    - 대부분의 라이브러리 지원
    - 라이브러리의 의존성의 의존성까지 자동으로 관리 해줌
- 단점
    - 라이브러리를 다운받아 설치 → 시간 오래 걸림
    - 프로젝트를 빌드할 때마다 모든 라이브러리들이 함께 빌드 →  빌드 속도 느림

# 참고

[CocoaPods(코코아팟) 사용법(쉬움주의, 따라만해), Charts라이브러리 설치](https://katarnios.tistory.com/23)

[iOS) 라이브러리와 의존성 관리 도구](https://co-dong.tistory.com/63)

23.02.01 업로드