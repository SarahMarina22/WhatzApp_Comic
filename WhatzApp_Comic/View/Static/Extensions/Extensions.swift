//
//  Extensions.swift
//  WhatzApp_Comic
//
//  Created by Sarah Ndenbe on 22/11/22.
//

import Foundation

extension DateComponentsFormatter{
    static let abbreviated: DateComponentsFormatter = {
        print("Initializing DateComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle =  .abbreviated
        /*{
            
            switch( formatter.allowedUnits){
            case .hour :
                return .abbreviated
            case .minute :
                return .short
            case .second :
                return .abbreviated
            default:
                return .abbreviated
            }
        }()*/
        
        return formatter
    }()
    
    static let  positional : DateComponentsFormatter = {
        print("Initializing DateComponentsFormatter.positional")
        
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [ .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}


extension URL {
    var createdDate: Date {
        let _ = self.startAccessingSecurityScopedResource()
        let attributes = try! FileManager.default.attributesOfItem(atPath: self.path)
        let creationDate = attributes[.creationDate] as? Date ?? Date()
        defer {
            self.stopAccessingSecurityScopedResource()
        }
        return creationDate
    }
    var modifiedDate: Date {
        let _ = self.startAccessingSecurityScopedResource()
        let attributes = try! FileManager.default.attributesOfItem(atPath: self.path)
        let modificationDate = attributes[.modificationDate] as? Date ?? Date()
        defer {
            self.stopAccessingSecurityScopedResource()
        }
        return modificationDate
    }
    var size: Double {
        let _ = self.startAccessingSecurityScopedResource()
        let attributes = try! FileManager.default.attributesOfItem(atPath: self.path)
        let size = attributes[.size] as? Double ?? 0
        defer {
            self.stopAccessingSecurityScopedResource()
        }
        return size
    }
}
