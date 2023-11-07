struct CoordinatePoint {
    var x: Int
    var y: Int
}

class Position {
    var point: CoordinatePoint?
    let name: String

    init(name: String) {
        self.name = name
    }
}

let yagomPosition: Position = Position(name: "yagom")
print("yagom's name is \(yagomPosition.name)")
print("yagom's position is (\(yagomPosition.point?.x), \(yagomPosition.point?.y))")
yagomPosition.point = CoordinatePoint(x: 20, y: 10)
print("yagom's position is (\(yagomPosition.point!.x), \(yagomPosition.point!.y))")