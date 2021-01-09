//: # 스위프트 구조체
/*:
 * 구조체도 extension, protocol, init 가능
 * 상속, deinit 없음
 * 런타임에서 클래스 인스턴스 유형은 식별되지만 구조체는 아니다..
 
 일반적으로 구조체가 클래스보다 효율적이고 멀티 스레드에 안정적임 - 이때는 구조체
 
 상속, 데이터 캡슐화 이용, 소멸자 사용 필요(소멸시 리소스 확보 작업 필요) - 이때는 클래스
 ## 1. 값 타입 vs 참조 타입
 구조체 인스턴스: 값 타입 -> 복사하면 다른 공간에 할당됨
 
 클래스 인스턴스: 참조타입 -> 복사하면 동일 공간 공유
 */
// 구조체 예시
struct SampleStruct {
    var name: String
    init(name: String) {
        self.name = name
    }
}
var myStruct1 = SampleStruct(name: "Mark")
var myStruct2 = myStruct1
myStruct2.name = "David"
print(myStruct1.name) // Mark
print(myStruct2.name) // David

// 클래스 예시
class SampleClass {
    var name: String
    init(name: String) {
        self.name = name
    }
}
var myClass1 = SampleClass(name: "Mark")
var myClass2 = myClass1
myClass2.name = "David"
print(myClass1.name) // David
print(myClass2.name) // David
