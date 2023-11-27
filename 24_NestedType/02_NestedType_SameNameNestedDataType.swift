// 서로 다른 데이터 타입이 고용 데이터 타입을 이용해야할 때 데이터 중첩을 이용하면 사용에 용이
struct Sports {
    enum GameType {
        case football, basketball
    }
    
    var gameType: GameType

    struct GameInfo {
        var time: Int
        var player: Int
    }

    var gameInfo: GameInfo {
        switch self.gameType {
            case .basketball:
                return GameInfo(time: 40, player: 5)
            case .football:
                return GameInfo(time: 90, player: 11)
        }
    }
}

struct ESports {
    enum GameType {
        case online, offline
    }

    var gameType: GameType

    struct GameInfo {
        var location: String
        var pakage: String
    }

    var gameInfo: GameInfo {
        switch self.gameType {
            case .online:
                return GameInfo(location: "www.liveonline.co.kr", pakage: "LOL")
            case .offline:
                return GameInfo(location: "제주", pakage: "SA")
        }
    }
}

var basketball: Sports = Sports(gameType: .basketball)
print(basketball.gameInfo)

var sudden: ESports = ESports(gameType: .offline)
print(sudden.gameInfo)

let someGameType: Sports.GameType = .football
print(someGameType)
let anotherGameType: ESports.GameType = .online
print(anotherGameType)
// let errorIfYouWantIt: Sports.GameType = .online