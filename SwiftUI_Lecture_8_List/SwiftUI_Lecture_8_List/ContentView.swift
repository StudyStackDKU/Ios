//
//  ContentView.swift
//  SwiftUI_Lecture_8_List
//
//  Created by 정윤아 on 2021/01/21.
//

import SwiftUI

// List
// Model

struct LocationInfo: Hashable, Identifiable {
    var id = UUID() // Identifiable은 id 반드시 구현.
    // UUID로 모델 생성되면서 만들어지게 함
    
    var city = ""
    var wether = ""
}
struct ContentView: View {
    @State private var locations = [
        LocationInfo(city: "Seoul", wether: "rainy"),
        LocationInfo(city: "Bussan", wether: "sunny"),
        LocationInfo(city: "LA", wether: "cloudy")
    ]
    var body: some View {
        List {
            // 한칸을 셀이나 아이템이라고 말함
            HStack{
                Text("hi")
                Text("hello")
            }
            HStack{
                Text("hi")
                Text("hello")
            }
            HStack{
                Text("hi")
                Text("hello")
            }
            HStack{
                Text("hi")
                Text("hello")
            }
            HStack{
                Text("hi")
                Text("hello")
            }
        }
        
        List {
            // ForEach는 세가지 스타일 모두 잘 사용함
            
            // 1. id 사용
            // id는 중복되는경우 복잡해져서 위 원소는 적합x
            // \.는 키패스?에 대한 문법. \.self는 이거 자체를 id로
            // id를 self로 해놓으면 모델은 Hashable이라는 프로토콜 준수
            ForEach(locations, id: \.self) {
                location in
                HStack {
                    Text("\(location.city)")
                    Text("\(location .wether)")
                }
            }
            
            // 2. id 사용x
            // id 안쓰려면 Identifiable 프로토콜 준수해야
            ForEach(locations) {
                location in
                HStack {
                    Text("\(location.city)")
                    Text("\(location .wether)")
                }
            }
            
            // 3. index 형태로
            // 어떤 프로토콜 준수하는 모델이 아니어도 됨!
            ForEach(0..<10){ // ..< 이어야 함
                index in
                HStack {
                    Text("\(locations[index].city)")
                    Text("\(locations[index].wether)")
                    
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
