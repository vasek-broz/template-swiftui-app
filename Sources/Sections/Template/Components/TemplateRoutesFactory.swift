//  TemplateRoutesFactory.swift
//  Created by Václav Brož on 12/8/2021

import Swinject

struct TemplateRoutesFactory {
    let assembler: Assembler
}

extension TemplateRoutesFactory: TemplateRoutesFactorable {}
