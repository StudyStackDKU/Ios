//
//  ContentView.swift
//  SwiftUI_Lecture_17_NavigationView
//
//  Created by 정윤아 on 2021/01/26.
//

import SwiftUI

struct ContentView: View {
    
    // 네비게이션 설정은 이닛쪽에 해놔야 함
    init() {
        // 타이틀 설정 초기화하여 사용
//        UINavigationBar.appearance()
//            .titleTextAttributes = [.foregroundColor: UIColor.red]
        let myAppearance =
            UINavigationBarAppearance()
        
        myAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        
        // large인 경우를 나눠서 설정하기
        myAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.blue,
        ]
        
        myAppearance.backgroundColor = .orange
        
        // 타이틀에 대한 폰트와 색정도만 했는데 적용해보자
        UINavigationBar.appearance()
            .standardAppearance = myAppearance
        
        // large 일 때 안내려도 똑같이 해두고 싶으면
        UINavigationBar.appearance().scrollEdgeAppearance
        = myAppearance
        
        // compact도 많이 씀
        // 디바이스 바뀔 때, 가로모드일때
        // 보통 설정도 똑같이 가고싶다 할 때 compact
        // 기본 바ㅏㅇ 하고싶으면 안해도 그만
        UINavigationBar.appearance().compactAppearance
        = myAppearance
        
        
        
        // 직접 설정해버리면 약간 달라지는게 있긴 함
        // appearance로 잡힌 부분만 색이 변경됨
        // 잘 감안해서 작업해야 함......
//        UINavigationBar.appearance().backgroundColor
//            = .orange
        
        // 디테일로 들어갔을 때 위에 폰트 색상을 변경하고싶으면?
        // UI킷에 있던 것 더 세부적으로 하고 싶으면
        // UINavigationbar appearnce로 검색하면 설정 많이 나옴
        UINavigationBar.appearance().tintColor =
            .yellow

        
    }
    
    var body: some View {
        NavigationView{
            
            List {
                //            Text("Hello, world!")
                //                .padding()
                
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        HStack {
                            Image(systemName: "person")
                            Text("Navigate")
                        }
                    })
            }
            
            // 클릭했을때 움직ㅇ려면 네비게이션 링크
            //            NavigationLink("click me",
            //                           destination:
            //                           Text("detail"))
            
            
            .navigationBarTitle("Title", displayMode: .large)
            // displaymode는 기본적으로 large로 잡혀있음
            // 왔다갔다 되려면 컨텐츠가 스크롤이 되어있는 상태여야
            // 예를들면 list..
            // inline은 항상 상단에 있음
            // 리스트로 묶어있으면 체감됨
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
