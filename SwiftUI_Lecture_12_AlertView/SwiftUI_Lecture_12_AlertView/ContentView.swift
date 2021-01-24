//
//  ContentView.swift
//  SwiftUI_Lecture_12_AlertView
//
//  Created by 정윤아 on 2021/01/24.
//

import SwiftUI
// 버튼 눌러서 경고창 띄우기
struct ContentView: View {
    @State private var isShowAlert = false
    
    @State private var selectText = "x"
    var body: some View {
        
        VStack {
            Button("show laert") {
                isShowAlert.toggle() // 참이면 거짓, 거짓이면 참으로 바꿈
            }
            .alert(isPresented: $isShowAlert, content: {
                // 바인딩으로 넘겨서 값이 직접 변함
                // 얼럿의 구성 요소 만들기
                // Alert(title: Text("alert"))
//                Alert(title: Text("alert title"), dismissButton: .cancel())
                let primaryButton = Alert.Button.default(Text("done")) {
                    selectText = "done"
                }
                let secondaryButton =
                    Alert.Button.default(Text("cancel")){
                        selectText = "cancle"
                    }
                // 여러 줄이니까 무엇이 리턴되는지 써놔야함
                return Alert(title: Text("show alert"),
                      primaryButton: primaryButton,
                      secondaryButton: secondaryButton)
            })
            Spacer() // 맨 밑에 보이게 할래!
            Text("\(isShowAlert.description)")
            Spacer()
            Text("\(selectText)")
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
