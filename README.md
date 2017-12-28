# Song

Data structure serialization with static typing. Song is to JSON as Swift is to Javascript.

## Getting Started

### Prerequisites

Swift 4.0

### Installing

Add dependency to Package.swift

```
.package(url: "https://github.com/blanu/Song", from: "0.0.0")
```

Or check out directly

```
git clone https://github.com/blanu/Song
cd Song
```

## Running the tests

If checked out directly

```
swift test
```

### Encoding and decoding tests

The tests cover encoding and decoding primitive types, Foundation types, arrays, dictionaries, structs, and classes.
Enums are not yet supported.

## Deployment

You can use Song in your application the same way you would use a JSON encoder.

### Define your data structures

Structs and classes must adopt the Codable protocol.
All fields must also be of Codable types.
Most primitive types and Foundation types already adopt this protocol.

```
struct ExampleStruct: Codable {
    let value: String
}

let example = ExampleStruct(value: "example string")
```

### Create and use an encoder

```
let song = Song()
let result: Data = try? song.encode(ex)
```

### Use the encoded data

For this example, we will just print it as a UTF8 string.

```
NSLog("\(String(bytes: result!, encoding: .utf8)!)")
```

The result will be the following string:

```
let value: ExampleStruct = ExampleStruct(value: "example string")
```

Notice that the string printed is the same as the Swift code you used to instantiate the struct originally. This is the purpose of Song. It serializes data structures as Swift code and parses Swift code into data structures.

## Built With

* [swift-ast](https://github.com/yanagiba/swift-ast) - Swift syntax parser and generator

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests.

## Versioning

[SemVer](http://semver.org/) is used for versioning. For the versions available, see the [tags on this repository](https://github.com/blanu/Songs/tags).

## Authors

* **Dr. Brandon Wiley** - *Concept and initial work* - [Operator Foundation](https://OperatorFoundation.org/)

## License

This project is licensed under the GPLv3 License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Song is inspired by [Enso](http://enso-lang.org/) and conversations with [William R. Cook](http://www.cs.utexas.edu/~wcook/).

