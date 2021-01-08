/*:
# 스위프트 5의 함수, 메서드, 클로저 개요
## 1. 함수 시그니처: (함수이름, 매개변수, 반환결과타입)
## 2. 단일 표현식에서의 암묵적 변환 - 아래 두 함수는 동일한 결과를 리턴
 */
func buildMessageFor(name: String, count: Int) -> String {
    return "\(name), you are customer number \(count)"
}
func buildMessageFor2(name: String, count: Int) -> String {
    // let uppername = name.uppercased() 이 구문 들어가면 컴파일 에러.. 단일 표현식이 아니기 때문에
    "\(name), you are customer number \(count)"
}

/*:
 ## 3. local, external parameter name
 지역 매개변수명: 함수 코드 내에서 참조할 수 있는 이름
 외부 매개변수명: 함수가 호출될 때 참조되는 매개변수 이름
 */
//: 1) name과 count를 local, external로 동시에 사용중
let message = buildMessageFor(name: "John", count: 100)
//: 2) default external은 없앨 수 있다.
func buildMessageFor3(_ name: String, _ count: Int) -> String {
    "\(name), you are customer number \(count)"
}
let message3 = buildMessageFor3("John", 100)
/*:
 3) external 다르게 바꿀 수도 있다.
 **굳이 다르게 설정해야하는 이유는 뭐지?**
 */
func buildMessageFor4(userName name: String, userCount count: Int) -> String {
    "\(name), you are customer number \(count)"
}
let message4 = buildMessageFor4(userName: "John", userCount: 100)

/*:
 ## 4. 디폴트 매개변수 선언하기
 디폴트 값을 설정한 매개변수에 대해 지역 매개변수명을 기반으로한 디폴트 외부 매개변수명 제공
 */
func buildMessageFor5(name: String = "Customer", count: Int) -> String {
    "\(name), you are customer number \(count)"
}
let message5 = buildMessageFor5(count: 100)
print(message5)

/*:
 ## 5. 여러 결과 반환
 튜플로 래핑해서 여러 개 반환
 */
func sizeConverter(_ length: Float) -> (yards: Float, centimeters: Float, meters: Float) {
    let yards = length * 0.027778
    let centimeters = length * 2.54
    let meters = length * 0.0254
    return (yards, centimeters, meters)
}
let lengthTuple = sizeConverter(20)
print(lengthTuple.yards)
print(lengthTuple.centimeters)
print(lengthTuple.meters)

/*:
 ## 6. 가변개수 매개변수
 매개변수 개수를 명시 안해줄 수 있다.
 */
func displayStrings(_ strings: String...) {
    for string in strings {
        print(string)
    }
}
displayStrings("one", "two", "three")
displayStrings("one", "two", "three", "fouar")

/*
 ## 7. 변수인 매개변수
 매개변수는 상수이다.
 수정 위해 변수에 매개변수 복사(얕은복사)해서 사용함
 */
func calcuateArea(length: Float, width: Float) -> Float {
    var length = length
    var width = width
    
    length = length * 2.54
    width = width * 2.54
    return length * width
}
/*:
 ## 8. in-out parameter
 매개변수를 복사해 사용해도 원본 변수는 변경이 안됨
 매개변수를 변경시키고싶다면, **입출력 매개변수**로 선언해야함. 호출시 매개변수로 주소 넘겨줌
 */
func doubleValue (_ value: inout Int) -> Int {
    value += value
    return value
}
var myValue: Int = 20
print("Before function call myValue = \(myValue)") // 20
print("doubleValue call returned \(doubleValue(&myValue))") // 20 -> 40
print("After function call myValue = \(myValue)") // 40: 원본 값이 변경됨

/*:
 ## 9. 함수를 상수나 변수에 할당
 */
func inchesToFeet (_ inches: Float) -> Float {
    inches * 0.083333
}
func inchesToYards (_ inches: Float) -> Float {
    inches * 0.0277778
}

let toFeet = inchesToFeet // 함수를 상수에 할당해버림..!
let result = toFeet(10) // 상수에 저장한 함수를 상수로 호출해버림..!
let toYards = inchesToYards
//: 함수를 매개변수로 설정할 수도 있음
func outputConversion(_ conterterFunc: (Float) -> Float, value: Float) {
    let result = conterterFunc(value)
    print("Result of conversion is \(result)")
}
outputConversion(toYards, value: 10) // yard로
outputConversion(toFeet, value: 10) // feet로
//: 함수를 return값으로 설정도 가능
func decideFunction(_ feet: Bool) -> (Float) -> Float {
    if feet {
        return toFeet // 밖에서 선언한 '상수'인데 함수 안쪽에서 사용이 되네..?!
    } else {
        return toYards
    }
}
    }
}

/*:
 ## 10. 클로저 표현식
 closure expression: 독립적인 코드 블록. 비동기 메서드 호출에 자주 사용함
 함수와 비슷하지만 다음과 같은 차이 있음
    * 클로저 표현식은 이름이 없음
    * 매개변수와 반환 타입이 괄호{} 안에 포함됨
    * 클로저 표현식의 코드 가리키는 **in** 키워드를 사용함
 */
let sayHello = { print("Hello") } // 클로저 표현식(1)
let multiply = { (_ val1: Int, _ val2: Int) -> Int in // 클로저 표현식(2)
    return val1 * val2
}

/*:
 ## 11. 클로저
 closure: 독립적인 코드 블록(ex. 클로저)과 코드 블록 주변에 있는 하나 이상의 변수가 결합된 것
 */
func functionA() -> () -> Int {
    var counter = 0
    func function B() -> Int { // 카운터 변수를 잡고있으므로 클로저로 간주됨
        return counter + 10
    }
    return functionB
}
let myClosure = functionA() // functionB를 반환: 클로저를 반환함
let result = myClosure() // functionB의 결과를 반환

