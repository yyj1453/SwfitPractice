struct CoordinatePoint {
    var x: Int = 0
    var y: Int = 0
}

let yagomPoint: CoordinatePoint = CoordinatePoint()
let wizplanPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

print("yagom's point: (\(yagomPoint.x), \(yagomPoint.y))")
print("wizplan's point: (\(wizplanPoint.x), \(wizplanPoint.y))")

class Position {
    var point: CoordinatePoint = CoordinatePoint()
    var name: String = "Unknown"
}

let yagomPosition: Position = Position()

yagomPosition.point = yagomPoint
yagomPosition.name = "yagom"

print("yagom's name is \(yagomPosition.name)")
print("yagom's position is (\(yagomPosition.point.x), \(yagomPosition.point.y))")