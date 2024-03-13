//
//  baseballGame5.swift
//  NumberBaseball
//
//  Created by Seungseop Lee on 3/12/24.
//

// - 2번 게임 기록 보기의 경우 완료한 게임들에 대해 시도 횟수를 보여줍니다
// < 게임 기록 보기 >
// [ 1번째 게임 : 시도 횟수 - 14 ]
// [ 2번째 게임 : 시도 횟수 - 9  ]
// [ 3번째 게임 : 시도 횟수 - 12 ]

import Cocoa

class BaseballGame5: NSObject {
    
    // Try 횟수 기록을 위한 Int 배열 생성
    var recordArr: [Int] = []
    
    func start() {
        
        print("환영합니다! 원하시는 번호를 입력해주세요.")
        print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
        guard let userSelect = readLine(), let choice = Int(userSelect) else {
            print("잘못된 입력입니다.")
            start()
            return
        }
            
            switch choice {
            case 1:
                print("< 게임을 시작합니다 >")
                print("숫자를 입력하세요.")
                playBall()
                // case 2에 대한 동작 추가
            case 2:
                print("< 게임 기록 보기 >")
                recordPrint()
                start()
            default:
                print("올바른 숫자를 입력하세요.")
                start()
            }
        }
    
    // "2" 입력 시 게임 기록을 출력하는 함수 생성
    func recordPrint() {
        
        if recordArr.isEmpty {
            print("플레이한 기록이 없습니다.")
        } else {
            for (gameNumber, count) in recordArr.enumerated() {
                print("\(gameNumber + 1)번째 게임: 시도 횟수 - \(count)")
            }
        }
    }
    
    func playBall() {
        
        let comNumber = makeAnswer()
        // Try 횟수 기록을 위한 tryCount 변수 생성
        var tryCount = 0
        
        while true {
            guard let userInput = readLine(), userInput.count == 3, let userNumber = Int(userInput),
                  Set(userInput).count == 3 else {
                print("중복되지 않는 세 자리 숫자를 입력하세요.")
                continue
            }
            
            // userInput 1회마다 tryCount 1 증가
            tryCount += 1
            
            let (strike, ball) = referee(comNumber, userNumber)
            
            if strike == 3 {
                print("Homerun!")
                // 정답을 맞췄을 경우 tryCount를 recordArr 배열 인덱스로 추가
                recordArr.append(tryCount)
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
