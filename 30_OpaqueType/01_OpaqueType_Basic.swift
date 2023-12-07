protocol WrappedPrize {
    associatedtype Prize
    
    var wrapColor: String! { get }
    var prize: Prize! { get }
}
protocol Gundam { }
protocol Pokemon { }

struct WrappedGundam: WrappedPrize {
    var wrapColor: String!
    var prize: Gundam!
}
struct WrappedPokemon: WrappedPrize {
    var wrapColor: String!
    var prize: Pokemon!
}

struct PrizeMachine {
    // 반환값이 특정 프로토콜을 따르게 할 경우 반환 타입 앞에 some키워드를 써야함
    func dispenseRandomPrize() -> some WrappedPrize {
        return WrappedGundam()
    }
}

let machine: PrizeMachine = PrizeMachine()
let wrappedPrize = machine.dispenseRandomPrize()