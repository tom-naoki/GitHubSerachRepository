//
//  JsonDecodeError.swift
//  GitHubAPIRepository
//
//  Created by Naoki Kuratomi on 2018/05/04.
//  Copyright © 2018年 Naoki Kuratomi. All rights reserved.
//

import Foundation

enum JSONDecodeError : Error {
    //JSONの構造が想定と違う場合
    case invalidFormat(json: Any)
    //構造体の初期化に必要なキーに対する値が、JSONに存在しないか、その型が構造体のプロパティの型と異なる状態を表し、キーと実際の値をプロパティの連想値として渡すことができる。
    case missingValue(key: String, actualValue: Any?)
}
