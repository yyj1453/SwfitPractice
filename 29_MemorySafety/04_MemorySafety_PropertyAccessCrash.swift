func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

struct GamePlayer {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10

    mutating func restoreHealth() {
        self.health = GamePlayer.maxHealth
    }

    mutating func shareHealth(with teammate: inout GamePlayer) {
        balance(&teammate.health, &health)
    }
}

var oscar: GamePlayer = GamePlayer(name: "Oscar", health: 10, energy: 10)
var maria: GamePlayer = GamePlayer(name: "Maria", health: 5, energy: 10)

balance(&oscar.health, &oscar.energy) // 같은 인스턴스의 프로퍼티를 동시에 참조하므로 오류 발생!

// 함수, 반복문, 조건문 등 안에서 생성된 인스턴스라면 컴파일러가 오류처리를 하지 않음 (oscar2는 지역변수)
func someFunction() {
    var oscar2: GamePlayer = GamePlayer(name: "Oscar2", health: 10, energy: 10)
    balance(&oscar2.health, &oscar2.energy)
}