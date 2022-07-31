//
//  Constants.swift
//  ProjetoIntegrador
//
//  Created by Danielle Nozaki Ogawa on 2022/07/31.
//

import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage

let dbRef = Database.database().reference()
let usersREF = dbRef.child("users")

let storageREF = Storage.storage().reference()
let storageProfileImages = storageREF.child("profile_images")
