import Foundation

public struct SwiftGGFormater {
    let file: URL
    let web: URL

    public init(file: URL, web: URL) {
        self.file = file
        self.web = web
    }

    public func format() async throws {
        let data = try await self.fetchWebData()

        let parse = try self.parse(data: data)

        let reformat = try self.reformat(by: parse)

        let res = self.formYaml(from: reformat)

        try res.write(to: file, atomically: true, encoding: .utf8)
    }
}
