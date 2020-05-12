//
//  File.swift
//  
//
//  Created by avinance on 5/12/20.
//

#if !os(macOS)
import UIKit

extension UIView{
    func removeAllSubviews(){
        for view in subviews{
            view.removeFromSuperview()
        }
    }
    
    func fillSuperview(){
        self.translatesAutoresizingMaskIntoConstraints = false

        let trailingAnchor = self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor)
        let leadingAnchor = self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor)
        let topAnchor = self.topAnchor.constraint(equalTo: self.superview!.topAnchor)
        let bottomAnchor = self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor)

        NSLayoutConstraint.activate([trailingAnchor, leadingAnchor, topAnchor, bottomAnchor])
    }
}
#endif
