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

print("--------------------------------------")

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

print("--------------------------------------")

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


print("--------------------------------------")

// LV.4 Calculator
// - AbstractOperation라는 **추상화된** 클래스를 만들기
// - 기존에 구현한 AddOperation(더하기), SubtractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 클래스들과 관계를 맺고
// - Calculator 클래스의 내부 코드를 변경

class Abstract {
    func operate(_ a: Double, _ b: Double) -> Double {
        fatalError("잘못된 연산입니다.")
    }
}

class Add4: Abstract {
    override func operate(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class Subtract4: Abstract {
    override func operate(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class Multiply4: Abstract {
    override func operate(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class Divide4: Abstract {
    override func operate(_ a: Double, _ b: Double) -> Double {
        guard b != 0 else {
            fatalError("0으로 나눌 수 없습니다.")
        }
        return a / b
    }
}

class Remainder4: Abstract {
    override func operate(_ a: Double, _ b: Double) -> Double {
        return a.truncatingRemainder(dividingBy: b)
    }
}

class Calculator4 {
    func calculate(operation: Abstract, firstNumber: Double, secondNumber: Double) -> Double {
        return operation.operate(firstNumber, secondNumber)
    }
}

let calculator4 = Calculator4()
let add4 = Add4()
let subtract4 = Subtract4()
let multiply4 = Multiply4()
let divide4 = Divide4()
let remainder4 = Remainder4()

let addResult4 = calculator4.calculate(operation: add4, firstNumber: 10, secondNumber: 3)
let subtractResult4 = calculator4.calculate(operation: subtract4, firstNumber: 10, secondNumber: 3)
let multiplyResult4 = calculator4.calculate(operation: multiply4, firstNumber: 10, secondNumber: 3)
let divideResult4 = calculator4.calculate(operation: divide4, firstNumber: 10, secondNumber: 3)
let remainderResult4 = calculator4.calculate(operation: remainder4, firstNumber: 10, secondNumber: 3)

print("LV.4 더하기 : \(addResult4)")
print("LV.4 빼 기 : \(subtractResult4)")
print("LV.4 곱하기 : \(multiplyResult4)")
print("LV.4 나누기 : \(divideResult4)")
print("LV.4 나머지 : \(remainderResult4)")
