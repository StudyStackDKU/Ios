//
//  ContentView.swift
//  SwiftUI_Lecture_16_placeholder
//
//  Created by 정윤아 on 2021/01/26.
//

import SwiftUI

// redact에 들어있음
// 시간 오래 걸릴 때 이런거 띄워주면 좋잖아?!
struct ContentView: View {
    @State private var myString = "hello world"
    @State private var showPlaceholder = false
    var body: some View {
        VStack{
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle()) // 잘라버리겠다
                    .overlay(Circle().stroke()) // 오버레이는 그만큼 채우겠다
                Text(myString)
                    .foregroundColor(.red)
                    .padding()
            }
            .redacted(reason: showPlaceholder ? .placeholder : .init()) // 해당 컨텐츠만큼 뿌옇게 표현. init하면 사용하지않는다는 의미
            Button("click me") {
                showPlaceholder.toggle()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
