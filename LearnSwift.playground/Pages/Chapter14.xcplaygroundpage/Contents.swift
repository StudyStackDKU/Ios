//: # 스위프트의 배열과 딕셔너리 컬렉션으로 작업하기
/*:
 ## 1. 스위프트의 배열
 * 가변형 배열(var), 불변형 배열(let)
 * 기본적으로 동일한 타입의 값만
 * 여러 타입이 혼합된 배열도 생성 가능 - 1) type annotation 2) type inference
 */
var treeArray: [String] = ["Pine", "Oak", "Yew"] // 타입 명시
var treeArray2 = ["Pine", "Oak", "Yew"] // 타입 추론: 이제 이 배열에는 String만 담긴다
var priceArray = [Float]() // 생성할 때 꼭 값을 할당하지 않아도 된다
var nameArray = [String](repeating: "My String", count: 10) // 디폴트 값, 특정 크기로 배열 초기화
print(nameArray) // My String이 10번 출력됨
let thirdArray = treeArray2 + nameArray // 배열을 연결하여 저장할 수 있음

/*:
 ## 2. 배열 작업
 
 메서드와 프로퍼티를 알아보자
 */
var itemCount = treeArray.count // 항목 개수
if treeArray.isEmpty { // 배열이 비어있는지 확인
    print("treeArray는 비어있다")
}
print(treeArray[2]) // 배열 항목 접근
let shuffledTrees = treeArray.shuffled() // 원소 순서가 무작위로 섞인 새로운 배열 반환
let randomElement = treeArray.randomElement() // 배열의 랜덤 요소 반환
treeArray.append("Redwood") // append로 항목 추가
treeArray += ["Maple"] // + 연산으로 항목 추가
treeArray.insert("Birch", at: 0) // 0번 인덱스에 원소 새로 추가: 기존 항목은 뒤로 밀림
treeArray.remove(at: 0) // 0번 인덱스 원소 삭제
treeArray.removeLast() //  배열의 마지막 항목 삭제
for tree in treeArray { // 배열의 항목 반복
    print(tree)
}

/*:
 ## 3. 타입이 혼합된 배열
 * 스위프트의 **Any**타입 사용
 * 다운캐스팅이 필요할 수 있음
 */
let mixedArray: [Any] = ["A String", 432, 34.989] // String, Int, Float 배열

// 아래는 다운캐스팅이 필요한 경우: Any * Int와 같은 연산 불가능..
// 하지만 String을 Int로 캐스팅하지 못하기 때문에 여전히 에러 발생
for object in mixedArray {
    // print(object as! Int * 10) // as!는 다운캐스팅 위함. 업캐스팅은 as로 가능
}

/*:
 ## 4. 스위프트 딕셔너리
 * key, value쌍으로 이루어진 순서 없는 컬렉션
 * type annotation, type inference로 키, 밸류 타입 컴파일러가 식별
 */
var bookDict = ["100-432112" : "Wind in the Willows",
                "200-532874" : "Tale of Two Cities",
                "202-546549" : "Sense and Sensibility",
                "104-109834" : "Shutter Island"]
var bookDict2: [String: String] = ["100-432112" : "Wind in the Willows",
                                   "200-532874" : "Tale of Two Cities",
                                   "202-546549" : "Sense and Sensibility",
                                   "104-109834" : "Shutter Island"]
var myDictionary = [Int: String]()
/*:
**zip**함수를 이용하여 시퀀스를 이용하여 딕셔너리를 초기화 할 수 있음
 
 bookDict3, 4, 5는 동일한 딕셔너리
 */
let keys = ["100-432112", "200-532874", "202-546549", "104-109834"]
let values = ["Wind in the Willows", "Tale of Two Cities", "sense and Sensibiility", "Shutter Island"]
let bookDict3 = Dictionary(uniqueKeysWithValues: zip(keys, values))
let bookDict4 = Dictionary(uniqueKeysWithValues: zip(1..., values))
var bookDict5 = [1: "Wind in the Willows",
                 2: "Tale of Two Cities",
                 3: "Sense and Sensibility",
                 4: "Shutter Island"]
/*:
 ## 5. 딕셔너리 작업
 */
print(bookDict.count) // 딕셔너리 항목 개수
print(bookDict["200-532874"]) // 키 참조하여 value 찾기
print(bookDict["999-546547", default: "Book not found"]) // 지정된 키에 해당하는 값이 없을 경우 디폴트값 리턴
bookDict["200-532874"] = "Sense and Sensibility" // 특정 키와 연결된 값 갱신(1)
bookDict.updateValue("The Ruins", forKey: "200-532874") // 특정 키와 연결된 값 갱신(2)
bookDict["300-898871"] = "The overlook" // 키값쌍 추가
bookDict["300-898871"] = nil // 키값쌍 제거(1)
bookDict.removeValue(forKey: "300-898871") // 키값쌍 제거(2)
for (bookid, title) in bookDict { // 딕셔너리 반복
    print("BookId: \(bookid) Title: \(title)")
}
