//
//  ChatViewController.swift
//  Evidencia2
//
//  Created by user189807 on 10/28/21.
//  Copyright © 2021 user189807. All rights reserved.
//


import UIKit
import MessageKit

struct Sender: SenderType{
    var displayName: String
    
    var senderId: String
    
}

struct Message: MessageType {
        
    var sentDate: Date
    var sender: SenderType
    var messageId: String
    var kind: MessageKind
    
    
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate{
    let user = Sender(displayName: "jr", senderId: "JulioRuiz")
    let sentUser = Sender(displayName: "sentUser", senderId: "SentUser")
    var messages = [MessageType]()
    
    override func viewDidLoad() {
        messages.append(Message(sentDate: Date().addingTimeInterval(-100000),
        sender: user,
        messageId: "12345",
        kind: .text("Initialize")))
        messages.append(Message(sentDate: Date().addingTimeInterval(-90000),
        sender: sentUser,
        messageId: "12346",
        kind: .text("Initialize2")))
        messages.append(Message(sentDate: Date().addingTimeInterval(-80000),
        sender: user,
        messageId: "12347",
        kind: .text("Initialize3")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
    }
    
    func currentSender() -> SenderType {
        return user
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
        
    }
    
}
