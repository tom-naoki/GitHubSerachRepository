//
//  GitHubClient.swift
//  GitHubAPIRepository
//
//  Created by Naoki Kuratomi on 2018/05/06.
//  Copyright © 2018年 Naoki Kuratomi. All rights reserved.
//

import Foundation

class GitHubClient {
    //WebAPIの呼び出しにはHTTPクライアントが必要なので、URLSessionクラスのインスタンスを管理する必要がある
    //URLSessionクラスのインスタンスを1つ生成し、以後それを使い回す
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    //APIクライアントは、リクエストの型から実際のHTTPリクエストを作成し、非同期的に通信を行う
    //結果を受け取ったら、それらをレスポンスの型へと変換し呼び出し元に渡す
    func send<Request : GitHubRequest>(
        request: Request,
        //successの時Request.Responseを返す　errorの時GitHubClientErrorを返す
        //escaping属性
        completion: @escaping(Result<Request.Response, GitHubClientError>) -> Void) {
        //HTTPリクエストを送信する
        //URLリクエスト型のインスタンスを生成
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in
            
            switch (data, response, error) {
                //errorががnilでなければ通信に失敗
            case(_, _, let error?):
                completion(Result(error: .connectionError(error)))
            case(let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch let error as GitHubAPIError {
                    //エラーレスポンスを受け取った場合
                    completion(Result(error:  .apiError(error)))
                } catch {
                    //レスポンスが想定どうりの構成をしていなかった場合
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("inValid response combination \(data), \(response), \(error)")
            }
        }
        
        task.resume()
    }
}
