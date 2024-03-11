import UIKit

// lv.3 계산기
// - 아래 각각의 클래스들을 만들고 클래스간의 관계를 고려하여 Calculator 클래스와 관계 맺기
// - AddOperation(더하기)
// - SubstractOperation(빼기)
// - MultiplyOperation(곱하기)
// - DivideOperation(나누기)
// - Calculator 클래스의 내부코드를 변경
// - 관계를 맺은 후 필요하다면 별도로 만든 연산 클래스의 인스턴스를 Calculator 내부에서 사용

class Add3 {
    func operate(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class Subtract3 {
    func operate(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class Multiply3 {
    func operate(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class Divide3 {
    func operate(_ a: Double, _ b: Double) -> Double {
        guard b != 0 else {
            fatalError("0으로 나눌 수 없습니다.")
        }
        return a / b
    }
}

class Remainder3 {
    func operate(_ a: Double, _ b: Double) -> Double {
        return a.truncatingRemainder(dividingBy: b)
    }
}

class Calculator {
    func calculate(operation: (Double, Double) -> Double, firstNumber: Double, secondNumber: Double) -> Double {
        return operation(firstNumber, secondNumber)
    }
}

let calculator3 = Calculator()
let add3 = Add3()
let subtract3 = Subtract3()
let multiply3 = Multiply3()
let divide3 = Divide3()
let remainder3 = Remainder3()

let addResult3 = calculator3.calculate(operation: add3.operate, firstNumber: 10, secondNumber: 3)
let subtractResult3 = calculator3.calculate(operation: subtract3.operate, firstNumber: 10, secondNumber: 3)
let multiplyResult3 = calculator3.calculate(operation: multiply3.operate, firstNumber: 10, secondNumber: 3)
let divideResult3 = calculator3.calculate(operation: divide3.operate, firstNumber: 10, secondNumber: 3)
let remainderResult3 = calculator3.calculate(operation: remainder3.operate, firstNumber: 10, secondNumber: 3)

print("LV.3 더하기: \(addResult3)")
print("LV.3 빼 기: \(subtractResult3)")
print("LV.3 곱하기: \(multiplyResult3)")
print("LV.3 나누기: \(divideResult3)")
print("LV.3 나머지: \(remainderResult3)")
