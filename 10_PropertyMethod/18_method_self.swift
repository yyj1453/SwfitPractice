class LevelClass {
    var level: Int = 0

    func jumpLevel(to level: Int) {
        print("Jump to \(level)")
        self.level = level
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.jumpLevel(to: 3)
print(levelClassInstance.level)