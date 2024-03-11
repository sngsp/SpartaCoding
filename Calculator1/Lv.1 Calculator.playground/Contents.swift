import UIKit

// LV.1 Calculator
// - 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들기
// - 생성한 클래스를 이용하여 연산을 진행하고 출력
class Calculator1 {
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
        default:
            fatalError("잘못된 연산입니다.")
        }
    }
}

let calculator1 = Calculator1()

let addResult1 = calculator1.calculate(operator: "+", firstNumber: 10, secondNumber: 3)
let subtractResult1 = calculator1.calculate(operator: "-", firstNumber: 10, secondNumber: 3)
let multiplyResult1 = calculator1.calculate(operator: "*", firstNumber: 10, secondNumber: 3)
let divideResult1 = calculator1.calculate(operator: "/", firstNumber: 10, secondNumber: 3)

print("LV.1 더하기 : \(addResult1)")
print("LV.1 빼 기 : \(subtractResult1)")
print("LV.1 곱하기 : \(multiplyResult1)")
print("LV.1 나누기 : \(divideResult1)")
