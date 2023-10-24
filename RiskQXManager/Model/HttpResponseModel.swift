//
//  
//  HttpResponseModel.swift
//  RiskQXManager
//

//

import Foundation

struct EventResponse: Decodable {
    let registration: Bool
    let firstReplenishment: Bool
}
struct Response: Codable {
    let value: Int
}
struct VolumePair: Hashable, Codable, Identifiable {
    var id = UUID()
    let pair: String
    let flags: String
    var persent = Double.random(in: 0.01...0.99) 
    var isEnabled: Bool
    var meter = Double.random(in: 0.1...9.9) 
}
struct Signal: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let name: String
}
struct History: Hashable, Codable, Identifiable {
    var id = UUID()
    var imageName: String
    var name: String
    var time: String
    var persent: String
    var isBuy: Bool
    var type = ""
    var date: String
}
struct New: Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var link: String
}
