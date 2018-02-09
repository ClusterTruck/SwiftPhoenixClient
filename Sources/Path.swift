//
//  Path.swift
//  SwiftPhoenix
//
//  Created by Kyle Oba on 8/23/15.
//  Copyright (c) 2015 David Stump. All rights reserved.
//

import Foundation

public struct Path {

    /**
     Reomoves trailing slash from URL string

     - parameter path: String path

     - returns: String
     */
    public static func removeTrailingSlash(path:String) -> String {
        if path.count == 0 { return path }
        if path.last == "/" {
            return String(path[..<path.index(before: path.endIndex)])
        }
        return path
    }

    /**
     Remove Leading Slash from URL string

     - parameter path: String path

     - returns: String
     */
    public static func removeLeadingSlash(path:String) -> String {
        if path.count == 0 { return path }
        if path.first == "/" {
            return String(path[path.index(after: path.startIndex)...])
        }
        return path
    }

    /**
     Remove both leading and trailing URL slashes

     - parameter path: String path

     - returns: String
     */
    public static func removeLeadingAndTrailingSlashes(path:String) -> String {
        return Path.removeTrailingSlash(path: Path.removeLeadingSlash(path: path) )
    }

    /**
     Builds proper endoint

     - parameter prot:          Endpoint protocol - usually 'ws'
     - parameter domainAndPort: Phoenix server root domain and port
     - parameter path:          Phoenix server socket path
     - parameter transport:     Server transport - usually "websocket"

     - returns: String
     */
    public static func endpointWithProtocol(prot:String, domainAndPort:String, path:String, transport:String) -> String {
        let theProt = Path.protocolFrom(proto: prot)

        let theDomAndPort = removeLeadingAndTrailingSlashes(path: domainAndPort)
        let thePath = removeLeadingAndTrailingSlashes(path: path)
        let theTransport = removeLeadingAndTrailingSlashes(path: transport)
        return "\(theProt)://\(theDomAndPort)/\(thePath)/\(theTransport)"
    }
    
    /// Gets the corresponding http protocol given a websocket protocol. If the
    /// given protocol is not a websocket protocol, then it is returned without change
    ///
    /// - parameter proto: The websocket protocol. e.g "ws" or "wss"
    /// - return: "http" or "https" or proto if not a "ws*" protocol
    public static func protocolFrom(proto: String) -> String {
        switch proto {
        case "ws":
            return "http"
        case "wss":
            return "https"
        default:
            return proto
        }
    }
}
