//
//  NetworkingService.swift
//
//
//  Created by Sacha on 13/03/2020.
//

import Foundation
import Combine

public protocol NetworkingService {
    var network: NetworkingClient { get }
}

// Sugar, just forward calls to underlying network client

// TODO Put back
/*
public extension NetworkingService {
    
    // Data
    
    func get(_ route: String, params: Params = Params()) -> AnyPublisher<Data, Error> {
        network.get(route, params: params)
    }
    
    func post(_ route: String, params: Params = Params()) -> AnyPublisher<Data, Error> {
        network.post(route, params: params)
    }
    
    func post(_ route: String, body: Encodable) -> AnyPublisher<Data, Error> {
        network.post(route, body: body)
    }
    
    func put(_ route: String, params: Params = Params()) -> AnyPublisher<Data, Error> {
        network.put(route, params: params)
    }
    
    func patch(_ route: String, params: Params = Params()) -> AnyPublisher<Data, Error> {
        network.patch(route, params: params)
    }
    
    func patch(_ route: String, body: Encodable) -> AnyPublisher<Data, Error> {
        network.patch(route, body: body)
    }
    
    func delete(_ route: String, params: Params = Params()) -> AnyPublisher<Data, Error> {
        network.delete(route, params: params)
    }
    
    // Void
    
    func get(_ route: String, params: Params = Params()) -> AnyPublisher<Void, Error> {
        network.get(route, params: params)
    }
    
    func post(_ route: String, params: Params = Params()) -> AnyPublisher<Void, Error> {
        network.post(route, params: params)
    }
    
    func post(_ route: String, body: Encodable) -> AnyPublisher<Void, Error> {
        network.post(route, body: body)
    }
    
    func put(_ route: String, params: Params = Params()) -> AnyPublisher<Void, Error> {
        network.put(route, params: params)
    }
    
    func patch(_ route: String, params: Params = Params()) -> AnyPublisher<Void, Error> {
        network.patch(route, params: params)
    }
    
    func delete(_ route: String, params: Params = Params()) -> AnyPublisher<Void, Error> {
        network.delete(route, params: params)
    }
    
    // JSON
    
    func get(_ route: String, params: Params = Params()) -> AnyPublisher<Any, Error> {
        network.get(route, params: params)
    }
    
    func post(_ route: String, params: Params = Params()) -> AnyPublisher<Any, Error> {
        network.post(route, params: params)
    }
    
    func post(_ route: String, body: Encodable) -> AnyPublisher<Any, Error> {
        network.post(route, body: body)
    }
    
    func put(_ route: String, params: Params = Params()) -> AnyPublisher<Any, Error> {
        network.put(route, params: params)
    }
    
    func patch(_ route: String, params: Params = Params()) -> AnyPublisher<Any, Error> {
        network.patch(route, params: params)
    }
    
    func delete(_ route: String, params: Params = Params()) -> AnyPublisher<Any, Error> {
        network.delete(route, params: params)
    }
    
    // Decodable
    
    func get<T: Decodable>(_ route: String,
                                         params: Params = Params(),
                                         keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.get(route, params: params, keypath: keypath)
    }
    
    func post<T: Decodable>(_ route: String,
                                          params: Params = Params(),
                                          keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.post(route, params: params, keypath: keypath)
    }
    
    func put<T: Decodable>(_ route: String,
                                         params: Params = Params(),
                                         keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.put(route, params: params, keypath: keypath)
    }
    
    func patch<T: Decodable>(_ route: String,
                                           params: Params = Params(),
                                           keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.patch(route, params: params, keypath: keypath)
    }
    
    func delete<T: Decodable>(_ route: String,
                                            params: Params = Params(),
                                            keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.delete(route, params: params, keypath: keypath)
    }
    
    // Array Decodable
    
    func get<T: Decodable>(_ route: String,
                           params: Params = Params(),
                           keypath: String? = nil) -> AnyPublisher<T, Error> where T: Collection {
        network.get(route, params: params, keypath: keypath)
    }
    
    func post<T: Decodable>(_ route: String,
                           params: Params = Params(),
                           keypath: String? = nil) -> AnyPublisher<T, Error> where T: Collection {
        network.post(route, params: params, keypath: keypath)
    }
    
    func put<T: Decodable>(_ route: String,
                           params: Params = Params(),
                           keypath: String? = nil) -> AnyPublisher<T, Error> where T: Collection {
        network.put(route, params: params, keypath: keypath)
    }
    
    func patch<T: Decodable>(_ route: String,
                           params: Params = Params(),
                           keypath: String? = nil) -> AnyPublisher<T, Error> where T: Collection {
        network.patch(route, params: params, keypath: keypath)
    }
    
    func delete<T: Decodable>(_ route: String,
                           params: Params = Params(),
                           keypath: String? = nil) -> AnyPublisher<T, Error> where T: Collection {
        network.delete(route, params: params, keypath: keypath)
    }
    
    // NetworkingJSONDecodable
    
    func get<T: NetworkingJSONDecodable>(_ route: String,
                                         params: Params = Params(),
                                         keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.get(route, params: params, keypath: keypath)
    }
    
    func post<T: NetworkingJSONDecodable>(_ route: String,
                                          params: Params = Params(),
                                          keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.post(route, params: params, keypath: keypath)
    }
    
    func put<T: NetworkingJSONDecodable>(_ route: String,
                                         params: Params = Params(),
                                         keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.put(route, params: params, keypath: keypath)
    }
    
    func patch<T: NetworkingJSONDecodable>(_ route: String,
                                           params: Params = Params(),
                                           keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.patch(route, params: params, keypath: keypath)
    }
    
    func delete<T: NetworkingJSONDecodable>(_ route: String,
                                            params: Params = Params(),
                                            keypath: String? = nil) -> AnyPublisher<T, Error> {
        network.delete(route, params: params, keypath: keypath)
    }
    
    
    
    // Array NetworkingJSONDecodable
    
    func get<T: NetworkingJSONDecodable>(_ route: String,
                                         params: Params = Params(),
                                         keypath: String? = nil) -> AnyPublisher<[T], Error> {
        network.get(route, params: params, keypath: keypath)
    }
    
    func post<T: NetworkingJSONDecodable>(_ route: String,
                                          params: Params = Params(),
                                          keypath: String? = nil) -> AnyPublisher<[T], Error> {
        network.post(route, params: params, keypath: keypath)
    }
    
    func put<T: NetworkingJSONDecodable>(_ route: String,
                                         params: Params = Params(),
                                         keypath: String? = nil) -> AnyPublisher<[T], Error> {
        network.put(route, params: params, keypath: keypath)
    }
    
    func patch<T: NetworkingJSONDecodable>(_ route: String,
                                           params: Params = Params(),
                                           keypath: String? = nil) -> AnyPublisher<[T], Error> {
        network.patch(route, params: params, keypath: keypath)
    }
    
    func delete<T: NetworkingJSONDecodable>(_ route: String,
                                            params: Params = Params(),
                                            keypath: String? = nil) -> AnyPublisher<[T], Error> {
        network.delete(route, params: params, keypath: keypath)
    }
}
*/
