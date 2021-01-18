//
//  ContentView.swift
//  SwiftUI_Lecture_2
//
//  Created by 정윤아 on 2021/01/17.
//

import SwiftUI

// Text

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!hihihihihihihihihihi")
                .font(.largeTitle)
                .underline()
                .bold()
//                .frame(width:100, height:50)
                .padding(.bottom, 20) // 패딩 들어간 상태에서 백그라운드가 잡히는데, 순서 상관 있음..!
                .background(Color.green)
                .cornerRadius(20) // 부드럽게, object에 대한 기본 설정. 텍스트에만 해당되는 것 아님. 아무리 크게 줘도 원 이상 안됨
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .lineLimit(1) // 한 줄로 강제됨
//                .frame(width:100)
//                .truncationMode(.middle) // 중간 줄임
                .lineSpacing(-40) // 줄 간격 특정 값 이상은 되지 않음
            Text("Hello, world!!!")
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
