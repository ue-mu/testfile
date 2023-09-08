//
//  MukChiBbaGame.swift
//  mukjjibba
//
//  Created by Lee minyeol on 2023/09/06.
//

import Foundation

struct MukJjiBba {
    // 개행 실수
     func compareUserPickAndComputerPick(_ userChoice: MukJjiBbaChoice, _ computerChoice: MukJjiBbaChoice) {
        switch (userChoice, computerChoice) {
        case (.muk,.bba), (.jji,.muk), (.bba,.jji):
            turn = "컴퓨터"
            print("\(turn)의 턴입니다.")
            playMukChiBbaGame()
        case (.muk,.jji), (.jji,.bba), (.bba,.muk):
            turn = "사용자"
            print("\(turn)의 턴입니다.")
            playMukChiBbaGame()
        default:
            print("\(turn)의 승리!")
        }
    }
    
     func selectMenu() -> MukJjiBbaChoice {
        while true {
            // 고민
            print("[\(turn) 턴]묵(1), 찌(2), 빠(3)!<종료 : 0> :", terminator: " ")
            
            guard let input = readLine(), let userChoice = MukJjiBbaChoice(rawValue: Int(input) ?? -1) else {
                print("잘못된 입력입니다. 컴퓨터의 턴으로 넘깁니다.")
                turn = "컴퓨터"
                continue
            }
            return userChoice
        }
    }
    
     func playMukChiBbaGame() {
        let isRunning = true
        
        while isRunning {
            let computerChoice = MukJjiBbaChoice(rawValue: getRandomNumber()) ?? .muk
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
