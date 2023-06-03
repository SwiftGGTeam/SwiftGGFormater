//
//  Reformat.swift
//  
//
//  Created by 朱浩宇 on 2023/6/3.
//

import Foundation
import Yams

extension SwiftGGFormater {
    public func refomrat(by strings: [String]) throws -> [[String : String]] {
        let strings = strings.uniqued()

        guard let loadedDictionary = try Yams.load(yaml: String(contentsOf: file)) as? [[String: String]] else { throw NSError() }
        var new = [[String: String]]()

        let allKeys = loadedDictionary.compactMap { item in
            item["内容"]
        }

        var indexs = (0..<loadedDictionary.count).map { $0 }

        for string in strings {
            if let index = allKeys.firstIndex(of: string) {
                new.append(loadedDictionary[index])
                indexs.removeAll { i in
                    i == index
                }
            }
        }

        for index in indexs {
            new.append(loadedDictionary[index])
        }

        print(new.count, loadedDictionary.count)

        return new
    }

    public func formYaml(from formated: [[String : String]]) -> String {
        var res = ""

        for element in formated {
            let item = """
- 内容: '\(element["内容"]!)'
  提示: '\(element["提示"]!)'
  翻译: '\(element["翻译"]!)'\n
"""
            res += item
        }

        return res
    }
}
