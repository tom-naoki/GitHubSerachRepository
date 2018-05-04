//
//  JSONDecodable.swift
//  GitHubAPIRepository
//
//  Created by Naoki Kuratomi on 2018/05/04.
//  Copyright © 2018年 Naoki Kuratomi. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json : Any) throws
    
    //JSONからインスタンスを生成するためのイニシャライザはこれらの型すべてに共通して必要なためプロトコルとして宣言
}
