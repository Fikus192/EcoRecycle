//
//  Bundle+Extensions.swift
//  EcoRecycle
//
//  Created by Mateusz Ratajczak on 28/08/2023.
//

import Foundation

extension Bundle {
    public var appName: String {
        object(forInfoDictionaryKey: "CFBundleName") as? String ?? "Nie można określić nazwy aplikacji"
    }
    public var appVersion: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Nie można określić wersji aplikacji"
    }
    
    public func decode<T: Decodable>(
        _ type: T.Type,
        from file: String,
        withExtension fileExtension: String? = nil,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys
    ) -> T {
        guard let url = self.url(forResource: file, withExtension: fileExtension) else {
            fatalError("Error: Nie można zlokalizować \(file) w pakiecie.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error: Nie można załadować \(file) z pakietu.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Error: Nie można zdekodować \(file) z pakietu")
        }
        
        return loaded
    }
}
