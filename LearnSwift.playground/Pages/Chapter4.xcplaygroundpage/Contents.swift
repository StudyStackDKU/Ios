//: 데이터 타입
print("Int32 Min = \(Int32.min) Int32 Max = \(Int32.max)")
var myChar1 = "f"
var myChar2 = ":"
var myChar3 = "X"
var myChar4 = "\u{0058}"
var userName = "John"
var inboxCount = 25
let maxCount = 100

//: string interporation
var message = "\(userName) has \(inboxCount) messages. Message capacity remaining is \(maxCount - inboxCount) messages"
print(message)

//: 여러 줄의 문자열 선언하기 - 삼중 따옴표 기준으로 들여쓰면 들여쓰기 반영됨
var multiline = """
    The console glowed with flashing warnings.
    Clearly time was running out.

    "I thought you siad you knew how to fly this!" yelled Mary.
    "It was much easier on the simulator" replied her brother,
    trying to keep the panic out of his voice.
"""
print(multiline)

/*:
 # 변수와 상수
 **변수**: 변경 가능. var
 **상수**: 변경 불가. let
 애플은 가능한 변수보다 상수 사용 권장
 */

//: 타입 선언과 타입 추론
//: 1) 정수형으로 선언하기
var userCount: Int = 10

//: 2) 타입 추론 사용 - 반드시 선언시 값 초기화(상수는 나중에 할당 가능)
var signalStrength = 2.231
let companyName = "My Company"
let bookTitle: String

//: 튜플 - 서로 다른 타입 함께 저장 가능
let myTuple = (10, 432.433, "This is a String")
let myString = myTuple.2
print(myString)


let (myInt, myDouble, myString2) = myTuple
var (myInt2, _, myString3) = myTuple //: 특정 원소 무시 가능
let mytuple2 = (count: 10, length: 432.433, message: "this is a String")
print(mytuple2.message)

//: 옵셔널 타입 - ?로 옵셔널 선언
var index: Int?
index = 3
var treeArray = ["Oak", "Pine", "Yew", "Birch"]
if index != nil {
    // index 변수는 값이 할당되어 있음 - 래핑되었다! --> 언래핑으로 값 꺼낸다
    print(treeArray[index!])
} else{
    // index 변수는 값이 할당되어 있지 않다
    print("index does not contain a value")
}

//: 언래핑 대신 옵셔널 바인딩으로 임시변수/상수에 값 할당 가능
//: 임시변수, 임시상수? if나 반복문에서만 유효한 변숭
if let myValue = index{
    print(treeArray[myValue])
} else{
    print("index does not contain a value")
}

