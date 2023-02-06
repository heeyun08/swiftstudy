# JSON


💡 JavaScript Object Notation (JSON)

- Javascript 객체 문법으로 구조화된 데이터를 표현하기 위한 문자 기반의 표준 포맷
- 브라우저와 서버 간의 통신에 사용되는 표준 data format
- 웹 어플리케이션에서 데이터를 전송할 때 일반적으로 사용
- JSON은 문자열 형태로 존재
- 전송받은 데이터의 무결성을 사용자가 직접 검증해야 함

# Codable

💡 Swift4부터 추가된 프로토콜, JSON 데이터를 간편하고 쉽게 Encoding / Decoding 할 수 있게 해줌

- Decodable과 Encodable로 이루어져 있음

```swift
public typealias Codable = Decodable & Encodable
```

- Struct, Class, Enum 모두 Codable 채택가능

### Encoding

- 원하는 struct, class, enum 등의 인스턴스를 JSON 형태의 Data로 만들어 주는 것

### Decoding

- JSON 형태의 Data를 struct, class, enum 등의 인스턴스에 자동으로 파싱
- JSON Data의 Key 값과 동일한 이름의 구조체 변수의 value에 값을 파싱 → 파싱된 구조체 리턴
- ※ JSON Data의 Key 값은 Codable을 따르는 타입의 멤버 이름과 1대1 매칭 되어야만 문제 없이 사용 가능

### CodingKey

- Key 값에 대응하는 이름을 바꿀 때 사용
- CodingKey 프로토콜을 이용해서 Key의 이름이 바뀌었다는 걸 명시해야 함
    - CodingKey를 준수하는 타입에 enum으로 명시
        
        ```swift
        struct Location: Codable {
            var street: String
        }
            enum CodingKeys: String, CodingKey {
                case address = "street"
            }
        }
        ```
        

# 참고

> JSON
> 

[JSON으로 작업하기 - Web 개발 학습하기 | MDN](https://developer.mozilla.org/ko/docs/Learn/JavaScript/Objects/JSON)

[JSON](https://www.json.org/json-ko.html)

[코딩교육 티씨피스쿨](http://www.tcpschool.com/json/json_basic_structure)

> Codable
> 

[Swift) Codable - JSON을 쉽게 Encoding / Decoding 하자](https://babbab2.tistory.com/61)