//
//  JSONDecoder+Extensions.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import Foundation

extension JSONDecoder {
    public convenience init(
        withKeyDecodingStrategy keyDecodingStrategy: KeyDecodingStrategy
    ) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
