//
//  ContentView.swift
//  SwiftUI_Lecture_4
//
//  Created by 정윤아 on 2021/01/18.
//

import SwiftUI
// SF Symbols: System symbol
struct ContentView: View {
    var body: some View {
        Image(systemName: "wifi")
            .resizable()
            .aspectRatio(contentMode: .fit) // frame 잡히고 나서 넣으면 의미 없음
            .frame(width: 300, height: 300)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
