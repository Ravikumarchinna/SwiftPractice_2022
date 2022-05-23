//
//  HomeModel.swift
//  Swift_Practice2022
//
//  Created by Ravikumar on 23/05/22.
//

import Foundation

struct HomeModel: Codable {
    let account: [Account]
}

struct Account: Codable {
    let maxPctHiYield, dPositionHiYield, dPositionHiGrade: String
}
