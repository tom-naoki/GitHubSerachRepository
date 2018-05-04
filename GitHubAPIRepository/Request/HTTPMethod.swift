//
//  HTTPMethod.swift
//  GitHubAPIRepository
//
//  Created by Naoki Kuratomi on 2018/05/04.
//  Copyright © 2018年 Naoki Kuratomi. All rights reserved.
//

import Foundation

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case patch = "PATCH"
    case trace = "TRACE"
    case options = "OPTIONS"
    case connect = "CONNECT"
}
