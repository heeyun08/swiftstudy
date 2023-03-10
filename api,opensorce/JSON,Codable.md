# JSON


๐ก JavaScript Object Notation (JSON)

- Javascript ๊ฐ์ฒด ๋ฌธ๋ฒ์ผ๋ก ๊ตฌ์กฐํ๋ ๋ฐ์ดํฐ๋ฅผ ํํํ๊ธฐ ์ํ ๋ฌธ์ ๊ธฐ๋ฐ์ ํ์ค ํฌ๋งท
- ๋ธ๋ผ์ฐ์ ์ ์๋ฒ ๊ฐ์ ํต์ ์ ์ฌ์ฉ๋๋ ํ์ค data format
- ์น ์ดํ๋ฆฌ์ผ์ด์์์ ๋ฐ์ดํฐ๋ฅผ ์ ์กํ  ๋ ์ผ๋ฐ์ ์ผ๋ก ์ฌ์ฉ
- JSON์ ๋ฌธ์์ด ํํ๋ก ์กด์ฌ
- ์ ์ก๋ฐ์ ๋ฐ์ดํฐ์ ๋ฌด๊ฒฐ์ฑ์ ์ฌ์ฉ์๊ฐ ์ง์  ๊ฒ์ฆํด์ผ ํจ

# Codable

๐ก Swift4๋ถํฐ ์ถ๊ฐ๋ ํ๋กํ ์ฝ, JSON ๋ฐ์ดํฐ๋ฅผ ๊ฐํธํ๊ณ  ์ฝ๊ฒ Encoding / Decoding ํ  ์ ์๊ฒ ํด์ค

- Decodable๊ณผ Encodable๋ก ์ด๋ฃจ์ด์ ธ ์์

```swift
public typealias Codable = Decodable & Encodable
```

- Struct, Class, Enum ๋ชจ๋ Codable ์ฑํ๊ฐ๋ฅ

### Encoding

- ์ํ๋ struct, class, enum ๋ฑ์ ์ธ์คํด์ค๋ฅผ JSON ํํ์ Data๋ก ๋ง๋ค์ด ์ฃผ๋ ๊ฒ

### Decoding

- JSON ํํ์ Data๋ฅผ struct, class, enum ๋ฑ์ ์ธ์คํด์ค์ ์๋์ผ๋ก ํ์ฑ
- JSON Data์ Key ๊ฐ๊ณผ ๋์ผํ ์ด๋ฆ์ ๊ตฌ์กฐ์ฒด ๋ณ์์ value์ ๊ฐ์ ํ์ฑ โ ํ์ฑ๋ ๊ตฌ์กฐ์ฒด ๋ฆฌํด
- โป JSON Data์ Key ๊ฐ์ Codable์ ๋ฐ๋ฅด๋ ํ์์ ๋ฉค๋ฒ ์ด๋ฆ๊ณผ 1๋1 ๋งค์นญ ๋์ด์ผ๋ง ๋ฌธ์  ์์ด ์ฌ์ฉ ๊ฐ๋ฅ

### CodingKey

- Key ๊ฐ์ ๋์ํ๋ ์ด๋ฆ์ ๋ฐ๊ฟ ๋ ์ฌ์ฉ
- CodingKey ํ๋กํ ์ฝ์ ์ด์ฉํด์ Key์ ์ด๋ฆ์ด ๋ฐ๋์๋ค๋ ๊ฑธ ๋ช์ํด์ผ ํจ
    - CodingKey๋ฅผ ์ค์ํ๋ ํ์์ enum์ผ๋ก ๋ช์
        
        ```swift
        struct Location: Codable {
            var street: String
            
            enum CodingKeys: String, CodingKey {
                case address = "street"
            }
        }
        ```
        

# ์ฐธ๊ณ 

> JSON
> 

[JSON์ผ๋ก ์์ํ๊ธฐ - Web ๊ฐ๋ฐ ํ์ตํ๊ธฐ | MDN](https://developer.mozilla.org/ko/docs/Learn/JavaScript/Objects/JSON)

[JSON](https://www.json.org/json-ko.html)

[์ฝ๋ฉ๊ต์ก ํฐ์จํผ์ค์ฟจ](http://www.tcpschool.com/json/json_basic_structure)

> Codable
> 

[Swift) Codable - JSON์ ์ฝ๊ฒ Encoding / Decoding ํ์](https://babbab2.tistory.com/61)