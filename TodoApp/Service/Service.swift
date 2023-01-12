//
//  Service.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 10.01.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
struct Service {
    
    static func sendTask(text: String, completion: @escaping(Error?)-> Void){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let taskId = NSUUID().uuidString
        let data = [
            "text": text,
            "timestamp": Timestamp(date: Date()),
            "taskId": taskId
        ] as [String: Any]
        COLLECTION_TASKS.document(currentUid).collection("ongoing_tasks").document(taskId).setData(data,completion: completion)
    }
    
    static func fetchUser(uid: String, completion: @escaping(User)-> Void){
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data() else{ return }
            let user = User(data: data)
            completion(user)
        }

    }
    static func fetchTasks(uid: String ,completion: @escaping([Task])->Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var tasks = [Task]()
        COLLECTION_TASKS.document(uid).collection("ongoing_tasks").order(by: "timestamp").addSnapshotListener { snaphot, error in
            snaphot?.documentChanges.forEach({ value in
                let data = value.document.data()
                tasks.append(Task(data: data))
                completion(tasks)
            })
        }
    }
}
