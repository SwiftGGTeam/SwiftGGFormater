//
//  WebParser.swift
//  
//
//  Created by 朱浩宇 on 2023/6/3.
//

import Foundation
import SwiftSoup

extension SwiftGGFormater {
    public func fetchWebData() async throws -> String {
        let request = URLRequest(url: web)

        let webContainer: WebContainer = await WebContainer()
        try await webContainer.load(request: request)

        try await Task.sleep(for: .seconds(1))

        return try await webContainer.webView.html()
    }

    public func parse(data: String) throws -> [String] {
        let html = try SwiftSoup.parse(data)

        guard let body = html.body() else { throw NSError() }

        return try body.getAllElements().compactMap { element in
            switch element.tagName() {
            case "p", "h1", "h2": return try element.text()
            default: return nil
            }
        }
    }
}
