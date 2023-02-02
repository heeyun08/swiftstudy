# API

## 목차
  * [헤더](#--)
    + [1. 헤더란?](#1-----)
    + [2. 통신 방법에 대한 헤더 관리(json, url-encoding 등)](#2-----------------json--url-encoding---)
    + [3. 기본 헤더값에 무엇무엇이 있는지](#3------------------)
    + [3.1 공통헤더](#31-----)
    + [3.2 요청헤더](#32-----)
    + [3.3 응답헤더](#33-----)
  * [파라미터, 바디](#--------)
    + [url-encoding](#url-encoding)
    + [multipart/form-data](#multipart-form-data)
    + [body(data)](#body-data-)
    + [json](#json)
- [참고](#--)

***

## 헤더

### 1. 헤더란?

- key:value 형태로 되어있으며, 추가 정보를 담고 있는 부분

### 2. 통신 방법에 대한 헤더 관리(json, url-encoding 등)

**url-encoding**

- HTML form에 있는 데이터들이 전송될 때, form 필드의 이름과 값은 인코딩 되어 서버에 보내짐
- 인코딩된 데이터의 MIME type은 ‘application/x-www-fom-urlencoded’
- 폼 전송을 HTTP GET으로 할 때, ‘application/x-www-fom-urlencoded’ 데이터는 URI의 쿼리스트링(파라미터)으로 포함됨

**multipart/form-data**

- 이 속성은 `<form>` 요소의 method 속성값이 post일 때만 사용 가능
- Content-Type을 “multipart/form-data”로 설정

**json**

- Content-Type을 “application/json”로 설정

### 3. 기본 헤더값에 무엇무엇이 있는지

### 3.1 공통헤더

**Date**

- HTTP 메시지가 만들어진 시각
- 자동으로 만들어짐

**Connection**

- 클라이언트와 서버 사이의 커넥션을 연속적으로 유지할 것인지, 응답이 도착하면 연결을 닫는 형태로 단기로만 커넥션을 유지할 것인지 지시하는 부분
- 일반적으로 HTTP/1.1을 사용
- 기본적으로 keep-alive 되어있음

**Content-Length**

- Body의 길이를 나타냄
- 요청과 응답 메시지의 본문 크기를 바이트 단위로 표시
- 메시지 크기에 따라 자동으로 만들어짐

**Cache-Control**

**Content-Type**

- Body의 타입
- 컨텐츠의 타입(MIME)과 문자열 인코딩(utf-8 등등)을 명시할 수 있음
- json 형태로 주고받는다면 application/json 값을 가짐

**Content-Language**

- 사용자의 언어

**Content-Encoding**

- 응답 컨텐츠를 br, gzip, deflate 등의 알고리즘으로 압축해서 보내면, 브라우저가 알아서 해제해서 사용
- 다양한 압축 알고리즘 존재
- 요청이나 응답 전송 속도 빨라짐, 데이터 소모량 줄어듦

### 3.2 요청헤더

**Host**

- 서버의 도메인 네임
- 요청이 전송되는 타켓의 host url
- Host 헤더는 반드시 하나가 존재해야 함

**User-Agent**

- 가장 흔하게 보고 사용하는 헤더
- 클라이언트에 대한 정보
    - 현재 사용자가 어떤 클라이언트를 통해 요청을 보냈는지 알 수 있음

**Accept**

- 클라이언트가 허용할 수 있는 파일 형식(MIME TYPE)
- Accept로 우너하는 형식을 보내고, 서버가 응답하면서 헤더의 Content를 설정하게 됨

**Cookie**

- 웹 서버가 클라이언트에 쿠키를 저장해 놓았다면 해당 쿠키의 정보를 이름-값 쌍으로 웹서버에 전송함

**Origin**

- Post같은 요청을 보낼 때, 요청이 어느 주소에서 시작되었는지를 나타냄
- 이때, 보낸 주소와 받는 주소가 다르면 CORS 문제가 발생하기도 함

**If-Modified-Since**

- 페이지가 수정되었으면 최신 버전 페이지를 요청하기 위한 필드
- 만일 요청한 파일이 이 필드에 지정된 시간 이후로 변경되지 않았다면, 서버로부터 데이터를 전송받지 않음

A**uthorization**

- 인증 토큰을 서버로 보낼 때 사용하는 헤더
- API 요청을 할 때 토큰이 없으면 거절당하기 때문에 사용
- JWT(Json Web Token)을 사용한 인증에서 주로 사용

### 3.3 응답헤더

**Server**

- 웹서버 정보를 나타냄

**Access-Control-Allow-Origin**

- 요청 Host와 응답 Host가 다르면 CORS 에러가 발생 → 서버에서 응답 메시지 Access-Control-Allow-Origin헤더에 프론트 주소를 적으면 에러가 발생하지 않음

관련 헤더

- Access-Control-Request-Method : 실제로 보내려는 메서드
- Access-Control-Request-Headers : 실제로 보내려는 헤더
- Access-Control-Allow-Methods : 서버가 허용하는 메서드
- Access-Control-Allow-Headers : 서버가 허용하는 헤더

**Allow**

- CORS 요청 외에도 적용됨
- ex) Allow: GET → GET요청만 받음

**Content-Disposition**

- 응답 본문을 브라우저가 어떻게 표시해야 할지 알려주는 헤더
    - inline: 웹페이지 화면에 표시
    - attachment: 다운로드

**Location**

- 300번대 응답이나 201 Created 응답일 때 어느 페이지로 이동할지를 알려주는 헤더

**Content-Security-Policy**

- 다른 외부 파일들을 불러오는 경우, 차단할 소스와 불러올 소스를 여기에 명시할 수 있음
    - 이미지, JS, CSS, 폰트, 아이프레임 등

---

## 파라미터, 바디

### url-encoding

- URL로 사용할 수 없는 문자(특수문자, 예약문자, 훈민정음)들을 사용할 수 있도록 인코딩 해주는 것
- 인코딩된 문자는 triplet(세개가 한묶음)들로 인코딩되며 인코딩된 문자는 ‘%(Percent)’로 시작하고 그 뒤의 두 숫자는 16진수 숫자들로 표현됨
- 권 → EAB68C → “%EA%B6%8C”
    - 문자를 8bit단위로 끊어 16진수로 표현하고 앞에 ‘%’를 붙임
- ㅇ
    - HTTP GET 요청에서 쿼리스트링(파라미터)에 한글 또는 ASCII에 정의되지 않은 문자가 포함될 때
    - 쿼리스트링에 들어간 value가 예약어로서 동작하지 않게 하기 위해서

### multipart/form-data

- form: 입력 양식 전체를 감싸는 태그
    - name: form의 이름, 서버로 보내질 때 이름의 값으로 데이터 전송
    - action: form이 전송되는 서버 url 또는 html 링크
    - method: 전송 방법 설정 (get은 default)
    - autocomplete: 자동완성
    - **enctype**: 폼 데이터가 서버로 제출될 때, 해당 데이터가 인코딩되는 방법을 명시
- multipart/form-data는 entype의 속성값 중 하나
- 이 속성은 `<form>` 요소의 method 속성값이 post일 때만 사용 가능
- ❗️모든 문자를 인코딩하지 않음을 명시
- 이 방식은 `<form>` 요소가 파일이나 이미지를 서버로 전송할 때 주로 사용

```html
<form action="./uploadImg" method="post" enctype="multipart/form-data">
    <!-- code -->
</form>
```

※ **entype 속성값**

- application/x-www-form-urlencoded
    - default 값, 모든 문자들을 서버로 보내기 전에 인코딩됨을 명시
- text/plain
    - 공백 문자는 “+” 기호로 변환하지만, 나머지 문자는 모두 인코딩되지 않음을 명시
- ❗️**multipart/form-data**
    - 모든 문자를 인코딩하지 않음을 명시
    - 이 방식은 `<form>` 요소가 파일이나 이미지를 서버로 전송할 때 주로 사용

### body(data)

- 해당 request 혹은 response의 실제 메시지 혹은 내용이 담겨 있음

### json

- 브라우저와 서버 간의 통신에 사용되는 표준 data format
- json 구조 예시

```json
{
  "squadName": "Super hero squad",
  "homeTown": "Metro City",
  "formed": 2016,
  "secretBase": "Super tower",
  "active": true,
  "members": [
    {
      "name": "Molecule Man",
      "age": 29,
      "secretIdentity": "Dan Jukes",
      "powers": [
        "Radiation resistance",
        "Turning tiny",
        "Radiation blast"
      ]
    },
    {
      "name": "Madame Uppercut",
      "age": 39,
      "secretIdentity": "Jane Wilson",
      "powers": [
        "Million tonne punch",
        "Damage resistance",
        "Superhuman reflexes"
      ]
    },
    {
      "name": "Eternal Flame",
      "age": 1000000,
      "secretIdentity": "Unknown",
      "powers": [
        "Immortality",
        "Heat Immunity",
        "Inferno",
        "Teleportation",
        "Interdimensional travel"
      ]
    }
  ]
}
```

# 참고

## 헤더

[API 기본 개념 : 패킷, 헤더, 바디, CRUD, URI, path variable, 명세서](https://velog.io/@keepcalm/API-%EA%B8%B0%EB%B3%B8-%EA%B0%9C%EB%85%90-%ED%8C%A8%ED%82%B7-%ED%97%A4%EB%8D%94-%EB%B0%94%EB%94%94-CRUD-URI-path-variable-%EB%AA%85%EC%84%B8%EC%84%9C)

[[HTTP 기초_1] 헤더 (요청(Request) 헤더, 응답(Response)헤더)](https://goddaehee.tistory.com/169)

## 파라미터, 바디

[[Percent Encoding] 왜 때문에 URL Encoding?](https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=j880825&logNo=221231640609)

[HTTP multipart/form-data 란?](https://velog.io/@shin6403/HTTP-multipartform-data-%EB%9E%80)