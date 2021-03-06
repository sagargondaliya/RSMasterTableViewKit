//
//  AssociatedObjectExtension.swift
//
//  Copyright (c) 2017 Rushi Sangani
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// Convert object to dictionary
public extension NSObject {
    
    // dictionary
    @objc public func toDictionary() -> [String: AnyObject] {
        
        let propertiesDictionary : NSMutableDictionary = NSMutableDictionary()
        let model = Mirror(reflecting: self)
        for (name, value) in model.children {
            propertiesDictionary.setValue(value, forKey: name!)
        }
        return propertiesDictionary as! [String : AnyObject]
    }
}

/// View from nib
public extension UIView {
    
    /// Load view from nib
    class func loadFromNib<T: UIView>() -> T {
        
        let nib =  UINib(nibName: String(describing: T.self), bundle: Bundle(for: T.self))
        return nib.instantiate(withOwner: nil, options: nil).first as! T
    }
}
