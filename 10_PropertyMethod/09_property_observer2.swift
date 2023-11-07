class Account {                                                                         // 클래스 Account 생성
    var credit: Int = 0 {                                                               // 현금을 저장할 변수를 생성하면서 초기값을 0으로 지정
        willSet {                                                                       // 프로퍼티 옵저버 설정, 프로퍼티인 credit이 변경되기 직전에 실행
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet {                                                                        // 프로퍼티의 값이 바뀐 직후에 실행
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }

    var dollarValue: Double {                                                           // 달러를 저장할 변수 생성
        get {
            return Double(credit / 1000)                                                // 변수의 값을 가져오는 getter 생성, 변수의 중괄호안에 작성되어 dollarValue의 초기값을 결정
        }
        set {                                                                           // 변수의 값을 성정하는 setter 생성, setter의 파라미터는 생략 가능
            credit = Int(newValue * 1000)                                               // setter의 파라미터를 생략했을 땐 보통 newValue를 사용
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account {                                                         // Account 클래스를 상속받는 ForeignAccount 클래스를 생성
    override var dollarValue: Double {                                                  // 부모 클래스의 dollarValue를 오버라이드
        willSet {                                                                       // dollarValue의 프로퍼티 옵저버를 설정
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()                                        // ForeignAccount의 인스턴스를 생성
myAccount.credit = 1000                                                                 // credit 값이 변경되었으므로 credit의 프로퍼티 옵저버 실행
myAccount.dollarValue = 2
// 현재 credit 값 = 1000, 따라서 dollarValue의 값은 (Double)1.0로 설정
// dollarValue의 값이 2로 바뀌기 직전에 dollarValue의 willSet 실행
// dollarValue의 값이 바뀌면서 dollarValue의 setter 실행, setter가 실행되면서 credit의 값이 바뀜 (setter의 newValue에는 2가 저장)
// credit 값이 바뀌면서 credit의 프로퍼티 옵저버 실행, credit의 옵저버 실행이 끝나면 아까에 이어서 dollarValue의 setter 마저 실행
// dollarValue의 값이 바뀌면서 실행되는 setter 실행이 끝남, 바로 이어서 dollarValue의 didSet실행