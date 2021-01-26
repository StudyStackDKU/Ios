//
//  ContentView.swift
//  SwiftUI_Lecture_15_Grid
//
//  Created by 정윤아 on 2021/01/26.
//

import SwiftUI
// Grid
// Collection View
// 바둑판으로 나열
struct ContentView: View {
    
    // 그리드 아이템이 많아지면 따로 빼서 하는게 보기 좋아.
    // 타입만 잘 이해하면 됨
    var columns: [GridItem] {
        // fixed는 화면보다 커질 수 있음..
        // 스스로도 잘려버림
        // 화면보다 크지 않다는 것을 염두에 두고 fixed로 작업해야 함
        // flexible은 상황에 맞춰서 조절해야 하는 경우 유리
        // 최소와 최대가 있음
        // adaptive는 쭉 나열될 수 있는 영역만큼 쭉 나열!
        // 검색창이나 해쉬태그같은거 쭉 나타나는 것 처럼
        // flexible과 반대,, 맥시멈대로 커지지만 adaptive는 미니멈쪽으로 기준해서 나열
        [// GridItem(.fixed(40)),
        // GridItem(.fixed(100)),
//            GridItem(.flexible(minimum: 50, maximum: 200)),
//            GridItem(.flexible(minimum: 50, maximum: 200)),
//            GridItem(.flexible(minimum: 50, maximum: 200))
            GridItem(.adaptive(minimum: 30, maximum: 100))
        ] // 그 값 넓이 그대로
    }
    var body: some View {
        // 그리드는 기본적으로 스크롤이 없음...
        // 화면에 넘어가는 경우를 위해 스크롤뷰로 감싼다
        ScrollView(.horizontal){
            LazyVGrid(columns: columns, content: {
                Text("hi hello world")
                    .lineLimit(1)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
