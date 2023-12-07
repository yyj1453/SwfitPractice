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
oscar.shareHealth(with: &maria)
oscar.shareHealth(with: &oscar) // 인스턴스 메모리 충돌, 오류 발생!