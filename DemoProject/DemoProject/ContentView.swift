//
//  ContentView.swift
//  DemoProject
//
//  Created by 정윤아 on 2021/01/16.
//

import SwiftUI

// Stack
// H V Z
struct ContentView: View { // 나열된 대로 위에서 쭉 Hello World 보임.. Stack으로 감싸야 함
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all) // safe area 영역까지 잡는다 -> Z stack으로 사용해야 함
            Color.green
            VStack {
                HStack {
                    Text("Hello World").background(Color.red)
                        .padding(.top, 50) // 텍스트 크기 만큼의 영역의 배경이 빨강으로 잡힘
                    Text("Hello World")
                    Text("Hello")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 50) // 설정은 아래로 내리는 것이 관례
                }.padding(.bottom, 50) // 스택에 패딩도 가능
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
