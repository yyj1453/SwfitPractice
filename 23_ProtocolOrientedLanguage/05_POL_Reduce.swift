protocol SelfPrintable {
    func printSelf()
}
extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType

    var items: [ItemType] { get set }
    var count: Int { get }

    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}
extension Container {
    mutating func append(item: ItemType) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }

    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}
extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }

    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()

    // T타입의 초기값 initialResult 설정, initialResult에 어떠한 값을 담을지 연산하는 클로저로 nextPartialResult 설정
    // 초기값(T타입)과 클로저(T타입과 Element타입의 전달인자를 받아 T타입의 값을 반환)를 전달인자로 받아 T타입의 값을 반환하는 메소드 reduce<T>생성
    func reduce<T>(_ initialResult: T, nextPartialResult: (T, Element) -> T) -> T {
        // 초기값을 누적해서 담아야하기 때문에 따로 변수로 복제
        var result: T = initialResult

        for item in items {
            // 배열을 순회하며 nextPartialResult 클로저 수행하여 result 누적 (클로저 로직은 사용할때 구현)
            result = nextPartialResult(result, item)
        }

        // T타입으로 선언된 result 반환
        return result
    }
}

var myIntStack: Stack<Int> = Stack<Int>()
myIntStack.push(1)
myIntStack.push(5)
myIntStack.push(2)

// initialResult로 100이 설정되고 T타입은 Int타입으로 설정 
// T(Int)타입의 result와 Element(Int)타입의 next를 전달인자로 받아 result + next라는 클로저 로직을 수행 하여 T(Int)타입의 값을 반환
// 반환된 T(Int)타입의 (result + next)와 initialResult인 100을 전달인자로 받아 reduce 메소드 실행
let combinedInt: Int = myIntStack.reduce(100) { (result: Int, next: Int) -> Int in 
    return result + next
}
print(combinedInt)

// initialResult로 100.0이 설정되고 T타입은 Double타입으로 설정 
// T(Double)타입의 result와 Element(Int)타입의 next를 전달인자로 받아 result + next라는 클로저 로직을 수행 하여 T(Double)타입의 값을 반환 (+ 연산을 위해 next는 Double로 캐스팅)
// 반환된 T(Double)타입의 (result + next)와 initialResult인 100을 전달인자로 받아 reduce 메소드 실행
let combinedDouble: Double = myIntStack.reduce(100.0) { (result: Double, next: Int) -> Double in 
    return result + Double(next)
}
print(combinedDouble)

// initialResult로 ""이 설정되고 T타입은 String타입으로 설정 
// T(String)타입의 result와 Element(Int)타입의 next를 전달인자로 받아 result + next라는 클로저 로직을 수행 하여 T(String)타입의 값을 반환 (+ 연산을 위해 next값을 이용해 문자열 생성)
// 반환된 T(String)타입의 (result + next)와 initialResult인 100을 전달인자로 받아 reduce 메소드 실행
let combinedString: String = myIntStack.reduce("") { (result: String, next: Int) -> String in 
    return result + "\(next)"
}
print(combinedString)