//
//  MailView.swift
//
//
//  Created by Mateusz Ratajczak on 25/10/2023.
//

import MessageUI
import SwiftUI

internal struct MailView: UIViewControllerRepresentable {
    @Environment(\.isPresented) private var isPresented
    internal let mailData: MailData
    internal var result: (Result<MFMailComposeResult, Error>) -> Void
    
    internal func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = context.coordinator
        mailComposer.setSubject(mailData.subject)
        mailComposer.setToRecipients(mailData.recipients)
        mailComposer.navigationItem.rightBarButtonItem?.isEnabled = false
        mailComposer.setMessageBody(mailData.body, isHTML: mailData.isBodyHTML)
        
        for attachment in mailData.attachments {
            mailComposer.addAttachmentData(
                attachment.data,
                mimeType: attachment.mimeType,
                fileName: attachment.fileName
            )
        }
        
        if MFMailComposeViewController.canSendMail() {
            result(.success(.sent))
        }
        
        return mailComposer
    }
    
    internal func updateUIViewController(
        _ uiViewController: MFMailComposeViewController,
        context: Context) { }
    
    internal func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    internal class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        private var parent: MailView
        
        internal init(parent: MailView) {
            self.parent = parent
        }
        
        internal func mailComposeController(
            _ controller: MFMailComposeViewController,
            didFinishWith result: MFMailComposeResult,
            error: Error?
        ) {
            if let error {
                parent.result(.failure(error))
                return
            }
            
            parent.result(.success(result))
            controller.dismiss(animated: true)
        }
    }
}
