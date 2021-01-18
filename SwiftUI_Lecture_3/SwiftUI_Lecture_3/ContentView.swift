//
//  ContentView.swift
//  SwiftUI_Lecture_3
//
//  Created by 정윤아 on 2021/01/18.
//

import SwiftUI

// Image

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) { // spacing으로 인해 이미지가 딱 붙음: 이미지는 텍스트와 달리 경계 영역이 기본적으로 약간 있음
            Image("1")
                .resizable() // 얘만 해도 꽉 채울 수 있음
                //            .frame(width: 100, height: 200) // 영역은 잡히는데 이미지가 작아지지는 않음.. resizable 옵션 필요
                //               .padding() // 수동 간격 조절.. 각각으로 조절하고 싶으면 spacing 전체 씌우지 말고 padding으로 조절
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) // 전체 safe area까지 사용
                .aspectRatio(contentMode:.fit) // 비율 맞춰서 줄이기: fill은 화면 영역 넘어가는 영역, fit은 화면 맞게 비율
                .mask( // 이미지 말고도 많이 사용하지만 이미지에 많이 사용
                    HStack(spacing: 0) {
                        VStack(spacing:0) {
                            Circle() // 여러개 할 수도 있음
                            Circle() // 여러개 할 수도 있음
                            Circle() // 여러개 할 수도 있음
                        }
                        VStack(spacing:0) {
                            Circle() // 여러개 할 수도 있음
                            Circle() // 여러개 할 수도 있음
                            Circle() // 여러개 할 수도 있음
                        }
                    }
                )
//                .padding(.bottom, 20) // 패딩과 마스크 순서 중요 결과물이 크게 달라짐.. 좀 동그랗게 하면 코너래디우스.
                .frame(width: 300, height: 300) // 정사각형으로 해서 원 모양 맞추기
            
            //            Image("1")
            //   //            .resizable() // 얘만 해도 꽉 채울 수 있음
            //   //            .frame(width: 100, height: 200) // 영역은 잡히는데 이미지가 작아지지는 않음.. resizable 옵션 필요
            //               .padding()
            //               .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) // 전체 safe area까지 사용
            //               .aspectRatio(contentMode:.fit) // 비율 맞춰서 줄이기: fill은 화면 영역 넘어가는 영역, fit은 화면 맞게 비율
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
