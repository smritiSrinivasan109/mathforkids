//
//  SignUpModel.swift
//  MathForKids
//
//  Created by SRINIVASAN Smriti on 11/14/20.
//  Copyright © 2020 Smriti. All rights reserved.
//

import Foundation
import UIKit

class SignUpModel {
    var email:String?
    var password:String?
    var firstName:String?
    var lastName:String?
    var image:UIImage? //optional
    init(email:String? = "smriti@gmail.com",password:String? = "abc@123",firstName:String? = "Smriti",lastName:String? =  "Srinivasan",image:UIImage? = nil) {
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
    }
}
