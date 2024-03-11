import UIKit

// LV.2 Calculator
// - Lv1에서 만든 Calculator 클래스에 “나머지 연산”이 가능하도록 코드를 추가하고, 연산 진행 후 출력
// - ex) 나머지 연산 예시 : 6을 3으로 나눈 나머지는 0 / 5를 3으로 나눈 나머지는 2

class Calculator2 {
    func calculate(operator: String, firstNumber: Double, secondNumber: Double) -> Double {
        switch `operator` {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            guard secondNumber != 0 else {
                fatalError("0으로 나눌 수 없습니다.")
            }
            return firstNumber / secondNumber
        case "%":
            // 실수 연산에서 나머지를 연산하는 방법. % 가 먹히지 않을 때.
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
        default:
            fatalError("잘못된 연산입니다.")
        }
    }
}

let calculator2 = Calculator2()

let addResult2 = calculator2.calculate(operator: "+", firstNumber: 10, secondNumber: 3)
let subtractResult2 = calculator2.calculate(operator: "-", firstNumber: 10, secondNumber: 3)
let multiplyResult2 = calculator2.calculate(operator: "*", firstNumber: 10, secondNumber: 3)
let divideResult2 = calculator2.calculate(operator: "/", firstNumber: 10, secondNumber: 3)
let remainderResult2 = calculator2.calculate(operator: "%", firstNumber: 10, secondNumber: 3)

print("LV.2 더하기 : \(addResult2)")
print("LV.2 빼 기 : \(subtractResult2)")
print("LV.2 곱하기 : \(multiplyResult2)")
print("LV.2 나누기 : \(divideResult2)")
print("LV.2 나머지 : \(remainderResult2)")
