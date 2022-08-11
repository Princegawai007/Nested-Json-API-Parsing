//
//  FetchedData.swift
//  NestedJsonAPIDataFetching
//
//  Created by Prince's Mac on 17/07/22.
//

import Foundation

struct FetchedData  {
        var postId : Int
        var postName : String
        var postUsername : String
        var postEmail : String
        var postStreet : String
        var postSuite : String
        var postCity : String
        var postZipcode : String
        var postLat : String
        var postLng : String
        var postPhone : String
        var postWebsite : String
        var companyName : String
        var catchPhrase : String
        var postBs : String
    
    init(postId:Int,postName:String,postUsername:String,postEmail:String,postStreet:String, postSuite:String,postCity:String,postZipcode:String,postLat:String,postLng:String,postPhone:String,postWebsite:String,companyName:String,catchPhrase:String,postBs:String){
        
        self.postId = postId
        self.postName = postName
        self.postUsername = postUsername
        self.postEmail = postEmail
        self.postStreet = postStreet
        self.postSuite = postSuite
        self.postCity = postCity
        self.postZipcode = postZipcode
        self.postLat = postLat
        self.postLng = postLng
        self.postPhone = postPhone
        self.postWebsite = postWebsite
        self.companyName = companyName
        self.catchPhrase = catchPhrase
        self.postBs = postBs
    }
}
