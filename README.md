# SwiftGGFormater

SwiftGGFormater is a package that can reformat SwiftGG's YAML file, arranging its texts in the same order as the texts on the Apple Developer website.

## Installation

Requirement: macOS 13+. SwiftGGFormater can be installed through [Swift Package Manager](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app).

```swift
.package(url: "https://github.com/SwiftGGTeam/SwiftGGFormater", .upToNextMajor(from: "1.1.0"))
```

## Get Started

### Create the Formater

To create a formater, you need two essential components: the file you want to reorder and the website that serves as a reference for the desired order of your file

```swift
let formater = SwiftGGFormater(file: URL(filePath: "..."), web: URL(string: "...")!)
```

### Reformat

The SwiftGGFormater offers a convenient single function that seamlessly integrates all the necessary steps to reformat a file.

```swift
try awiat formater.reformat()
```

### Seprated Functions

You can achieve the same goal by utilizing separate functions instead.

```swift
let data = try await self.fetchWebData()
let parse = try self.parse(data: data)
let reformat = try self.reformat(by: parse)
let res = self.formYaml(from: reformat)

try res.write(to: file, atomically: true, encoding: .utf8)
```
