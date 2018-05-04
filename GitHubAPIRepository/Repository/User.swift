//
//  User.swift
//  GitHubAPIRepository
//
//  Created by Naoki Kuratomi on 2018/05/04.
//  Copyright © 2018年 Naoki Kuratomi. All rights reserved.
//

import Foundation

struct User : JSONDecodable {
    //id や login プロパティは必須であるためoptionalとして定義せずアンラップしてからイニシャライズする
    let id: Int
    let login: String

    //User型を表すJSONの型は[String:Any]型であることが期待されるので、それ以外の型の場合は初期化できない
    init(json: Any) throws {
        guard let dictionary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard  let id = dictionary["id"] as? Int else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictionary["id"])
        }
        
        guard let login = dictionary["login"] as? String else {
            throw JSONDecodeError.missingValue(key: "login", actualValue: dictionary["login"])
        }
        
        self.id = id
        self.login = login
    }
}

