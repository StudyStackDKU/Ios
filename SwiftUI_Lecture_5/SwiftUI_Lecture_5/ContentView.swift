//
//  ContentView.swift
//  SwiftUI_Lecture_5
//
//  Created by 정윤아 on 2021/01/18.
//

import SwiftUI
// Shape
struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                //                .stroke(Color.orange, lineWidth: 20)
                .stroke(Color.orange, style: // 스트로크 옵션 되게 많아..
                            StrokeStyle(lineWidth: 10,
                                        lineCap: .round,
                                        lineJoin: .miter, // 꼭짓점. 라운드 많이 씀
                                        miterLimit: 1 // lineJoin이 미터로 돼있을때 조정됨. 공식에 의해 계산됨
                                        //                                        dash: [30,30], dashPhase: 30
                                        )) // 스트로크 스타일로 설정할 수도 있음. dashPhase는 시작 위치
            
            //            .background(Color.blue) // 도형은 background로 색 설정하지 않음
            //                .fill(Color.blue) // 컬러는 fill로 채움!
            //                .frame(width: 100, height: 100)
            RoundedRectangle(cornerRadius: 20) // 둥근 사각형
                .fill(Color.blue)
            //                .frame(width: 100, height: 100)
            Circle()
                .fill(Color.purple)
            //                .frame(width: 200, height: 50) // 찌그러지지 않는다..
            Capsule()
                .fill(Color.blue)
            //                .frame(width: 200, height: 50) // 원은 원인데 찌그러진다
            Ellipse()
                .fill(Color.green)
            //                .frame(width: 100, height: 100) // 캡슐이랑 다르게 늘어남. 자연스러운 타원형태로 찌그러진다.
        }.frame(width: 200) // 해당하는 도형의 가로가 다같이 줄어들어서 코드 길이 줄어들어
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
