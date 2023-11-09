var customersInLine1: [String] = ["youngjin1", "youngjin2", "youngjin3", "youngjin4"]
print(customersInLine1.count)

// 클로저를 선언(생성)할 때는 실행되지 않음
let customerProvider1: () -> String = {
    // 배열이름.removeFirst()의 값은 배열의 첫번째 요소
    return customersInLine1.removeFirst()
}
print(customersInLine1.count)

print("Now serving \(customerProvider1())!")         // 클로저이름 뒤에 () 키워드를 사용해야 실행이 됨
print(customersInLine1.count)

print("-------------------------------------")

var customersInLine2: [String] = ["youngjin1", "youngjin2", "youngjin3", "youngjin4"]

// 매개변수로 (매개변수가 없고 반환타입이 String인 클로저)customerProvider2를 받고 반환타입이 Void(반환값이 없음)인 클로저 생성
func serveCustomer2(_ customerProvider2: () -> String) {
    // 출력문을 통해 클로저 customerProvider2를 실행하고 반환값 출력
    print("Now serving \(customerProvider2())!")
}

// 매개변수로 함수(클로저)가 있고 이름과 return키워드는 암시적으로 표현
serveCustomer2( { customersInLine2.removeFirst() } )
// func 함수이름() -> String {
//      return customersInLine2.removeFirst()
//}

print("-------------------------------------")

var  customersInLine3: [String] = ["youngjin1", "youngjin2", "youngjin3", "youngjin4"]

func serveCustomer3(_ customerProvider3: @autoclosure () -> String) {       // 자동클로저는 @autoclosure 키워드를 사용해야함
    print("Now serving \(customerProvider3())!")
}

// customersInLine3.removeFirst()는 String 전달이지만 serveCustomer3 함수의 전달인자 부분에서 자동으로 클로저로 변환이 됨
let FirstWord: String = customersInLine3.removeFirst()
serveCustomer3(FirstWord)

print("-------------------------------------")

var  customersInLine4: [String] = ["youngjin1", "youngjin2", "youngjin3", "youngjin4"]

// retuenProvider4 함수가 반환값으로 customerProvider4 클로저를 반환, 함수 내부의 클로저가 외부로 쓰여야 할때는 탈출클로저가 필요
func returnProvider4(_ customerProvider4: @autoclosure @escaping () -> String) -> (() -> String) {      // @autoclosure는 기본적으로 @noescape속성을 포함함
    return customerProvider4
}
let customerProvider4: () -> String = returnProvider4(customersInLine4.removeFirst())
print("Now serving \(customerProvider4())!")