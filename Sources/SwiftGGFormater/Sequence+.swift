//
//  Sequence+.swift
//  
//
//  Created by 朱浩宇 on 2023/6/3.
//

import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
