//
//  WebViewController.swift
//  SwiftUI_Lecture_13_Webview
//
//  Created by 정윤아 on 2021/01/24.
//

import Foundation
import UIKit
import WebKit
import SwiftUI
// 뷰컨트롤러로 만든거니까 걍 냅두고..
class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var url = "https://google.com"
    
    override func viewDidLoad() {
        self.webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: url)!))
        // URL은 언래핑해야해서..
    }
    
    func webView(_ webView: WKWebView, didFinish navigation:
                    WKNavigation!) {
        // 웹뷰 끝났을 때
        // 웹뷰 가져올 때 보통 타이틀 가져옴
        // document.title로 제목 가져옴
        self.webView.evaluateJavaScript("document.title") {
            (result, error) in
            self.navigationItem.title = result as? String // 뷰컨트롤러는 타이틀이 바로 없어서
            
        }
    }
}

// UIViewController를 스위프트 유아이쪽으로 연결시킬 수 있는 인터페이스 만들기
struct MyWebVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let webVC = UIStoryboard(name: "WebViewController", bundle: nil).instantiateViewController(identifier: "WebViewController") as! WebViewController
        let navi = UINavigationController(rootViewController: webVC)
        return navi
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        <#code#>
    }
}
