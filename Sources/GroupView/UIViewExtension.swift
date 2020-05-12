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
        view.translatesAutoresizingMaskIntoConstraints = false

        let trailingAnchor = view.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor)
        let leadingAnchor = view.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor)
        let topAnchor = view.topAnchor.constraint(equalTo: self.superview!.topAnchor)
        let bottomAnchor = view.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor)

        NSLayoutConstraint.activate([trailingAnchor, leadingAnchor, topAnchor, bottomAnchor])
    }
}
#endif
