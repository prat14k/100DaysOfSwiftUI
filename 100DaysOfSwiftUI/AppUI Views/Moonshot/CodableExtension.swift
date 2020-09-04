//
//  CodableExtension.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 03/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import Foundation

struct CustomError: LocalizedError {
    let msg: String

    var errorDescription: String? { return msg }
    var failureReason: String? { return msg }
}

extension Decodable {

    init(fromJSON file: JSONFile) throws {
        try self.init(fromFile: file.rawValue)
    }

    private init(fromFile fileName: String) throws {
        try self.init(data: Bundle.main.loadData(fromFile: fileName))
    }

    private init(data: Data?) throws {
        guard let data = data  else { throw CustomError(msg: "Nil data available for decoding") }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        self = try decoder.decode(Self.self, from: data)
    }
}

extension Bundle {

    func loadData(fromFile fileName: String) -> Data? {
        guard let fileUrl = url(forResource: fileName, withExtension: "json")  else { return nil }
        return try? Data(contentsOf: fileUrl)
    }
}
