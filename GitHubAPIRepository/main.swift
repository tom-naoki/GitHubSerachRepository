//
//  main.swift
//  GitHubAPIRepository
//
//  Created by Naoki Kuratomi on 2018/05/06.
//  Copyright © 2018年 Naoki Kuratomi. All rights reserved.
//

import Foundation

print("Enter your query here> ", terminator: "")

//入力されたクエリを取得
guard let keyword = readLine(strippingNewline: true) else {
    exit(1)
}

//APIクライアントの生成
let client = GitHubClient()
//リクエストの発行
let request = GitHubAPI.SearchRepositories(keyword: keyword)
//リクエストの送信
client.send(request: request) { result in
    switch result {
    case let .success(response):
        for item in response.items {
            //リポジトリの所有者と名前を入力
            print(item.owner.login + "/" + item.name)
        }
    case let .failure(error):
       //エラーの詳細を出力
        print(error)
        exit(1)
    }
}

//タイムアウト時間
let timeoutInterval: TimeInterval = 60
//タイムアウトまでメインスレッドを停止
Thread.sleep(forTimeInterval: timeoutInterval)
//タイムアウト後の処理
print("Connection timeout")
exit(1)

