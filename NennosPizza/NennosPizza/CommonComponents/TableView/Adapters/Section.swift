//
//  Section.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

public final class Section {
    
    public var insets: UIEdgeInsets?
    public var lineSpacing: CGFloat?
    public var header: AnySupplementaryViewModel?
    public var footer: AnySupplementaryViewModel?
    public var items: [AnyCellViewModel]
    
    public init(insets: UIEdgeInsets? = nil,
                lineSpacing: CGFloat? = nil,
                header: AnySupplementaryViewModel? = nil,
                footer: AnySupplementaryViewModel? = nil,
                items: [AnyCellViewModel]) {
        self.insets = insets
        self.lineSpacing = lineSpacing
        self.header = header
        self.footer = footer
        self.items = items
    }
}
