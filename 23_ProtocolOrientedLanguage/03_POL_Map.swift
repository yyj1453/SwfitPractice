let items: Array<Int> = [1, 2, 3]

let mappedItems: Array<Int> = items.map{ (item: Int) -> Int in
    return item * 10
}

print(mappedItems)

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

    // 요소를 T타입으로 바꾸는 함수를 transform이라는 전달인자로 받아 다시 Stack<T>타입의 인스턴스를 반환
    func map<T>(transform: (Element) -> T) -> Stack<T> {
        // 변형된 배열을 담을 Stack<T>의 인스턴스 생성
        var transformedStack: Stack<T> = Stack<T>()

        for item in items {
            // transformedStack의 배열에 추가를 하는데 transform 함수를 사용하고 Element로는 item을 설정
            transformedStack.items.append(transform(item))
        }

        return transformedStack
    }
}

var myIntStack: Stack<Int> = Stack<Int>()
myIntStack.push(1)
myIntStack.push(5)
myIntStack.push(2)
myIntStack.printSelf()
// T: String(쌍따옴표를 사용했기 때문), Element: $0(배열의 item을 순차적으로 적용)
var myStrStack: Stack<String> = myIntStack.map{ "\($0)" }
myStrStack.printSelf()