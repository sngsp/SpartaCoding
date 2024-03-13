//
//  baseballGame3.swift
//  NumberBaseball
//
//  Created by Seungseop Lee on 3/12/24.
//

// [ lv. 3 Number Baseball ]
// - 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요
// - 맨 앞자리에 0이 오는 것은 불가능합니다

import Cocoa

class BaseballGame3: NSObject {
    
    func start() {
        
        let comNumber = makeAnswer()
        
        while true {
            guard let userInput = readLine(), userInput.count == 3, let userNumber = Int(userInput),
                  Set(userInput).count == 3 else {
                print("중복되지 않는 세 자리 숫자를 입력하세요.")
                continue
            }
            
            let (strike, ball) = referee(comNumber, userNumber)
            
            if strike == 3 {
                print("Homerun!")
                break
            }
            
            if strike == 0 && ball == 0 {
                print("Nothing")
            } else {
                print("\(strike) Strike \(ball) Ball")
            }
        }
    }
    
    func makeAnswer() -> Int {
        
        var computerAnswer = 0
        var isUnusableNumber = true
        
        while isUnusableNumber {
            computerAnswer = Int.random(in: 102...987)
            
            let hundredsDigit = computerAnswer / 100
            let tensDigit = (computerAnswer / 10) % 10
            let onesDigit = computerAnswer % 10
            
            // if hundredsDigit != 0 && tensDigit != 0 && onesDigit != 0 조건의 삭제
            // 0의 존재 유무를 판독하지 않으면서 중복된 숫자가 있는지만 판독하게 됨
            if hundredsDigit != tensDigit && tensDigit != onesDigit && onesDigit != hundredsDigit {
                // 빠른 정답 판독을 위해 computerAnswer를 print하도록 임시로 설정
                print("정답 미리보기 : \(computerAnswer)")
                isUnusableNumber = false
            }
        }
        return computerAnswer
    }
    
    func referee(_ computer: Int, _ user: Int) -> (Int, Int) {
        
        var strike = 0
        var ball = 0
        
        let computerDigits = abs(computer)
        let userDigits = abs(user)
        
        for i in 0..<3 {
            if computerDigits[i] == userDigits[i] {
                strike += 1
            }
        }
        
        for i in 0..<3 {
            let userDigit = userDigits[i]
            if computerDigits.contains(userDigit) && computerDigits[i] != userDigit {
                ball += 1
            }
        }
        return (strike, ball)
    }

    func abs(_ number: Int) -> [Int] {
        
        var digits = [Int]()
        var temp = number
        
        while temp > 0 {
            digits.append(temp % 10)
            temp /= 10
        }
        return digits.reversed()
    }
}
