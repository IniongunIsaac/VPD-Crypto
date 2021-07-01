//
//  File.swift
//  24 Heights Service Provider
//
//  Created by Isaac Iniongun on 01/01/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct RideRequestRider: Codable, Scopable {
    let rideRequestRiderID, senderID: Int
    let sender, senderPhone, senderProfilePix, itemImage: String
    let specialInstruction, itemDescription, pickUpAddress: String
    let riderID: Int
    let rider, riderVehicle: String
    let riderVehicleID, rideRequestID: Int
    let tripRequestStatus: Int
    let cancelationReason, requestInfo, receiverAddress: String
    let receiverLatitude, receiverLongitude, riderLatitude, riderLongitude, pickupLatitude, pickUpLongitude: Double
    let updatedDate, createdDate: String
    
    enum CodingKeys: String, CodingKey {
        case rideRequestRiderID = "rideRequestRiderId"
        case senderID = "senderId"
        case sender, senderPhone, senderProfilePix, itemImage, specialInstruction, itemDescription, pickUpAddress, pickupLatitude, pickUpLongitude
        case riderID = "riderId"
        case rider, riderVehicle
        case riderVehicleID = "riderVehicleId"
        case riderLatitude, riderLongitude
        case rideRequestID = "rideRequestId"
        case tripRequestStatus, cancelationReason, requestInfo, receiverAddress, receiverLatitude, receiverLongitude, updatedDate, createdDate
    }
}
