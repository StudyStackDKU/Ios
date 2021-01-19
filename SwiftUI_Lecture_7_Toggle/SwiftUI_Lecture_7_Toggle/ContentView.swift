//
//  ContentView.swift
//  SwiftUI_Lecture_7_Toggle
//
//  Created by 정윤아 on 2021/01/20.
//

import SwiftUI
// Togle(UI switch)

// 토글은 title이 필요, on인지 off인지 필요한 bool타입 필요
/*
 바인딩타입?
 바인딩 불에는 불을 넣을 수 없다!
 원본이 있는 상태를 사용하겠다. 연결되어있다.
 이 값이 변경되거나 변경할 때 원래 값과 연결되어있음. 변경하면 '원래'값이 변경됨
 토글은 왜 바인딩일까?
 변경되는 UI와 그 값이 적용되어야 하기 때문
 누르면 원래 값 바꿔주고, 그 원래 값 읽어서 변경시키고, ...
 write read write read ...
 원래 값에 '연결'시켜줘야 한다
 포인터같은 개념
 다른 바인딩도 있다~~
 */
struct ContentView: View {
    @State private var isOn = false
    var body: some View {
        VStack {
            
            MyToggle(isOn: $isOn)
            Text("\(isOn.description)")
            
            
        }
    }
}


struct MyToggle: View {
    
    @Binding var isOn: Bool // 초기화 못해 -> 바인딩은 값을 가질 수 없다. 원본 값이 어딘가 있다는 뜻일 뿐.. 타입만 지정
    // 클래스도 그렇고 값이 없고 타입만 지정되어있으면 init할 때 자동으로 값이 붙어버림
    
    // 바디는 무조건 구현해야함
    var body: some View {
        Toggle("toggle title \(isOn.description)",
               isOn: $isOn) // 바인딩타입.. 그냥 bool타입으로는 안됨
        Toggle(isOn: $isOn, label: {
            HStack{
                Spacer() // 왼쪽에 스페이스를 둬서 레이블을 오른쪽으로 밀어버림
                VStack {
                    Text("Label1")
                    Text("Label1")
                }
            }
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
