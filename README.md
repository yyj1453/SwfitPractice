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
