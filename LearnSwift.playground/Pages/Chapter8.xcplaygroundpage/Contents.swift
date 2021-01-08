//: Swuift의 switch 구문 - 기존 switch와 다른 점?

//:  1) case 결합 가능
let value = 1
switch (value) {
case 0, 1, 2: //: 여러 개 케이스 결합!
    print("zero, one or two")
case 3:
    print("three")
default:
    print("default..")
}

//: 2) 범위 매칭 가능
let temp = 83
switch (temp) {
case 0...49:
    print("Cold!")
case 50...79:
    print("Warm")
default:
    print("Out of range")
}

//: 3) where구문 - 조건절. sql과 비슷
switch (temp) {
case 0...49 where temp % 2 == 0:
    print("cold and even")
case 50...79 where temp % 2 == 0:
    print("hot and even")
default:
    print("default..")
}

//: 4) fallthrough - break이 필요 없지만, 여러 케이스 흐름 가능케
//: break문은 default에서 아무 것도 하기 싫을 때 사용하면 좋아
switch (temp) {
case 0...49 where temp % 2 == 0:
    print("cold and even")
    fallthrough
case 50...79 where temp % 2 == 0:
    print("hot and even")
    fallthrough
default:
    break
}
