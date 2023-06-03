//
//  WKWebView+.swift
//  
//
//  Created by 朱浩宇 on 2023/6/3.
//

import Foundation
import WebKit

extension WKWebView {
    func html() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            self.callAsyncJavaScript("""
return document.documentElement.outerHTML.toString();
""", in: .none, in: .defaultClient) { res in
                switch res {
                case .success(let html):
                    if let res = html as? String {
                        continuation.resume(returning: res)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
