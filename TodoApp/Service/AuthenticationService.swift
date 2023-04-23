//
//  AuthenticationService.swift
//  TodoApp
//
//  Created by hakkı can şengönül on 3.01.2023.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
struct AuthenticationRegisterUserModel {
    let emailText: String
    let passwordText: String
    let usernameText: String
    let nameText: String
    let profileImage: UIImage
}
struct AuthenticationService {
    
    static func login(emailText: String, passwordText: String, completion: @escaping(AuthDataResult?, Error?)-> Void){
        Auth.auth().signIn(withEmail: emailText, password: passwordText,completion: completion)
    }
    
    static func createUser(user: AuthenticationRegisterUserModel, completion: @escaping(Error?)->Void){
        
        guard let profileImageData = user.profileImage.jpegData(compressionQuality: 0.5) else { return }
        let fileName = NSUUID().uuidString
        let reference = Storage.storage().reference(withPath: "images/profile_images/\(fileName)")
        reference.putData(profileImageData) { metaData, error in
            if let error = error{
                print("Error: \(error.localizedDescription)")
                return
            }
            reference.downloadURL { url, error in
                if let error = error{
                    print("Error: \(error.localizedDescription)")
                    return
                }
                guard let profileImageUrl = url?.absoluteString else{ return }
                Auth.auth().createUser(withEmail: user.emailText, password: user.passwordText) { result, error in
                    guard let uid = result?.user.uid else{ return }
                    let data = [
                        "email": user.emailText,
                        "username": user.usernameText,
                        "name": user.nameText,
                        "profileImageUrl": profileImageUrl,
                        "uid": uid
                    ] as [String: Any]
                    Firestore.firestore().collection("users").document(uid).setData(data,completion: completion)
                }
            }
        }
        
    }
    static func deleteUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).delete { error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            COLLECTION_TASKS.document(uid).delete { error in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                if let user =  Auth.auth().currentUser{
                    user.delete()
                }
                
            }
        }
    }
    
}
