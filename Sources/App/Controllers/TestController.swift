//
//  TestController.swift
//  App
//
//  Created by Dan Isacson on 2018-05-27.
//

import Vapor

final class TestController {
    func echo(_ req: Request) throws -> Future<String> {
        let input = try req.parameters.next() as String
        let promise = req.eventLoop.newPromise(String.self)

        promise.succeed(result: input)
        promise.fail(error: NSError(domain: "", code: 1, userInfo: nil))
        
        return promise.futureResult
    }
}
