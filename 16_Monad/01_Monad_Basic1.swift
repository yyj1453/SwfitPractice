/*
    ※ 모나드(Monad)가 갖춰야 하는 조건
    1. 타입을 인자로 받는 타입(특정 타입의 값을 포장)
    2. 특정 타입의 값을 포장한 것을 반환하는 함수(메서드)가 존재
    3. 포장된 값을 반환하여 같은 형태로 포장하는 함수(메서드)가 존재
*/
// 컨텍스트(Context) 개념 (물건을 담는 상자와 비슷)
// 컨텍스트(Context)는 컨텐츠(Contents)를 담는 상자
func addThree(_ num: Int) -> Int{
    return num + 3
}

/*
    ※ 옵셔널 (옵셔널은 열거형으로 정의되어있음)
    1. 옵셔널 역시 하나의 컨텍스트(Context)
    2. Optional(2)는 옵셔널이라는 Context에 2라는 Contents가 담겨있음을 의미함
    3. var a: Int? = nil은 옵셔널이라는 컨텍스트에 아무런 컨텐츠가 없음을 의미함
  ☆4. 옵셔널은 Wrapped 타입을 받는 (제네릭)타입 -> 타입을 인자로 받는 타입 -> 모나드 조건 1번
       var a: Int?에서 Int?는 옵셔널 타입이고 ?가 붙기 전 Int를 Wrapped타입이라고 함
  ☆5. 옵셔널 타입은 Optional<Int>.init(2)처럼 다른 타입(Int)의 값을 갖는 상태의 컨텍스트를 생성(반환)가능 -> 모나드 조건 2번
*/

print(addThree(2))                  // 순수한 값인 2를 전달하면 실행 가능
//print(addThree(Optional(2)))        // 2를 Optional이라는 컨텍스트에 담아 전달하면 실행 불가능 (addThree는 옵셔널을 받아들일 수 없음)

// 함수 객체(Functor)의 개념
// map은 컨테이너의 값을 변형 시킬 수 있는 고차함수
print(Optional(2).map(addThree))        // Optional(5)
/*
    ※ Optional(2).map(addThree) 실행과정
    1. 옵셔널이라는 Context에서 2라는 Contents 추출
    2. map 메서드를 통해 전달받은 addThree함수 적용
    3. 결과 값인 5를 다시 옵셔널이라는 Context에 담아 전달
*/

var value: Int? = 2
print(value.map{ $0 + 3 })              // Optional(5)
value = nil
print(value.map{ $0 + 3 })              // nil