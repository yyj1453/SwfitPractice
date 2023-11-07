struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }

    mutating func levelUp() {                                       // 구조체와 열거형의 내부 프로퍼티의 값을 바꾸는 메소드에는 mutating이라는 키워드가 필요함
        print("Level Up!")
        level += 1
    }

    mutating func levelDown() {
        print("Level Down!")
        level -= 1
        if level < 0 {
            reset()
        }
    }

    mutating func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }

    mutating func reset() {
        print("Reset!")
        level = 0
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
levelStructInstance.levelDown()
levelStructInstance.levelDown()
levelStructInstance.jumpLevel(to: 3)