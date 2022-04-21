//
//  Configs.swift
//  baseapp
//
//  Created by Alex on 04/01/2022.
//

import Foundation
import SwiftyBeaver
import JGProgressHUD
// MARK: HUB
let hub = JGProgressHUD.init(style: .dark)
// MARK: App & IAP
let K_APP_ID: String = ""
let K_APPLE_SECRET: String = ""

let K_PRODUCT_WEEKLY: String = ""
let K_PRODUCT_YEARLY: String = ""
let K_PRODUCT_MONTHLY : String = ""

let K_TERM: String = ""
let K_POLICY: String = ""

let K_EMAIL_SUPPORT: String = ""
let K_LINK_APP: String = "https://itunes.apple.com/us/app/id\(K_APP_ID)"

let K_APP_NAME: String = ""

// MARK: Trial
let K_LIMIT_TRIAL: Int = 2

// MARK: API & Decode
let K_API_DECODE: String = ""
let K_API_BASE_URL: String = ""
let K_DECRYPT_INSECT : String = "77986ee977986ee9"
let K_DECRYPT_PLANT: String = "23f041aa9fb1537e"

// MARK: Internal variable
internal let appDelegate = UIApplication.shared.delegate as! AppDelegate
internal let log = SwiftyBeaver.self

