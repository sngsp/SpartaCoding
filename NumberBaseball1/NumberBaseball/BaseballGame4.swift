//
//  baseballGame4.swift
//  NumberBaseball
//
//  Created by Seungseop Lee on 3/12/24.
//

// [ lv. 4 Number Baseball ]
// - 프로그램을 시작할 때 안내문구를 보여주세요
//     | 환영합니다! 원하시는 번호를 입력해주세요.          |
//     | 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기  |
// - 1번 게임 시작하기의 경우 **“필수 구현 기능”** 의 예시처럼 게임이 진행됩니다
// - 정답을 맞혀 게임이 종료된 경우 위 안내문구를 다시 보여주세요

import Cocoa

class BaseballGame4: NSObject {
    
    // 가장 먼저 실행되어야 할 start 함수 구현
    func start() {
        
        print("환영합니다! 원하시는 번호를 입력해주세요.")
        print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
        
        guard let userSelect = readLine(), let choice = Int(userSelect) else {
            print("잘못된 입력입니다.")
            start()
            return
        }
            
            switch choice {
                // 1이 입력되었을 때 게임이 진행되도록 구현
            case 1:
                print("< 게임을 시작합니다 >")
                print("숫자를 입력하세요.")
                playBall()
            default:
                print("올바른 숫자를 입력하세요.")
                start()
            }
        }
    
    // 기존 start 함수였지만 이보다 먼저 호출되어야 할 함수가 생겼으므로 playBall로 함수 명칭 변경
    func playBall() {
        
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
                // 정답 시 break 대신 start 함수 호출로 재귀적 구현
                start()
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
