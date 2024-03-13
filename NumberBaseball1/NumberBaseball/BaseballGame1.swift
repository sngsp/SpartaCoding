//
//  baseballGame1.swift
//  NumberBaseball
//
//  Created by Seungseop Lee on 3/12/24.
//

// [ lv. 1 Number Baseball]
// - 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
// - 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

import Cocoa

class BaseballGame1: NSObject {
    
    func start() {
        
        let comNumber = makeAnswer()
        var userNumber: Int =  0
        
        // User의 입력값 받아 Int형으로 변환하기 (정답 전까지 무한입력)
        while true {
            
            let userInput = readLine()
            
            // if let으로 Optional("1")을 벗겨서 "1"을 input에 담음
            if let input = userInput {
                // String을 Int로("1" 을 1로) 형변환시켜서 number에 담음
                if let number = Int(input) {
                    userNumber = number
                }
            }
            
            // 정답일 경우 while문을 break
            if userNumber == comNumber {
                print("Homerun!")
                break
            }
        }
    }
    
    // 컴퓨터의 랜덤한 세 자리 수를 생성하는 함수
    func makeAnswer() -> Int {
        
        var computerAnswer = 0
        var isUnusableNumber = true
        
        while isUnusableNumber {
            computerAnswer = Int.random(in: 123...987)
            
            // 각 자리별 숫자 지정
            let hundredsDigit = computerAnswer / 100
            let tensDigit = (computerAnswer / 10) % 10
            let onesDigit = computerAnswer % 10
            
            // 0이 포함되지 않은 경우만 포함
            if hundredsDigit != 0 && tensDigit != 0 && onesDigit != 0 {
                // 각 자리 숫자가 중복되지 않은 경우에만 while 종료
                if hundredsDigit != tensDigit && tensDigit != onesDigit && onesDigit != hundredsDigit {
                    // 빠른 정답 판독을 위해 computerAnswer를 print하도록 임시로 설정
                    print("정답 미리보기 : \(computerAnswer)")
                    isUnusableNumber = false
                }
            }
        }
        return computerAnswer
    }

}
