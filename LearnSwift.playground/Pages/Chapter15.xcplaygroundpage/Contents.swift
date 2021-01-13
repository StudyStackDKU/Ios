//: # 스위프트의 에러핸들링 이해하기
/*:
 2 steps
 * 에러 발생(throwing)
 * throwing된 에러 잡아서 처리
 */
//: ## 1. 에러타입 선언
enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}

//: ## 2. 에러 던지기: throw 구문과 guard 구문 결합하여 사용
let connectionOK = true
let connectionSpeed = 30.00
let fileFound = false

func fileTransfer() throws { // 리턴값이 있다면 throuws 다음에 명시 ex) throws -> Bool
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
}

/*:
 ## 3. 에러를 던지는 메서드와 함수 호출
 
 에러 던지게 선언된 함수와 메서드는 일반적인 방법으로 호출 불가
 * try로 호출해야
 * do-catch로 호출해야함(던져진 모든 에러 잡아서 처리)
 */

func sendFile() -> String { // do-catch로 호출
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return "No Network Connection"
    } catch FileTransferError.lowBandwidth {
        return "File Transfer Speed too Low"
    } catch FileTransferError.fileNotFound {
        return "File not Found"
    } catch {
        return "Unknown error"
    }
    
    return "Successful transfer"
}
print(sendFile())

//: 에러 객체에 접근하기
/*
do {
    try fileTransfer()
} catch let error {
    print("Error: \(error.localizedDescription)") // 현재는 오류지만 이런식으로 사용한다,,
}
*/
/*:
 ## 4. 에러 캐칭 비활성화
 
 try! 구문을 사용하여 do-catch 구문 내에서 메서드 호출되도록 감싸지 않아도 스로잉 메서드 강제 실행
 */
try! fileTransfer // 이 메서드 호출은 어떠한 에러도 발생하지 않을 것이라고 컴파일러에게 일러줌. 에러 나오면 런타임 에러,,,가급적 자제

/*:
 ## 5. defer 구문
 
 catch절이 반환하기 전에 별도의 작업 수행하는게 효과적일 수도 있다.
 
 이때 **defer**구문 이용!
 */
func sendFile2() -> String {
    defer { // 메서드가 어떤 반환을 하든지 제어권 반환 전에 이 영역 수행함
        removeTmpFiles()
        closeConnection()
    }
    
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return "No Network Connection"
    } catch FileTransferError.lowBandwidth {
        return "File Transfer Speed too Low"
    } catch FileTransferError.fileNotFound {
        return "File not Found"
    } catch {
        return "Unknown error"
    }
    
    return "Successful transfer"
}
