# pakage dependency

### ๐ก SPM(Swift Package Manager)

- ์ข์์ฑ ๊ด๋ฆฌ๋ฅผ ์ํ Apple์ ๊ณต์ ๋๊ตฌ
- Xcode11์ ๋ด์ฌ๋ ๊ธฐ๋ฅ์ผ๋ก ์ถ๊ฐ๋จ
- ์์ฒด ๋น๋ ์์คํ ํฌํจ
- ์ํํธ์จ์ด์ ๊ตฌ์ฑ๊ณผ ํ์คํธ, ์คํ๊น์ง ํฌํจ

### Swift Package Manager ์ฌ์ฉ๋ฒ

- ํ๋ก์ ํธ์ Pacakge ์ถ๊ฐํ๊ธฐ
    1. Xcode ์ด๊ณ  ํ๋ก์ ํธ ์ ํ
    2. Package dependencies ํญ ์๋ `+` ์ ํ
    3. ๊ฒ์์ฐฝ์ Package URL ๋ฃ๊ณ  Add Package ์ ํ
    4. ์ํ๋ Target์ ์ ํ๊ณ  Add Package ์ ํ
    5. Package Dependencies ๋ชฉ๋ก์ Package ์ถ๊ฐ๋จ
    6. ํ์ธ : ์ ํํ Targe์์ General > Frameworks, Libraries, and Embedded Content
- Package ์์ฑํ๊ธฐ
    - ๋ด๋ถ ๋ชจ๋์ ๋ง๋ค๊ฑฐ๋ ์ด๋ค ์ฝ๋๋ฅผ publish ํ  ๋ ์ฌ์ฉ๋จ
    1. Xcode ํด๋ก ์์ฑ
        1. File > New > Package ์ ํ
    2. ํฐ๋ฏธ๋ ๋ช๋ น์ด๋ก ์์ฑํ๊ธฐ
        1. ํฐ๋ฏธ๋์์ ํน์  ๋๋ ํฐ๋ฆฌ์ ์๋ ๋ช๋ น์ด ์๋ ฅํ๋ฉด, ํด๋น ํด๋ ์ด๋ฆ์ ๊ธฐ์ค์ผ๋ก ๊ธฐ๋ณธ์ ์ธ ๋๋ ํฐ๋ฆฌ ๊ตฌ์กฐ๋ฅผ ๋ง๋ค์ด์ค
            
            ```bash
            swift package init
            ```
            

# ์ฐธ๊ณ 

[Apple Developer Documentation](https://developer.apple.com/documentation/packagedescription/package/dependency)

[Swift Package Manager ์ ์ฉ๊ธฐ](https://tech.kakao.com/2022/06/02/swift-package-manager/)

23.02.02 ์๋ก๋