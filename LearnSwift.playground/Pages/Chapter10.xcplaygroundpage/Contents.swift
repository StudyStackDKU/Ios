//: # 스위프트의 객체 지향 프로그래밍 기초

//: ## 1. 클래스 선언과 초기화
class BankAccount {
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    
    func displayBalance() { // 인스턴스 메소드
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
    class func getMaxBalance() -> Float { // 타입 메소드: 인스턴스 생성 없이도 사용 가능
        return 100000.00
    }
}

var account1: BankAccount = BankAccount()
/*:
 * 생성자: init
 * 소멸자: deinit
 */

/*:
 ## 2. 저장 프로퍼티, 연산 프로퍼티
 * 저장 프로퍼티: 상수, 변수에 담기는 값
 * 연산 프로퍼티: 로직에 의해 처리된 값. getter, setter등을 생성함
 */
class BankAccount2 {
    var accountBalance: Float = 0 // 저장 프로퍼티
    var accountNumber: Int = 0 // 저장 프로퍼티
    let fees: Float = 25.00 // 저장 프로퍼티
    
    var balanceLessFees: Float { // 연산 프로퍼티
        get { // 게터 생성
            return accountBalance - fees
        }
        set(newBalance) { // 선택적으로 세터 생성
            accountBalance = newBalance - fees
        }
    }
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }
    func displayBalance() { // 인스턴스 메소드
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
    class func getMaxBalance() -> Float { // 타입 메소드: 인스턴스 생성 없이도 사용 가능
        return 100000.00
    }
}
var account2: BankAccount2 = BankAccount2(number: 10, balance: 2000)
account2.displayBalance()
var balance2 = account2.balanceLessFees // 게터 작동
print("balance2: \(balance2)")
account2.balanceLessFees = 12123.12 // 세터 작동
account2.displayBalance()

/*:
 ## 3. 지연 저장 프로퍼티
 프로퍼티를 최초로 접근할 때만 초기화 --> 클로저를 사용한 초기화작업의 시간과 리소스 아끼기
 * **lazy**키워드 사용함 --> lazy var myProperty: String = {...}()
 * 반드시 var로 선언되어야 함
 */


/*:
 ## 4. self
 스위프트에서는 self를 사용하지 않아도 디폴트로 프로퍼티 접근함
 다음 상황에서는 **self를 무조건 사용해야**함
 - 클로저 표현식 내에서 프로퍼티나 메서드를 참조
 - 함수의 매개변수 == 클래스 프로퍼티
 */

/*:
 ## 5. protocol
 protocol 키워드로 선언
 클래스가 반드시 포함해야 하는 메소드와 프로퍼티 정의
 어떤 프로퍼티가 어떤 프로토콜 채택함 ->
 */
protocol MessageBuilder {
    var name: String { get } // gettable, settable 명시
    func buildMessage() -> String
}
class MyClass: MessageBuilder {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        "Hello" + name
    }
}

/*:
 ## 6. 불투명 반환 타입
 지정된 프로토콜 따르는 모든 타입이 반환되게끔 만든다.
 */
func doubleFunc1(value: Int) -> some Equatable { // Equatable은 스위프트가 제공하는 표준 프로토콜
    value * 2
}
func doubleFunc2(value: String) -> some Equatable {
    value + value
}
