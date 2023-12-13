# SwfitPractice
### Summary
> ![yagom](https://github.com/yyj1453/SwfitPractice/assets/112950093/9d78e86b-fbcb-4f9d-8138-b552a5514baf)
> * 기본적인 스위프트의 문법을 공부
> * 공부기간
>   * 2023/11/01 ~ 2023/12/05

### How to Use
> 1. Swift online compiler
>    * Programiz: <https://www.programiz.com/swift/online-compiler>
>    * 코드를 복사 후 온라인 컴파일러에 붙여넣기를 해 결과화면을 확인
> 2. VSCode
>    * VSCode 설치: <https://code.visualstudio.com>

### Study Detail
> 1. Struct and Class
>    * 스위프트에는 객체의 설계도 역할을 하는 구조체, 클래스 등이 존재
>    * struct, class 키워드로 선언 가능
>      ```
>      struct SomeStruct {...}
>      class SomeClass {...}
>      ```
>    * 구조체나 클래스의 객체(인스턴스)를 생성할 수 있음
>      ```
>      var structInstance: SomeStruct = SomeStruct()
>      var classInstance: SomeClass = SomeClass()
>      ```
>    * 구조체는 상속이 불가능하지만 처리속도가 빠름, 클래스는 상속이 가능하지만 처리속도가 구조체에 비해 느림
> 2. Property and Method
>    * 클래스나 구조체 내부의 맴버변수를 프로퍼티, 함수는 메소드라고 지칭
>    * 프로퍼티에 접근을 돕는 getter와 setter가 존재
>      ```
>      struct SomeStruct {
>          var a: Int
>          var b: Int
>          var opposite: SomeStruct {
>              get {
>                  return SomeStruct(a: -a, b: -b)
>              }
>              set {
>                  a = -newValue.a
>                  b = -newValue.b
>              }
>          }
>      }
>      var structInstance: SomeStruct = SomeStruct(a: 10, b: 20)
>      print(structInstance.opposite)
>      structInstance.opposite = SomeStruct(a: 15, b: 25)
>      ```
>    * 메소드를 통해 프로퍼티 접근 등 여러 동작을 수행 가능
>      ```
>      class SomeClass {
>          var a: Int = 10
>          func numUp() {
>              a += 5
>          }
>          func numDown() {
>              a -= 5
>          }
>      }
>      var classInstance: SomeClass = SomeClass()
>      classInstance.numUp()
>      classInstance.numDown()
>      ```
>    * 클래스가 아닌 구조체나 열거형의 경우 내부 프로퍼티 값을 바꾸는 메소드에는 mutating 키워드가 필요함
>      ```
>      mutating func someFunc() {...}
>      ```
>    * 메소드 내부의 self 키워드는 해당 클래스, 구조체, 열거형으로 만들어진 객체(인스턴스)를 지칭함
>      ```
>      class SomeClass {
>          var num1: Int = 0
>          func change(to num1: Int) {
>              self.num1 = num1
>          }
>      }
>      ```
> 3. Instance Create and Extinction
>    * 생성자를 통해 초기 프로퍼티의 값을 설정 가능
>      ```
>      class SomeClass {
>          var a: Int
>          var b: Int
>          init(num1: Int, num2: Int) {
>              a = num1
>              b = num2
>          }
>      }
>      var classInstance: SomeClass = SomeClass(num1: 10, num2: 20)
>      ```
>    * 소멸자를 통해 메모리 참조 해제 시 원하는 동장 가능
>      ```
>      class SomeClass {
>          var a: Int
>          init(num1: Int) {
>              a = num1
>          }
>          deinit {
>            print("Deinit Instance")
>          }
>      }
>      var classInstacne: SomeClass = SomeClass()
>      classInstance = nil
>      ```
> 4. Access Control
>    * 접근수준을 명시할 수 있는 키워드는 open, public, internal, fileprivate, private 다섯 가지가 있음
>      |키워드|범위|
>      |:-----:|:----:|
>      |open|모듈 외부까지|
>      |public|모듈 외부까지|
>      |internal|모듈 내부|
>      |fileprivate|파일 내부|
>      |private|기능 정의 내부|
>    * open은 클래스에서만 사용가능
