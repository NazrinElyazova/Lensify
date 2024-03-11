//
//  SaveFileManager.swift
//  Lensify
//
//  Created by Nazrin on 05.03.24.
//
import UIKit
import Foundation

class SaveFileManager {
    
    static let saveFile = SaveFileManager()
    private init() {}
    
    
    private func createFolder(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else {return}
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("Folder URL: \(url)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderUrl = getURLForFolder(folderName: folderName) else {return nil}
        return folderUrl.appendingPathComponent(imageName + ".jpg")
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getUrlForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) -> Bool {
        createFolder(folderName: folderName)
        guard let data = image.jpegData(compressionQuality: 0.5),
              let url = getUrlForImage(imageName: imageName, folderName: folderName)
        else { return false }
        do {
            try data.write(to: url)
            print("Image saved at: \(url)")
            return true
        } catch {
            print("Error saving image: \(error.localizedDescription)")
            return false
        }
    }
}

