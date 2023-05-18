import XCTest

extension XCTestCase {

    func XCTAssertThrowsAsyncError<T>(_ expression: @autoclosure () async throws -> T,
                                      _ message: String = "XCTAssertThrowsError failed: did not throw an error",
                                      file: StaticString = #filePath,
                                      line: UInt = #line,
                                      _ errorHandler: (_ error: Error) -> Void = { _ in }) async {

        do {
            _ = try await expression()

            XCTFail(message, file: file, line: line)
        } catch {
            errorHandler(error)
        }
    }
}
