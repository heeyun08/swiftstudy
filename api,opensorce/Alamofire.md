## 목차
- [Alamofire](#alamofire)
    + [기본 세팅](#기본-세팅)
    + [주요 기능](#주요-기능)
    + [1. Request](#1-request)
    + [1.1 GET](#11-get)
    + [1.2 POST](#12-post)
    + [2. Response](#2-response)
    + [2.1 Response Handler](#21-response-handler)
    + [3. Validation](#3-validation)
    + [4. Data Upload](#4-data-upload)
    + [4.1 데이터 전달](#41-데이터-전달)
    + [5. Data Download](#5-data-download)
- [참고](#참고)

---

# Alamofire

💡 iOS, macOS를 위한 swift 기반 HTTP 네트워킹 라이브러리

- URLSession을 기반으로 하여 어려운 네트워킹 작업을 감춰줌
    - 주요 로직에 집중할 수 있음
    - 데이터에 쉽게 접근 가능
    - 코드의 가독성 상승

- HTTP 네트워킹을 하는데 자주 사용하게 되는 코드나 함수를 더 쉽게 사용할 수 있도록 모아놓은 것

### 기본 세팅

- SPM을 이용하여 Alamofire 설치
- import Alamofire 추가한 뒤 사용
- Alamofire는 네임스페이스를 사용하므로 사용하는 모든 호출에 접두사를 붙어야 함

### 주요 기능

- AF.upload
    - 다중 부분, 스트림, 파일 또는 데이터 방법으로 파일을 업로드
- AF.dounload
    - 파일을 다운로드하거나 이미 진행 중은 다운로드를 재개
- AF.request
    - 파일 전송과 관련되지 않은 기타 HTTP 요청

이러한 Alamofire 메서드는 전역적이므로 이를 사용하기 위해 클래스를 인스턴스화할 필요 없음

기본 Alamofire 요소에는

- SessionManager
- DataRequest
- DataResponse

와 같은 클래스 및 구조체가 포함됨

### 1. Request

- 요청을 보내기 위해 사용하는 함수

```swift
//주요 메소드
AF.request(URL, method: .get)
AF.request(URL, method: .post)
AF.request(URL, method: .patch)
AF.request(URL, method: .delete)
AF.request(URL, method: .post)
AF.request(URL, method: .put)

//나머지
AF.request(URL, method: .query)
AF.request(URL, method: .connect)
AF.request(URL, method: .options)
AF.request(URL, method: .head)
AF.request(URL, method: .trace)
```

- method - get생략 가능

- GET: 서버로부터 데이터를 취득
- POST: 서버에 데이터를 추가, 작성 등
- PUT: 서버의 데이터를 갱신, 작성 등
- DELETE: 서버의 데이터를 삭제
- HEAD: 웹 서버에서 헤더 정보 이외에는 어떤 데이터도 보내지 않음 (메타 데이터의 취득)
- OPTIONS: 리소스가 지원하고 있는 메소드 종류 확인
- PATCH: 리소스의 일부분을 수정
- CONNECT: 프록시 동작의 터널 접속을 변경

### 1.1 GET

```swift
let url = "https://jsonplaceholder.typicode.com/todos/1"
AF.request(url,
           method: .get, //통신방식
           parameters: nil,
           encoding: URLEncoding.default,
           headers: ["Content-Type":"application/json", "Accept":"application/json"]) //송/수신 데이터 타입을 나타냄
    .validate(statusCode: 200..<300)
    .responseJSON { (json) in
        print(json)
		  }
```

- url : 요청할 url
- method: 어떤 request method를 사용할 것인지 나타냄
- parameters: request body를 사용할 때 전달할 값을 담음
- encoding: 인코딩 방식을 정함
- headers: 부가적인 정보를 나타냄
- validate: 유효성 검사
- responseJSON: 응답 json 데이터

### 1.2 POST

- 서버로 값 전송

```swift
let url = "https://"
let params = ["id":"아이디", "pw":"패스워드"] as Dictionary

AF.request(url,
		   method: .post,
           parameters: params,
           encoding: JSONEncoding(options: []),
           headers: ["Content-Type":"application/json", "Accept":"application/json"])
	.responseJSON { response in

	/** 서버로부터 받은 데이터 활용 */
    switch response.result {
    case .success(let data):
			print("post 성공")
		case .failure(let error):
			print("post 실패")
	}
}
```

### 2. Response

- 응답을 확인하려면 request 뒤에 response 붙이기

```swift
AF.request(URL).reponse()
```

### 2.1 Response Handler

- **Response**
    - URLSessionDelegate에서 직접 모든 정보를 전달하고 응답 데이터를 평가하지 않음 → 2가지 방식으로 사용됨
- **responseData**
    - DataResponseSerializer를 사용해 서버에서 변환된 데이터를 추출하고 유효성 검사 진행
- **responseString**
    - StringResponseSerializer를 사용해 서버에서 반환된 데이터를 지정된 인코딩을 사용하는 문자열로 변환
- **responseJSON**
    - JSONResponseSerializer를 사용해 서버에서 변환된 데이터를 지정된 JSONSerialization.ReadingOptions를 사용하는 Any타입으로 변환
    - JSON 데이터를 받아올 때 사용
- **responseDecodable**
    - DecodableResponseSerializer를 사용해 서버에서 반환된 데이터를 지정된 DataDecoder를 사용하는 Decodable타입으로 변환
- **responseStream**
    - 넘어온 데이터를 DataStreamSerializer를 이용해 스트림으로 변경해 전달

### 3. Validation

💡 .validate()를 호출함으로써 요청에 대한 유효성 검사 실시

```swift
AF.request(URL)
	.validate() //기본
	.validate(statusCode: 200..<500) //200~500사이 상태만 허용
	.validate(contentType: ["application/json"] //JSON 포맷만 허용
```

### 4. Data Upload

```swift
let url = "https://"

AF.upload(multipartFormData: { multipartData in
			/** 서버로 전송할 데이터 */
		 }, to: url,
    	 method: .post,
    	 headers: ["Content-Type" : "multipart/form-data"])
    .response { response in
    
    if response.error != nil {
			print("upload fail")
	} else{
			print("upload success")
	}
}
```

- 파일을 업로드 하거나 다운로드할 때는 Content-Type을 multipart/form-data 로 작성해야 함
    - ❗️모든 문자를 인코딩하지 않음을 명시

### 4.1 데이터 전달

request body 추가

```swift
for (key, value) in parameters {
	multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
}
```

이미지 추가

```swift
if let image = imageData?.pngData() {
	multipartFormData.append(image, withName: "activityImage", fileName: "\(image).png", mimeType: "image/png")
}
```

- value: 전달할 파일
- withName: key
- fileName: 서버에 업로드할 파일 이름
- mimeType: 파일 형식

### 5. Data Download

```swift

// 테스트사이트에서 복사한 다운로드 주소
let url = "http://212.183.159.230/50MB.zip"

// 파일매니저
let fileManager = FileManager.default
// 앱 경로
let appURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
// 파일이름 url 의 맨 뒤 컴포넌트로 지정 (50MB.zip)
let fileName : String = URL(string: url)!.lastPathComponent
// 파일 경로 생성
let fileURL = appURL.appendingPathComponent(fileName)

// 파일 경로 지정 및 다운로드 옵션 설정 ( 이전 파일 삭제 , 디렉토리 생성 )
let destination: DownloadRequest.Destination = { _, _ in
    return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
}

// 다운로드 시작
AF.download(url, method: .get, parameters: nil, encoding: JSONEncoding.default, to: destination).downloadProgress { (progress) in
    // 이 부분에서 프로그레스 수정
}.response{ response in
        if response.error != nil {
            print("파일다운로드 실패")
        }else{
            print("파일다운로드 완료")
        }
}
```

# 참고

> alamofire
> 

[아이폰 스위프트UI 뽀개기 씨리즈](https://www.youtube.com/playlist?list=PLgOlaPUIbynqyJHiTEv7CFaXd8g5jtogT)

[Kodeco, the new raywenderlich.com](https://www.kodeco.com/library?q=alamofire)

[[Swift] Alamofire 알아보기](https://velog.io/@dlwns33/Swift-Alamofire-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0)

[[Swift] Alamofire 사용해보기_(2)](https://velog.io/@chagmn/Swift-Alamofire-%EC%82%AC%EC%9A%A9%ED%95%B4%EB%B3%B4%EA%B8%B02)

[[iOS] Alamofire 사용하기](https://velog.io/@gnwjd309/iOS-Alamofire)

[iOS Swift 라이브러리 Alamofire 사용하기](https://gonslab.tistory.com/14)

> http method
>
[HTTP 응답 코드 종류 && HTTP 메소드 종류](https://gyrfalcon.tistory.com/entry/HTTP-%EC%9D%91%EB%8B%B5-%EC%BD%94%EB%93%9C-%EC%A2%85%EB%A5%98-HTTP-%EB%A9%94%EC%86%8C%EB%93%9C-%EC%A2%85%EB%A5%98)

[Http Method 란? (GET, POST, PUT, DELETE)](https://velog.io/@yh20studio/CS-Http-Method-%EB%9E%80-GET-POST-PUT-DELETE)

23.02.07 업로드