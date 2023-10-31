//
//  MailComposer.swift
//
//
//  Created by Mateusz Ratajczak on 25/10/2023.
//

import MessageUI
import SwiftUI

internal struct MailComposer: ViewModifier {
    @Binding private var isPresented: Bool
    private var mailData: MailData
    private var onDismiss: (() -> Void)?
    private var result: ((Result<MFMailComposeResult, Error>) -> Void)?
    
    internal init(
        isPresented: Binding <Bool>,
        mailData: MailData,
        onDismiss: (() -> Void)? = nil,
        result: ((Result<MFMailComposeResult, Error>) -> Void)? = nil
    ) {
        self._isPresented = isPresented
        self.mailData = mailData
        self.onDismiss = onDismiss
        self.result = result
    }
    
    @ViewBuilder
    internal func body(content: Content) -> some View {
        content
            .sheet(
                isPresented: $isPresented,
                onDismiss: onDismiss
            ) {
                if MFMailComposeViewController.canSendMail() {
                    MailView(mailData: mailData) { result in
                        self.result?(result)
                    }
                }
            }
    }
}

extension View {
    public func mailComposer(
        isPresented: Binding<Bool>,
        mailData: MailData,
        onDismiss: (() -> Void)? = nil,
        result: ((Result<MFMailComposeResult, Error>) -> Void)? = nil
    ) -> some View {
        self.modifier(
            MailComposer(
                isPresented: isPresented,
                mailData: mailData,
                onDismiss: onDismiss,
                result: result
            )
        )
    }
}
