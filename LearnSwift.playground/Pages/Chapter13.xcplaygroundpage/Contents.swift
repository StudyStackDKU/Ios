//: # 스위프트 프로퍼티 래퍼
/*:
 프로퍼티에 있는 값의 변환작업이나 유효성 검사가 필요한 경우 있음
 
 연산 프로퍼티로 구현할 수 있지만 유사한 패턴을 가지는 경우 많다..
 
 이를 해결하는 방법 = 프로퍼티 래퍼
 
 동일한 기능의 연산 프로퍼티를 효율적으로 관리하기 위함
 */

//: ## 1. 연산 프로퍼티로 구현 예제 - 도시 이름을 대문자로 저장하고 싶음
struct Address {
    private var cityname: String = ""
    var city: String {
        get { cityname }
        set { cityname = newValue.uppercased() }
    }
}
// 구조체 테스트
var address = Address()
address.city = "London"
print(address.city) // LONDON

// propertyWrapper 구현 예제
@propertyWrapper
struct FixCase {
    private(set) var value: String = ""
    
    var wrappedValue: String { // 게터와 세터 코드가 포함된 wrappedValue 프로퍼티 가져야 함
        get { value }
        set { value = newValue.uppercased() }
    }
    
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}
// 프로퍼티 래퍼 사용: name, city, country에 대해 대문자 변환 연산 프로퍼티 따로 만들 필요 없음. 규격 제공!
struct Contact {
    @FixCase var name: String
    @FixCase var city: String
    @FixCase var country: String
}
var contact = Contact(name: "John Smith", city: "London", country: "United Kingdom")
print("\(contact.name), \(contact.city), \(contact.country)")

/*:
 ## 2. 여러 변수와 타입 지원하는 프로퍼티 래퍼
 * 프로퍼티 래퍼는 특정 **프로토콜**을 따르는 모든 타입과 작업 가능
 */
@propertyWrapper
struct MinMaxVal {
    var value: Int
    let max: Int
    let min: Int
    
    init(wrappedValue: Int, min: Int, max: Int) {
        value = wrappedValue
        self.min = min
        self.max = max
    }
    var wrappedValue: Int {
        get { return value }
        set {
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}

struct Demo {
    @MinMaxVal(min: 100, max: 200) var value: Int = 100
}

var demo = Demo()
demo.value = 150
print(demo.value)

demo.value = 250
print(demo.value)

//: 여러 타입과 함께 작업하도록 구현
// 현재 프로퍼티 래퍼 목적은 비교 작업: **Foundation 프레임워크**에 포함된 **Comparable 프로토콜**을 따르는 모든 데이터 타입 지원케 수정
@propertyWrapper
struct MinMaxVal2<V: Comparable> { // Comparable 프로토콜을 따르는 모든 타입에도 사용 가능
    var value: V
    let max: V
    let min: V
    
    init(wrappedValue: V, min: V, max: V) {
        value = wrappedValue
        self.min = min
        self.max = max
    }
    
    var wrappedValue: V {
        get { return value }
        set {
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}
struct Demo2 {
    @MinMaxVal2(min: "Apple", max: "Orange") var value: String = ""
}
var demo2 = Demo2()
demo2.value = "Banana"
print(demo2.value)

demo2.value = "Pear"
print(demo2.value)
