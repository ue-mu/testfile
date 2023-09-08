//
//  RandomNumber.swift
//  mukjjibba
//
//  Created by Lee minyeol on 2023/09/06.
//

import Foundation

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

// 함수만 따로 분리 하지 않는다.
// get이나 make는 지양하는편
// Int는 RockPaperScissorsChoice타입을 반환하는게 더 나아보인다.
//
