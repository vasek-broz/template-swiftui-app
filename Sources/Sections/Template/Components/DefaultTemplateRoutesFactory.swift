//  DefaultTemplateRoutesFactory.swift
//  Created by Václav Brož on 12/8/2021

import Swinject

struct DefaultTemplateRoutesFactory {
    let assembler: Assembler
}

extension DefaultTemplateRoutesFactory: TemplateRoutesFactorable {}
