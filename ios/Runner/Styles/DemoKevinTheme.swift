//
//  DemoKevinTheme.swift
//  Runner
//
//  Created by Daniel Klinge on 25/01/2022.
//

import Foundation
import SwiftUI
import Kevin

public class DemoKevinTheme : KevinTheme {
    
    public override init() {
        super.init()
        self.primaryTextColor = UIColor(Color("PrimaryTextColor", bundle: nil))
        self.secondaryBackgroundColor = UIColor(Color("SecondaryBackgroundColor", bundle: nil))
        self.primaryBackgroundColor = UIColor(Color("PrimaryBackgroundColor", bundle: nil))
        self.selectedOnPrimaryColor = UIColor(Color("SelectedOnPrimaryColor", bundle: nil))
        //  for more properties check KevinTheme class
    }
}
