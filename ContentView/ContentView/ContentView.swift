//
//  ContentView.swift
//  ContentView
//
//  Created by 정윤아 on 2021/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Main title")
                .font(.largeTitle)
                .foregroundColor(.black)
                .bold()
            Text("sub title")
                .font(.largeTitle)
                .italic()
                .foregroundColor(.black)
                
            // myWeight 받을 수 있게 작성해놨으니까
            Text("description")
                .modifier(MyTextStyle(myWeight: .bold))
            
            Text("익스텐션")
                .CustomFont(color: .orange)
                
        }
    }
}

// 공통으로 사용하는 형식 묶음
struct MyTextStyle: ViewModifier {
    // 뷰모디파이어에서 사용할 수 없는 것들이 있음
    // 이탤릭같은 것..
    // 그럼 extension이라고 기능 추가하는 방법이 있잖아!
    var myWeight = Font.Weight.regular
    var myFont = Font.title2
    var myColor = Color.blue
    func body(content: Content) -> some View {
        content
            .font(myFont.weight(myWeight))
            .foregroundColor(myColor)
            .padding(.bottom, 20)
    }
}

// 익스텐션으로 기능 확장시켜놓으면
// 텍스트에 이 설정을 사용할 수 있음
// >>>>> 뷰모디파이어에서 사용 못하는 것 사용 가능
// 그때는 익스텐션 사용하는 것도 괜찮다
// 특징정리!
extension Text {
    func CustomFont(color: Color) -> Text {
        self
            .font(.title2)
            .bold()
            .italic()
            .foregroundColor(color)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
