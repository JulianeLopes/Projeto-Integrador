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


// diretorio para salvar os usuários no database
let dbRef = Database.database().reference()
let usersREF = dbRef.child("users")


// diretorio para salvar as fotos usuários no database
let storageREF = Storage.storage().reference()
let storageProfileImages = storageREF.child("profile_images")
