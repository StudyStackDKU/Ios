//
//  ContentView.swift
//  SwiftUI_Lecture_9_ContentView
//
//  Created by 정윤아 on 2021/01/23.
//

import SwiftUI
// List Section
// Section은 row 묶음

// 1. 기본 구조
// 2. data 가공(원하는 형태로 표현)

// 딕셔너리로 리스트에 필요한 row 만드는 부분
struct Animal: Identifiable {
    // 뷰에서 사용하기 위해 고유한 아이디 생성
    let id = UUID()
    let name: String
    let index: Int
}
struct ContentView: View {
    // 강아지랑 새끼리 묶고싶으면...?
    // 딕셔너리로 묶자
    // 키: 밸류
    var animalList = [
        Animal(name: "dog", index: 1),
        Animal(name: "dog", index: 3),
        Animal(name: "cat", index: 2),
        Animal(name: "bird", index: 4),
        Animal(name: "bird", index: 7),
        Animal(name: "bird", index: 6),
        Animal(name: "bird", index: 5)
    ]
    
    var animalGrouped: [String: [Animal]] {
        var groupData = Dictionary(grouping: animalList) {
            $0.name // $0으로 리스트 안의 내용물 직접 접근
        }
        
        for (key, value) in groupData {
            groupData[key] = value.sorted(by: { $0.index < $1.index })
        }
        return groupData
    }
    var groupKey: [String] {
        animalGrouped.map({ $0.key })
    }
    
    var body: some View {
        List {
            // 그룹키는 단순히 키로서 이름으로서만 리스트 가져서
            // 구분 가능한 하나하나 따로 있지 않아서..
            ForEach(groupKey, id: \.self) { animalKey in
                
                Section(header: Text("\(animalKey)")) {
                    ForEach(animalGrouped[animalKey]!) { animal in
                        HStack {
                            Text("\(animal.name)")
                            Text("\(animal.index)")
                        }
                    }
                }
                
            }
        }
        List {
            ForEach(animalList) { animal in
                HStack{
                    Text("\(animal.index)")
                    Text("\(animal.name)")
                }
            }
        }
        List {
            Section(header: Text("header area")) {
                // 헤더는 뷰 프로토콜을 따라야 함
                Text("A")
                Text("A")
                Text("A")
            }
            Section(footer: Image(systemName: "trash")) {
                // 아래쪽에 붙음!
                Text("A")
                Text("A")
                Text("A")
            }
            Section(header: Text("header"),
                    footer: Text("footer")) {
                Text("A")
                Text("A")
                Text("A")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
