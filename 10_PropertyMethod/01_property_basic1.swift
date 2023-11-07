struct CoordinatePoint {
    var x: Int
    var y: Int
}

let yagomPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position {
    var point: CoordinatePoint
    let name: String

    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

let yagomPosition: Position = Position(name: "yagom", currentPoint: yagomPoint)
print("name: \(yagomPosition.name)")
print("position: (\(yagomPosition.point.x), \(yagomPosition.point.y))")