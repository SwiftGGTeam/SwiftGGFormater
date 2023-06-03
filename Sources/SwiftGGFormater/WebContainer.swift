//
//  WebContainer.swift
//  
//
//  Created by 朱浩宇 on 2023/6/3.
//

import WebKit

@MainActor
class WebContainer: NSObject {

    lazy var webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView: WKWebView = WKWebView(frame: .init(x: 0, y: 0, width: 1000, height: 2000), configuration: configuration)
        webView.navigationDelegate = self
        return webView
    }()

    var continuation: UnsafeContinuation<Void, any Error>?

    func load(request: URLRequest) async throws {
        try await withUnsafeThrowingContinuation { continuation in
            self.continuation = continuation
            webView.load(request)
        }
    }
}

extension WebContainer: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        continuation?.resume(returning: ())
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        continuation?.resume(throwing: error)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        continuation?.resume(throwing: error)
    }
}
