import XCTest
@testable import SwiftGGFormater

final class SwiftGGFormaterTests: XCTestCase {
    func testParseWeb() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let formater = SwiftGGFormater(file: URL(filePath: ""), web: URL(string: "https://developer.apple.com/tutorials/swiftui-concepts/driving-changes-in-your-ui-with-state-and-bindings")!)

        let data = try await formater.fetchWebData()

        print(try formater.parse(data: data))
    }

    func testReformat() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let formater = SwiftGGFormater(file: URL(filePath: "/Users/zhuhaoyu/Downloads/driving-changes-in-your-ui-with-state-and-bindings.yml"), web: URL(string: "https://developer.apple.com/tutorials/swiftui-concepts/driving-changes-in-your-ui-with-state-and-bindings")!)

        let data = try await formater.fetchWebData()

        let parse = try formater.parse(data: data)

        print(try formater.refomrat(by: parse))
    }

    func testAll() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let formater = SwiftGGFormater(file: URL(filePath: "/Users/zhuhaoyu/Downloads/driving-changes-in-your-ui-with-state-and-bindings.yml"), web: URL(string: "https://developer.apple.com/tutorials/swiftui-concepts/driving-changes-in-your-ui-with-state-and-bindings")!)

        try await formater.formate()
    }
}
