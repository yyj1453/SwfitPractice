// 현재 배열 전체 내역을 출력할 프로토콜
protocol SelfPrintable {
    func printSelf()
}
// SelfPrintable 프로토콜을 채택한 형식이 Container 프로토콜도 채택할 때 추가하는 코드
extension SelfPrintable where Self: Container {
    // 현재 배열 출력
    func printSelf() {
        print(items)
    }
}

// 배열을 구성할 프로토콜 (SelfPrintable 상속)
protocol Container: SelfPrintable {
    associatedtype ItemType

    // 읽기 쓰기 다 가능한 배열 선언
    var items: [ItemType] { get set }
    // 읽기만 가능하면서 배열의 갯수를 저장할 프로퍼티 선언
    var count: Int { get }

    // 배열에 아이템 추가하는 메소드
    mutating func append(item: ItemType)
    // 인덱스에 따른 배열 요소 출력할 서브스크립트
    subscript(i: Int) -> ItemType { get }
}
extension Container {
    // 배열 요소 추가 메소드 구현
    mutating func append(item: ItemType) {
        items.append(item)
    }
    
    // 배열 요소 갯수 프로퍼티 구현
    var count: Int {
        return items.count
    }

    // 인덱스 값에 따른 요소 가져올 서브스크립트 구현
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

// 스택을 구현할 프로토콜 생성 (Container 상속)
protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}
extension Popable {
    // 배열이 비어있을경우 반환값이 없을 수 도 있으므로 반환값을 옵셔널로 선언
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }

    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

// 큐를 구현할 프로토콜 생성 (Container 상속)
protocol Insertable: Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}
extension Insertable {
    // 배열이 비어있을경우 반환값이 없을 수 도 있으므로 반환값을 옵셔널로 선언
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }

    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}

// 제네릭을 통해 스택 생성
struct Stack<Element>: Popable {
    // 프로토콜 확장에서 구현되지 않은 프로퍼티 구현
    var items: [Element] = [Element]()
}
// 제네릭을 통해 큐 생성
struct Queue<Element>: Insertable {
    // 프로토콜 확장에서 구현되지 않은 프로퍼티 구현
    var items: [Element] = [Element]()
}

// 스택 인스턴스(객체) 생성
var myIntStack: Stack<Int> = Stack<Int>()
var myStringStack: Stack<String> = Stack<String>()
// 큐 인스턴스(객체) 생성
var myIntQueue: Queue<Int> = Queue<Int>()
var myStringQueue: Queue<String> = Queue<String>()

myIntStack.push(3)
myIntStack.printSelf()
myIntStack.push(2)
myIntStack.printSelf()
myIntStack.pop()
myIntStack.printSelf()

myStringStack.push("A")
myStringStack.printSelf()
myStringStack.push("B")
myStringStack.printSelf()
myStringStack.pop()
myStringStack.printSelf()

myIntQueue.insert(3)
myIntQueue.printSelf()
myIntQueue.insert(2)
myIntQueue.printSelf()
myIntQueue.delete()
myIntQueue.printSelf()

myStringQueue.insert("A")
myStringQueue.printSelf()
myStringQueue.insert("B")
myStringQueue.printSelf()
myStringQueue.delete()
myStringQueue.printSelf()