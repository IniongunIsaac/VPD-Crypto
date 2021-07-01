//
//  RideRequest.swift
//  24 Heights Service Provider
//
//  Created by Isaac Iniongun on 01/01/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct RideRequest: Codable {
    let rideRequestID, senderID: Int
    let sender, senderPhone, senderDeviceToken, senderProfilePix: String
    let deliveryID, vehicleID: Int
    let vehicle, vehicleImage, pickUpAddress, specialInstruction: String
    let riderID: Int
    let rider, riderDeviceToken: String
    let riderLatitude, riderLongitude, senderLatitude, senderLongitude, pickupLatitude, pickUpLongitude: Double
    let itemCategoryID: Int
    let itemCategoryName: String
    let deliveryAmount, tripRequestStatus, rideRequestType: Int
    let itemImage, cancelationReason, itemDescription, receiverAddress: String
    let receiverLatitude, receiverLongitude: Double
    let receiversName, receiversPhone, updatedDate, createdDate: String
    let rideRequestRiders: [RideRequestRider]
    
    enum CodingKeys: String, CodingKey {
        case rideRequestID = "rideRequestId"
        case senderID = "senderId"
        case sender, senderPhone, senderDeviceToken, senderProfilePix
        case deliveryID = "deliveryId"
        case vehicleID = "vehicleId"
        case vehicle, vehicleImage, pickUpAddress, specialInstruction, pickupLatitude, pickUpLongitude
        case riderID = "riderId"
        case rider, riderDeviceToken, riderLatitude, riderLongitude, senderLatitude, senderLongitude
        case itemCategoryID = "itemCategoryId"
        case itemCategoryName, deliveryAmount, tripRequestStatus, rideRequestType, itemImage, cancelationReason, itemDescription, receiverAddress, receiverLatitude, receiverLongitude, receiversName, receiversPhone, updatedDate, createdDate, rideRequestRiders
    }
}
