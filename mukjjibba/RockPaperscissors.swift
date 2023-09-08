//
//  RockPaperscissors.swift
//  mukjjibba
//
//  Created by Lee minyeol on 2023/09/06.
//

import Foundation

sstruct RockPaperScissors {
    func generateRandomNumber() -> RockPaperScissorsChoice {
        let randomNumber = Int.random(in: 1...3)
        
        switch randomNumber {
        case 1:
            return .rock
        case 2:
            return .paper
        case 3:
            return .scissors
        default:
            return .unknown
        }
    }
    
    private var nextGame = MukJjiBba()
    //mutating 공부를 하고 쓰자.
     func compareUserPickAndComputerPick(_ userChoice: RockPaperScissorsChoice, _ computerChoice: RockPaperScissorsChoice) {
        switch (userChoice, computerChoice) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            print("이겼습니다!")
            turn = "사용자"
            nextGame.playMukChiBbaGame()
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            print("비겼습니다!")
            playRockPaperScissors()
        default:
            turn = "컴퓨터"
            print("졌습니다!")
            nextGame.playMukChiBbaGame()
        }
    }
    //private가 공부를 하고 쓰자.
    private func selectMenu() -> RockPaperScissorsChoice {
        while true {
            // 고민
            print("가위(1), 바위(2), 보(3)!<종료 : 0> :", terminator: " ")
            // 게임 로직 struct 구현(시간이 된다면)
            guard let input = readLine(), let userChoice =  RockPaperScissorsChoice(rawValue: Int(input) ?? -1)  else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            return userChoice
        }
    }
    
     func playRockPaperScissors() {
        let isRunning = true
        
        while isRunning {
            let computerChoice = RockPaperScissorsChoice(rawValue: generateRandomNumber()) ?? .unknown
            // 디폴트값을 넣어줄 언노운 케이스를 만들어주는게 낫다.
            let userChoice = selectMenu()
            
            if userChoice == .quit {
                print("게임 종료")
                break
            }
            
            compareUserPickAndComputerPick(userChoice, computerChoice)
            break
        }
    }
}
