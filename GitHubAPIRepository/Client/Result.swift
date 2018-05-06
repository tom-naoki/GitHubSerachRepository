//
//  Result.swift
//  GitHubAPIRepository
//
//  Created by Naoki Kuratomi on 2018/05/06.
//  Copyright © 2018年 Naoki Kuratomi. All rights reserved.
//

import Foundation

enum Result<T, Error : Swift.Error> {
    case success(T)
    case failure(Error)
    
    init (value: T) {
        self = .success(value)
    }
    
    init(error : Error) {
        self = .failure(error)
    }
}
