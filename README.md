# SwiftUUIDv5
[![Build Status](https://travis-ci.org/dtop/SwiftUUIDv5.svg?branch=master)](https://travis-ci.org/dtop/SwiftUUIDv5)
[![Compatibility](https://img.shields.io/badge/Swift-3.0-blue.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/dtop/SwiftValidate/master/LICENSE)
[![codebeat badge](https://codebeat.co/badges/716a0ace-cfe2-46a1-bf74-270d19e51dd0)](https://codebeat.co/projects/github-com-dtop-swiftuuidv5)
[![GitHub release](https://img.shields.io/github/release/dtop/SwiftUUIDv5.svg)](https://github.com/dtop/SwiftUUIDv5)

#####Extension for generating v5 UUIDs

By [Danilo Topalovic](http://blog.danilo-topalovic.de).


* [Introduction]
* [Requirements]
* [Installation]
* [Example]



## Introduction

UUIDv5 is commonly used for generating namespace based unique identifiers.
the namespace is also a valid UUID.

see: [wikipedia](https://en.wikipedia.org/wiki/Universally_unique_identifier#Version_5_.28SHA-1_hash_and_namespace.29)

## Requirements

Swift 3.0

## Installation

currently only [Carthage] is supported, sorry.

Cartfile:

```
github "dtop/SwiftUUIDv5"

```

## Example

```swift

if let namespace = UUID(uuidString: "6BA7B811-9DAD-11D1-80B4-00C04FD430C8") {
	
	guard let customerUuid = UUID(namespace: namespace, name: "your-customer@customer.com") else {
		// ...
	}
	
	let customerId = customerUuid.uuidString
	
	// ...
}

```






[Carthage]: https://github.com/Carthage/Carthage

[Introduction]: #introduction
[Requirements]: #requirements
[Installation]: #installation
[Example]: #example