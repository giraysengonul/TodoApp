//
//  Task.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 13.01.2023.
//

import FirebaseFirestore
struct Task{
    let taskId: String
    let text: String
    let timestamp: Timestamp
    init(data: [String: Any]) {
        self.taskId = data["taskId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
