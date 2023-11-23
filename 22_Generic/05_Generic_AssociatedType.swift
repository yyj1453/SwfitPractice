protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType{ get }
}

/*
    ※ Container 프로토콜 준수 규칙
        1. 컨테이너의 새로운 아이템은 append(_:) 메소드를 통해서만 추가
        2. Int타입의 프로퍼티 count 구현
        3. subscript(:) 구현
*/

class MyContainer: Container {
    var items: Array<Int> = Array<Int>()

    var count: Int {
        return items.count
    }

    func append(_ item: Int) {
        items.append(item)
    }

    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct IntStack1: Container {
    var items = [Int]()

    // push와 pop 구현
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop()-> Int {
        return items.removeLast()
    }

    // 프로토콜 준수
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct IntStack2: Container {
    typealias ItemType = Int

    var items = [ItemType]()

    // push와 pop 구현
    mutating func push(_ item: ItemType) {
        items.append(item)
    }
    mutating func pop()-> ItemType {
        return items.removeLast()
    }

    // 프로토콜 준수
    mutating func append(_ item: ItemType) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

// 제네릭, associatedType 사용
struct Stack<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }

    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}