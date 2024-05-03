//
//  RecentCallModel.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 03/05/24.
//

import Foundation

enum CallType {
    case incoming
    case outgoing
    case missed
}

struct RecentCallModel {
    let title: String
    let subtitle: String
    let day: String
    let callType: CallType
    let count: Int
}
