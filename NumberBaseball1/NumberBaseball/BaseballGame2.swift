//
//  baseballGame2.swift
//  NumberBaseball
//
//  Created by Seungseop Lee on 3/12/24.
//

// [ lv. 2 Number Baseball ]
// - 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
// - 힌트는 야구용어인 **볼**과 **스트라이크**입니다.
// - 같은 자리에 같은 숫자가 있는 경우 **스트라이크**, 다른 자리에 숫자가 있는 경우 **볼**입니다
// - 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
// - 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다

import Cocoa

class BaseballGame2: NSObject {
    
    func start() {
        
        let comNumber = makeAnswer()
        
        while true {
            // userinput이 세 자리 숫자가 아닌 경우 오류 문구를 출력하는 조건 추가
            guard let userInput = readLine(), userInput.count == 3, let userNumber = Int(userInput),
                  Set(userInput).count == 3 else {
                print("중복되지 않는 세 자리 숫자를 입력하세요.")
                continue
            }
            
            // 볼, 스트라이크 판정 추가
            let (strike, ball) = referee(comNumber, userNumber)
            
            // 정답일 경우 while문 탈출 조건 추가
            if strike == 3 {
                print("Homerun!")
                break
            }
            
            // 0스트라이크 0볼의 경우 Nothing 출력
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
            computerAnswer = Int.random(in: 123...987)
            
            let hundredsDigit = computerAnswer / 100
            let tensDigit = (computerAnswer / 10) % 10
            let onesDigit = computerAnswer % 10
            
            if hundredsDigit != 0 && tensDigit != 0 && onesDigit != 0 {
                if hundredsDigit != tensDigit && tensDigit != onesDigit && onesDigit != hundredsDigit {
                    // 빠른 정답 판독을 위해 computerAnswer를 print하도록 임시로 설정
                    print("정답 미리보기 : \(computerAnswer)")
                    isUnusableNumber = false
                }
            }
        }
        return computerAnswer
    }
    
    // 볼, 스트라이크를 판독하는 '심판' 함수 추가
    func referee(_ computer: Int, _ user: Int) -> (Int, Int) {
        
        var strike = 0
        var ball = 0
        
        let computerDigits = abs(computer)
        let userDigits = abs(user)
        
        // 스트라이크 계산
        for i in 0..<3 {
            if computerDigits[i] == userDigits[i] {
                strike += 1
            }
        }
        
        // 볼 계산
        for i in 0..<3 {
            let userDigit = userDigits[i]
            // 중복된 숫자이면서 같은 인덱스가 아닌 경우 볼 카운트 증가
            if computerDigits.contains(userDigit) && computerDigits[i] != userDigit {
                ball += 1
            }
        }
        return (strike, ball)
    }

    
    // 숫자를 자릿수별로 분리하는 Automatic Ball-strike System 함수 추가
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
