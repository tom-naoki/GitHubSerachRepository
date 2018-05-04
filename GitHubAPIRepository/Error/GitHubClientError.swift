//
//  GitHubClientError.swift
//  GitHubAPIRepository
//
//  Created by Naoki Kuratomi on 2018/05/04.
//  Copyright © 2018年 Naoki Kuratomi. All rights reserved.
//

import Foundation

enum GitHubClientError : Error {
    //通信に失敗
    case connectionError(Error)
    //レスポンスの解釈に失敗
    case responseParseError(Error)
    //APIからエラーレスポンスを受け取った
    case apiError(GitHubAPIError)
}
