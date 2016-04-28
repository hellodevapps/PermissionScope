//
//  Structs.swift
//  PermissionScope
//
//  Created by Nick O'Neill on 8/21/15.
//  Copyright © 2015 That Thing in Swift. All rights reserved.
//

import Foundation

/// Permissions currently supportes by PermissionScope
@objc public enum PermissionType: Int, CustomStringConvertible {
    case Contacts, LocationAlways, LocationInUse, Notifications, Microphone, Camera, Photos, Reminders, Events, Bluetooth, Motion
    
    public var prettyDescription: String {
        switch self {
        case .LocationAlways, .LocationInUse:
            return "Location"
        default:
            return "\(self)"
        }
    }
    
    public var description: String {
        switch self {
        case .Contacts:         return "Contactos"
        case .Events:           return "Eventos"
        case .LocationAlways:   return "Localização"
        case .LocationInUse:    return "Localização"
        case .Notifications:    return "Notificações"
        case .Microphone:       return "Microfone"
        case .Camera:           return "Camera"
        case .Photos:           return "Fotos"
        case .Reminders:        return "Reminders"
        case .Bluetooth:        return "Bluetooth"
        case .Motion:           return "Motion"
        }
    }
    
    static let allValues = [Contacts, LocationAlways, LocationInUse, Notifications, Microphone, Camera, Photos, Reminders, Events, Bluetooth, Motion]
}

/// Possible statuses for a permission.
@objc public enum PermissionStatus: Int, CustomStringConvertible {
    case Authorized, Unauthorized, Unknown, Disabled
    
    public var description: String {
        switch self {
        case .Authorized:   return "Autorizado"
        case .Unauthorized: return "Não Autorizado"
        case .Unknown:      return "Indefinido"
        case .Disabled:     return "Inactivo" // System-level
        }
    }
}

/// Result for a permission status request.
@objc public class PermissionResult: NSObject {
    public let type: PermissionType
    public let status: PermissionStatus
    
    internal init(type:PermissionType, status:PermissionStatus) {
        self.type   = type
        self.status = status
    }
    
    override public var description: String {
        return "\(type) \(status)"
    }
}
