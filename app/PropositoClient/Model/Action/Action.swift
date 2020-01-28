//
//  Act.swift
//  PropositoClient
//
//  Created by Matheus Gois on 08/07/19.
//  Copyright © 2019 Matheus Gois. All rights reserved.
//

import Foundation


struct Action: Codable {
    
    let id: UUID
    var prayID: UUID?
    var name: String
    var date: Date
    var time: String
    var remember: Bool
    var repetition: Bool
    var whenRepeat: String?
    var completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, prayID, name, date, time, remember, repetition, whenRepeat, completed
    }
}

typealias Actions = [Action]
