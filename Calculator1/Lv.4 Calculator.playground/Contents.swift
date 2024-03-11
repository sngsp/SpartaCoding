import UIKit

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
