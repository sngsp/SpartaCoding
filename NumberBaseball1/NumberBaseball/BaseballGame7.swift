//
//  BaseballGameMAX.swift
//  NumberBaseball
//
//  Created by Seungseop Lee on 3/13/24.
//

// [ lv. 7 Number Baseball ]
// 과제는 BaseBallGame6 파일에서 모두 구현하였습니다.
// 이 파일은 제가 생각하기에 추가적으로 구현할 수 있을 것 같은 코드를 더 작성한 파일입니다.
// 과제와 연관성없이 구현하고싶은 추가 기능들이 들어가있습니다.
// 예쁘게 봐주신다면 감사히 피드백 받겠습니다.

import Cocoa

class BaseballGame7: NSObject {
    
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
            case 2:
                print("< 게임 기록 보기 >")
                recordPrint()
                start()
            case 3:
                print("< 숫자 야구 게임을 종료합니다 >")
                exit(0)
            default:
                print("올바른 숫자를 입력하세요.")
                start()
            }
        }
    
    // 게임을 종료시키지 않으면서 기록만 삭제할 수 있는 함수를 구현해보았습니다.
    // 2번을 입력했을 때, 기록이 존재할 경우에만 게임 기록의 삭제 여부를 묻는 함수입니다.
    // y를 입력하면 초기화되며 y를 제외한 모든 입력의 경우에는 메인 화면으로 돌아갑니다.
    // 입력이 없을 경우 다시 한 번 묻습니다.
    func recordReset() {
        
        print("이전 게임 기록을 모두 삭제하시겠습니까?")
        print("삭제하시려면 y, 이전 화면으로 돌아가시려면 아무 키나 입력해주십시오.")
        
        guard let userChoice = readLine(), !userChoice.isEmpty else {
            print("입력값이 없습니다.")
            recordReset()
            return
        }
        
        switch userChoice {
        case "y":
            recordArr = []
            print("이전 게임 기록을 모두 삭제했습니다. 메인 화면으로 돌아갑니다.")
        default :
            print("메인 화면으로 돌아갑니다.")
        }
        
    }
    
    // 플레이 순서에 따라서 순차적으로 출력되던 recordPrint 함수를 수정하여 최고 기록부터 최저 기록까지 순서대로 출력되도록 바꾸었습니다.
    // 등수가 차례대로 표기되며 각 등수마다 몇 번째 게임이었는지, 몇 번의 시도를 했는지가 출력됩니다.
    func recordPrint() {
        
        if recordArr.isEmpty {
                print("플레이한 기록이 없습니다.")
            } else {
                let sortedRecords = recordArr.sorted()
                for (index, count) in sortedRecords.enumerated() {
                    let gameNumber = recordArr.firstIndex(of: count)! + 1
                    print("\(index + 1)등: \(gameNumber)번째 게임 - 시도 횟수 \(count)")
                    // recordReset이 기록이 없을 경우에는 실행되지 않으며, 기록이 존재하는 경우에만 삭제 여부를 묻습니다.
                }
                recordReset()
            }
    }
    
    func playBall() {
        
        let comNumber = makeAnswer()
        var tryCount = 0
        
        while true {
            guard let userInput = readLine(), userInput.count == 3, let userNumber = Int(userInput),
                  Set(userInput).count == 3 else {
                print("중복되지 않는 세 자리 숫자를 입력하세요.")
                continue
            }
            
            tryCount += 1
            
            let (strike, ball) = referee(comNumber, userNumber)
            
            if strike == 3 {
                print("Homerun!")
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
