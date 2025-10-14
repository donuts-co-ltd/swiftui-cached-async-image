//
//  URLSessionTaskController.swift
//  swiftui-cached-async-image
//
//  Created by hayakawa.hikaru on 2025/10/14.
//

import Foundation

final class URLSessionTaskController: NSObject, URLSessionTaskDelegate {
    var metrics: URLSessionTaskMetrics?
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        self.metrics = metrics
    }
}
