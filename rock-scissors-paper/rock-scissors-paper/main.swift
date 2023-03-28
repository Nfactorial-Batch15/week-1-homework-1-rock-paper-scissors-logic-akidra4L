print("Game maded by Alikhan Gubayev on nFactorial iOS Course")
print("----------------------")

print("Hello to the Game: Rock, Scissors, Paper.")
print("With whom you want to play?")
print("1 - with computer.")
print("2 - with friend.")

let values: [Choices] = [.rock, .paper, .scissors]

class Player {
    let name: String
    
    private var _choice: Choices = .rock
    var choice: Choices {
        get { return _choice }
        set(newChoice) { _choice = newChoice }
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, choice: Choices) {
        self.name = name
        self.choice = choice
    }
}

enum Choices: String {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
}

func game(player1: Player, player2: Player) -> String {
    if player1.choice == player2.choice {
        return "Draw."
    }
    
    let winString = " win!"
    
    if player1.choice == .scissors && player2.choice == .paper {
        return player1.name + winString
    } else if player1.choice == .paper && player2.choice == .rock {
        return player1.name + winString
    } else if player1.choice == .rock && player2.choice == .scissors {
        return player1.name + winString
    }
    
    return player2.name + winString
}

func playerChoosingValue(playerName: String) -> Player {
    print("\(playerName) choose your value:")
    for (index, value) in values.enumerated() {
        print("\(index + 1). \(value)")
    }
    
    if let inputChoice = readLine() {
        if let playerChoiceValue = Int(inputChoice) {
            let player = Player(name: playerName)
            switch playerChoiceValue {
            case 1:
                player.choice = .rock
                return player
            case 2:
                player.choice = .paper
                return player
            case 3:
                player.choice = .scissors
                return player
            default:
                print("Error: Unknown input choice")
                break
            }
        }
    }
    return Player(name: playerName, choice: .rock)
}

// reading block
if let input = readLine() {
    if let command = Int(input) {
        switch command {
        case 1:
            // Playing with computer
            // randomly choosing element for computer
            let computer = Player(name: "Computer", choice: values.randomElement()!)
            
            // player picking his value
            print("Choose your value:")
            for (index, value) in values.enumerated() {
                print("\(index + 1). \(value)")
            }
            
            let player = playerChoosingValue(playerName: "Player")
            print(game(player1: player, player2: computer))
        case 2:
            let player1 = playerChoosingValue(playerName: "Player 1")
            let player2 = playerChoosingValue(playerName: "Player 2")
            
            print(game(player1: player1, player2: player2))
        default:
            print("Error: Unknown command")
        }
    }
}


