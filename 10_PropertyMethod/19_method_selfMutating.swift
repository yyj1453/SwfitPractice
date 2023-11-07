class LevelClass {
    var level: Int = 0

    func reset() {
        //self = LevelClass()
    }
}

struct LevelStruct {
    var level: Int = 0

    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }

    mutating func reset() {
        print("Reset!")
        self = LevelStruct()                                    // self는 LevelStruct로 생성된 인스턴스를 지칭함, 구조체 외부의 인스턴스를 통해 reset() 메소드를 호출하면 그 인스턴스를 없애고 새로운 인스턴스로 대체함
    }
}

var LevelStructInstance: LevelStruct = LevelStruct()
LevelStructInstance.levelUp()
print(LevelStructInstance.level)
LevelStructInstance.reset()
print(LevelStructInstance.level)

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)