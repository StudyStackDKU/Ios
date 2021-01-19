//
//  ContentView.swift
//  SwiftUI_Lecture_6
//
//  Created by 정윤아 on 2021/01/18.
//

import SwiftUI
// Button
// State (Property Wrapper)
// State: 하나의 뷰 안에서 사용되는 값. UI에서 작업하는 것은 state로 되어있어야 함.. 변경된 값은 다른곳에서 알아서 적용시켜줌
struct ContentView: View {
    @State private var didSelected = false // 그냥 변수로 설정해버리면 안쪽에서 변경이 되지 않기 때문에
    
    var buttonImage: String {
        if didSelected {
            return "circle"
        } else {
            return "pencil"
        }
    }
    
    var body: some View {
        
        VStack {
            // Button은 action label 형태를 많이 사용함. 버튼 눌렀을 때 해야할 일, 버튼 모양
            Text("current Status: \(didSelected.description)") // .description은 String이 아닌 것을 String으로 표현해줌
            
            Button(action: {
                didSelected.toggle() // true면 false로, 아니면 그 반대로 알아서 바꿔줌
            }, label: {
                HStack {
                    Image(systemName: buttonImage) // write를 하지 않기 때문에 buttonImage 사용할 수 있음
                        .resizable() // 화면에서 잡힐 수 있는 가장 큰
                        .aspectRatio(contentMode: .fit)
                    Text("Button \(didSelected.description)")
                }
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

