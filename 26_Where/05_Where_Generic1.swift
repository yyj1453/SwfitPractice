func doubled1<T>(integerValue: T) -> T where T: BinaryInteger {
    return integerValue * 2
}
func doubled2<T: BinaryInteger>(integerValue: T) -> T {
    return integerValue * 2
}

func prints1<T, U>(first: T, second: U) where T: CustomStringConvertible, U: CustomStringConvertible {
    print(first)
    print(second)
}
func prints2<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, second: U) {
    print(first)
    print(second)
}

func compareTwoSequences1<S1, S2>(a: S1, b: S2) where S1: Sequence,
    S1.Element: Equatable, S2: Sequence, S2.Element: Equatable {
        // ..
}
func compareTwoSequences2<S1, S2>(a: S1, b: S2) where S1: Sequence,
    S2: Sequence, S1.Element: Equatable, S2.Element: Equatable {
        //..
}
func compareTwoSequences3<S1: Sequence, S2: Sequence>(a: S1, b: S2) where 
    S1.Element = Equatable, S1.Element == S2.Iterator.Element {
        // ..
}

protocol Container1 {
    associatedtype ItemType where ItemType: BinaryInteger
    var count: Int { get }
    
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}
protocol Container2 where ItemType: BinaryInteger {
    associatedtype ItemType
    var count: Int { get }

    mutating func append(_ item: ItemType)
    subscript(i :Int) -> ItemType { get }
}