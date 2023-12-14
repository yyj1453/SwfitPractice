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
> 5. Closure
>    * 클로저는 함수와 비슷한 코드형태의 블록
>    * 변수나 상수로 저장이 가능하고 함수 인자로도 전달 가능
>    * 클로저의 기본 형태는 다음과 같다
>      ```
>      { (매개변수) -> 반환타입 in
>          실행코드
>      }
>      ```
>    * 클로저는 몇가지의 키워드로 축약이 가능하다
>      ```
>      let names: [String] = ["youngjin1", "youngjin2", "youngjin3"]
>
>      // 1. 전달인자의 타입과 반환타입을 안적어 줘도 알아서 추측함
>      let reversed1: [String] = names.sorted { (first, second) in
>          return first > second
>      }
>
>      // 2. 전달인자를 $0, $1, $2, ... 순으로 표현 가능
>      let reversed2: [String] = names.sorted {
>          return $0 > $1
>      }
>
>      // 3. return을 안적어줘도 암시적으로 반환
>      let reversed3: [String] = names.sorted { $0 > $1 }
>
>      // 4. > 함수를 클로저로서 함수 안에서 사용 가능
>      let reversed4: [String] = names.sorted(by: >)
>      ```
>    * 반환 값을 특정 함수로 지정 가능
>      ```
>      func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
>          var runningTotal = 0
>          func incrementer() -> Int {
>              runningTotal += amount
>              return runningTotal
>          }
>          return incrementer
>      }
>      let incrementerByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
>      ```
>    * 전달인자로 클로저를 받는 함수가 있을 때 클로저가 함수 외부에서도 호출이 될려면 탈출클로저가 필요함
>      ```
>      typealias VoidVoidClosure = () -> Void
>      let firstClosure: VoidVoidClosure = {
>          print("Closure A")
>      }
>      let secondClosure: VoidVoidClosure = {
>          print("Closure B")
>      }
>      func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
>          return shouldReturnFirstClosure ? first : second
>      }
>      let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)
>      returnedClosure()
>      ```
>    * 특정 타입을 받아 자동으로 클로저로 변환해주는 기능도 있음
>      ```
>      var names: [String] = ["youngjin1", "youngjin2", "youngjin3"]
>      func helloName(_ name: @autoclosure () -> String) {
>          print("Hello \(name())!")
>      }
>      let firstName: String = names.removeFirst()
>      helloName(firstName)
>      ```
> 6. Optional Chaining and Early Exit
>    * 옵셔널 바인딩은 코드가 너무 길어져 한줄로 줄인 것을 옵셔널 체이닝이라고 함
>      ```
>      var youngjinNumber: Int = SomeClass.someProperty1?.someProperty2?.someProperty3?.someProperty4
>      ```
>    * 빠른 종료 (guard) 기본문법
>      ```
>      guard (Bool 타입 값) else {
>          Bool 타입 값에 해당 되지 않은 예외사항 실행문
>          제어문 전환 명령어
>      }
>      ```
>    * guard 간단한 예제
>      ```
>      for i in 0...3 {
>          guard i == 2 else {
>              continue
>          }
>          print(i)
>      }
>      ```
> 7. Map, Filter, Reduce
>    * Map은 배열의 각각 요소에 특정 작업을 수행후 다시 배열 형태로 반환하는 메소드
>      ```
>      let numbers: [Int] = [0, 1, 2, 3, 4]
>      var doubleNumbers: [Int] = [Int]()
>      var strings: [String] = [String]()
>
>      doubleNumbers = numbers.map({ (number: Int) -> Int in
>          return number * 2
>      })
>      strings = numbers.map({ (number: Int) -> String in
>          return "\(number)"
>      })
>      ```
>    * Filter는 배열에서 특정 조건에 부합하는 요소들만 골라 다시 배열로 반환하는 메소드
>      ```
>      let numbers: [Int] = [0, 1, 2, 3, 4]
>      let evenNumbers: [Int] = numbers.filter{ (number: Int) -> Bool in
>          return number % 2 == 0
>      }
>      let oddNumbers: [Int] = numbers.filter{ $0 % 2 == 1 }
>      ```
>    * Reduce는 배열에서 특정 작업후 나온 값을 누적 시킨후 특정한 타입으로 한 값을 반환하는 메소드
>      ```
>      // reduce(초기값, { (누적값을 담을변수, 다음 요소를 담을 변수) -> 특정타입 in 특정작업 })
>      let numbers: [Int] = [1, 2, 3]
>      var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
>          print("\(result) + \(next)")
>          // 0 + 1
>          // 1 + 2
>          // 3 + 3
>          return result + next
>      })
>      ```
>    * Map, Filter, Reduce 종합 예제
>      ```
>      let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7]
>      var result: Int = numbers.filter{ $0.isMultiple(of: 2) }.map{ $0 * 3 }.reduce(0){ $0 + $1 }
>      // 짝수만 걸러내어 3을 곱한 후 누적하여 더하기
>      ```
> 8. Monad
>    * 모나드란? <br/>
>      -> 어떤 값을 감싸고 그 값을 조작하는 일련의 연산을 캡슐화하는 디자인 패턴 (옵셔널과 연관이 깊음)
>    * 모나드가 갖춰야 하는 조건
>      1. 타입을 인자로 받는 타입
>      2. 특정 타입의 값을 포장한 것을 반환하는 함수가 존재
>      3. 포장된 값을 반환하여 같은 형태로 포장하는 함수가 존재
>    * 컨텍스트(Context)와 컨텐츠(Contents)란?
>      |Context|Contents|
>      |:-----:|:------:|
>      |물건을 담는 상자|상자안의 내용물|
>    * 옵셔널의 개념 (옵셔널은 열거형으로 정의) <br/>
>      1. 옵셔널은 하나의 컨텍스트(Context)
>      2. Optional(2)는 옵셔널이라는 컨텍스트(Context)안에 2라는 컨텐츠(Contents)가 담겨있음을 의미
>      3. var a: Int? = nil은 옵셔널이라는 컨텍스트에 아무런 컨텐츠가 없음을 의미
>      4. 옵셔널은 Wrapped 타입을 받는 (제네릭)타입 -> 타입을 인자로 받는 타입 -> 모나드 조건 1번 <br/>
>         var a: Int?에서 Int?는 옵셔널 타입이고 ?가 붙기전 Int를 Wrapped타입이라고 함
>      5. 옵셔널 타입은 Optional<Int>.init(2)처럼 다른 타입(Int)의 값을 갖는 상태의 컨텍스트를 생성(반환) 가능 -> 모나드 조건 2번
>    * 컨텍스트와 컨테츠에 대한 간단한 예제
>      ```
>      func addThree(_ num: Int) -> Int {
>          return num + 3
>      }
>      print(addThree(2))
>      print(addThree(Optional(2)))  // 오류 발생!!
>      // addThree라는 함수는 전달인자로 컨텐츠(Contents)를 받음
>      // Optioanl이라는 컨텍스트로 포장된 것을 전달인자로 보내면 오류가 발생함
>      print(Optional(2).map(addThree))  // Optional(5)
>      /*
>          ※ Optional(2).map(addThree) 실행과정
>            1. 옵셔널이라는 컨텍스트(Context)에서 2라는 컨텐츠(Contents)를 추출
>            2. map 메소드를 통해 전달받은 addThree 함수 적용
>            3. 결과 값인 5를 다시 옵셔널이라는 컨텍스트(Context)에 담아 반환
>      */
>      ```
>    * CompactMap란?
>      -> 배열에서 요소의 값이 nil이 아닌 요소들만 모아 다시 배열 생성
>    * FlatMap란?
>      -> 중첩배열을 풀어 1차원 배열로 바꿈
>    * Map과 (CompactMap, FlatMap)의 차이
>      -> Map은 연산 처리 후 다시 컨텍스트에 감싸지만 (CompactMap, FlatMap)은 컨텍스트를 풀어 컨텐츠로 위상을 낮춤
> 9. Subscript
>    * index값을 통해 객체(인스턴스)의 특정 정보를 접근하는 것을 도와주는 메소드을 서브스크립트라고 함
>    * 서브스크립트 간단한 예제
>      ```
>      class SomeClass {
>          var numbers: [Int] = []
>          subscript(index: Int) -> Int {
>              get {
>                  return numbers[index]
>              }
>              set(newValue) {
>                  while numbers.count <= index {
>                      numbers.append(0)
>                  }
>                  numbers[index] = newVlaue
>              }
>          }
>      }
>      var classInstance = SomeClass()
>      classInstance[0] = 10
>      classInstance[1] = 20
>      print(classInstance[1])  // 20
>      ```
> 10. Inheritance
>    * 하나의 클래스가 다른클래스의 정보를 받아오는 것을 상속이라함
>    * 상속 기본 문법
>      ```
>      class 자식클래스: 부모클래스 {
>          프로퍼티와 메소드
>      }
>      ```
>    * override란? <br/>
>      -> 부모클래스에서 정의된 맴버들을 자식클래스에서 재정의하는 것을 의미함
>      ```
>      class Person {
>          var name: String = ""
>          func introduce() -> String {
>              return "안녕하세요, 제 이름은 \(self.name) 입니다."
>          }
>      }
>      class Youngjin: Person {
>          override var name: String = "윤영진"
>          override func intrduce() -> String {
>              return "안녕하세요, 제 이름은 윤영진 입니다."
>          }
>      }
>      ```
>    * 부모클래스에서 맴버에 final이라는 키워드를 쓰면 자식클래스에서 재정의가 불가능함
>    * class를 선언할 때 class 앞에 final 키워드를 쓰면 해당 클래스는 상속이 불가능함
>    * 지정 이니셜라이저와 편의 이니셜라이저란? <br/>
>      -> 지정 이니셜라이저는 인스턴스를 초기화하는 주된 역할을 가지고 있으면 init 키워드를 이용하여 선언, <br/>
>      -> 편의 이니셜라이저는 다른 이니셜라이저를 통해 초기화 기회를 보다 편리하게 제공하고 convenience 키워드를 이용하여 선언
>    * 지정 이니셜라이저와 편의 이니셜라이저 사이의 규칙
>      1. 자식클래스의 지정 이니셜라이저는 부모클래스의 지정 이니셜라이저를 반드시 호출해야함
>      2. 편의 이니셜라이저는 자신을 정의한 클래스의 다른 이니셜라이저를 반드시 호출해야함
>      3. 편의 이니셜라이저는 궁극적으로 지정 이니셜라이저를 반드시 호출해야함
>    * 지정 이니셜라이저와 편의 이니셜라이저의 간단한 예제
>      ```
>      class Person {
>          var name: String
>          var age: Int
>          init(name: String, age: int) {
>              self.name = name
>              self.age = age
>          }
>      }
>      class Student: Person {
>          var major: String
>          init(name: String, age: Int, major: String) {
>              self.major = "Swift"
>              super.init(name: name, age: age)
>          }
>          convenience init(name: String) {
>              self.init(name: name, age: 24, major: "Kotlin")
>          }
>      }
>      ```
>    * 부모클래스의 이니셜라이저 앞에 required 키워드를 사용하면 자식클래스에서 반드시 다시 언급을 해줘야함
> 11. Type Casting
>    * 특정한 타입을 가진 변수의 타입을 다른 타입으로 바꾸는 것을 타입 캐스팅이라고 함
>      ```
>      var num1: Double = 5.5
>      var num2: Int = Int(num1)
>      print(num2)  // 5
>      ```
>    * is 키워드를 사용하면 해당 변수의 타입을 확인할 수 있음
>      ```
>      var num: Int = 10
>      print(num is Int)  // true
>      print(num is Double)  // false
>      ```
>    * 다운 캐스팅이란? <br/>
>      -> 부모클래스의 객체를 하위클래스로 형변환하는 것을 의미
>    * 다운 캐스팅의 간단한 예제
>      ```
>      class Person { }
>      class Youngjin: Person { }
>      let person: Person = Youngjin()
>      if let youngjin1 = person as? Youngjin {
>          print("Success!")
>      } else {
>          print("fail...")
>      }
>      ```
> 12. Protocol
>    * 프로토콜이란? <br/>
>      -> 특정 기능을 수행하기 위한 프로퍼티, 메소드, 이니셜라이저 등의 청사진
>    * 프로토콜에서 프로퍼티를 요구할때 get 또는 set 키워드를 이용하면 해당 변수를 변경 가능여부를 정할 수 있음
>    * 프로토콜끼리 상속받을 때 class 키워드를 이용하면 클래스 전용 프로토콜로 설정 가능
>    * 프로토콜 간단한 예제
>      ```
>      protocol SomeProtocol1 {
>          var name: String { get }
>          var age: Int { get set }
>      }
>      protocol SomeProtocol2: class, SomeProtocol1 {
>          var major: String { get set }
>          init(name: String)
>      }
>      class Person: SomeProtocol2 {
>          var name: String
>          var age: Int
>          var major: String
>          init(name: String) {
>              self.name = name
>              self.age = 24
>              self.major = "Swift"
>          }
>      }
>      ```
>    * @objc와 optional 키워드를 이용하면 선택적 요구가 가능
>      ```
>      @objc protocol SomeProtocol {
>          var name: String { get set }
>          @objc optional var age: Int { get set }
>      }
>      class Person: SomeProtocol {
>          var name: String = ""
>      }
>      ```
> 13. Extension
>    * extension 키워드를 통해 프로토콜, 클래스, 구조체, 열거형에 프로퍼티, 메소드 등를 추가할 수 있음
>    * 상속은 기존 클래스에 기능을 추가해서 새로운 클래스를 만드는 반면 확장은 그냥 기능 추가하기만 함
>    * 간단한 예제
>      ```
>      protocol SomeProtocol { var a: Int }
>      extension SomeProtocol { var b: Int }
>      class SomeClass: SomeProtocol {
>          var a: Int = 10
>          var b: Int = 20
>      }
>      ```
> 14. Generic
>    * 타입을 일반화 하여 어느 타입에든 적용할 수 있는 방식을 제네릭이라고 함
>    * 제네릭을 이용하여 스택 알고리즘 구현
>      ```
>      struct Stack<Element> {
>          var items = [Element]()
>          mutating func push(_ item: Element) {
>              items.append(item)
>          }
>          mutating func pop() -> Element {
>              return items.removeLast()
>          }
>      }
>      var doubleStack: Stack<Double> = Stack<Double>()
>      var stringStack: Stack<String> = Stack<String>()
>      var anyStack: Stack<Any> = Stack<Any>()
>      ```
> 15. Protocol Oriented Language
>    * 스위프트는 프로토콜 지향 언어로서 많은 구조체, 클래스, 열거형 등의 프로토콜이 있고 이를 지향함
>    * 프로토콜을 준수하는 스택 알고리즘 구현
>      ```
>      protocol StackProtocol {
>          associated type ItemType
>          var items = [ItemType] { get set }
>          mutating func push(_ item: ItemType)
>          mutating func pop() -> ItemType?
>      }
>      extension StackProtocol {
>          mutating func push(_ item: ItemType) {
>              items.append(item)
>          }
>          mutating func pop() -> ItemType? {
>              return items.removeLast()
>          }
>      }
>      struct Stack<Element>: StackProtocol {
>          var items: [Element] = [Element]()
>      }
>      var doubleStack: Stack<Double> = Stack<Double>()
>      var stringStack: Stack<String> = Stack<String>()
>      var anyStack: Stack<Any> = Stack<Any>()
>      ```
> 16. Nested Type
>    * 열거형, 구조체, 클래스 안에 또 다른 열거형, 구조체, 클래스를 선언할 수 있음
>    * 같은 이름의 내부 열거형, 구조체, 클래스를 사용해야 할 때 용이 (가독성 증가)
>    * 간단한 예제
>      ```
>      struct Sports {
>          enum GameType {
>              case football, basketball
>          }
>      }
>      struct ESports {
>          enum GameType {
>              case online, offline
>          }
>      }
>      ```
> 17. Pattern
>    * 스위프트에는 문법에 응용할 수 있는 패턴들이 존재
>      1. 값을 해제(추출)하거나 무시하는 패턴<br/>
>         ex) 와일드카드, 식별자, 값 바인딩, 튜플
>      3. 패턴 매칭을 위한 패턴<br/>
>         ex) 열거형 케이스, 옵셔널, 타입캐스팅, 표현
>    * 각각 패턴 설명
>      1. 와일드 카드 패턴 <br/>
>         -> _ 키워드를 사용하여 뭐든 받을 수 있음
>         ```
>         let string: String = "ABC"
>         switch string {
>         case _:
>             print(string)
>         }
>         ```
>      2. 식별자 패턴 <br/>
>         -> 데이터 타입 식별자와 값의 타입을 일치시키는 것을 의미함
>         ```
>         let someInt: Int = 10
>         let someDouble: Double = 10.0
>         let someString: String = "String"
>         ```
>      3. 값 바인딩 패턴 <br/>
>         -> 변수의 속성을 이용해 연결해주는 것을 의미함
>         ```
>         let youngjin = ("youngjin", 24, "Male")
>         switch youngjin {
>         case let (name, age, gender):
>             print("Name: \(name), Age: \(age), Gender: \(gender)")
>         }
>         ```
>      4. 튜플 패턴 <br/>
>         -> 소괄호 내에 쉽표를 이용하여 일종의 리스트를 만드는 것을 의미함
>         ```
>         let youngjin = ("youngjin", 24, "Male")
>         // 소괄호 내에는 서로 다른 타입의 값을 넣어도 됨
>         ```
>      5. 열거형 케이스 패턴 <br/>
>         -> 값과 케이스의 타입을 같게 하는 것을 의미함
>         ```
>         let string: String = "ABC"
>         switch string {
>         case "CBA":
>             print("CBA")
>         case "ABC":
>             print("ABC")
>         }
>         ```
>      6. 옵셔널 패턴 <br/>
>         -> ? 키워드를 이용하여 nil의 가능성여부와 매치 시키는 것을 의미함
>         ```
>         var optionalValue: Int? = 100
>         var anotherVlaue: Int? = optionalValue
>         ```
>      7. 타입 캐스팅 패턴 <br/>
>         -> is 또는 as 키워드를 사용하여 타입 캐스팅 여부를 판단하는 것을 의미함
>         ```
>         let someValue: Any = 100
>         switch someValue {
>         case is String: print("String")
>         case let value as Int: print(value + 1)
>         default: print("둘다 아님")
>         }
>         ```
>      8. 표현 패턴 <br/>
>         -> ~= 연산자를 이용하여 범위나 특정 조건에 부합하는지 판단하는 것을 의미함
>         ```
>         let number = 7
>         switch number {
>         case 1...10 where number % 2 == 1;
>             print("홀수입니다.)
>         default:
>             print(" 짝수 또는 범위를 벗어남)
>         }
>         // case 1...10 where number % 2 == 1에서 ~=연산자가 사용됨
>         ```
