//
//  SaveFileManager.swift
//  Lensify
//
//  Created by Nazrin on 05.03.24.
//
import UIKit
import Foundation

    class SaveFileManager {
        var item: GetTopics?
        static let saveFile = SaveFileManager()
        private init() {}

        func saveImage(image: UIImage, imageName: String, folderName: String) {
            createFolder(folderName: folderName)
            guard let data = image.jpegData(compressionQuality: 0.5),
                let url = getUrlForImage(imageName: imageName, folderName: folderName)
                else { return }
            do {
                try data.write(to: url)
            } catch {
                print(error.localizedDescription)
            }
        }

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

        func getImge(imageName: String, folderName: String) -> UIImage? {
            guard let url = getUrlForImage(imageName: imageName, folderName: folderName),
                  FileManager.default.fileExists(atPath: url.path) else { return nil }
            return UIImage(contentsOfFile: url.path)
        }

        private func getURLForFolder(folderName: String) -> URL? {
            guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}

            return url.appendingPathComponent(folderName)
        }

        private func getUrlForImage(imageName: String, folderName: String) -> URL? {
            guard let folderUrl = getURLForFolder(folderName: folderName) else {return nil}
            return folderUrl.appendingPathComponent(imageName + ".jpg") 
        }
    }

