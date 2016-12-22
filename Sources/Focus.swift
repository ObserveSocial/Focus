struct Focus {

    static var failureHandler: ((_ message: String, _ file: StaticString, _ line: UInt) -> (Void))?
    static var successHandler: ((_ file: StaticString, _ line: UInt) -> (Void))?
}

func expect<Item>(_ item: Item) -> Expect<Item> {
    return Expect(item: item)
}