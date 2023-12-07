// Error는 요구사항이 없는 빈 프로토콜이지만 주로 오류표현을 위해 사용
enum VendingMachineError: Error {
    case invalidSelection                       // 잘못된 선택
    case insufficientFunds(cointsNeeded: Int)   // 자금 부족
    case outOfStock                             // 품절
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    // 재고
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Biscuit": Item(price: 7, count: 11)
    ]

    // 구매자가 넣은 금액
    var coinsDeposited = 0

    // 물건 제공 문구
    func dispense(snack: String) {
        print("\(snack) 제공")
    }

    // 물건 제공
    func vend(itemNamed name: String) throws {
        // 없는 물건을 골랐을 때를 방지
        guard let item = self.inventory[name] else {
            // 오류 던지기
            throw VendingMachineError.invalidSelection
        }

        // 재고가 없을 때를 방지
        guard item.count > 0 else {
            // 오류 던지기
            throw VendingMachineError.outOfStock
        }

        // 구매자가 넣은 금액이 물건 가격보다 낮을 때를 방지
        guard item.price <= self.coinsDeposited else {
            // 오류 던지기
            throw VendingMachineError.insufficientFunds(cointsNeeded: item.price - self.coinsDeposited)
        }

        // 잔돈 계산
        self.coinsDeposited -= item.price

        // 구매 후 남은 재고 계산
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem

        // 물건 제공 문구 출력
        self.dispense(snack: name)
    }
}

// 좋아하는 물건들 각각 저장
let favoriteSnacks = [
    "youngjin1": "Chips",
    "youngjin2": "Biscuit",
    "youngjin3": "Chocolate"
]

// 좋아하는 물건 사는 함수
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

// 사고자하는 물건을 입력받아 사는 구조체
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

// 자판기 인스턴스 생성
let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 30

var purchase: PurchasedSnack = try PurchasedSnack(name: "Biscuit", vendingMachine: machine)

print(purchase.name)

// 오류발생 (오류를 던지기만 할 뿐 처리를 안함)
for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine)
}