//
//  WebView.swift
//  SwiftUI_Lecture_13_Webview
//
//  Created by 정윤아 on 2021/01/24.
//
import Foundation
import WebKit
import SwiftUI

// 뷰를 만들어서/Users/yuna/Desktop/iOS/SwiftUI_Lecture_13_Webview/SwiftUI_Lecture_13_Webview/WebViewController.swift 스위프트유아이와 맞춰서 바로 사용할 수 있게 해주는 프로토콜 선언
// 웹뷰를 따로 제공하지 않고있기 때문에..
struct WebView: UIViewRepresentable {
    // url은 초기화하지 않았기 때문에 호출할 때 파라미터 "꼭" 넘겨줘야 함
    var url: String // 받아와야하니까
    
    func makeUIView(context: Context) ->
    some UIView {
//        let url = URL(string: "https://google.com")
        let url = URL(string: self.url)
        let request = URLRequest(url: url!)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        
        return wkWebView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}


// UIView Controller
