struct CoordinatePoint {
    var x: Int
    var y: Int

    var oppositePoint: CoordinatePoint {
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

print(yagomPosition)
print(yagomPosition.oppositePoint)
yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)             // set 메소드를 구현하지 않았으므로 오류!