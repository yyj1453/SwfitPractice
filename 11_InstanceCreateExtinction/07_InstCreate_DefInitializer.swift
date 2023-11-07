// 기본(멤머와이즈) 이니셜라이저는 클래스에는 지원되지 않는 구조체만의 특권
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)