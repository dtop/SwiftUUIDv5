# SwiftUUIDv5
[![Build Status](https://travis-ci.org/dtop/SwiftUUIDv5.svg)](https://travis-ci.org/dtop/SwiftUUIDv5)
[![Compatibility](https://img.shields.io/badge/Swift-3.0-blue.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/dtop/SwiftValidate/master/LICENSE)
[![codebeat badge](https://codebeat.co/badges/716a0ace-cfe2-46a1-bf74-270d19e51dd0)](https://codebeat.co/projects/github-com-dtop-swiftuuidv5)
[![GitHub release](https://img.shields.io/github/release/dtop/SwiftUUIDv5.svg)](https://github.com/dtop/SwiftUUIDv5)

Extension for generating v5 UUIDs


```

import UUIDv5

class Foo {

    private static let UUIDNS = ""

    func Bar() -> UUID? {
    
        return UUID(namespace: Foo.UUIDNS, name: "Dr. Frankenstein") 
    }
}

```