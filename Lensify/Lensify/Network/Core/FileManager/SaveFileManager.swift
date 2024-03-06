//
//  SaveFileManager.swift
//  Lensify
//
//  Created by Nazrin on 05.03.24.
//

import Foundation

class SaveFileManager {
    
    func getJsonFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files [0].appendingPathComponent("favorite.json")
        print(path)
        return path
    }
    
    func writeJsonData(items: [GetTopics]) {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: getJsonFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readJsonFile(complete: (([GetTopics]) -> Void)) {
        if let data = try? Data(contentsOf: getJsonFilePath()) {
            do {
                let items = try JSONDecoder().decode([GetTopics].self, from: data)
                complete(items)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
