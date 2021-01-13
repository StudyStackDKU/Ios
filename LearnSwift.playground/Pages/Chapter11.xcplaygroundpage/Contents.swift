//: # 스위프트의 서브클래싱과 익스텐션 개요

/*:
 ## 1. 스위프트 상속
 단일 상속.. 오로지 한 개의 부모 클래스만 가능
 
 은행 계좌를 상속하는 저축 계좌를 만들어보자!
 */
class BankAccount {
    var accountBalance: Float
    var accountNumber: Int
    
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }
    
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
}

class SavingAccount: BankAccount {
    var interestRate: Float = 0.0
    func calculateInterest() -> Float { // 추가 메서드 구현
        return interestRate * accountBalance
    }
}

/*:
 ## 2. 메소드 오버라이드
 하위 클래스 오버라이딩 메서드의 규칙
 * 부모 클래스 메서드의 **매개변수 개수, 타입이 일치**
 * 부모 클래스 메서드의 **반환 타입 일치**
 */
class SavingAccount2: BankAccount {
    var interestRate: Float = 0.0
    
    func calculateInterest() -> Float { // 추가 메서드 구현
        return interestRate * accountBalance
    }
    
    override func displayBalance() { // 오버라이딩 메소드 구현
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
        // 위 두 줄은 아래 추석 코드로 치환 가능: 부모 메소드 호출
        // super.displayBalance()
        print("Prevailing interest rate is \(interestRate)")
    }
}

/*:
 ## 3. 자식 클래스 init
 부모 클래스의 init은 자식 초기화 후 호출해야함
 */
class SavingAccount3: BankAccount {
    var interestRate: Float = 0.0
    
    init(number: Int, balance: Float, rate: Float) { // 초기화
        interestRate = rate
        super.init(number: number, balance: balance)
    }
    func calculateInterest() -> Float { // 추가 메서드 구현
        return interestRate * accountBalance
    }
    
    override func displayBalance() { // 오버라이딩 메소드 구현
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
        // 위 두 줄은 아래 추석 코드로 치환 가능: 부모 메소드 호출
        // super.displayBalance()
        print("Prevailing interest rate is \(interestRate)")
    }
}

/*:
 ## 4. 익스텐션
 하위 클래스를 생성하지 않고, 기존 클래스에 메서드, initialize, 연산 프로퍼티, 서브스크립트 등의 기능을 추가하기 위해 사용
 */
extension Double {
    var sqared: Double { // 연산 프로퍼티 추가(1)
        return self*self
    }
    
    var cubed: Double { // 연산 프로퍼티 추가(2)
        return self*self*self
    }
}
print(3.0.sqared) // 확장한 연산 프로퍼티를 상속 없이 사용 가능
print(6.0.cubed)
